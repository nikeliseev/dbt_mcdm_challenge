with bing as (
    select * from {{ ref("src_ads_bing_all_data") }}
),

fb as (
    select * from {{ ref("src_ads_creative_facebook_all_data") }}
),

tiktok as (
    select * from {{ ref("src_ads_tiktok_ads_all_data") }}
),

twitter as (
    select * from {{ ref("src_promoted_tweets_twitter_all_data") }}
)

select fb.* from fb left join tiktok using (ad_id)