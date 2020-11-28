view: county_14d_grouped {

  derived_table: {
    sql: SELECT
        county_name
        , sum(new_confirmed) as sum_new_confirmed
      FROM bigquery-public-data.covid19_public_forecasts.county_14d
      GROUP BY county_name
      ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension: sum_new_confirmed {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.sum_new_confirmed ;;
  }

  measure: newly_confirmed {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.sum_new_confirmed ;;
  }
}
