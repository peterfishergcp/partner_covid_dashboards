- dashboard: partner_covid_19_public_forecast_by_county
  title: Partner COVID 19 Public Forecast by County
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
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
    row: 0
    col: 10
    width: 14
    height: 6
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
    row: 6
    col: 10
    width: 7
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
    row: 6
    col: 17
    width: 7
    height: 3
  - title: 14 Day Forecast by County
    name: 14 Day Forecast by County
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_grid
    fields: [county_14d.county_name, county_14d.sum_new_confirmed, county_14d.sum_new_deaths_baseline,
      county_14d.max_hospitalized_patients]
    filters:
      county_14d.county_name: ''
    sorts: [county_14d.sum_new_confirmed desc]
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
      county_14d.sum_new_deaths_baseline: Forecasted Deaths
    series_cell_visualizations:
      county_14d.sum_new_confirmed:
        is_active: true
        value_display: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, mirror: true}}, bold: false, italic: false, strikethrough: false,
        fields: [county_14d.sum_new_confirmed]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          palette_id: google-sequential-0, options: {steps: 5, mirror: true}}, bold: false,
        italic: false, strikethrough: false, fields: [county_14d.sum_new_deaths_baseline]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 6710e048-9310-2b08-d24a-344c3a731ef6,
            label: Custom, type: continuous, stops: [{color: "#fffee1", offset: 0},
              {color: "#ffa500", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [county_14d.max_hospitalized_patients]}]
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
    defaults_version: 1
    series_types: {}
    listen:
      State Name: county_14d.state_name
    row: 9
    col: 0
    width: 24
    height: 6
  - title: COVID19 County New Cases Map
    name: COVID19 County New Cases Map
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_map
    fields: [county_14d.county_fips_code, county_14d.sum_new_confirmed]
    filters:
      county_14d.county_name: ''
    sorts: [county_14d.sum_new_confirmed desc]
    limit: 500
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
  - title: Predicted Confirmed Cases
    name: Predicted Confirmed Cases
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_line
    fields: [county_14d.prediction_date, county_14d.sum_cumulative_confirmed_ground_truth,
      county_14d.sum_new_confirmed]
    fill_fields: [county_14d.prediction_date]
    filters: {}
    sorts: [county_14d.prediction_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${county_14d.sum_new_confirmed})',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: predicted_confirmed_cases, label: Predicted
          Confirmed Cases, expression: 'if(row() < 15, coalesce(${correct_running_total},0)
          + coalesce(${calculation_5},0), null)', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: correct_running_total,
        label: Correct Running Total, expression: 'if(row() = 1, sum(${county_14d.sum_new_confirmed}),
          sum(${county_14d.sum_new_confirmed}) - offset(${running_total}, -1))', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: calculation_5, label: Calculation 5, expression: 'max(${county_14d.sum_cumulative_confirmed_ground_truth})',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
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
      show_hide: hide
      first_last: first
      num_rows: '0'
    hidden_fields: [calculation_5, county_14d.sum_new_confirmed, running_total, correct_running_total]
    defaults_version: 1
    listen:
      State Name: county_14d.state_name
    row: 15
    col: 0
    width: 12
    height: 6
  - title: Predicted Deaths
    name: Predicted Deaths
    model: gps_vaccine_distro
    explore: county_14d
    type: looker_line
    fields: [county_14d.prediction_date, county_14d.sum_cumulative_deaths_ground_truth,
      county_14d.sum_new_deaths]
    fill_fields: [county_14d.prediction_date]
    filters: {}
    sorts: [county_14d.prediction_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${county_14d.sum_new_deaths})',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: predicted_confirmed_cases, label: Predicted
          Confirmed Cases, expression: 'if(row() < 15, coalesce(${correct_running_total},0)
          + coalesce(${calculation_5},0), null)', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: correct_running_total,
        label: Correct Running Total, expression: 'if(row() = 1, sum(${county_14d.sum_new_deaths}),
          sum(${county_14d.sum_new_deaths}) - offset(${running_total}, -1))', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: calculation_5, label: Calculation 5, expression: 'max(${county_14d.sum_cumulative_deaths_ground_truth})',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
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
      show_hide: hide
      first_last: first
      num_rows: '0'
    hidden_fields: [calculation_5, running_total, correct_running_total, county_14d.sum_new_deaths]
    defaults_version: 1
    listen:
      State Name: county_14d.state_name
    row: 15
    col: 12
    width: 12
    height: 6
  filters:
  - name: State Name
    title: State Name
    type: field_filter
    default_value: California
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gps_vaccine_distro
    explore: county_14d
    listens_to_filters: []
    field: county_14d.state_name
  - name: County Name
    title: County Name
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
    field: county_14d.county_name
