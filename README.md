---
title: "Getting and Cleaning Data Course Project"
author: "Marco Marchetti"
date: "21 May 2017"
output: html_document
---

Submission of the course project for the Johns Hopkins Getting and Cleaning Data course.  
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 

## Overview

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.  
The source data set for this project was obtained from the Human Activity Recognition using Samsung Galaxy S smartphone accelerometers.  
The source data set is available at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

This project uses the source data to create a Tidy Data set contains the average of each source data variable for each activity and each subject.  

This repository contains the following files:

* `README.md` this file, which provides an overview of the project.

* `TidyData.txt` contains independent tidy data set with the average of each variable for each activity and each subject.

* `run_analysis.R` R script that was used to create the Tidy data set

* `CodeBook.md` describes how to use all this, variables, data, and any transformations performed to clean up the data.


## How the Script works

Tidy Data set is created by running `run_analysis.R` on the UCI HAR Dataset.  
The R script executes both the **Data Collection** and the **Tidy data Creation** steps.  

### Data Collection

The UCI HAR Dataset set is available at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data collection steps:  

1. `data` directory creation
2. Download into the data directory the [Zipped UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) as `Dataset.zip`   
3. Unzip `Dataset.zip` into `data\UCI HAR Dataset`  

### Tidy data Creation

Tidy data creation steps:

MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET  

1. Read features and activity labels 
2. Read train data (7352 rows)
3. Read test data (2947 rows)
4. Merge train and test data into a combined data set.

EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT  

1. Create a logical vector (subjectId, activityId, mean and standard deviation columns)
2. Using the logical vector to subset the combined data set.

USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET  

1. Merge the combined data (only mean and std) with activity labels by activityId.

APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE ACTIVITY NAMES  

1. Cleanup variable names and labels the combined data set 

CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT  

1. Aggregate the combined data set with average of each variable for each activity and each subject
2. Order the combined data set
3. Write data set (`TidyData.txt`) in the root project directory.


`run_analysis.R` script using R version 3.3.3 on Windows 8.1 64-bit edition.  
The script requires the dplyr package (version 0.4.3).


