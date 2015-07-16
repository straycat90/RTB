- view: fact_requests_agg_adspace_day
  sql_table_name: kds.fact_requests_agg_adspace_day
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: sum_floor_price
    type: number
    sql: ${TABLE}.sum_floor_price

  - dimension_group: imp_dt
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

  - dimension: sum_response_time
    type: int
    sql: ${TABLE}.sum_response_time

  - dimension: response_type
    sql: ${TABLE}.response_type

  - dimension: status
    sql: ${TABLE}.status

  - dimension: sum_bids
    type: number
    sql: ${TABLE}.sum_bids

  - dimension: user_matched
    sql_case:
      unmatched: ${TABLE}.user_matched = 0
      matched: ${TABLE}.user_matched = 1
      else: unknown

  - dimension: sum_win_price
    type: number
    sql: ${TABLE}.sum_win_price

  - dimension: num_won
    type: int
    sql: ${TABLE}.num_won

  - measure: total_num_requests
    type: sum
    sql: ${TABLE}.num_requests

  - measure: total_sum_floor_price
    type: sum
    sql: ${TABLE}.sum_win_price

  - measure: total_bid_amt
    type: sum
    sql: ${sum_bids}
    decimals: 4

  - measure: total_win_price
    type: sum
    sql: ${sum_win_price}
    decimals: 4

  - measure: total_num_bids
    type: sum
    sql: ${num_bids}

  - measure: total_num_bids_above_floor
    type: sum
    sql: ${num_bids_above_floor}

  - measure: total_bids_won
    type: sum
    sql: ${num_won}

  - measure: total_spend
    type: sum
    sql: ${sum_win_price}
    decimals: 4
  
  - measure: avg_win_price
    type: number
    sql: ${total_win_price}::float/NULLIF(${total_bids_won},0)
    decimals: 4

  - measure: avg_floor_price
    type: number
    sql: ${total_sum_floor_price}::float/NULLIF(${total_num_requests},0)
    decimals: 4

  - measure: bids_per_request
    type: number
    sql: ${total_num_bids}::float/NULLIF(${total_num_requests},0)
    decimals: 4
