# Zapier Workflow Setup

1. Typeform - New Entry
功能： 偵測新表單回覆
設定：
App：Typeform
Trigger：New Entry
選擇表單
2. Formatter by Zapier - Date / Time
功能： 轉換Typeform每筆紀錄生成的submitted_at欄位
設定：
App：Formatter
Action Event：Date/Time
Input： Submitted date
To Format：YYYY-MM-DD
To Timezone：UTC

3. Google Sheets - Create Spreadsheet Row
功能： 將問卷回覆內容寫入Google Sheets
設定：
App：Google Sheets
Action：Create Spreadsheet Row
選擇試算表與工作表
將問卷欄位與Google Sheets一一對應
*注意esponse_date要選擇轉換後的時間Date/Time in Formatter by Zapier

4. Webhooks by Zapier - POST
功能： 將資料POST至Airbyte Sync
設定：
App：Webhooks by Zapier
Action：POST
URL：目標API端點https://xxxxxxx.ngrok-free.app/api/v1/connections/sync (詳細請參考)
Payload Type：JSON
Data：選擇要傳送的欄位data { "connectionId": "18f5f65d-67a7-49ba-9838-07f56621110e" }
Wrap Request In Array: Yes
Unflatten: Yes
Headers：Content-Type application/json

5. Gmail - Send Email
功能： 發送通知Email給問卷填答者
設定：
App：Gmail
Action：Send Email
To：問卷填答者Email 
Subject：
Body：
