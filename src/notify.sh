#!/bin/bash

TELEGRAM_USER_ID="807543629"

TELEGRAM_BOT_TOKEN="6301245745:AAHCT2qW8XkB_XWHKy-lgniKht-QRmOan0w"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

TEXT="project:+$CI_PROJECT_NAME%0AStage:+$CI_JOB_STAGE%0A+$CI_JOB_STATUS%0A"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
