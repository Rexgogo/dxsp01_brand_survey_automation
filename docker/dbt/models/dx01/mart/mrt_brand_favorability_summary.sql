SELECT
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
    COUNT(*) AS respondent_count,
    ROUND(AVG(avg_favorability_score), 2) AS avg_favorability_score,
    ROUND(SUM(CASE WHEN favorability_level = '正面' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS favorability_positive_pct,
    ROUND(SUM(CASE WHEN favorability_level = '中立' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS favorability_neutral_pct,
    ROUND(SUM(CASE WHEN favorability_level = '負面' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS favorability_negative_pct
FROM {{ ref('int_user_brand_favorability') }}
GROUP BY region
