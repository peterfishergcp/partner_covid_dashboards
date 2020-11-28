connection: "covid_vaccine_distro"

# include all the views
include: "/views/**/*.view"

datagroup: pf_vaccine_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pf_vaccine_default_datagroup

explore: state_14d{
join: county_14d {
  relationship: one_to_many
  sql_on: lower(${county_14d.state_name}) = lower(${state_14d.state_name});;
  type: left_outer
}
}
explore: hospital_general_info {
  join: county_14d {
    relationship: one_to_many
    sql_on: lower(${county_14d.county_name}) = lower(${hospital_general_info.county_name}) and ${county_14d.prediction_date}>=current_date();;
  }
  join: county_14d_grouped {
    relationship: many_to_one

    type: left_outer

    sql_on: lower(${county_14d_grouped.county_name}) = lower(${hospital_general_info.county_name}) ;;
  }
  }

explore: ca_healthcare_facilities {}
explore: county_14d {}
explore: county_14d_grouped {}
explore: county_28d{}
explore: covid19_open_data {}
explore: state_28d {
  join: county_28d {
    relationship: one_to_many
    sql_on: lower(${county_28d.state_name}) = lower(${state_28d.state_name});;
    type: left_outer
  }
}
explore: symptom_search_weekly_county {}
explore: symptom_search_weekly_state {}
