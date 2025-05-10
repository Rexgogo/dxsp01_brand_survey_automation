SELECT
  CASE
    WHEN CAST(age AS INT64) BETWEEN 18 AND 24 THEN '18–24'
    WHEN CAST(age AS INT64) BETWEEN 25 AND 34 THEN '25–34'
    WHEN CAST(age AS INT64) BETWEEN 35 AND 44 THEN '35–44'
    WHEN CAST(age AS INT64) BETWEEN 45 AND 54 THEN '45–54'
    WHEN CAST(age AS INT64) >= 55 THEN '55+'
    ELSE 'Unknown'
  END AS age_group,
  COUNT(*) AS respondent_count,
  ROUND(AVG(avg_favorability_score), 2) AS avg_favorability_score,
  ROUND(SUM(CASE WHEN favorability_level = '正面' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_positive_pct,
  ROUND(SUM(CASE WHEN favorability_level = '中立' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_neutral_pct,
  ROUND(SUM(CASE WHEN favorability_level = '負面' THEN 1 ELSE 0 END) / COUNT(*), 2) AS favorability_negative_pct
FROM {{ ref('int_user_brand_favorability') }}
GROUP BY age_group
