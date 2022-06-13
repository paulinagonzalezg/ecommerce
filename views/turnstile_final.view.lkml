# The name of this view in Looker is "Turnstile Final"
view: turnstile_final {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `absolve.turnstile_final`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Control Area" in Explore.

  dimension: control_area {
    type: string
    sql: ${TABLE}.control_area ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: entries {
    type: number
    sql: ${TABLE}.entries ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_entries {
    type: sum
    sql: ${entries} ;;
  }

  measure: average_entries {
    type: average
    sql: ${entries} ;;
  }

  dimension: exits {
    type: number
    sql: ${TABLE}.exits ;;
  }

  dimension: linename {
    type: string
    sql: ${TABLE}.linename ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: reported_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.reported_timestamp ;;
  }

  dimension: scp {
    type: string
    sql: ${TABLE}.scp ;;
  }

  dimension: station {
    type: string
    sql: ${TABLE}.station ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  measure: count {
    type: count
    drill_fields: [linename]
  }
}
