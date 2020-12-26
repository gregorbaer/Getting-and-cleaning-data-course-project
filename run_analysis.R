
# Instructions ------------------------------------------------------------

# create script that called "run_analysis.R" that:
# 1) merges training and test sets to create one data set
# 2) extracts only the mean and std deviation for each measurement
# 3) uses descriptive activity names to name activities in the data set
# 4) appropriately labels the data set with descriptive variable names
# 5) from the data in step 4, creates a 2nd, independent tidy data set with the
#    average of each variable for each activity and each subject.

library(tidyverse)
library(data.table)

# read data into R ---------------------------------------------------

# read in the separate training and test data sets
traindata <- fread("./UCI HAR Dataset/train/X_train.txt")
testdata <- fread("./UCI HAR Dataset/test/X_test.txt")

# read in the labels that show what type of activity individuals were doing
trainlabel <- fread("./UCI HAR Dataset/train/y_train.txt")
testlabel <- fread("./UCI HAR Dataset/test/y_test.txt")
labelconversion <- fread("./UCI HAR Dataset/activity_labels.txt")

# attach the label vectors to the training and test datasets
traindata <- cbind(traindata, trainlabel)
testdata <- cbind(testdata, testlabel)

# combine the training and test data and remove the objects from workspace that
# are not needed anymore
activitydata <- rbind(traindata, testdata)

# features are the column names of the measured variables. read in the feature
# names and use them as the variable names in the combined data set. 
featurenames <- fread("./UCI HAR Dataset/features.txt", select = 2)


names(activitydata[,1:562]) <- featurenames


rm(list = c("traindata", "testdata", "trainlabel", "testlabel"))


