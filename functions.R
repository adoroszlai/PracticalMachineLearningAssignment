# This script defines some variables and functions for use by multiple scripts.

clean_file <- 'clean.RData'
testdata_file <- 'split.RData'
model_file <- 'rf.RData'

train_url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'
problem_url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'

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