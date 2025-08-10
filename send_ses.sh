#!/bin/bash
# send_ses.sh <subject> <body-file>

SUBJECT="$1"
BODY_FILE="$2"

FROM_EMAIL="$SES_FROM"
TO_EMAIL="$SES_TO"

BODY_CONTENT=$(sed ':a;N;$!ba;s/\n/\\n/g' "$BODY_FILE") # escape newlines

aws ses send-email \
    --from "$FROM_EMAIL" \
    --destination "ToAddresses=$TO_EMAIL" \
    --message "Subject={Data=$SUBJECT,Charset=UTF-8},Body={Text={Data=$BODY_CONTENT,Charset=UTF-8}}" \
    --region "$AWS_REGION"
