WITH base AS (
  SELECT
    respondent_id,
    region,
    -- ISO 3166-2 區域代碼欄位（地圖視覺化對應用）
    CASE
        WHEN region = '台北市' THEN 'TW-TPE'
        WHEN region = '新北市' THEN 'TW-NWT'
        WHEN region = '台中市' THEN 'TW-TXG'
        WHEN region = '台南市' THEN 'TW-TNN'
        WHEN region = '高雄市' THEN 'TW-KHH'
        WHEN region = '桃園市' THEN 'TW-TAO'
        WHEN region = '基隆市' THEN 'TW-KEE'
        WHEN region = '新竹市' THEN 'TW-HSZ'
        WHEN region = '新竹縣' THEN 'TW-HSQ'
        WHEN region = '苗栗縣' THEN 'TW-MIA'
        WHEN region = '彰化縣' THEN 'TW-CHA'
        WHEN region = '南投縣' THEN 'TW-NAN'
        WHEN region = '雲林縣' THEN 'TW-YUN'
        WHEN region = '嘉義市' THEN 'TW-CYI'
        WHEN region = '嘉義縣' THEN 'TW-CYQ'
        WHEN region = '屏東縣' THEN 'TW-PIF'
        WHEN region = '宜蘭縣' THEN 'TW-ILA'
        WHEN region = '花蓮縣' THEN 'TW-HUA'
        WHEN region = '台東縣' THEN 'TW-TTT'
        WHEN region = '澎湖縣' THEN 'TW-PEN'
        WHEN region = '金門縣' THEN 'TW-KIN'
        WHEN region = '連江縣' THEN 'TW-LIE'
        ELSE NULL
    END AS region_iso_code,
    age,
    gender,
    -- 將 0 當作 NULL 處理
    NULLIF(brand_preference, 0) AS brand_preference,
    NULLIF(emotional_attachment, 0) AS emotional_attachment,
    NULLIF(satisfaction, 0) AS satisfaction,
    NULLIF(loyalty, 0) AS loyalty
  FROM {{ ref('stg_brand_survey_cleaned') }}
),

favorability_scored AS (
  SELECT
    *,
    -- 計算有填答的題目數
    (
      IF(brand_preference IS NOT NULL, 1, 0) +
      IF(emotional_attachment IS NOT NULL, 1, 0) +
      IF(satisfaction IS NOT NULL, 1, 0) +
      IF(loyalty IS NOT NULL, 1, 0)
    ) AS answered_count,

    -- 合計得分
    (
      COALESCE(brand_preference, 0) +
      COALESCE(emotional_attachment, 0) +
      COALESCE(satisfaction, 0) +
      COALESCE(loyalty, 0)
    ) AS total_score
  FROM base
)

SELECT
  *,
  -- 安全除法計算平均分數
  ROUND(SAFE_DIVIDE(total_score, answered_count), 2) AS avg_favorability_score,

  CASE
    WHEN SAFE_DIVIDE(total_score, answered_count) >= 4 THEN '正面'
    WHEN SAFE_DIVIDE(total_score, answered_count) >= 2.5 THEN '中立'
    ELSE '負面'
  END AS favorability_level

FROM favorability_scored
WHERE answered_count >= 2  -- ✅ 至少填答兩題才計算（可調整）
