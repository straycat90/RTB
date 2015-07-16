- view: rtb_floor_optimizer
  sql_table_name: kds.rtb_floor_optimizer2
  fields:

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: bid2_price
    type: number
    sql: ${TABLE}.bid2_price

  - dimension: bid_price
    type: number
    sql: ${TABLE}.bid_price

  - dimension: floor_price
    type: number
    sql: ${TABLE}.floor_price
    decimals: 4

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

  - dimension: orig_floor_price
    type: number
    sql: ${TABLE}.orig_floor_price

  - dimension: orig_win_price
    type: number
    sql: ${TABLE}.orig_win_price

  - dimension: orig_won
    type: int
    sql: ${TABLE}.orig_won

  - dimension: revenue
    type: number
    sql: ${TABLE}.revenue

  - dimension: won
    type: int
    sql: ${TABLE}.won

  - measure: num_impressions
    type: count
    drill_fields: []

  - measure: orig_revenue
    type: sum
    sql: ${orig_win_price}
    decimals: 4

  - measure: orig_win_bids
    type: sum
    sql: ${orig_won}

  - measure: orig_fill_rate
    type: number
    value_format: '###.##%'
    sql: ${orig_won}::float/NULLIF(${num_impressions},0)
    decimals: 2

  - measure: exp_revenue
    type: sum
    sql: ${revenue}
    decimals: 4

  - measure: exp_win_bids
    type: sum
    sql: ${won}

  - measure: exp_fill_rate
    type: number
    value_format: '###.##%'
    sql: ${exp_win_bids}::float/NULLIF(${num_impressions},0)
    decimals: 2
