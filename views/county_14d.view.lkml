view: county_14d {
  sql_table_name: `bigquery-public-data.covid19_public_forecasts.county_14d`
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


parameter: mobility {
  type: unquoted
  default_value: "medium"
  allowed_value: { label: "High" value: "high" }
  allowed_value: { label: "Medium" value: "medium" }
  allowed_value: { label: "Low" value: "low" }
}

parameter: school_closure {
  type: unquoted
  default_value: "Yes"
  allowed_value: { label: "Yes" value: "Yes" }
  allowed_value: { label: "No" value: "No" }
}

parameter: mask_ordinance {
  type: unquoted
  default_value: "No"
  allowed_value: { label: "Yes" value: "Yes" }
  allowed_value: { label: "No" value: "No" }
}

dimension: hospitalized_patients {
  type: number
  sql: {%    if mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes' and mask_ordinance._parameter_value == 'No' %}    ${TABLE}.hospitalized_patients * 1.1
          {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * 1.04
          {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}    ${TABLE}.hospitalized_patients * 1.2
          {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * 1.14
          {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.hospitalized_patients * 0.9
          {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * .84
          {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.hospitalized_patients * 1.05
          {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * 1.01
          {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.hospitalized_patients * 0.75
          {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * .71
          {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.hospitalized_patients * 0.85
          {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.hospitalized_patients * .81
          {% else %}                                         ${TABLE}.hospitalized_patients * 1.0
          {% endif %} ;;
}

dimension: hospitalized_patients_baseline {
  type: number
  sql: ${TABLE}.hospitalized_patients ;;
}

dimension: hospitalized_patients_ground_truth {
  type: number
  sql: ${TABLE}.hospitalized_patients_ground_truth ;;
}

dimension: new_confirmed_baseline {
  type: number
  sql: ${TABLE}.new_confirmed ;;
}

dimension: new_confirmed {
  type: number
  sql: {%    if mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes' and mask_ordinance._parameter_value == 'No' %}    ${TABLE}.new_confirmed * 1.1
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * 1.04
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}    ${TABLE}.new_confirmed * 1.2
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * 1.14
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_confirmed * 0.9
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * .84
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_confirmed * 1.05
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * 1.01
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_confirmed * 0.75
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * .71
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_confirmed * 0.85
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_confirmed * .81
    {% else %}                                         ${TABLE}.new_confirmed * 1.0
    {% endif %} ;;
}

dimension: new_confirmed_ground_truth {
  type: number
  sql: ${TABLE}.new_confirmed_ground_truth ;;
}

dimension: new_deaths_baseline {
  type: number
  sql: ${TABLE}.new_deaths ;;
}

dimension: new_deaths {
  type: number
  sql: {%    if mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes' and mask_ordinance._parameter_value == 'No'%}    ${TABLE}.new_deaths * 1.1
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * 1.04
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}    ${TABLE}.new_deaths * 1.2
    {% elsif mobility._parameter_value == 'high' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * 1.14
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_deaths * 0.9
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * .84
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_deaths * 1.05
    {% elsif mobility._parameter_value == 'medium' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * 1.01
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_deaths * 0.75
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'Yes'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * .71
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'No'%}  ${TABLE}.new_deaths * 0.85
    {% elsif mobility._parameter_value == 'low' and school_closure._parameter_value == 'No'  and mask_ordinance._parameter_value == 'Yes'%}   ${TABLE}.new_deaths * .81
    {% else %}                                         ${TABLE}.new_deaths * 1.0
    {% endif %} ;;
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
  drill_fields: [county_name]
  sql: ${TABLE}.state_name ;;
  link: {
    label: "{{value}} State Dashboard"
    url: "/dashboards-next/864?State+Name={{ value }}"
    icon_url: "http://www.looker.com/favicon.ico"
  }
  link: {
    label: "{{value}} State Covid News"
    url: "https://news.google.com/search?q={{ value }}+covid&hl=en-US&gl=US&ceid=US:en"
    icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.news.google.com"
  }
}
dimension: distinct_key {
  sql: ${county_fips_code} || ${prediction_date}  ;;
}


measure: count {
  type: count
  drill_fields: [county_name, state_name]
}

measure: sum_new_confirmed_baseline {
  label: "New Confirmed Baseline"
  type: number
  value_format_name: decimal_0
  sql: SUM(${new_confirmed_baseline}) ;;
}

measure: sum_new_confirmed {
  label: "New Confirmed"
  type: number
  value_format_name: decimal_0
  sql: SUM(${new_confirmed}) ;;
}

measure: sum_new_deaths_baseline {
  label: "New Deaths Baseline"
  type: number
  value_format_name: decimal_0
  sql: SUM(${new_deaths_baseline}) ;;
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

measure: sum_hospitalized_patients_baseline {
  label: "Hospitalized Patients Baseline"
  type: number
  sql:SUM(${hospitalized_patients_baseline}) ;;
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
}
