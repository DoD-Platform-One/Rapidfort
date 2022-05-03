# Updating From Upstream RF Charts

As of now (May 2 2022) the upstream RF charts are hosted on [GitHub](https://github.com/rapidfort/helm-charts). They are stored in the `.tgz` format so there is no record of changes between versions. Since we maintain our own parent chart there is manual update process involved.
1. Download the latest `rapidfort-x.x.x.tgz` from the GitHub repository.
    1. Easy way to do this is to open the repository page in a web browser, click on the latest `.tgz` and click "Download".
1. Extract the contents of the archive to your machine.
1. In the RapidFort package repository, checkout the `rf-upstream` branch.
1. Delete the `charts` folder under `chart`
1. Copy the `charts` folder from the unarchived RF download into the `chart` folder in the repository.
    1. This is a good time to review what changes were made
1. Commit all changes to the `rf-upstream` branch. This branch is meant to mirror the latest charts from RF so we will not be changing anything here.
1. Push the changes.
1. Create and checkout a new branch from `origin/main`.
1. Run `git merge rf-upstream`.
1. Assuming merge conflicts, resolve all conflicts, DO NOT COMMIT.
    1. If there are no conflicts DO NOT PUSH
1. Before committing all changes to the `mysql` subchart must be discarded. This is because the `mysql` chart we use is not based off of RF's `mysql` chart.
1. If you're concerned you did something wrong with the `mysql` chart, you can download the files from `origin/main` and delete/replace the mysql folder with that one since there should never be any changes to it from this process.
1. Since we maintain our own parent chart, any updates to the parent chart on RF's side must be manually reviewed. To be honest there isn't a great way of doing this as of now. Just check for anything new at the parent chart level in RF's version and if necessary implement it into our parent chart.
1. After ensuring all merge conflicts were resolved appropriately, no changes were made to the `mysql` subchart, and any parent chart updates are done, commit and push the merge to this new branch.
1. Open a merge request for this branch into `origin/main`.
1. Merge after approval!