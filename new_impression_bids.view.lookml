- view: new_impression_bids
  sql_table_name: public.new_impression_bids
  fields:

  - dimension: bid1_price
    type: number
    sql: ${TABLE}.bid1_price

  - dimension: bid2_price
    type: number
    sql: ${TABLE}.bid2_price

  - dimension: floor_price
    type: number
    sql: ${TABLE}.floor_price

  - dimension_group: imp
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.imp_date

  - dimension: imp_id
    sql: ${TABLE}.imp_id

  - dimension: new_win_price
    type: number
    sql: ${TABLE}.new_win_price

  - dimension: page_domain
    sql: ${TABLE}.page_domain

  - dimension: publisher_id
    type: int
    # hidden: true
    sql: ${TABLE}.publisher_id

  - dimension: subdomain
    sql: ${TABLE}.subdomain

  - dimension: win_price
    type: number
    sql: ${TABLE}.win_price

  - dimension: won
    type: int
    sql: ${TABLE}.won

  - measure: num_impressions
    type: count
    drill_fields: [publisher.publisher_id]

  - measure: orig_revenue
    type: sum
    sql: ${win_price}
    decimals: 4

  - measure: new_revenue
    type: sum
    sql: ${new_win_price}
    decimals: 4