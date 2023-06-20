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

select * from fb 
union all
select * from tiktok 
union all
select * from bing 
union all
select * from twitter 
