view: county_28d {
    sql_table_name: `bigquery-public-data.covid19_public_forecasts.county_28d`
      ;;

    dimension: county_fips_code {
      type: string
      map_layer_name: us_counties_fips
##  label: {{ county_name._value }} ;;
      label: "{{ county_name._value }} "
      html: {{ county_name._value }} ;;
      sql: ${TABLE}.county_fips_code ;;
    }

    dimension: county_name {
      type: string
      sql: ${TABLE}.county_name ;;
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

    dimension: state_name {
      type: string
      map_layer_name: us_states
      drill_fields: [county_fips_code]
      sql: ${TABLE}.state_name ;;
    }
    dimension: distinct_key {
      sql: ${county_fips_code} || ${prediction_date}  ;;
    }
    measure: count {
      type: count
      drill_fields: [county_name, state_name]
    }


  measure: sum_new_confirmed {
    label: "New Confirmed"
    type: number
    value_format_name: decimal_0
    sql: SUM(${new_confirmed}) ;;
  }


  measure: sum_new_deaths {
    label: "New Deaths"
    type: number
    value_format_name: decimal_0
    sql: SUM(${new_deaths}) ;;
  }

  measure: sum_new_deaths_ground_truth {
    label: "Historic Daily Deaths"
    type: number
    value_format_name: decimal_0
    sql: SUM(${new_deaths_ground_truth}) ;;
  }

  measure: sum_cumulative_confirmed_ground_truth {
    label: "Historic Confirmed Cases"
    type: number
    sql: sum(${cumulative_confirmed_ground_truth}) ;;
  }

  measure: sum_cumulative_deaths_ground_truth {
    label: "Historic Confirmed Deaths"
    type: number
    sql: sum(${cumulative_deaths_ground_truth}) ;;
  }

  measure: sum_new_confirmed_ground_truth {
    label: "Historic Daily Cases"
    type: number
    sql: sum(${new_confirmed_ground_truth}) ;;
  }

  measure: sum_hospitalized_patients {
    label: "Hospitalized Patients"
    type: number
    sql:SUM(${hospitalized_patients}) ;;
    value_format_name: decimal_0
  }


  measure: sum_hospitalized_patients_ground_truths {
    label: "Historic Hospitalized Patients"
    type: number
    value_format_name: decimal_0
    sql: SUM(${hospitalized_patients_ground_truth}) ;;
  }

  measure: max_hospitalized_patients {
    type: max
    sql:${hospitalized_patients} ;;
    value_format_name: decimal_0
  }

  measure: sumcumulative_confirmed {
    label: "cumulative_confirmed"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_confirmed}) ;;
  }

  dimension: cumulative_confirmed_q0025 {
    type: number
    sql: ${TABLE}.cumulative_confirmed_q0025 ;;
  }

  measure: sumcumulative_confirmedlower {
    label: "cumulative_confirmed lower bound"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_confirmed_q0025}) ;;
  }

  dimension: cumulative_confirmed_q0975 {
    type: number
    sql: ${TABLE}.cumulative_confirmed_q0975 ;;
  }

  measure: sumcumulative_confirmedupper {
    label: "cumulative_confirmed Upper bound"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_confirmed_q0975}) ;;
  }

  measure: sumcumulative_deaths {
    label: "cumulative_deaths"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_deaths}) ;;
  }

  dimension: cumulative_deaths_q0025 {
    type: number
    sql: ${TABLE}.cumulative_deaths_q0025;;
  }

  measure: deaths_confirmlower {
    label: "cumulative_deaths lower bound"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_deaths_q0025}) ;;
  }

  dimension: cumulative_deaths_q0975 {
    type: number
    sql: ${TABLE}.cumulative_deaths_q0975 ;;
  }

  measure: cumulative_deathsupper {
    label: "cumulative_deaths Upper bound"
    type: number
    value_format_name: decimal_0
    sql: SUM(${cumulative_deaths_q0975}) ;;
  }

  dimension: new_confirmed_7day_rolling {
    type: number
    sql: ${TABLE}.new_confirmed_7day_rolling ;;
  }

  measure: confirmed_7day_rolling {
    label: "new_confirmed_7day_rolling"
    type: number
    value_format_name: decimal_0
    sql:SUM(${new_confirmed_7day_rolling}) ;;
  }

  dimension: new_deaths_7day_rolling {
    type: number
    sql: ${TABLE}.new_deaths_7day_rolling ;;
  }

  measure: deaths_7day_rolling {
    label: "new_deaths_7day_rolling"
    type: number
    value_format_name: decimal_0
    sql:SUM(${new_deaths_7day_rolling}) ;;

  }
  }
