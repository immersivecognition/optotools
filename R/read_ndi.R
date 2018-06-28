#' Reads and converts an Optotrak file from given filepath into a opto object
#' @export
read_ndi <- function(filepath) {

  # http://tsgdoc.socsci.ru.nl/images/2/20/Optotrak_Application_Programmers_Interface_Guide%28IL-1070086%29.pdf

  ndi <- opto()

  ndi$fpath <- filepath
  ndi$fname <- basename(filepath)

  to_read = file(ndi$fpath, "rb")

  ndi$filetype <- readBin(to_read, what = 'int', size = 1, n = 1)
  ndi$items <- readBin(to_read, what = 'int', size = 2, n = 1)
  ndi$subitems <- readBin(to_read, what = 'int', size = 2, n = 1)
  ndi$numframes <- readBin(to_read, what = 'int', size = 4, n = 1)
  ndi$freq <- readBin(to_read, what = 'double', size = 4, n = 1)
  ndi$userComments <- rawToChar(readBin(to_read, what = 'raw', size = 1, n = 60))
  ndi$SysComments <- rawToChar(readBin(to_read, what = 'raw', size = 1, n = 60))
  ndi$DescripFile <- rawToChar(readBin(to_read, what = 'raw', size = 1, n = 30))
  ndi$cutoff <- readBin(to_read, what = 'int', size = 2, n = 1)
  ndi$CollTime <- rawToChar(readBin(to_read, what = 'raw', size = 1, n = 10))
  ndi$CollDate <- rawToChar(readBin(to_read, what = 'raw', size = 1, n = 10))
  ndi$FrameStart <- readBin(to_read, what = 'int', size = 4, n = 1)
  # extended header not implemented

  # close connection
  close(to_read)

  n_total_items <- ndi$numframes * ndi$items * ndi$subitems
  n_cols <- ndi$items * ndi$subitems

  # open new connection
  to_read = file(ndi$fpath, "rb")
  skip_header <- readBin(to_read, what = 'raw', size = 1, n = 256)
  raw_data <- readBin(to_read, what = 'double', size = 4, n = n_total_items)

  # close connection
  close(to_read)

  # add NaN
  raw_data[raw_data == -3.6973140302885666e+28] <- NaN
  # count NaN
  ndi$nummissing <- sum(is.nan(raw_data))

  raw_matrix <- matrix(raw_data, ncol = n_cols, byrow = TRUE)

  ndi$df <- as.data.frame(raw_matrix)

  xyz <- c("x", "y", "z")
  dims <- xyz[1:ndi$subitems]

  column_headers = c()

  for (m in 1:ndi$items) {
    markers <- paste(paste0("m", m), dims, sep = "_")
    column_headers <- c(column_headers, markers)
  }

  colnames(ndi$df) <- column_headers

  return(ndi)

}
