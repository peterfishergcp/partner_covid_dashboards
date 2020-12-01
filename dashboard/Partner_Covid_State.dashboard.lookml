- dashboard: partner_covid19_public_forecasts__state
  title: Partner COVID-19 Public Forecasts - State
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 14 Day Forecast by State - Deaths
    name: 14 Day Forecast by State - Deaths
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_geo_choropleth
    fields: [county_14d.state_name, county_14d.sum_new_deaths]
    sorts: [county_14d.sum_new_deaths desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map: auto
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 9
    width: 7
    height: 11
  - name: About this Dashboard
    type: text
    title_text: About this Dashboard
    subtitle_text: ''
    body_text: |-
      This model generates a 14-day  and 28 Day forecast of the development of COVID-19 in each US state and county, and is intended to be used as one of many signals to help first responders in healthcare, the public sector, and other impacted organizations be better prepared for what lies ahead. <br />
      <br />
      Access the data in [BigQuery](https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-public-forecasts) or as a CSV ([state forecasts](https://storage.googleapis.com/covid-external/forecast_STATE_14.csv), [county forecasts](https://storage.googleapis.com/covid-external/forecast_COUNTY_14.csv).) <br />
      <br />
      Historical data for confirmed cases and deaths are powered primarily by the Johns Hopkins Coronavirus Resource Center. Historical values for hospital, ICU, and ventilator usage are powered primarily by the COVID Tracking Project. <br />
      <br />
      In order to download or use the forecasts, you must agree to the Google [Terms of Service](https://policies.google.com/terms?hl=en).
    row: 0
    col: 16
    width: 8
    height: 11
  - title: Deaths
    name: Deaths
    model: gps_vaccine_distro
    explore: county_14d
    type: single_value
    fields: [county_14d.sum_new_deaths, county_14d.prediction_date]
    fill_fields: [county_14d.prediction_date]
    sorts: [county_14d.prediction_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: yesterday, label: Yesterday, expression: 'offset(${county_14d.sum_new_deaths},1)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: vs_prior_day, label: vs Prior Day,
        expression: "${county_14d.sum_new_deaths}-${yesterday}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [yesterday]
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 5
    width: 4
    height: 4
  - title: Confirmed Cases
    name: Confirmed Cases
    model: gps_vaccine_distro
    explore: county_14d
    type: single_value
    fields: [county_14d.prediction_date, county_14d.sum_new_confirmed]
    fill_fields: [county_14d.prediction_date]
    filters: {}
    sorts: [county_14d.prediction_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: yesterday, label: Yesterday, expression: 'offset(${county_14d.sum_new_confirmed},1)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: vs_prior_day, label: vs Prior Day,
        expression: "${county_14d.sum_new_confirmed}-${yesterday}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [yesterday]
    listen:
      State Name: county_14d.state_name
    row: 0
    col: 0
    width: 5
    height: 4
  - title: State 14 Day Forecast
    name: State 14 Day Forecast
    model: gps_vaccine_distro
    explore: state_14d
    type: looker_grid
    fields: [county_14d.state_name, county_14d.sum_new_confirmed, county_14d.sum_new_deaths,
      state_14d.max_hospitalized_patients, state_14d.max_intensive_care_patients,
      state_14d.max_ventilator_patients]
    filters: {}
    sorts: [state_14d.max_intensive_care_patients desc]
    limit: 500
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
      county_14d.sum_new_confirmed: Forecasted Confirmed Cases
      county_14d.sum_new_deaths: Forecasted Deaths
      state_14d.max_hospitalized_patients: Peak Daily Hospitalized Patients
      state_14d.max_intensive_care_patients: Peak Daily ICU Patients
      state_14d.max_ventilator_patients: Peak Daily Ventilator Patients
    series_column_widths:
      state_14d.max_hospitalized_patients: 236
    series_cell_visualizations:
      county_14d.sum_new_confirmed:
        is_active: false
      state_14d.max_hospitalized_patients:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: [county_14d.sum_new_confirmed]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: [county_14d.sum_new_deaths]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: c3678fa8-6b3c-a425-979c-4e7f7f0cd907,
            label: Custom, type: continuous, stops: [{color: "#fffee1", offset: 0},
              {color: "#ffa500", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [state_14d.max_hospitalized_patients]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: e9b3b47a-9277-810c-0f1d-e523da50ec8e,
            label: Custom, type: continuous, stops: [{color: "#fffee1", offset: 0},
              {color: "#ffa500", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [state_14d.max_intensive_care_patients]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 1a6d7996-fc2d-ae27-109e-3fed4ea1bf44,
            label: Custom, type: continuous, stops: [{color: "#fffee1", offset: 0},
              {color: "#ffa500", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [state_14d.max_ventilator_patients]}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    listen:
      State Name: county_14d.state_name
    row: 20
    col: 0
    width: 23
    height: 9
  - name: Forecast breakdown by state
    type: text
    title_text: Forecast breakdown by state
    subtitle_text: ''
    body_text: Historical data for Hospitalized, ICU, and Ventilator usage by COVID-19
      patients is not available for all states. Therefore, forecasts may be less accurate
      for these metrics than for Deaths and Confirmed Cases.
    row: 17
    col: 0
    width: 24
    height: 3
  - title: Confirmed Cases - Cumulative 28 Day Forecast
    name: Confirmed Cases - Cumulative 28 Day Forecast
    model: gps_vaccine_distro
    explore: county_28d
    type: looker_line
    fields: [county_28d.prediction_date, county_28d.sum_cumulative_confirmed_ground_truth,
      county_28d.sumcumulative_confirmed, county_28d.sumcumulative_confirmedlower,
      county_28d.sumcumulative_confirmedupper]
    fill_fields: [county_28d.prediction_date]
    sorts: [county_28d.prediction_date desc]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '100'
    defaults_version: 1
    listen:
      State Name: county_28d.state_name
    row: 4
    col: 0
    width: 9
    height: 7
  - title: Deaths - Cumulative 28 Day Forecast
    name: Deaths - Cumulative 28 Day Forecast
    model: gps_vaccine_distro
    explore: county_28d
    type: looker_line
    fields: [county_28d.prediction_date, county_28d.sum_cumulative_deaths_ground_truth,
      county_28d.sumcumulative_deaths, county_28d.deaths_confirmlower, county_28d.cumulative_deathsupper]
    fill_fields: [county_28d.prediction_date]
    sorts: [county_28d.prediction_date desc]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '100'
    defaults_version: 1
    listen:
      State Name: county_28d.state_name
    row: 11
    col: 0
    width: 9
    height: 6
  - title: Confirmed Cases - Daily with 7 Day Moving Avg
    name: Confirmed Cases - Daily with 7 Day Moving Avg
    model: gps_vaccine_distro
    explore: county_28d
    type: looker_column
    fields: [county_28d.prediction_date, county_28d.sum_new_confirmed_ground_truth,
      county_28d.sum_new_confirmed, county_28d.confirmed_7day_rolling]
    fill_fields: [county_28d.prediction_date]
    sorts: [county_28d.prediction_date]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '100'
    series_types:
      county_28d.confirmed_7day_rolling: line
    series_labels: {}
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      State Name: county_28d.state_name
    row: 11
    col: 9
    width: 7
    height: 6
  - title: " Daily Deaths with 7 Day Moving Avg"
    name: " Daily Deaths with 7 Day Moving Avg"
    model: gps_vaccine_distro
    explore: county_28d
    type: looker_column
    fields: [county_28d.prediction_date, county_28d.sum_new_deaths_ground_truth, county_28d.sum_new_deaths,
      county_28d.deaths_7day_rolling]
    fill_fields: [county_28d.prediction_date]
    sorts: [county_28d.prediction_date]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '100'
    series_types:
      county_28d.confirmed_7day_rolling: line
      county_28d.deaths_7day_rolling: line
    series_labels: {}
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      State Name: county_28d.state_name
    row: 11
    col: 16
    width: 8
    height: 6
  - title: State 28 Day Forecast
    name: State 28 Day Forecast
    model: gps_vaccine_distro
    explore: state_28d
    type: looker_grid
    fields: [state_28d.state_name, county_28d.sum_new_confirmed, county_28d.sum_new_deaths,
      state_28d.max_hospitalized_patients, state_28d.max_intensive_care_patients,
      state_28d.max_ventilator_patients]
    sorts: [county_28d.sum_new_confirmed desc]
    limit: 500
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
      county_28d.sum_new_confirmed: Forecasted Confirmed Cases
      county_28d.sum_new_deaths: Forecasted Deaths
      state_28d.max_hospitalized_patients: Peak Daily Hospitalized Patients
      state_28d.max_intensive_care_patients: Peak Daily ICU Patients
      state_28d.max_ventilator_patients: Peak Daily Ventilator Patients
    series_cell_visualizations:
      county_28d.sum_new_confirmed:
        is_active: true
      county_28d.sum_new_deaths:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, stepped: true}}, bold: false, italic: false, strikethrough: false,
        fields: [county_28d.sum_new_confirmed]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: feadd703-568e-8f64-8f6c-324ed8615203, label: Custom, type: continuous,
            stops: [{color: "#fffee1", offset: 0}, {color: "#ffa500", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [state_28d.max_hospitalized_patients]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 70814079-f363-633a-5701-cfa9179b3167, label: Custom, type: continuous,
            stops: [{color: "#fffee1", offset: 0}, {color: "#ffa500", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [state_28d.max_intensive_care_patients]}, {type: along a scale...,
        value: !!null '', background_color: "#4285F4", font_color: !!null '', color_application: {
          collection_id: google, custom: {id: c540d5a2-c160-d043-607c-f2c8e28ad687,
            label: Custom, type: continuous, stops: [{color: "#fffee1", offset: 0},
              {color: "#ffa500", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [state_28d.max_ventilator_patients]}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    listen:
      State Name: state_28d.state_name
    row: 29
    col: 0
    width: 23
    height: 10
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
