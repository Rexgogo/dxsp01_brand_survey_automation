| 技術 / 工具         | 所用 API                 | 驗證方式         | 你做了什麼                             |
|--------------------|--------------------------|------------------|----------------------------------------|
| Google Sheets API  | REST API                | OAuth2           | 讀取問卷資料，自動載入至資料流         |
| BigQuery API       | REST API / SQL API      | JSON Credential  | 寫入問卷資料至雲端資料倉儲             |
| Airbyte Sync API   | REST API                | -                | 呼叫自動同步流程，執行 ETL             |
| Zapier Webhook     | HTTP POST (Webhook API) | -                | 接收表單事件並觸發 Airbyte 任務        |
| GCP Credential     | -（非 API，但支援 API）  | JSON Credential  | 驗證工具存取權限以執行 API 操作        |
