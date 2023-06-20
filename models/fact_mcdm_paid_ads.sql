with bing as (
    select * from {{ ref("stg_bing") }}
),

fb as (
    select * from {{ ref("stg_facebook") }}
),

tiktok as (
    select * from {{ ref("stg_tiktok") }}
),

twitter as (
    select * from {{ ref("stg_twitter") }}
)

select fb.* from fb left join tiktok using (ad_id)