#!/bin/bash

usage() {
    echo "Usage: $0 slack_webhook job_name repo_name run_id"
    echo "Example: ./notify.sh https://hooks.slack.com/services/... build my-repo 123456"
    exit 1
}

if [[ $# -lt 4 ]]; then
    usage
fi

WEBHOOK=$1
JOB_NAME=$2
REPO_NAME=$3
RUN_ID=$4
MESSAGE="Check GitHub Actions run for details: https://github.com/$REPO_NAME/actions/runs/$RUN_ID"

curl -s -X POST "$WEBHOOK" \
     -H 'Content-type: application/json' \
     --data "{\"text\":\":x: [$REPO_NAME] Job *$JOB_NAME* failed.\n$MESSAGE\"}"