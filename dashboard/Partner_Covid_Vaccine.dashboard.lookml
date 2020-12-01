- dashboard: partner_covid_19_public_forecast_vaccine_capacity
  title: Partner COVID 19 Public Forecast Vaccine Capacity
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: About this Dashboard
    type: text
    title_text: About this Dashboard
    subtitle_text: ''
    body_text: |-
      This model generates a 14-day forecast of the development of COVID-19 in each US state and county, and is intended to be used as one of many signals to help first responders in healthcare, the public sector, and other impacted organizations be better prepared for what lies ahead. <br />
      <br />
      Access the data in [BigQuery](https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-public-forecasts) or as a CSV ([state forecasts](https://storage.googleapis.com/covid-external/forecast_STATE_14.csv), [county forecasts](https://storage.googleapis.com/covid-external/forecast_COUNTY_14.csv).) <br />
      <br />
      Historical data for confirmed cases and deaths are powered primarily by the Johns Hopkins Coronavirus Resource Center. Historical values for hospital, ICU, and ventilator usage are powered primarily by the COVID Tracking Project. <br />
      <br />
      In order to download or use the forecasts, you must agree to the Google [Terms of Service](https://policies.google.com/terms?hl=en).
    row: 9
    col: 0
    width: 24
    height: 4
  - title: Deaths
    name: Deaths
    model: gps_vaccine_distro
    explore: county_14d
    type: single_value
    fields: [county_14d.sum_new_deaths]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: New Deaths
    series_types: {}
    defaults_version: 1
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 10
    width: 4
    height: 3
  - title: Confirmed Cases
    name: Confirmed Cases
    model: gps_vaccine_distro
    explore: county_14d
    type: single_value
    fields: [county_14d.sum_new_confirmed]
    filters:
      county_14d.county_name: ''
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Newly Confirmed
    series_types: {}
    defaults_version: 1
    listen:
      State Name: county_14d.state_name
    row: 3
    col: 10
    width: 4
    height: 3
  - title: Vaccine Capacity Planning
    name: Vaccine Capacity Planning
    model: gps_vaccine_distro
    explore: hospital_general_info
    type: looker_grid
    fields: [hospital_general_info.state, hospital_general_info.hospital_type, hospital_general_info.vaccination_capacity,
      county_14d.sum_hospitalized_patients, county_14d.sum_new_confirmed, county_14d.sum_new_deaths]
    pivots: [hospital_general_info.hospital_type]
    sorts: [hospital_general_info.hospital_type 0, hospital_general_info.state]
    limit: 20
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      county_14d.sum_new_confirmed: Forecasted New Cases
      county_14d.sum_new_deaths: Forecasted Deaths
    series_column_widths:
      hospital_general_info.state: 84
      hospital_general_info.vaccination_capacity: 168
      county_14d.sum_hospitalized_patients: 170
      county_14d.sum_new_confirmed: 178
      county_14d.sum_new_deaths: 156
    series_cell_visualizations:
      hospital_general_info.vaccination_capacity:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields:
    listen:
      State Name: county_14d.state_name
    row: 13
    col: 0
    width: 24
    height: 11
  - title: 'Covid Vaccine Capacity Top 20 '
    name: 'Covid Vaccine Capacity Top 20 '
    model: gps_vaccine_distro
    explore: hospital_general_info
    type: looker_area
    fields: [hospital_general_info.vaccination_capacity, hospital_general_info.state,
      hospital_general_info.hospital_type, county_14d.sum_hospitalized_patients, county_14d.sum_new_confirmed,
      county_14d.sum_new_deaths]
    sorts: [hospital_general_info.vaccination_capacity desc]
    limit: 20
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      county_14d.sum_new_confirmed: Forecasted New Cases
      county_14d.sum_new_deaths: Forecasted Deaths
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [hospital_general_info.hospital_type]
    listen:
      State Name: county_14d.state_name
    row: 24
    col: 0
    width: 24
    height: 9
  - title: Hospitalized Patients
    name: Hospitalized Patients
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_map
    fields: [county_14d.sum_hospitalized_patients, county_14d.state_name]
    filters: {}
    sorts: [county_14d.sum_hospitalized_patients desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map_latitude: 37.37015718405753
    map_longitude: -106.78710937500001
    map_zoom: 5
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 0
    width: 10
    height: 9
  - title: Forecasted New Cases
    name: Forecasted New Cases
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_map
    fields: [county_14d.sum_new_confirmed, county_14d.state_name]
    filters: {}
    sorts: [county_14d.sum_new_confirmed desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map_latitude: 37.37015718405753
    map_longitude: -106.78710937500001
    map_zoom: 5
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 14
    width: 10
    height: 9
  filters:
  - name: State Name
    title: State Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gps_vaccine_distro
    explore: county_14d
    listens_to_filters: []
    field: county_14d.state_name
