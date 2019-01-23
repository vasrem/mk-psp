# Minikube with PodSecurityPolicy enabled
This repository contains a bash script which spins up minikube with the necessary Kubernetes resources that are needed for the cluster to be initialized.

Run the following command to initialize minikube.
```sh
$ ./minikube.sh
```

[This](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) link provides information about Pod Security Policies.

## Tested with
  - **Minikube 0.33.1**
  - **Kubernetes v1.13.2**

## Tags
Tags are synced with the tested minikube version. Please checkout to a different tag if you want to use this repo with an older version of minikube.
