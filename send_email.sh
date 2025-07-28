#!/bin/bash

SUBJECT="$1"
BODY_FILE="$2"
TO_EMAIL="Jagritpandeer1969@gmail.com"
FROM_EMAIL="jpandeer15@gmail.com"
REGION="us-east-1"

BODY=$(cat "$BODY_FILE")

# Create JSON payload
cat > email.json <<EOF
{
  "Source": "$FROM_EMAIL",
  "Destination": {
    "ToAddresses": ["$TO_EMAIL"]
  },
  "Message": {
    "Subject": {
      "Data": "$SUBJECT",
      "Charset": "UTF-8"
    },
    "Body": {
      "Text": {
        "Data": "$BODY",
        "Charset": "UTF-8"
      }
    }
  }
}
EOF

cat email.json  # Debug: Check contents

aws ses send-email --region "$REGION" --cli-input-json file://email.json
