view: hospital_general_info {
  sql_table_name: bigquery-public-data.cms_medicare.hospital_general_info
    ;;

  dimension: address {
    primary_key: yes
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension: effectiveness_of_care_national_comparison {
    type: string
    sql: ${TABLE}.effectiveness_of_care_national_comparison ;;
  }

  dimension: effectiveness_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.effectiveness_of_care_national_comparison_footnote ;;
  }

  dimension: efficient_use_of_medical_imaging_national_comparison {
    type: string
    sql: ${TABLE}.efficient_use_of_medical_imaging_national_comparison ;;
  }

  dimension: efficient_use_of_medical_imaging_national_comparison_footnote {
    type: string
    sql: ${TABLE}.efficient_use_of_medical_imaging_national_comparison_footnote ;;
  }

  dimension: emergency_services {
    type: yesno
    sql: ${TABLE}.emergency_services ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.hospital_name ;;
  }

  dimension: hospital_overall_rating {
    type: string
    sql: ${TABLE}.hospital_overall_rating ;;
  }

  dimension: hospital_overall_rating_footnote {
    type: string
    sql: ${TABLE}.hospital_overall_rating_footnote ;;
  }

  dimension: hospital_ownership {
    type: string
    sql: ${TABLE}.hospital_ownership ;;
  }

  dimension: hospital_type {
    type: string
    sql: ${TABLE}.hospital_type ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: meets_criteria_for_meaningful_use_of_ehrs {
    type: yesno
    sql: ${TABLE}.meets_criteria_for_meaningful_use_of_ehrs ;;
  }

  dimension: mortality_national_comparison {
    type: string
    sql: ${TABLE}.mortality_national_comparison ;;
  }

  dimension: mortality_national_comparison_footnote {
    type: string
    sql: ${TABLE}.mortality_national_comparison_footnote ;;
  }

  dimension: patient_experience_national_comparison {
    type: string
    sql: ${TABLE}.patient_experience_national_comparison ;;
  }

  dimension: patient_experience_national_comparison_footnote {
    type: string
    sql: ${TABLE}.patient_experience_national_comparison_footnote ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.provider_id ;;
  }

  dimension: readmission_national_comparison {
    type: string
    sql: ${TABLE}.readmission_national_comparison ;;
  }

  dimension: readmission_national_comparison_footnote {
    type: string
    sql: ${TABLE}.readmission_national_comparison_footnote ;;
  }

  dimension: safety_of_care_national_comparison {
    type: string
    sql: ${TABLE}.safety_of_care_national_comparison ;;
  }

  dimension: safety_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.safety_of_care_national_comparison_footnote ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    drill_fields: [county_name]
   sql: ${TABLE}.state ;;
  }

  dimension: timeliness_of_care_national_comparison {
    type: string
    sql: ${TABLE}.timeliness_of_care_national_comparison ;;
  }

  dimension: timeliness_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.timeliness_of_care_national_comparison_footnote ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [hospital_name, county_name]
  }


  measure: vaccination_capacity {
    type: number
    sql: case  when ${hospital_type}='Critical Access Hospitals' then 500*${count}
             when ${hospital_type}='Acute Care Hospitals' then 300*${count}
             when ${hospital_type}='Childrens' then 200*${count}
             when ${hospital_type}='Acute Care - Department of Defense' then 100*${count}
             when ${hospital_type}='Psychiatric' then 50*${count}
         end ;;
  }


}
