# How to deploy Airbyte on Docker container

Airbyte自2024年起不再支援 docker-compose建置方式
改用跨平台 CLI 工具`abctl`
同樣能本地或雲端快速部署 Airbyte
本文件是在Docker container佈屬的步驟

## abctl deployment 

1. 下載 abctl. exe: 執行`curl -L -o abctl.exe https://github.com/airbytehq/abctl/releases/latest/download/abctl-windows-amd64.exe`
2. 加入系統變數Path中
3. 重新啟動cmd
4. 測試`abctl version`
5. 使用 Docker 建立本地 Airbyte 環境: 執行`abctl local instal`
6. 訪問 http://localhost:8000
7. 首次先輸入 Email, 組織名，接著執行`abctl local credentials`找到預設密碼
	
	 INFO    Using Kubernetes provider:
	            Provider: kind
	            Kubeconfig: C:\Users\Rex\.airbyte\abctl\abctl.kubeconfig
	            Context: kind-airbyte-abctl
	 SUCCESS  Retrieving your credentials from 'airbyte-auth-secrets'
	  INFO    Credentials:
	            Email: XXX
	            Password: x7RGT9RQhKxRCCgOlaibBXZ6zEgXXXXX
	            Client-Id: 4cabbcaf-0919-4391-a639-d96XXXXXXXX
	            Client-Secret: cksiguYbnWVPJjZGSCsXXXXXXXXXXX

## Create conneection

1. create souce and destination (若無 GoogleAPI 憑證請先執行 2.)
		Google Sheets
		BigQuery
2. credentials
		- 啟用Google Sheets API與Google Drive API
		- `API 與服務` → `OAuth 同意畫面` → 選擇「外部」目標對象
		- 接著填寫
			- 應用程式名稱：`Internal Google Sheets Connector for Airbyte`
			- 使用者支援電子郵件：你的 Gmail
			- 開發人員聯絡資訊：你的 Gmail
	        - 在「測試使用者」區段中，新增 Google帳號
	    - `API 與服務` → `憑證`
	    - `建立憑證` → `OAuth 用戶端 ID`→`Web 應用程式`
	    - 授權的重新導向 URI 填入：`http://localhost:8000/auth_flow`
	    - 複製 `Client ID` 與 `Client Secret` 回填`New Connection` → `Source` → `Google Sheets` →`Authorize`
	    
3. configure connection
	- Append Historical Changes(保留歷史異動)
	- Destination Namespace: Destination-defined (寫入預設的BigQuery dataset)
	- Stream Prefix: 無 (沿用來源資料表名稱)
	- When the source schema changes, I want to: Propagate field changes only
		- 當 GSheet 刪欄位 → 不會自動刪除 BigQuery 欄位
		- 當 GSheet 改欄位型別 → 不自動更改 schema
	- Be notified when schema changes occur V
	- Backfill new or renamed columns V