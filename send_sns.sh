#!/bin/bash
# send_sns.sh <subject> <body-file>
SUBJECT="$1"
BODY_FILE="$2"
SNS_TOPIC_ARN="${SNS_TOPIC_ARN:-$1}"   # prefer env var

if [ -z "$SNS_TOPIC_ARN" ]; then
  echo "SNS_TOPIC_ARN not set"
  exit 2
fi

aws sns publish \
  --topic-arn "$SNS_TOPIC_ARN" \
  --subject "$SUBJECT" \
  --message file://"$BODY_FILE"
