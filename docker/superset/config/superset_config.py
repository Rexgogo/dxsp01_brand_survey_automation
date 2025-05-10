import os

# 使用環境變數來設定資料庫連接
SQLALCHEMY_DATABASE_URI = 'postgresql://superset:superset@postgres:5432/superset'
# SQLALCHEMY_DATABASE_URI = f"postgresql://{os.environ.get('POSTGRES_USER')}:{os.environ.get('POSTGRES_PASSWORD')}@dx01_db_postgres:5432/{os.environ.get('POSTGRES_DB')}"
BIGQUERY_CREDENTIALS_PATH = '/app/credentials/dx01_gcp_credentials_20250416.json'



# Security Configuration
SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY')
ENABLE_PROXY_FIX = True

# Feature Flags
FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True,
    "ENABLE_PYTHON_TEMPLATING": True
}

# 默認的內存緩存
CACHE_CONFIG = {
    'CACHE_TYPE': 'SimpleCache',
    'CACHE_DEFAULT_TIMEOUT': 300
}