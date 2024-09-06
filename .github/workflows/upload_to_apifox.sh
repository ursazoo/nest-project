#!/bin/bash

# 打印环境变量，确保它们被正确设置
echo "APIFOX_PROJECT_ID: $APIFOX_PROJECT_ID"
echo "APIFOX_API_TOKEN: $APIFOX_API_TOKEN"

# 变量设置
# APIFOX_PROJECT_ID="5118368"       # 替换为你的 Apifox 项目 ID
# APIFOX_API_TOKEN="your_api_token"         # 替换为你的 Apifox API Token
SWAGGER_FILE_PATH="./swagger.json"        # Swagger JSON 文件的路径

curl --location -g --request POST "https://api.apifox.com/v1/projects/$APIFOX_PROJECT_ID/import-openapi?locale=zh-CN" \
--header 'X-Apifox-Api-Version;' \
--header "Authorization: Bearer $APIFOX_API_TOKEN" \
--header 'User-Agent: Apifox/1.0.0 (https://apifox.com)' \
--header 'Content-Type: application/json' \
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