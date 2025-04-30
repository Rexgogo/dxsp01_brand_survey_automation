📁 dxsp01_brand_survey_automation
├── 📁 abctl
│   ├── 📄 abctl.exe
│   ├── 📄 LICENSE
│   └── 📄 README.md
├── 📁 assets
│   └── 📄 zapier_workflow_diagram.png
├── 📄 brandX_survey_result_2025_Q2.csv
├── 📄 client_secret_525012642936-kdqkt76dscj4qf8q5u8i232si8bdvnkj.apps.googleusercontent.com.json
├── 📁 credentials
├── 📁 dbt
│   ├── 📁 credentials
│   │   └── 📄 bq-dxsp01-credentials-20250416.json
│   ├── 📄 dbt_project.yml
│   ├── 📄 Dockerfile
│   ├── 📁 logs
│   │   └── 📄 dbt.log
│   ├── 📁 models
│   │   ├── 📁 intermediate
│   │   │   ├── 📄 int_brand_survey_cleaned.sql
│   │   │   └── 📄 int_brand_survey_cleaned.yml
│   │   ├── 📁 mart
│   │   ├── 📁 staging
│   │   │   ├── 📄 bq_sources.yml
│   │   │   └── 📄 stg_brand_survey.sql
│   │   └── 📁 test
│   │       └── 📄 test_model.sql
│   ├── 📄 profiles.yml
│   └── 📁 target
│       ├── 📁 compiled
│       │   └── 📁 dxsp01
│       │       └── 📁 models
│       │           ├── 📁 intermediate
│       │           │   └── 📄 int_brand_survey_cleaned.sql
│       │           ├── 📁 staging
│       │           │   └── 📄 stg_brand_survey.sql
│       │           └── 📁 test
│       │               └── 📄 test_model.sql
│       ├── 📄 graph.gpickle
│       ├── 📄 graph_summary.json
│       ├── 📄 manifest.json
│       ├── 📄 partial_parse.msgpack
│       ├── 📁 run
│       │   └── 📁 dxsp01
│       │       └── 📁 models
│       │           ├── 📁 intermediate
│       │           │   └── 📄 int_brand_survey_cleaned.sql
│       │           ├── 📁 staging
│       │           │   └── 📄 stg_brand_survey.sql
│       │           └── 📁 test
│       │               └── 📄 test_model.sql
│       ├── 📄 run_results.json
│       └── 📄 semantic_manifest.json
├── 📄 docker-compose.yml
├── 📁 docs
│   ├── 📄 airbyte_connection_setup.md
│   ├── 📄 API.md
│   ├── 📄 docker_airbyte_deployment.md
│   ├── 📄 file_system_diagram.ipynb
│   ├── 📄 zapier_trigger_airbyte.md
│   └── 📄 zapier_worflow_setup.md
├── 📁 ngrok_config
├── 📄 README.md
└── 📄 未命名的試算表 - dx01_raw__stream_brandX_survey_result_2025_Q2.csv
