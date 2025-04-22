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