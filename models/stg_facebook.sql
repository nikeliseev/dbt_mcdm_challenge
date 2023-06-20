with fb as (
    select * from {{ ref("src_ads_creative_facebook_all_data") }}
)

select 
      ad_id
    , add_to_cart
    , adset_id
    , campaign_id
    , channel
    , clicks
    , comments
    , creative_id
    , date
    , views + clicks + comments + likes + shares as engagements
    , impressions
    , mobile_app_install as installs
    , likes
    , inline_link_clicks as link_clicks
    , null as placement_id
    , null as post_click_conversions
    , null as post_view_conversions
    , purchase
    , complete_registration as registrations
    , null as revenue
    , shares
    , spend
    , case when purchase = 0 then 0 else spend / purchase end as total_conversions
    , null as video_views
from fb