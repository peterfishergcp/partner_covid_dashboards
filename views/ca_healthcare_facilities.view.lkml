view: ca_healthcare_facilities {
  sql_table_name: `covid19shared.covid19.ca_healthcare_facilities`
    ;;

  dimension: county_code {
    type: number
    sql: ${TABLE}.COUNTY_CODE ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.COUNTY_NAME ;;
  }

  dimension: dba_address1 {
    type: string
    sql: ${TABLE}.DBA_ADDRESS1 ;;
  }

  dimension: dba_city {
    type: string
    sql: ${TABLE}.DBA_CITY ;;
  }

  dimension: dba_zip_code {
    type: number
    sql: ${TABLE}.DBA_ZIP_CODE ;;
  }

  dimension: er_service_level_desc {
    type: string
    sql: ${TABLE}.ER_SERVICE_LEVEL_DESC ;;
  }

  dimension: facility_level_desc {
    type: string
    sql: ${TABLE}.FACILITY_LEVEL_DESC ;;
  }

  dimension: facility_name {
    type: string
    sql: ${TABLE}.FACILITY_NAME ;;
  }

  dimension_group: facility_status {
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
    sql: ${TABLE}.FACILITY_STATUS_DATE ;;
  }

  dimension: facility_status_desc {
    type: string
    sql: ${TABLE}.FACILITY_STATUS_DESC ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: license_category_desc {
    type: string
    sql: ${TABLE}.LICENSE_CATEGORY_DESC ;;
  }

  dimension: license_num {
    type: string
    sql: ${TABLE}.LICENSE_NUM ;;
  }

  dimension: license_type_desc {
    type: string
    sql: ${TABLE}.LICENSE_TYPE_DESC ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: oshpd_id {
    type: number
    sql: ${TABLE}.OSHPD_ID ;;
  }

  measure: total_number_beds {
    type: sum
    # sql: ${TABLE}.TOTAL_NUMBER_BEDS ;;
    label: "Bed Count"
  }

  measure: count {
    type: count
    drill_fields: [county_name, facility_name]
    label: "Facility Count"
  }
}
