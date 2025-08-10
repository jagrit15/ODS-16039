#!/bin/bash

SUBJECT="$1"
BODY="$2"
TO_EMAIL="jagritpandeer1969@gmail.com"
FROM_EMAIL="jagritpandeer1969@gmail.com"
REGION="us-east-1"

# Remove ANSI escape codes for clean email
CLEAN_BODY=$(echo "$BODY" | sed -r "s/\x1B\[[0-9;]*[mK]//g")

# Build CodeBuild log URL if inside CodeBuild
if [ -n "$CODEBUILD_PROJECT" ] && [ -n "$CODEBUILD_BUILD_ID" ]; then
    CODEBUILD_LOG_URL="https://console.aws.amazon.com/codesuite/codebuild/projects/${CODEBUILD_PROJECT}/build/${CODEBUILD_BUILD_ID}/?region=${REGION}"
    CLEAN_BODY="${CLEAN_BODY}\n\nCodeBuild Logs: ${CODEBUILD_LOG_URL}"
fi

aws ses send-email \
    --region "$REGION" \
    --from "$FROM_EMAIL" \
    --destination "ToAddresses=${TO_EMAIL}" \
    --message "Subject={Data=${SUBJECT},Charset=utf8},Body={Text={Data=${CLEAN_BODY},Charset=utf8}}"
