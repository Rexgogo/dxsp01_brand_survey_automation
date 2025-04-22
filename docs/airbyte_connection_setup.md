# Airbyte Connection Setup
#### Create souce & destination 
Google Sheets
BigQuery
若無 GoogleAPI 憑證請先執行2. Create API/Credentials

#### Create API/Credentials
1. 啟用Google Sheets API與Google Drive API
2. `API 與服務` → `OAuth 同意畫面` → 選擇「外部」目標對象
		- 應用程式名稱：`Internal Google Sheets Connector for Airbyte`
		- 使用者支援電子郵件：你的 Gmail
		- 開發人員聯絡資訊：你的 Gmail
	    - 在「測試使用者」區段中，新增 Google帳號
3. `API 與服務` → `憑證`
	    - `建立憑證` → `OAuth 用戶端 ID`→`Web 應用程式`
	    - 授權的重新導向 URI 填入：`http://localhost:8000/auth_flow`
4. 複製 `Client ID` 與 `Client Secret` 回填`New Connection` → `Source` → `Google Sheets` →`Authorize`
	    
#### Configure connection
- Append Historical Changes(保留歷史異動)
- Destination Namespace: Destination-defined (寫入預設的BigQuery dataset)
- Stream Prefix: 無 (沿用來源資料表名稱)
- When the source schema changes, I want to: Propagate field changes only
	- 當 GSheet 刪欄位 → 不會自動刪除 BigQuery 欄位
	- 當 GSheet 改欄位型別 → 不自動更改 schema
- Be notified when schema changes occur V
- Backfill new or renamed columns V