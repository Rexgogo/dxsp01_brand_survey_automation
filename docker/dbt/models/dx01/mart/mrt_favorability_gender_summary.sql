SELECT
  gender,
  COUNT(*) AS respondent_count,
  ROUND(AVG(avg_favorability_score), 2) AS avg_favorability_score,
  ROUND(SUM(CASE WHEN favorability_level = '正面' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_positive_pct,
  ROUND(SUM(CASE WHEN favorability_level = '中立' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_neutral_pct,
  ROUND(SUM(CASE WHEN favorability_level = '負面' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_negative_pct
FROM {{ ref('int_user_brand_favorability') }}
GROUP BY gender
