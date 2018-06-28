#' Reads and converts an Optotrak file from given filepath and re-saves as a CSV file
#' @export
ndi_to_csv <- function(ndi_path, output_path, sep = ",") {

  opto_data <- read_ndi(ndi_path)

  write.csv(as.data.frame(opto_data), output_path, sep = sep)

}
