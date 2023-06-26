# ads_basic_performance report
ads_basic_performance report consists of 4 sources: raw data from Facebook, Twitter, Bing and TikTok ad platforms.

![graph](https://downloader.disk.yandex.ru/preview/bdb825879d4a1977c4e10b25ba4bd1e53794bc5d37bb7c6bc64bf0c7060050de/6492790c/N4GxGREnGdEAa6T7R-B5e_rjTx4rOWMnCky0Ay53auxrtMbJg_uOCalT-rCwtXxGjtOPBvdOAJqLC5m1cBYPpA%3D%3D?uid=0&filename=Screenshot%202023-06-21%20025449.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=2048x2048)

Each source have their stage model, in which data is prepared for use. You can find all the sql-queries for creating stage-models below.

<details>
		<summary>stg queries</summary>
	
	/* stg_facebook */
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
	    , purchase as total_conversions
	    , null as video_views
	from src_ads_creative_facebook_all_data

	/* stg_tiktok */
	select 
	      ad_id
	    , add_to_cart
	    , adgroup_id as adset_id
	    , campaign_id
	    , channel
	    , clicks
	    , null as comments
	    , null as creative_id
	    , date
	    , null as engagements
	    , impressions
	    , rt_installs + skan_app_install as installs
	    , null as likes
	    , null as link_clicks
	    , null as placement_id
	    , null as post_click_conversions
	    , null as post_view_conversions
	    , purchase
	    , registrations
	    , null as revenue
	    , null as shares
	    , spend
	    , conversions + skan_conversion as total_conversions
	    , video_views
	from src_ads_tiktok_ads_all_data
 
	/* stg_twitter */
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
	    , null as purchase
	    , null as registrations
	    , null as revenue
	    , retweets as shares
	    , spend
	    , null as total_conversions
	    , video_total_views as video_views
	from src_promoted_tweets_twitter_all_data

 	/* stg_bing */
	select 
	      ad_id
	    , null as add_to_cart
	    , adset_id
	    , campaign_id
	    , channel
	    , clicks
	    , null as comments
	    , null as creative_id
	    , date
	    , null as engagements
	    , imps as impressions
	    , null as installs
	    , null as likes
	    , null as link_clicks
	    , null as placement_id
	    , null as post_click_conversions
	    , null as post_view_conversions
	    , null as purchase
	    , null as registrations
	    , revenue
	    , null as shares
	    , spend
	    , conv as total_conversions
	    , null as video_views
	from src_ads_bing_all_data
</details>

All stage-models combined in one view - fact_mcdm_paid_ads, which you can use for analytics and dashboards design.

[Link to dashboard](https://lookerstudio.google.com/s/l9IerrM22f8)

