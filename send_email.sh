#!/bin/bash

SUBJECT="$1"
BODY_FILE="$2"
TO_EMAIL="Jagritpandeer1969@gmail.com"
FROM_EMAIL="jpandeer15@gmail.com"
REGION="us-east-1"

# Read file safely into variable
BODY=$(cat "$BODY_FILE")

# Debug log to verify body (remove after testing)
echo "Email body content:"
echo "$BODY"

# Send the email using AWS SES
aws ses send-email \
  --region "$REGION" \
  --from "$FROM_EMAIL" \
  --destination "ToAddresses=$TO_EMAIL" \
  --message "Subject={Data=\"$SUBJECT\",Charset=utf-8},Body={Text={Data=\"$(echo "$BODY" | sed 's/"/\\"/g')\",Charset=utf-8}}"
