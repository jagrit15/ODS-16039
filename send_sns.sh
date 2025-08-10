#!/bin/bash
# send_sns.sh <subject> <body-file>
SUBJECT="$1"
BODY_FILE="$2"
SNS_TOPIC_ARN="arn:aws:sns:us-east-1:010438474962:mail"  # replace with yours

aws sns publish \
  --topic-arn "$SNS_TOPIC_ARN" \
  --subject "$SUBJECT" \
  --message file://"$BODY_FILE"
