with twitter as (
    select * from {{ ref("src_promoted_tweets_twitter_all_data") }}
)

select 
      null as ad_id
    , null as add_to_cart
    , null as adset_id
    , campaign_id
    , channel
    , clicks
    , comments
    , null as creative_id
    , date
    , engagements
    , impressions
    , null as installs
    , likes
    , url_clicks as link_clicks
    , null as placement_id
    , null as post_click_conversions
    , null as post_view_conversions
    , null as post_view_conversions
    , null as purchase
    , null as registrations
    , null as revenue
    , retweets as shares
    , spend
    , null as total_conversions
    , video_total_views as video_views
from twitter