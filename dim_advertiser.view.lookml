- view: dim_advertiser
  sql_table_name: kds.dim_advertiser
  fields:

  - dimension: advertiser
    sql: ${TABLE}.advertiser

  - dimension: advertiser_id
    type: int
    sql: ${TABLE}.advertiser_id

  - measure: count
    type: count
    drill_fields: []

