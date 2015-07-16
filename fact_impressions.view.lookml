- view: fact_impressions
  sql_table_name: kds.fact_impressions
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: bid_price
    type: number
    sql: ${TABLE}.bid_price

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

  - dimension: imp_hour
    type: int
    sql: ${TABLE}.imp_hour

  - dimension: imp_id
    sql: ${TABLE}.imp_id

  - dimension: imp_min
    type: int
    sql: ${TABLE}.imp_min

  - dimension: num_bids
    type: int
    sql: ${TABLE}.num_bids

  - dimension: num_bids_above_floor
    type: int
    sql: ${TABLE}.num_bids_above_floor

  - dimension: num_requests
    type: int
    sql: ${TABLE}.num_requests

  - dimension: response_time
    type: int
    sql: ${TABLE}.response_time

  - dimension: response_type
    sql: ${TABLE}.response_type

  - dimension: sum_bids
    type: int
    sql: ${TABLE}.sum_bids

  - dimension: win_price
    type: number
    sql: ${TABLE}.win_price

  - dimension: won
    type: int
    sql: ${TABLE}.won

  - measure: num_impressions
    type: count
    drill_fields: []

  - measure: num_win_bids
    type: sum
    sql: ${won}

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
    sql: ${win_price}
    decimals: 4

  - measure: avg_win_price
    type: avg
    sql: ${win_price}
    decimals: 4

  - measure: avg_winning_bid
    type: avg
    sql: ${bid_price}
    decimals: 4

  - measure: sum_floor_price
    type: sum
    sql: ${floor_price}
    decimals: 4

  - measure: avg_floor_price
    type: avg
    sql: ${floor_price}
    decimals: 4

  - measure: win_pct_of_floor
    type: number
    value_format: '###.##%'
    sql: ${revenue}::float/NULLIF(${sum_floor_price},0)
    decimals: 2

  - measure: avg_bid
    type: number
    sql: ${total_bid_amt}::float/NULLIF(${total_num_bids},0)
    decimals: 4

  - measure: expected_rev
    type: number
    value_format: '$###.##'
    sql: ${avg_bid}::float*${num_impressions}
    decimals: 2

  - measure: fill_rate
    type: number
    value_format: '###.##%'
    sql: ${num_win_bids}::float/NULLIF(${num_impressions},0)
    decimals: 2

  - measure: resp_rate
    type: number
    value_format: '###.##%'
    sql: ${total_num_bids}::float/NULLIF(${total_num_requests},0)
    decimals: 2
