#!/bin/bash

#AWS Credentials
AWS_ACCESS_KEY_ID=AKIA5ATVMXE7ZSOSJPYD
AWS_SECRET_ACCESS_KEY=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
AWS_DEFAULT_REGION=us-east-1

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION
