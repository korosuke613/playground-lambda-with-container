#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
    exec /aws-lambda/aws-lambda-rie /opt/bitnami/node/bin/npx aws-lambda-ric $1
else
    exec /opt/bitnami/node/bin/npx aws-lambda-rie $1
fi
