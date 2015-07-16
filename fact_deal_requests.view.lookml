- view: fact_deal_requests
  sql_table_name: kds.fact_deal_requests
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: deal_code
    sql: ${TABLE}.deal_code

  - dimension: deal_floor_price
    type: number
    sql: ${TABLE}.deal_floor_price

  - dimension: deal_priority
    type: int
    sql: ${TABLE}.deal_priority

  - dimension: deal_type
    type: int
    sql: ${TABLE}.deal_type

  - dimension: dsp_id
    type: int
    sql: ${TABLE}.dsp_id

  - dimension: floor_price
    type: number
    sql: ${TABLE}.floor_price

  - dimension_group: imp
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

  - dimension: response
    type: int
    sql: ${TABLE}.response

  - dimension: sum_bids
    type: number
    sql: ${TABLE}.sum_bids

  - dimension: win_price
    type: number
    sql: ${TABLE}.win_price

  - dimension: won
    type: int
    sql: ${TABLE}.won

  - dimension: z_bid_req_id
    sql: ${TABLE}.z_bid_req_id

  - measure: num_deal_requests
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
    sql: ${win_price}
    decimals: 4

  - measure: avg_floor_price
    type: avg
    sql: ${floor_price}
    decimals: 4

  - measure: avg_deal_floor_price
    type: avg
    sql: ${deal_floor_price}
    decimals: 4
