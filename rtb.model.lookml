- connection: rtb

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: fact_impressions_agg_adspace_day
  joins:
  - join: dim_adspace
    sql_on: ${fact_impressions_agg_adspace_day.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_impressions
  joins:
  - join: dim_adspace
    sql_on: ${fact_impressions.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_requests_agg_adspace_day
  joins:
  - join: dim_adspace
    sql_on: ${fact_requests_agg_adspace_day.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_requests_agg_adspace_hour
  joins:
  - join: dim_adspace
    sql_on: ${fact_requests_agg_adspace_hour.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_requests
  joins:
  - join: dim_adspace
    sql_on: ${fact_requests.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_deal_requests
  joins:
  - join: dim_adspace
    sql_on: ${fact_deal_requests.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: fact_bids
  joins:
  - join: dim_adspace
    sql_on: ${fact_bids.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one
  - join: dim_advertiser
    sql_on: ${fact_bids.advertiser_id}=${dim_advertiser.advertiser_id}
    relationship: many_to_one

- explore: rtb_floor_optimizer
  joins:
  - join: dim_adspace
    sql_on: ${rtb_floor_optimizer.adspace_id}=${dim_adspace.adspace_id}
    relationship: many_to_one

- explore: new_impression_bids

- explore: new_impression_bids_agg_day
