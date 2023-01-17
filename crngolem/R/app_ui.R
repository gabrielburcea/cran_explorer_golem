#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    htmlTemplate(
      filename = "inst/app/www/index.html",
      box_packages_new_month = pretty_value_box_ui("packages-new-month", icon_name = "cubes"),
      box_packages_updated_month = pretty_value_box_ui("packages-updated-month", background_color = "#7ab885", icon_name = "cubes"),

      box_packages_new_year = pretty_value_box_ui("packages-new-year", icon_name = "cubes"),
      box_packages_updated_year = pretty_value_box_ui("packages-updated-year", background_color = "#7ab885", icon_name = "cubes"),

      header_ui = uiOutput("header_ui") %>% shinycssloaders::withSpinner(size = 0.5, proxy.height = "50px", type = 6, color = "#FFFFFF"),

      package_chart = package_chart_ui("package_chart"),

      featured_packages = featured_packages_ui("featured_packages"),

      dependency_network = graph_network_ui("dependency_network")
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "crngolem"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
