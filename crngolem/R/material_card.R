#' material_card
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
material_card <- function(..., header = NULL, bgcolor = "white") {
  div(
    class = "card",
    header,
    div(class = "card-content", ..., style = sprintf("background-color: %s", bgcolor))
  )
}

