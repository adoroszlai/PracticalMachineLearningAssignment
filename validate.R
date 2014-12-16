# This script applies the fitted model to the final "test" dataset for which we need to submit the predictions.

library(randomForest)
library(caret)

source('functions.R')

file <- download_if_necessary(problem_url)
data <- read.csv(file)

load(model_file)
pred <- predict(rf.fit, newdata = data)

# save predictions for submission via the course website
dir.create("submission")
ignored <- sapply(1:length(pred), function(i) {
  filename = paste0("submission/problem_id_", i, ".txt")
  write.table(pred[i], file=filename, quote=FALSE, row.names=FALSE, col.names=FALSE)
})
