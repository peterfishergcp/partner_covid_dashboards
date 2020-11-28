view: covid19_open_data {
  sql_table_name: `bigquery-public-data.covid19_open_data.covid19_open_data`
    ;;

  dimension: aggregation_level {
    type: number
    sql: ${TABLE}.aggregation_level ;;
  }

  dimension: average_temperature_celsius {
    type: number
    sql: ${TABLE}.average_temperature_celsius ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: cumulative_confirmed {
    type: number
    sql: ${TABLE}.cumulative_confirmed ;;
  }

  dimension: cumulative_deceased {
    type: number
    sql: ${TABLE}.cumulative_deceased ;;
  }

  dimension: cumulative_hospitalized_patients {
    type: number
    sql: ${TABLE}.cumulative_hospitalized_patients ;;
  }

  dimension: cumulative_intensive_care_patients {
    type: number
    sql: ${TABLE}.cumulative_intensive_care_patients ;;
  }

  dimension: cumulative_recovered {
    type: number
    sql: ${TABLE}.cumulative_recovered ;;
  }

  dimension: cumulative_tested {
    type: number
    sql: ${TABLE}.cumulative_tested ;;
  }

  dimension: cumulative_ventilator_patients {
    type: number
    sql: ${TABLE}.cumulative_ventilator_patients ;;
  }

  dimension: current_hospitalized_patients {
    type: number
    sql: ${TABLE}.current_hospitalized_patients ;;
  }

  dimension: current_intensive_care_patients {
    type: number
    sql: ${TABLE}.current_intensive_care_patients ;;
  }

  dimension: current_ventilator_patients {
    type: number
    sql: ${TABLE}.current_ventilator_patients ;;
  }

  dimension: datacommons_id {
    type: string
    sql: ${TABLE}.datacommons_id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: iso_3166_1_alpha_2 {
    type: string
    sql: ${TABLE}.iso_3166_1_alpha_2 ;;
  }

  dimension: iso_3166_1_alpha_3 {
    type: string
    sql: ${TABLE}.iso_3166_1_alpha_3 ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_geometry {
    type: string
    sql: ${TABLE}.location_geometry ;;
  }

  dimension: location_key {
    type: string
    sql: ${TABLE}.location_key ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: maximum_temperature_celsius {
    type: number
    sql: ${TABLE}.maximum_temperature_celsius ;;
  }

  dimension: minimum_temperature_celsius {
    type: number
    sql: ${TABLE}.minimum_temperature_celsius ;;
  }

  dimension: mobility_grocery_and_pharmacy {
    type: number
    sql: ${TABLE}.mobility_grocery_and_pharmacy ;;
  }

  dimension: mobility_parks {
    type: number
    sql: ${TABLE}.mobility_parks ;;
  }

  dimension: mobility_residential {
    type: number
    sql: ${TABLE}.mobility_residential ;;
  }

  dimension: mobility_retail_and_recreation {
    type: number
    sql: ${TABLE}.mobility_retail_and_recreation ;;
  }

  dimension: mobility_transit_stations {
    type: number
    sql: ${TABLE}.mobility_transit_stations ;;
  }

  dimension: mobility_workplaces {
    type: number
    sql: ${TABLE}.mobility_workplaces ;;
  }

  dimension: new_confirmed {
    type: number
    sql: ${TABLE}.new_confirmed ;;
  }

  dimension: new_deceased {
    type: number
    sql: ${TABLE}.new_deceased ;;
  }

  dimension: new_hospitalized_patients {
    type: number
    sql: ${TABLE}.new_hospitalized_patients ;;
  }

  dimension: new_intensive_care_patients {
    type: number
    sql: ${TABLE}.new_intensive_care_patients ;;
  }

  dimension: new_recovered {
    type: number
    sql: ${TABLE}.new_recovered ;;
  }

  dimension: new_tested {
    type: number
    sql: ${TABLE}.new_tested ;;
  }

  dimension: new_ventilator_patients {
    type: number
    sql: ${TABLE}.new_ventilator_patients ;;
  }

  dimension: openstreetmap_id {
    type: number
    sql: ${TABLE}.openstreetmap_id ;;
  }

  dimension: rainfall_mm {
    type: number
    sql: ${TABLE}.rainfall_mm ;;
  }

  dimension: snowfall_mm {
    type: number
    sql: ${TABLE}.snowfall_mm ;;
  }

  dimension: subregion1_code {
    type: string
    sql: ${TABLE}.subregion1_code ;;
  }

  dimension: subregion1_name {
    type: string
    sql: ${TABLE}.subregion1_name ;;
  }

  dimension: subregion2_code {
    type: string
    sql: ${TABLE}.subregion2_code ;;
  }

  dimension: subregion2_name {
    type: string
    sql: ${TABLE}.subregion2_name ;;
  }

  dimension: wikidata_id {
    type: string
    sql: ${TABLE}.wikidata_id ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name, subregion1_name, subregion2_name]
  }
}
