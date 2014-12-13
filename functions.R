download_if_necessary <- function(url, file = basename(url), zipfile = paste0(file, ".zip")) {
  if (!file.exists(file)) {
    if (file.exists(zipfile)) {
      unzip(zipfile)
    } else {
      download.file(url, file, method = 'curl')
      zip(zipfile, file, "-9")
    }
  }
  file
}