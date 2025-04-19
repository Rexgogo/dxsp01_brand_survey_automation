# DXSP01-Brand Survey Automation Project

## Overview專案簡介
本專案是一套以Zapier為觸發中介的流程自動化專案，針對每日品牌市調問卷結果進行轉換、異常檢測、數據貼標、分析儀表板更新與通知發送，支援行銷團隊進行即時決策與品牌追蹤(正在進行品牌形象的行銷企劃)

No-Code Zapier自動化流程進一步整合BigQuery + dbt + Looker Studio，不僅以流程優化為目標，更為之後資料基礎建設與數據驅動目標建立良好基礎

--- 

## Objectives專案目標

**建立一套能長期、持續蒐集品牌認知數據的自動化機制，以回應行銷部門的策略調整需求**
- 降低行銷團隊人工處理問卷與分析時間成本
- 設計資料管線、促發，提升數據
- 即時/定期視覺化品牌KPI儀表板，提升決策效率
- 導入dbt作為數據轉換與建模主力，促進跨部門數據協作
- 專案日誌與洞察紀錄，累積數位轉型經驗
- 異常偵測通知
---


## Technical Stack 工具技術

| 工具 | 用途 |
|------|------|
| **API** | Webhook Integration, OAuth 2.0 授權, GCP API 認證, Service Account Key |
| **Typeform** | 問卷收集 |
| **Zapier** | 自動觸發資料流程與第三方軟體整合 |
| **Google Sheets** | 問卷暫存與查閱 |
| **Python** | 問卷資料清洗與貼標 |
| **Airbyte** | 資料同步、萃取工具 |
| **BigQuery** | 雲端資料儲存與查詢 |
| **dbt** | 資料建模與轉換(SQL-Based) |
| **Looker Studio** | BI工具 |
| **Notion** | 專案進度與分析紀錄 |
| **Slack / Gmail** | 自動通知 |

---

## Folder Structure 資料結構

```text
dxsp01_survey_automate_zapier/
├── README.md
├── .gitignore
├── .env
├── docker-compose.yml
├── credentials/
│   ├── zapier_credentials.json
│   └── bigquery_credentials.json
├── scripts/
│   ├── data_cleaning.py
│   ├── anomaly_detection.py
│   ├── user_segmentation.py
│   └── send_notifications.py
├── airbyte/
│   └── airbyte_config.yml
├── dbt_project/
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   └── marts/
│   ├── tests/
│   ├── macros/
│   ├── seeds/
│   └── schema.yml
└── docs/
    ├── technical_documentation.md
    └── workflow_diagram.png

```

## Workflow Diagram 工作流程圖

eraser.ai
資料流向、工具串接、測試與除錯、異常通知
```text
  A[Typeform / Google Forms 問卷填答] --> B[Google Sheets 問卷同步]
  B -->|Airbyte or Zapier| C[BigQuery 原始資料表]
  C -->|dbt stg/transformation| D[中繼資料模型 int_]
  D --> E[分析模型 mart_]
  E --> F[Looker Studio 看板]

```
---

## Environment Setup Guide 環境配置指南

1. System

Windows
Python ver
Docker ver

2. 安裝步驟 (Installation Steps)



3. API Keys & Credentials​

申請Typeform API Token

設定Zapier Webhook URL

配置Airbyte的連線資訊​

4. Local Development Setup

啟動 Docker 容器
執行資料庫遷移
載入初始資料


5. Testing & Verification

- 接手維護人員如何測試
- 業務單位的資料庫查詢測試

---

## Project Results & Highlights 專案成果

**轉型成效**
- 累積品牌市調專案資料，作為評估策略成效與改善的基礎，加速行銷團隊策略的迭代
- 流程遵循以Cloud-based DW為核心的ELT方法，在轉型初期即建立良好的數據彈性與可維護性
- 降低行銷團隊手動作業錯誤率至接近0%
- 每日品牌市調數據處理時效由人工2小時縮短至15分鐘

**技術落地**
- Zapier Webhook（Trigger: GSheets新增Row）觸發Airbyte同步至BigQuery
- 以dbt(SQL-based)為核心的數據建模與轉化的架構，提升內部對於資料的近用性

**商業應用**
- 支援全年品牌曝光 ROI 評估與多平台媒體配置建議

---

## Follow-up Optimization 後續優化 

- 整合進完整的資料管線
- CI/CD 自動化測試與部署

---

## 👤 Author Maintainer 

- **Rex C.**
- **chanminglung126@gmail.com**
- [**Profile URL**]()
- [**GitHub URL**]()
- **Skills:**
  - ETL (Airflow, Airbyte...)
  - Data Modeling & SQL Transformation (dbt, BigQuery)
  - Cloud-based Data Warehouse (BigQuery)
  - Python Data Analysis
  - BI Dashboarding (Superset, Looker Studio)
  - Automation design (Zapier)

--- 