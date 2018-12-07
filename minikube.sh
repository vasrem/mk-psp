#!/usr/bin/env bash

set -eo pipefail

function log {
    local GREEN='\033[1;32m'
    local RESET='\033[0m' 
    echo -e "${GREEN}$( date "+%Y-%m-%d %H:%M:%S" ) - $@${RESET}" 1>&2
}

log "Delete cluster if exists"
minikube delete || true

log "Create cluster"
minikube start \
  --extra-config=apiserver.admission-control="NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota,PodSecurityPolicy"

log "Apply Default Manifests"
kubectl apply -f 01_clusterrole.yaml

kubectl apply -f 02_full-psp.yaml

kubectl apply -f 03_restricted-psp.yaml

kubectl apply -f 04_clusterrolebinding.yaml

kubectl apply -f rb_kube-system.yaml

