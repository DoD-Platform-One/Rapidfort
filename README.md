# rapidfort

![Version: 0.1.0-bb.0](https://img.shields.io/badge/Version-0.1.0--bb.0-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Automated container hardening

## Upstream References
* <https://www.rapidfort.com>

* <https://repo1.dso.mil/platform-one/big-bang/apps/third-party/rapidfort>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install rapidfort chart/
```

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
