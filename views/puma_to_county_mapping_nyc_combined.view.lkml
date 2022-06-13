# The name of this view in Looker is "Puma to County Mapping Nyc Combined"
view: puma_to_county_mapping_nyc_combined {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `absolve.puma_to_county_mapping_nyc_combined`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "County Fips" in Explore.

  dimension: county_fips {
    type: string
    sql: ${TABLE}.county_fips ;;
  }

  dimension: county_pop {
    type: number
    sql: ${TABLE}.county_pop ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_county_pop {
    type: sum
    sql: ${county_pop} ;;
  }

  measure: average_county_pop {
    type: average
    sql: ${county_pop} ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pct_of_county_pop_in_puma {
    type: number
    sql: ${TABLE}.pct_of_county_pop_in_puma ;;
  }

  dimension: pct_of_puma_pop_in_county {
    type: number
    sql: ${TABLE}.pct_of_puma_pop_in_county ;;
  }

  dimension: puma_fips {
    type: string
    sql: ${TABLE}.puma_fips ;;
  }

  dimension: puma_pop {
    type: number
    sql: ${TABLE}.puma_pop ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
