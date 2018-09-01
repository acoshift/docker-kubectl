#!/bin/bash

if [[ $(kubectl config current-context 2> /dev/null) == "" ]]; then
    function usage() {
        cat <<EOF
No cluster is set. To set the cluster, set the environment variables
  TOKEN=<service account token>
  SERVER=<server master url>
  NAMESPACE=<namespace>
EOF
        exit 1
    }

    [[ -z "$TOKEN" ]] && usage
    [[ -z "$SERVER" ]] && usage
    [[ -z "$NAMESPACE" ]] && usage

    echo "Running: kubectl config set-credentials user --token=\"__TOKEN__\""
    kubectl config set-credentials user --token="$TOKEN" || exit

    echo "Running: kubectl config set-cluster cluster --server=\"$SERVER\" --insecure-skip-tls-verify"
    kubectl config set-cluster cluster --server="$SERVER" --insecure-skip-tls-verify || exit

    echo "Running: kubectl config set-context context-name --cluster=cluster --user=user --namespace=\"$NAMESPACE\""
    kubectl config set-context context --cluster=cluster --user=user --namespace="$NAMESPACE" || exit

    echo "Running: kubectl config use-context context"
    kubectl config use-context context || exit
fi

echo "Running: kubectl $@"
kubectl "$@"
