
# Instructions ------------------------------------------------------------

# create script called "run_analysis.R" that:
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

# read in the identifiers for the invididuals who were doing the activities
trainidentifier <- fread("./UCI HAR Dataset/train/subject_train.txt")
testidentifier <- fread("./UCI HAR Dataset/test/subject_test.txt")

# attach the label and identifier variables to the training and test datasets
traindata <- cbind(traindata, trainlabel, trainidentifier)
testdata <- cbind(testdata, testlabel, testidentifier)

# combine the training and test data
activitydata <- rbind(traindata, testdata)

# features are the column names of the measured variables. read in the feature
# names (unlist to get a vector instead of data table). Also add a descriptive
# column names for columns that contain 
featurenames <- unlist(fread("./UCI HAR Dataset/features.txt", select = 2))
featurenames[562:563] <- c("activity", "subject")

# name the columns of the merged data set
names(activitydata) <- featurenames

# free up work space
rm(list = c("traindata", "testdata", "trainlabel", "testlabel", 
            "trainidentifier", "testidentifier", "featurenames"))

# extract only the mean and std deviation for each measurement, as well as the
# activity and subject variables. Then change the activity variable such that
# it contains descriptive activity names
activitydata <- 
        activitydata %>% 
        select(matches("-mean()|-std()"), activity, subject) %>% 
        mutate(activity = recode(activitydata[, activity],
                                      "1" = "walking", 
                                      "2" = "walking_upstairs",
                                      "3" = "walking_downstairs", 
                                      "4" = "sitting", "5" = "standing", 
                                      "6" = "laying"))

activitydata %>% 
        group_by(subject, activity) %>%
        summarize_all() 
# ct here, we still need to check documentation and what function works for
# applying a transformation to multiple columns whilst considering the group_by
# argument
        
        


