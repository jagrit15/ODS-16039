#!/bin/bash

SUBJECT="$1"
BODY_FILE="$2"
TO_EMAIL="jagritpandeer1969@gmail.com"
FROM_EMAIL="jagritpandeer1969@gmail.com"
REGION="us-east-1"

# Optional: use environment variables from CodeBuild
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=${REGION:-"us-east-1"}
BUILD_ID=${CODEBUILD_BUILD_ID}
BUILD_URL="https://${REGION}.console.aws.amazon.com/codesuite/codebuild/projects/${CODEBUILD_PROJECT_NAME}/build/${BUILD_ID}/log?region=${REGION}"

BODY=$(<"$BODY_FILE")
BODY="$BODY

View logs: $BUILD_URL"

aws ses send-email \
  --region "$REGION" \
  --from "$FROM_EMAIL" \
  --destination "ToAddresses=$TO_EMAIL" \
  --message "Subject={Data=\"$SUBJECT\",Charset=utf-8},Body={Text={Data=\"$BODY\",Charset=utf-8}}"
