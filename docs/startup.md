# RapidFort Startup

This doc is intended to be a walkthrough-ish guide on getting rapidfort to a functioning state. This will require interacting with the AWS console, setting secrets, and setting environment variables.

## AWS

RapidFort is currently dependent on a bunch of AWS resources, so we'll need to get those setup. I think these resources will fall under the free tier but I'm not 100% on that.

### Account ID and Secret Key

First and foremost RF needs a way to authenticate to AWS, for the purposes of this document that will be an ID and Secret Key generated from your account.

1. Sign into AWS Console
1. Open the dropdown at the top right and select `Security Credentials`
1. Create an Access Key, take note of the ID and Secret Key, they will be needed later

### Amazon SES

RF uses an email to activate the master admin account. This means it requires access to an email sending service, which for us will be AWS SES. We will be activating SES, adding a verified identity, and adding a config set.

1. Search for `SES` in the AWS Console search bar
1. I think there's a part about activating SES, go through that wizard
    1. It should ask you for a verified email ID or something like that, choose an email you have access to and set it to that. Note the email you used here somewhere, it will be needed later
1. If you don't start on the `Account Dashboard` page, navigate there using the left index
1. Click on `Create SMTP credentials` under `Simple Mail Transfer Protocol (SMTP) settings`
    1. Follow the wizard and note the ID and secret key you receive, it will be needed later.
1. Return to the SES Dashboard
1. Click on `Configuration Sets` in the left index
    1. Create a new set and call it `user_smtp`. RapidFort requires this for now. (Should be removed eventually?)

### S3

RF requires an s3 bucket for storage. We will be creating that bucket.

1. Search for `s3` in the AWS Console search bar.
1. Click `Create Bucket`
1. Give it a name. Note the name, it will be needed later.
1. Click `Create Bucket`

### IAM and ARN/STS

RF needs an ARN to access S3 and STS. We will create the ARN and the backing policy.

1. Search for `IAM` in the AWS Console search bar.
1. Go to `Roles` in the left index
1. Create a new role
1. Select `AWS Account` radio button
1. Click `Next`
1. Click `Create Policy`
    1. Select the `JSON` tab
    1. Paste the code block below into the editor, overwriting all contents. Any sections annotated with `<>` must be replaced with what it's referencing, delete the carots. The Role name can be anything but whatever you name the role later must match it.
    1. Click `Next: Tags`
    1. Click `Next: Review`
    1. Name and describe the policy, note the name, it will be needed later.
    1. Close this tab
1. Click the refresh button for the policy table and search for the policy you just created
1. Check the box for that policy
1. Click `Next`
1. Name and describe the role. Remember it must match whatever was entered in the policy earlier.
1. Click `Create Role`
1. Search for the role you just created
1. Click on it
1. Copy the `ARN` under `Summary` and note it, it will be needed later.

```
{
    "Statement": [
        {
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::<S3BUCKETNAME>/*",
                "arn:aws:s3:::<S3BUCKETNAME>"
            ],
            "Sid": ""
        },
        {
            "Action": "sts:AssumeRole",
            "Effect": "Allow",
            "Resource": [
                "arn:aws:iam::391600237054:user/<USERNAME>",
                "arn:aws:iam::391600237054:role/<ROLENAME>"
            ],
            "Sid": ""
        }
    ],
    "Version": "2012-10-17"
}
```

## Secrets

Rapidfort requires a bunch of secrets to function, most of which we just created values for during the AWS setup. The secrets can be found in the `values.yaml` file under `chart/`. They can be modified there or added to an external yaml and included via a helm command flag. If a value is skipped, it's default value is fine.

- `AWS_ACCESS_KEY_ID`
  - The ID key for your account.
- `USERNAME_SMTP`
  - The ID generated for access to the SES (SMTP) service.
- `PASSWORD_SMTP`
  - The secret key/password generated for access to the SES (SMTP) service.
- `AWS_SECRET_ACCESS_KEY`
  - The secret key for your account.
- `STS_ACCESS_ID`
  - The ID key for your account.
  - This is the same as `AWS_ACCESS_KEY_ID`.
- `STS_ROLE_ARN`
  - This is the ARN copied earlier when creating the role.
- `STS_SECRET_KEY`
  - The secret key for your account.
  - This is the same as `AWS_SECRET_ACCESS_KEY`.
- `RF_S3_BUCKET`
  - This is whatever name you gave when creating the s3 bucket.
- `RF_APP_HOST`
  - This is the hostname or ip address of the node that you will be accessing RF via
- `RF_APP_ADMIN`
  - This is the email of the RF administrator. It can be the same as the verified identity in SES, however some services may perceive it as phishing/spam since it used that email to send it. If you run into issues, changing this to a different email shouldn't be a problem.

## Environment Variables

There are a few non-secret environment variables that need to be set for RF to function. These are also found in the `values.yaml` file. They too can be set via an external file.

- `backend.env.sender_email_id`
  - This is the email ID that RF will attach to emails sent via SES/SMTP. It MUST match the verified identity in SES.
- `runner.env.rf_app_admin`
  - This is the email of the RF administrator, it MUST match the `RF_APP_ADMIN` set in the secrets. Eventually it will reference the secret.

# Subchart Enables

At the time of writing `rfvdb` and `runner` are disbabled for GitLab CI reasons. We do not currently have teh `rfvdb` image so that can stay disabled, however `runner` will need to be enabled for a functional RF deployment. `runner.enabled` must be set to `true`