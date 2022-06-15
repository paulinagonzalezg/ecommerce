# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `absolve.users`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    html:{% if value == 'Female'%}
    <p><img src="https://img.icons8.com/ios-filled/50/undefined/standing-woman.png" height=40 width=40>{{ rendered_value }}</p>
    {% else %}
    <p><img src="https://img.icons8.com/ios-glyphs/30/undefined/men-age-group-4.png" height=40 width=40>{{ rendered_value }}</p>
    {% endif %} ;;
  }


  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
    html:  {% if value == 'Display'%}
         <p><img src="http://findicons.com/files/icons/2806/plex_for_android/96/people.png" height=20 width=20>{{ rendered_value }}</p>
         {% elsif value == 'Email' %}
        <p><img src="http://findicons.com/files/icons/2806/plex_for_android/96/gmail.png" height=20 width=20>{{ rendered_value }}</p>
         {% elsif value == 'Facebook' %}
        <p><img src="http://findicons.com/files/icons/2806/plex_for_android/96/facebook.png" height=20 width=20>{{ rendered_value }}</p>
         {% elsif value == 'Organic' %}
        <p><img src="http://findicons.com/files/icons/2806/plex_for_android/96/office.png" height=20 width=20>{{ rendered_value }}</p>
      {% else %}
        <p><img src="http://findicons.com/files/icons/2806/plex_for_android/96/springpad.png" height=20 width=20>{{ rendered_value }}</p>
      {% endif %} ;;
  }


  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, orders.count, order_items.count]
  }
}
