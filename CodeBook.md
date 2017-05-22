---
title: "CodeBook"
author: "Marco Marchetti"
date: "21 may 2017"
output: html_document
---

In this CodeBook there are 3 sections:  
- [Study Design](#Study): Information about data collection and project's steps  
- [Tidy Data set](#Tidy): Tidy Data description (Output)   
- [UCI HAR Dataset](#Raw): Original Data set description (Input)  

## Study Design <a name="Study"></a>

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
3. Write data set (`TidyData.csv`) in the root project directory.


`run_analysis.R` script using R version 3.3.3 on Windows 8.1 64-bit edition.  
The script requires the dplyr package (version 0.4.3).

## Tidy Data set <a name="Tidy"></a>

`TidyData.csv` is a text file containing comma-separated values and the first row contains the names of the variables.  
Each row contains, for a given subject and activity type, 86 averaged signal measurements.

### Identifiers:

 [1] "subjectId":  Subject who performed the activity (integer 1:30)      
 [2] "activityType": WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

 
### Signal Measurements:

All signal measurements are normalized and bounded within [-1,1].  
Prior to normalisation, acceleration measurements were in g's (9.81 m.s⁻²) and gyroscope measurements were in radians per second (rad.s⁻¹). Magnitudes of three-dimensional signals were calculated using the Euclidean norm.

The measurements are classified in:

- Time-domain signals (prefix Time), resulting from the capture of accelerometer and gyroscope raw signals.

 [3] "Time Body Accelerometer mean X"                       
 [4] "Time Body Accelerometer mean Y"                       
 [5] "Time Body Accelerometer mean Z"                       
 [6] "Time Body Accelerometer std X"                        
 [7] "Time Body Accelerometer std Y"                        
 [8] "Time Body Accelerometer std Z"                        
 [9] "Time Gravity Accelerometer mean X"                    
[10] "Time Gravity Accelerometer mean Y"                    
[11] "Time Gravity Accelerometer mean Z"                    
[12] "Time Gravity Accelerometer std X"                     
[13] "Time Gravity Accelerometer std Y"                     
[14] "Time Gravity Accelerometer std Z"                     
[15] "Time Body Accelerometer Jerk mean X"                  
[16] "Time Body Accelerometer Jerk mean Y"                  
[17] "Time Body Accelerometer Jerk mean Z"                  
[18] "Time Body Accelerometer Jerk std X"                   
[19] "Time Body Accelerometer Jerk std Y"                   
[20] "Time Body Accelerometer Jerk std Z"                   
[21] "Time Body Gyroscope mean X"                           
[22] "Time Body Gyroscope mean Y"                           
[23] "Time Body Gyroscope mean Z"                           
[24] "Time Body Gyroscope std X"                            
[25] "Time Body Gyroscope std Y"                            
[26] "Time Body Gyroscope std Z"                            
[27] "Time Body Gyroscope Jerk mean X"                      
[28] "Time Body Gyroscope Jerk mean Y"                      
[29] "Time Body Gyroscope Jerk mean Z"                      
[30] "Time Body Gyroscope Jerk std X"                       
[31] "Time Body Gyroscope Jerk std Y"                       
[32] "Time Body Gyroscope Jerk std Z"                       
[33] "Time Body Accelerometer Magnitude mean"               
[34] "Time Body Accelerometer Magnitude std"                
[35] "Time Gravity Accelerometer Magnitude mean"            
[36] "Time Gravity Accelerometer Magnitude std"             
[37] "Time Body Accelerometer Jerk Magnitude mean"          
[38] "Time Body Accelerometer Jerk Magnitude std"           
[39] "Time Body Gyroscope Magnitude mean"                   
[40] "Time Body Gyroscope Magnitude std"                    
[41] "Time Body Gyroscope Jerk Magnitude mean"              
[42] "Time Body Gyroscope Jerk Magnitude std"  

- Frequency-domain signals (prefix Frequency), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

[43] "Frequency Body Accelerometer mean X"                  
[44] "Frequency Body Accelerometer mean Y"                  
[45] "Frequency Body Accelerometer mean Z"                  
[46] "Frequency Body Accelerometer std X"                   
[47] "Frequency Body Accelerometer std Y"                   
[48] "Frequency Body Accelerometer std Z"                   
[49] "Frequency Body Accelerometer meanFreq X"              
[50] "Frequency Body Accelerometer meanFreq Y"              
[51] "Frequency Body Accelerometer meanFreq Z"              
[52] "Frequency Body Accelerometer Jerk mean X"             
[53] "Frequency Body Accelerometer Jerk mean Y"             
[54] "Frequency Body Accelerometer Jerk mean Z"             
[55] "Frequency Body Accelerometer Jerk std X"              
[56] "Frequency Body Accelerometer Jerk std Y"              
[57] "Frequency Body Accelerometer Jerk std Z"              
[58] "Frequency Body Accelerometer Jerk meanFreq X"         
[59] "Frequency Body Accelerometer Jerk meanFreq Y"         
[60] "Frequency Body Accelerometer Jerk meanFreq Z"         
[61] "Frequency Body Gyroscope mean X"                      
[62] "Frequency Body Gyroscope mean Y"                      
[63] "Frequency Body Gyroscope mean Z"                      
[64] "Frequency Body Gyroscope std X"                       
[65] "Frequency Body Gyroscope std Y"                       
[66] "Frequency Body Gyroscope std Z"                       
[67] "Frequency Body Gyroscope meanFreq X"                  
[68] "Frequency Body Gyroscope meanFreq Y"                  
[69] "Frequency Body Gyroscope meanFreq Z"                  
[70] "Frequency Body Accelerometer Magnitude mean"          
[71] "Frequency Body Accelerometer Magnitude std"           
[72] "Frequency Body Accelerometer Magnitude meanFreq"      
[73] "Frequency Body Accelerometer Jerk Magnitude mean"     
[74] "Frequency Body Accelerometer Jerk Magnitude std"      
[75] "Frequency Body Accelerometer Jerk Magnitude meanFreq"   
[76] "Frequency Body Gyroscope Magnitude mean"              
[77] "Frequency Body Gyroscope Magnitude std"               
[78] "Frequency Body Gyroscope Magnitude meanFreq"          
[79] "Frequency Body Gyroscope Jerk Magnitude mean"         
[80] "Frequency Body Gyroscope Jerk Magnitude std"          
[81] "Frequency Body Gyroscope Jerk Magnitude meanFreq"  

- Angle measurements

[82] "Angle(Time Body Accelerometer mean,Gravity mean)"     
[83] "Angle(Time Body Accelerometer Jerk mean,Gravity mean)"  
[84] "Angle(Time Body Gyroscope mean,Gravity mean)"         
[85] "Angle(Time Body Gyroscope Jerk mean,Gravity mean)"    
[86] "Angle(X,Gravity mean)"                                
[87] "Angle(Y,Gravity mean)"                                
[88] "Angle(Z,Gravity mean)"


## UCI HAR Dataset <a name="Raw"></a>

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.

**Feature Selection**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes:

- Features are normalized and bounded within [-1,1].

- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

**Licence** 

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.