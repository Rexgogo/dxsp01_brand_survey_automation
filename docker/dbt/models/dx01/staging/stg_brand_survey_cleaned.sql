# models/staging/stg_brand_survey_cleaned.sql

with source as(
    select * from {{ref('stg_brand_survey')}}
), 

parsed  as(
    select 
        _airbyte_raw_id, 
        json_value(_airbyte_data, '$.timestamp') as survey_submitted_at, 
        json_value(_airbyte_data, '$.respondent_id') as respondent_id,
        json_value(_airbyte_data, '$.age') as age,
        json_value(_airbyte_data, '$.gender') as gender,
        json_value(_airbyte_data, '$.region') as region,
        json_value(_airbyte_data, '$.heard_of_brand') as heard_of_brand,
        json_value(_airbyte_data, '$.purchased_before') as purchased_before,
        json_value(_airbyte_data, '$.purchase_frequency') as purchase_frequency,
        json_value(_airbyte_data, '$.purchase_channel') as purchase_channel,
        json_value(_airbyte_data, '$.purchased_category') as purchased_category,
        -- 以下皆為 Likert Scale 類型 → cast 成 int64
        cast(json_value(_airbyte_data, '$.brand_awareness') as int64) as brand_awareness,
        cast(json_value(_airbyte_data, '$.brand_trust') as int64) as brand_trust,
        cast(json_value(_airbyte_data, '$.perceived_quality') as int64) as perceived_quality,
        cast(json_value(_airbyte_data, '$.perceived_value') as int64) as perceived_value,
        cast(json_value(_airbyte_data, '$.satisfaction') as int64) as satisfaction,
        cast(json_value(_airbyte_data, '$.loyalty') as int64) as loyalty,
        cast(json_value(_airbyte_data, '$.recommend') as int64) as recommend,
        cast(json_value(_airbyte_data, '$.purchase_intent') as int64) as purchase_intent,
        cast(json_value(_airbyte_data, '$.brand_preference') as int64) as brand_preference,
        cast(json_value(_airbyte_data, '$.emotional_attachment') as int64) as emotional_attachment
    from source
), 

transformed as(
    select 
        survey_submitted_at,
        respondent_id,
        age,
        gender,
        region,
        heard_of_brand,
        case heard_of_brand 
            when '是' then 1
            when '否' then 0
        end as heard_of_brand_flag,
        purchased_before,
        case purchased_before
                when '是' then 1
                when '否' then 0
            end as purchased_before_flag,
        purchase_frequency,
        purchase_channel,
        purchased_category,
        brand_awareness,
        brand_trust,
        perceived_quality,
        perceived_value,
        satisfaction,
        loyalty,
        recommend,
        purchase_intent,
        brand_preference,
        emotional_attachment
    from parsed  
)


select * from transformed