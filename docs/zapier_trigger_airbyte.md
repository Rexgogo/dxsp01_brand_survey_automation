# Zapier Trigger Airbyte
以Zapier 作為Trigger，當source新增資料時，呼叫 Airbyte`/api/v1/connections/sync` API進行數據同步

## Configuration
- `App`: Webhooks by Zapier
- `Event`: POST`

- `URL`：https://xxxxxxx.ngrok-free.app/api/v1/connections/sync
- `Payload Type`：JSON
- `Data`：選擇要傳送的欄位data { "connectionId": "18f5f65d-67a7-49ba-9838-07f56621110e" }
- `Wrap Request In Array`: Yes
- `Unflatten`: Yes
- `Headers`：Content-Type application/json


## 如何取得URL?

在本地 Docker 設定 ngrok 並啟動公開連線
>ngrok 是一種用來將本地服務expose到網際網路的工具。我們使用它將本地的 Airbyte HTTP 介面 (預設在 `localhost:8000`) expose成可從外部存取的 HTTPS URL，供 Zapier  Webhook呼叫用

1. 建立 ngrok 設定檔位置 `D:\Desktop\DS_workspace\dxsp01\ngrok_config\.config\ngrok\ngrok.yml`
2. 至 [https://dashboard.ngrok.com/get-started/your-authtoken](https://dashboard.ngrok.com/get-started/your-authtoken) 取得authtoken
3. ngrok. yml內容為
```
version: "3"
agent:
    authtoken: 2vrfT6vJMdVkxHo6eodM7BJcUYd_2Gq5p22gaE1J3JbUKekjG
```
4. 啟動 ngrok
```bash
docker run -it --rm \
  -v D:\Desktop\DS_workspace\dxsp01_survey_automate_zapier\ngrok_config:/home/ngrok \
  -e NGROK_CONFIG=/home/ngrok/.config/ngrok/ngrok.yml \
  ngrok/ngrok http 8000
```
5. 如成功會顯示Forwarding https://xxxx-xx.ngrok-free.app → http://localhost:8000

## 如何取得Data內容?

#### 方法一
從 Airbyte UI 的網址取得: `Connections` → 查看網址 `http://localhost:8000/connections/18f5f65d-67a7-49ba-9838-07f56621110e`

#### 方法二
```bash
curl -X POST http://localhost:8000/api/v1/connections/list
#會顯示
{
  "connections": [
    {
      "connectionId": "18f5f65d-67a7-49ba-9838-07f56621110e",
      "name": "GSheet to BigQuery",
      ...
    }
  ]
}
```


|欄位|填寫內容|
|---|---|
|**Key**|`data` （請直接打上「data」）|
|**Value**|`{ "connectionId": "18f5f65d-67a7-49ba-9838-07f56621110e" }`（**整段 JSON 字串**）|
