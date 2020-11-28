view: symptom_search_weekly_county {
  sql_table_name: `bigquery-public-data.covid19_symptom_search.counties_weekly_2020`
    ;;

  dimension:country_region_code{
    type: string
    sql: ${TABLE}.country_region_code ;;
  }

dimension:country_region{
  type: string
  sql: ${TABLE}.country_region ;;
  label: "Country"
}


dimension:sub_region_1{
  type: string
  sql: ${TABLE}.sub_region_1 ;;
  label: "State"
}

dimension:sub_region_2{
  type: string
  sql: ${TABLE}.sub_region_2 ;;
  label: "County"
}

dimension:sub_region_2_code{
  type: string
  sql: ${TABLE}.sub_region_2_code ;;
  label: "Zip Code"
}

dimension_group: Date {
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

measure:symptom_Angular_cheilitis{
  type: sum
  sql: ${TABLE}.symptom_Angular_cheilitis ;;
}

measure:symptom_Aphonia{
  type: sum
  sql: ${TABLE}.symptom_Aphonia ;;
}

measure:symptom_Auditory_hallucination{
  type: sum
  sql: ${TABLE}.symptom_Auditory_hallucination ;;
}

measure:symptom_Balance_disorder{
  type: sum
  sql: ${TABLE}.symptom_Balance_disorder ;;
}

measure:symptom_Burning_Chest_Pain{
  type: sum
  sql: ${TABLE}.symptom_Burning_Chest_Pain ;;
}

measure:symptom_Burning_mouth_syndrome{
  type: sum
  sql: ${TABLE}.symptom_Burning_mouth_syndrome ;;
}

measure:symptom_Chills{
  type: sum
  sql: ${TABLE}.symptom_Chills ;;
}

measure:symptom_Chest_pain{
  type: sum
  sql: ${TABLE}.symptom_Chest_pain ;;
}

measure:symptom_Cluster_headache{
  type: sum
  sql: ${TABLE}.symptom_Cluster_headache ;;
}

measure:symptom_Common_cold{
  type: sum
  sql: ${TABLE}.symptom_Common_cold ;;
}

measure:symptom_Cough{
  type: sum
  sql: ${TABLE}.symptom_Cough ;;
}

measure:symptom_Diarrhea{
  type: sum
  sql: ${TABLE}.symptom_Diarrhea ;;
}

measure:symptom_Esophagitis{
  type: sum
  sql: ${TABLE}.symptom_Esophagitis ;;
}

measure:symptom_Facial_swelling{
  type: sum
  sql: ${TABLE}.symptom_Facial_swelling ;;
}

measure:symptom_Gastroparesis{
  type: sum
  sql: ${TABLE}.symptom_Gastroparesis ;;
}

measure:symptom_Headache{
  type: sum
  sql: ${TABLE}.symptom_Headache;;
}

measure:symptom_Indigestion{
  type: sum
  sql: ${TABLE}.symptom_Indigestion;;
}

measure:symptom_Laryngitis{
  type: sum
  sql: ${TABLE}.symptom_Laryngitis;;
}

measure:symptom_Muscle_weakness{
  type: sum
  sql: ${TABLE}.symptom_Muscle_weakness;;
}

measure:symptom_Neck_mass{
  type: sum
  sql: ${TABLE}.symptom_Neck_mass;;
}

measure:symptom_Nasal_polyp{
  type: sum
  sql: ${TABLE}.symptom_Nasal_polyp;;
}

measure:symptom_Night_sweats{
  type: sum
  sql: ${TABLE}.symptom_Night_sweats ;;
}

measure:symptom_Rectal_pain{
  type: sum
  sql: ${TABLE}.symptom_Rectal_pain ;;
}
}
