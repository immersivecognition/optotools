#' Reads and converts an Optotrak file from given filepath and re-saves as a CSV file.
#' @param ndi_path string Location of the file to read.
#' @param output_path string Location of the file to write.
#' @param sep The field separator string. Values within each row of the dataframe are separated by this string.
#' @param row.names Either a logical value indicating whether the row names of x are to be written along with x, or a character vector of row names to be written.
#' @param ... Additional parameters passed to write.table
#' @export
ndi_to_csv <- function(ndi_path, output_path, sep = ",", row.names = FALSE, ...) {

  opto_data <- read_ndi(ndi_path)

  write.table(as.data.frame(opto_data), output_path, sep = sep, row.names = row.names, ...)

}
