#' Base type for Optotrak data
opto <- function() structure(list(), class = 'opto')

#' Extracts dataframe from opto object
#' @export
as.data.frame.opto <- function(x) x$df
