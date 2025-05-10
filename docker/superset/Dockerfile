FROM apache/superset:4.1.2

########################
# install extra wheels #
########################
USER root

# 把 requirements 複製進來
COPY requirements-local.txt /tmp/requirements-local.txt

# ① 安裝到全域 site-packages（給 root 用，順手）
RUN pip install --no-cache-dir -r /tmp/requirements-local.txt

# ② **再** 以 superset 身分裝一次，放進 /home/superset/.local
USER superset
RUN pip install --no-cache-dir --user -r /tmp/requirements-local.txt

########################
# 讓 Superset 找得到套件 #
########################
ENV PYTHONPATH="/home/superset/.local/lib/python3.10/site-packages:${PYTHONPATH}"

# 你的自訂設定
ENV SUPERSET_CONFIG_PATH=/app/config/superset_config.py
