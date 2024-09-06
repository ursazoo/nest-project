#!/bin/bash

# 变量设置
APIFOX_PROJECT_ID="5118368"       # 替换为你的 Apifox 项目 ID
APIFOX_API_TOKEN="your_api_token"         # 替换为你的 Apifox API Token
SWAGGER_FILE_PATH="./swagger.json"        # Swagger JSON 文件的路径

# Apifox API URL
APIFOX_API_URL="https://api.apifox.cn/api/v1/import/swagger"

# 调用 Apifox API 上传 Swagger 文档
curl -X POST "$APIFOX_API_URL" \
  -H "Authorization: $APIFOX_API_TOKEN" \
  -F "projectId=$APIFOX_PROJECT_ID" \
  -F "file=@$SWAGGER_FILE_PATH" \
  -F "autoSync=true"  # autoSync 可以设置为 true，以自动同步文档