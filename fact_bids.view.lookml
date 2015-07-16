- view: fact_bids
  sql_table_name: kds.fact_bids
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: advertiser_id
    type: int
    sql: ${TABLE}.advertiser_id

  - dimension: bid_above_floor
    type: int
    sql: ${TABLE}.bid_above_floor

  - dimension: bid_price
    type: number
    sql: ${TABLE}.bid_price

  - dimension: deal_code
    sql: ${TABLE}.deal_code

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

  - dimension: response_time
    type: int
    sql: ${TABLE}.response_time

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

  - dimension: z_bid_resp_id
    sql: ${TABLE}.z_bid_resp_id

  - measure: num_bids
    type: count
    drill_fields: []

  - measure: total_bid_amt
    type: sum
    sql: ${bid_price}
    decimals: 4

  - measure: total_num_bids_above_floor
    type: sum
    sql: ${bid_above_floor}

  - measure: total_bids_won
    type: sum
    sql: ${TABLE}.won

  - measure: total_spend
    type: sum
    sql: ${won}*{win_price}
    decimals: 4

  - measure: avg_bid_price
    type: avg
    sql: ${bid_price}
    decimals: 4

  - measure: avg_win_price
    type: avg
    sql: ${win_price}
    decimals: 4

  - measure: avg_floor_price
    type: avg
    sql: ${floor_price}
    decimals: 4

  - measure: win_rate
    type: number
    value_format: '###.##%'
    sql: ${total_bids_won}::float/NULLIF(${num_bids},0)
    decimals: 2
