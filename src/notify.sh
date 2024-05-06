#!/bin/bash

TELEGRAM_USER_ID="*********"

TELEGRAM_BOT_TOKEN="XXXXXXXXXXXXXXXXXX"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

TEXT="project:+$CI_PROJECT_NAME%0AStage:+$CI_JOB_STAGE%0A+$CI_JOB_STATUS%0A"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
