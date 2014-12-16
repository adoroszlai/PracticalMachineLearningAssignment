# This script partitions the cleaned data into training and testing subsets,
# and uses the training subset to fit Random Forest model via the caret package.

source('functions.R')

library(caret)
library(randomForest)

preProc <- c("center", "scale")
trControl <- trainControl(method = 'cv', number = 10)

set.seed(123)
load(clean_file)
inTrain <- createDataPartition(y = data$classe, p = 0.5, list = F)
training <- data[inTrain,]
test <- data[-inTrain,]
save(inTrain, training, test, file = testdata_file)

# Random Forest
set.seed(123)
rf.grid <- data.frame(mtry = 2:53)
Sys.time()
system.time(rf.fit <- train(classe ~ ., data = training, preProc = preProc, trControl = trControl,
                            method = 'rf', tuneGrid = rf.grid))
Sys.time()
save(rf.fit, file = model_file)
