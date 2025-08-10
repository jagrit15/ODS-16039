#!/bin/bash
set -e

# Variables
AWS_REGION="us-east-1"
FROM_EMAIL="jpandeer15@gmail.com"     # Must be a verified SES identity
TO_EMAIL="jagritpandeer1969@gmail.com" # Must also be verified in SES (sandbox mode)
SUBJECT="CodeBuild Notification"
BODY_TEXT="Hello! This is a test email from AWS CodeBuild using SES."
BODY_HTML="<h1>Hello!</h1><p>This is a test email from <b>AWS CodeBuild</b> using SES.</p>"

echo "Sending email from $FROM_EMAIL to $TO_EMAIL..."

aws ses send-email \
    --from "$FROM_EMAIL" \
    --destination "ToAddresses=$TO_EMAIL" \
    --message "Subject={Data=$SUBJECT,Charset=utf8},Body={Text={Data=$BODY_TEXT,Charset=utf8},Html={Data=$BODY_HTML,Charset=utf8}}" \
    --region "$AWS_REGION"

echo "Email sent command executed."
