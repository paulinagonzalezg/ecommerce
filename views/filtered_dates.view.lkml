view: filtered_dates {
  derived_table: {
    sql: SELECT
          order_items.id  AS order_items_id,
              (DATE(order_items.created_at )) AS order_items_created_at,
              (DATE(order_items.delivered_at )) AS order_items_delivered_at,
              (DATE(order_items.shipped_at )) AS order_items_shipped_at
      FROM `absolve.order_items`
           AS order_items
      WHERE order_items.delivered_at is not null
      AND order_items.shipped_at is not null
      ORDER BY RAND ()
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_items_id ;;
  }

  dimension: order_items_created_at {
    type: date
    datatype: date
    label: "Creation Date"
    sql: ${TABLE}.order_items_created_at ;;
  }

  dimension: order_items_delivered_at {
    type: date
    datatype: date
    label: "Delivery Date"
    sql: ${TABLE}.order_items_delivered_at ;;
  }

  dimension: order_items_shipped_at {
    type: date
    datatype: date
    label: "Shipped Date"
    sql: ${TABLE}.order_items_shipped_at ;;
  }
  set: detail {
    fields: [order_items_id, order_items_created_at, order_items_delivered_at, order_items_shipped_at]
  }
}
