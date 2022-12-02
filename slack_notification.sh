#!/bin/bash
SERVER_NAME=$1
PORT=$2
SERVICE=$3
STATUS=$4
TEST_WHEN="`date +%Y-%m-%d_%H:%M:%S`"
PRETEXT="$SERVER_NAME | $TEST_WHEN"
TEXT="[$SERVER_NAME:$PORT] $SERVICE - $STATUS"
SLACK_HOOK="https://hooks.slack.com/services/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"

curl -X POST --data-urlencode "payload={\"text\": \"$TEXT\"}" $SLACK_HOOK
