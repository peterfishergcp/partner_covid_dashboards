view: state_14d {
  sql_table_name: bigquery-public-data.covid19_public_forecasts.state_14d
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(cast(${prediction_raw} as string),'|',cast(${state_name} as string)) ;;
  }

  dimension: cumulative_confirmed {
    type: number
    sql: ${TABLE}.cumulative_confirmed ;;
  }

  dimension: cumulative_confirmed_ground_truth {
    type: number
    sql: ${TABLE}.cumulative_confirmed_ground_truth ;;
  }

  dimension: cumulative_deaths {
    type: number
    sql: ${TABLE}.cumulative_deaths ;;
  }

  dimension: cumulative_deaths_ground_truth {
    type: number
    sql: ${TABLE}.cumulative_deaths_ground_truth ;;
  }

  dimension_group: forecast {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.forecast_date ;;
  }

  dimension: hospitalized_patients {
    type: number
    sql: ${TABLE}.hospitalized_patients ;;
  }

  dimension: hospitalized_patients_ground_truth {
    type: number
    sql: ${TABLE}.hospitalized_patients_ground_truth ;;
  }

  dimension: intensive_care_patients {
    type: number
    sql: ${TABLE}.intensive_care_patients ;;
  }

  dimension: intensive_care_patients_ground_truth {
    type: number
    sql: ${TABLE}.intensive_care_patients_ground_truth ;;
  }

  dimension: new_confirmed {
    type: number
    sql: ${TABLE}.new_confirmed ;;
  }

  dimension: new_confirmed_ground_truth {
    type: number
    sql: ${TABLE}.new_confirmed_ground_truth ;;
  }

  dimension: new_deaths {
    type: number
    sql: ${TABLE}.new_deaths ;;
  }

  dimension: new_deaths_ground_truth {
    type: number
    sql: ${TABLE}.new_deaths_ground_truth ;;
  }

  dimension_group: prediction {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.prediction_date ;;
  }

  dimension: recovered {
    type: number
    sql: ${TABLE}.recovered ;;
  }

  dimension: recovered_documented_ground_truth {
    type: number
    sql: ${TABLE}.recovered_documented_ground_truth ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  dimension: state_name {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state_name ;;
  }

  dimension: ventilator_patients {
    type: number
    sql: ${TABLE}.ventilator_patients ;;
  }

  dimension: ventilator_patients_ground_truth {
    type: number
    sql: ${TABLE}.ventilator_patients_ground_truth ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }

  measure: actual_active_cases {
    type: sum
    sql:${cumulative_confirmed_ground_truth} ;;
    value_format_name: decimal_0
  }

  measure: actual_deaths {
    type: sum
    sql:${cumulative_deaths_ground_truth} ;;
    value_format_name: decimal_0
  }

  measure: actual_hospitalized {
    type: sum
    sql:${hospitalized_patients_ground_truth} ;;
    value_format_name: decimal_0
  }

  measure: sum_hospitalized_patients {
    type: sum
    sql:${hospitalized_patients} ;;
    value_format_name: decimal_0
  }

  measure: max_hospitalized_patients {
    type: max
    sql:${hospitalized_patients} ;;
    value_format_name: decimal_0
  }

  measure: sum_intensive_care_patients {
    type: sum
    sql: ${intensive_care_patients} ;;
    value_format_name: decimal_0
  }

  measure: max_intensive_care_patients {
    type: max
    sql: ${intensive_care_patients} ;;
    value_format_name: decimal_0
  }

  measure: sum_ventilator_patients {
    type: sum
    sql: ${ventilator_patients} ;;
    value_format_name: decimal_0
  }

  measure: max_ventilator_patients {
    type: max
    sql: ${ventilator_patients} ;;
    value_format_name: decimal_0
  }
}
