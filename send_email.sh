#!/bin/bash

SUBJECT="$1"
BODY_FILE="$2"
TO_EMAIL="jagritpandeer1969@gmail.com"
FROM_EMAIL="jagritpandeer1969@gmail.com"
REGION="us-east-1"

BODY_CONTENT=$(cat "$BODY_FILE" | sed 's/"/\\"/g')

aws ses send-email \
    --region "$REGION" \
    --from "$FROM_EMAIL" \
    --destination "ToAddresses=$TO_EMAIL" \
    --message "Subject={Data=\"$SUBJECT\",Charset=utf-8},Body={Text={Data=\"$BODY_CONTENT\",Charset=utf-8\"}}"
