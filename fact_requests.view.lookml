- view: fact_requests
  sql_table_name: kds.fact_requests
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: dsp_id
    type: int
    sql: ${TABLE}.dsp_id

  - dimension: floor_price
    type: number
    sql: ${TABLE}.floor_price

  - dimension_group: imp_dt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.imp_date

  - dimension: imp_hour
    type: int
    sql: ${TABLE}.imp_hour

  - dimension: num_bids
    type: int
    sql: ${TABLE}.num_bids

  - dimension: num_bids_above_floor
    type: int
    sql: ${TABLE}.num_bids_above_floor

  - dimension: response_time
    type: int
    sql: ${TABLE}.response_time

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

  - dimension: win_price
    type: number
    sql: ${TABLE}.win_price


  - dimension: won
    sql_case:
      lost: ${TABLE}.won = 0
      won: ${TABLE}.won = 1
      else: unknown

  - dimension: z_bid_req_id
    sql: ${TABLE}.z_bid_req_id

  - measure: num_requests
    type: count
    drill_fields: []

  - measure: total_bid_amt
    type: sum
    sql: ${sum_bids}
    decimals: 4

  - measure: total_num_bids
    type: sum
    sql: ${num_bids}

  - measure: total_num_bids_above_floor
    type: sum
    sql: ${num_bids_above_floor}

  - measure: total_bids_won
    type: sum
    sql: ${won}

  - measure: total_spend
    type: sum
    sql: ${won}*{win_price}
    decimals: 4
  
  - measure: avg_win_price
    type: avg
    sql: ${win_price}::float
    decimals: 4

  - measure: avg_floor_price
    type: avg
    sql: ${floor_price}
    decimals: 4
    
  - measure: bids_per_request
    type: number
    sql: ${total_num_bids}::float/NULLIF(${num_requests},0)
    decimals: 4
