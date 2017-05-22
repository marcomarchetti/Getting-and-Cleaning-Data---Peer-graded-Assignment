
##-------------------------------------------------------
##  Marco Marchetti
##  21 May 2017
##  Getting and Cleaning Data Course Project
##
##  The project uses source data collected from the 
##  Samsung Galaxy S smartphone accelerometers
##  and create a TidyData.csv file contains the average 
##  of each variable for each activity and each subject.
##
##------------------------------------------------------

library(dplyr)

## ----------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.
## ----------------------------------------------------------------

# Download and Unzip dataSet into data directory
if (!file.exists("data")) {dir.create("data")}
DataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(DataUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Read features and activity labels
features <- read.table('./data/UCI HAR Dataset/features.txt',
                      col.names= c('index', 'featureNames'))
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt',
                             col.names = c('activityId','activityType'))

# Read train data
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                            col.names = 'subjectId')
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",
                      col.names = 'activityId')
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- features[,'featureNames'] 

# Read test data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",
                           col.names = 'subjectId')
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt",
                     col.names = 'activityId')
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features[,'featureNames']

# merge datasets (train:7352 obs, test:2947 obs)
train <- cbind(subject_train, y_train, x_train) 
test <- cbind(subject_test, y_test, x_test) 
combined <- rbind(train, test)

## ----------------------------------------------------------------------
## 2. Extracting only the measurements on the mean and standard deviation 
##    for each measurement
## ----------------------------------------------------------------------

# create logical vector : subjectId, activityId, mean and standard deviation columns
MeanStd <- (grepl("subjectId" , colnames(combined)) | 
                   grepl("activityId" , colnames(combined)) | 
                   grepl("mean" , colnames(combined)) | 
                   grepl("Mean" , colnames(combined)) | 
                   grepl("std" , colnames(combined)))

# subset combined with mean and standard deviation
combined_MeanStd <- combined[ , MeanStd]

## -------------------------------------------------------------------------
## 3. Uses descriptive activity names to name the activities in the data set
## -------------------------------------------------------------------------

# merge by activityId and reorder columns 
combined_MeanStd <- merge(combined_MeanStd, activity_labels, by='activityId')
combined_MeanStd <- select(combined_MeanStd, -activityId)
combined_MeanStd <- select(combined_MeanStd, subjectId, activityType, 2:ncol(combined_MeanStd))

## --------------------------------------------------------------------
## 4. Appropriately labels the data set with descriptive activity names
## --------------------------------------------------------------------

# Cleanup variable names 
colNames <-colnames(combined_MeanStd)
colNames<-gsub("\\-", " ", colNames) 
colNames<-gsub("\\.", " ", colNames)
colNames<-gsub("\\()", "", colNames)
colNames<-gsub("\\),", ",", colNames)
colNames<-gsub("BodyBody", "Body", colNames) #feature name correction
colNames<-gsub("tBody", "Time Body ", colNames)
colNames<-gsub("fBody", "Frequency Body ", colNames)
colNames<-gsub("tGravity", "Time Gravity ", colNames)
colNames<-gsub("fGravity", "Frequency Gravity ", colNames)
colNames<-gsub("Acc", "Accelerometer ", colNames)
colNames<-gsub("Gyro", "Gyroscope ", colNames)
colNames<-gsub("Mag", "Magnitude ", colNames)
colNames<-gsub("Jerk", "Jerk ", colNames)
colNames<-gsub("Mean", " mean", colNames)
colNames<-gsub("gravity)", "Gravity mean)", colNames) # feature name correction
colNames<-gsub("gravity", "Gravity", colNames)
colNames<-gsub("angle", "Angle", colNames)
colNames<-gsub("  ", " ", colNames)
colNames<-gsub("^\\s+|\\s+$", "", colNames)

# labels data set 
names(combined_MeanStd) <- colNames

## --------------------------------------------------------------------------------
## 5. Creates a second, independent tidy data set with the average of each variable 
##    for each activity and each subject. 
## --------------------------------------------------------------------------------

# Aggregate ad order data set
combined_TidyData <- aggregate(. ~subjectId + activityType, combined_MeanStd, mean)
combined_TidyData <- combined_TidyData[order(combined_TidyData$subjectId, combined_TidyData$activityType),]

# write data set
write.table(combined_TidyData, "TidyData.csv", row.name=FALSE, sep = ",")
