- view: dim_adspace
  sql_table_name: kds.dim_adspace
  fields:

  - dimension: account_id
    type: int
    sql: ${TABLE}.account_id

  - dimension: ad_type
    type: int
    sql: ${TABLE}.ad_type

  - dimension: adspace_id
    type: int
    sql: ${TABLE}.adspace_id

  - dimension: height
    type: int
    sql: ${TABLE}.height

  - dimension: ad_size
    sql: ${width} || 'X' || ${height}

  - dimension: page_domain
    sql: ${TABLE}.page_domain

  - dimension: publisher_id
    type: int
    sql: ${TABLE}.publisher_id

  - dimension: site_id
    type: int
    sql: ${TABLE}.site_id

  - dimension: subdomain
    sql: ${TABLE}.subdomain

  - dimension: width
    type: int
    sql: ${TABLE}.width

  - measure: count
    type: count
    drill_fields: []

