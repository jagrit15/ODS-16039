#!/bin/bash
# send_ses.sh <subject> <body-file>
SUBJECT="$1"
BODY_FILE="$2"
FROM_EMAIL="noreply@example.com"    # must be verified in SES
TO_EMAIL="you@example.com"          # must be verified unless SES is in production

aws ses send-email \
  --from "$FROM_EMAIL" \
  --destination "ToAddresses=$TO_EMAIL" \
  --message "Subject={Data=$SUBJECT,Charset=utf-8},Body={Text={Data=$(cat "$BODY_FILE"),Charset=utf-8}}"
