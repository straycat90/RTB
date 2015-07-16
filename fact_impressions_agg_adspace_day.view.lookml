- view: fact_impressions_agg_adspace_day
  sql_table_name: kds.fact_impressions_agg_adspace_day
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: floor_price
    type: number
    sql: ${TABLE}.floor_price

  - dimension: floor_tier
    type: tier
    tiers: [0,0.25,0.50,1,1.50]
    style: relational
    sql: ${floor_price}
    
  - dimension_group: imp
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.imp_date

  - dimension: num_bids
    type: int
    sql: ${TABLE}.num_bids

  - dimension: num_bids_above_floor
    type: int
    sql: ${TABLE}.num_bids_above_floor

  - dimension: num_requests
    type: int
    sql: ${TABLE}.num_requests

  - dimension: num_impressions
    type: int
    sql: ${TABLE}.num_impressions

  - dimension: sum_response_time
    type: int
    sql: ${TABLE}.response_time

  - dimension: sum_bids
    type: int
    sql: ${TABLE}.sum_bids

  - dimension: sum_winning_bid_price
    type: number
    sql: ${TABLE}.sum_bid_price

  - dimension: sum_win_price
    type: number
    sql: ${TABLE}.sum_win_price

  - dimension: won
    type: int
    sql: ${TABLE}.won

  - measure: total_num_impressions
    type: sum
    sql: ${num_impressions}

  - measure: num_win_bids
    type: sum
    sql: ${won}*${num_impressions}

  - measure: total_num_requests
    type: sum
    sql: ${num_requests}

  - measure: total_num_bids
    type: sum
    sql: ${num_bids}

  - measure: total_num_bids_above_floor
    type: sum
    sql: ${num_bids_above_floor}

  - measure: total_bid_amt
    type: sum
    sql: ${sum_bids}
    decimals: 4

  - measure: revenue
    type: sum
    sql: ${sum_win_price}
    decimals: 4

  - measure: total_winning_bid
    type: sum
    sql: ${sum_winning_bid_price}
    decimals: 4

  - measure: avg_win_price
    type: number
    sql: ${revenue}::float/NULLIF(${num_win_bids},0)
    decimals: 4

  - measure: avg_winning_bid
    type: number
    sql: ${total_winning_bid}::float/NULLIF(${num_win_bids},0)
    decimals: 4

  - measure: sum_floor_price
    type: sum
    sql: ${floor_price}*${num_impressions}
    decimals: 4

  - measure: avg_floor_price
    type: number
    sql: ${sum_floor_price}::float/NULLIF(${total_num_impressions},0)
    decimals: 4

  - measure: avg_bid
    type: number
    sql: ${total_bid_amt}::float/NULLIF(${total_num_bids},0)
    decimals: 4

  - measure: expected_rev
    type: number
    value_format: '$###.##'
    sql: ${avg_bid}::float*${total_num_impressions}
    decimals: 2

  - measure: fill_rate
    type: number
    value_format: '###.##%'
    sql: ${num_win_bids}::float/NULLIF(${total_num_impressions},0)
    decimals: 2

  - measure: resp_rate
    type: number
    value_format: '###.##%'
    sql: ${total_num_bids}::float/NULLIF(${total_num_requests},0)
    decimals: 2
