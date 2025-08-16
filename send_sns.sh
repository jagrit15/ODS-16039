#!/bin/bash
# send_sns.sh <subject> <body-file>
SUBJECT="$1"
BODY_FILE="$2"

aws sns publish \
  --topic-arn "$SNS_TOPIC_ARN" \
  --subject "$SUBJECT" \
  --message file://"$BODY_FILE"
