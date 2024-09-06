#!/bin/bash

# 确保脚本可以正确运行
set -e

# 打印环境变量，帮助调试
echo "Uploading Swagger to Apifox..."
echo "APIFOX_PROJECT_ID === : $APIFOX_PROJECT_ID"
echo "APIFOX_API_TOKEN === : $APIFOX_API_TOKEN"

# 使用环境变量替换占位符并上传 Swagger 文档
curl --location --request POST "https://api.apifox.com/v1/projects/${APIFOX_PROJECT_ID}/import-openapi?locale=zh-CN" \
--header "X-Apifox-Api-Version: 2024-03-28" \
--header "Authorization: Bearer ${APIFOX_API_TOKEN}" \
--header "User-Agent: Apifox/1.0.0 (https://apifox.com)" \
--header "Content-Type: application/json" \
--data-raw '{
    "input": "string",
    "options": {
        "targetEndpointFolderId": 0,
        "targetSchemaFolderId": 0,
        "endpointOverwriteBehavior": "OVERWRITE_EXISTING",
        "schemaOverwriteBehavior": "OVERWRITE_EXISTING",
        "updateFolderOfChangedEndpoint": false,
        "prependBasePath": false
    }
}'

echo "Upload complete."