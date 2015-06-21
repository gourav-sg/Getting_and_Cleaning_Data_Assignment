
# CODEBOOK

This document mentions the following:

1. Description of data
2. Description of variables
3. Any transformations or work required to clean the data


## Description of Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


## Description of Variables

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The final file extract is a calculation of mean of all the mean and standard deviation measurement

## Tranformations:

The following transformations were carried out as per the instructions:

1. Merges the training and the test sets to create one data set.

  * Get the values of test/X_test.txt into data frame
  
  * Merge by column the dataframes above into a test data frame
  
  * Get the values of train/X_test.txt into a data frame
  
  * Merge by column the dataframes above into a train data frame
  
  * Merge the test and train data frame by row into one
  
2. Extracts only the measurements on the mean and standard deviation for each measurement 

  * select all the field names from "features.txt"
  
  * select records which have "mean" and "sd" in them

3. Uses descriptive activity names to name the activities in the data set

  * Get the values of train/y_test.txt and test/y_test.txt into two data frames
  
  * Merge the values of the activity data frames
  
  * Get the values of the train/subject_test.txt and test/subject_train.txt into two data frames
  
  * Merge the values of the subject data frames
  
  * Include the values of activity data frame and subject data frames into the main measurement data frame created in above steps
  
  * Read the description of activities stored in activity_labels.txt into a data frame
  
  * Do a left join of the measurement + activity data frame created above with the activity description data frame, please note that after doing merge the order of the rows changes.
  

4. Appropriately labels the data set with descriptive variable names

  * consider the earlier data frame which contains the name of the selected fields
  
  * remove the characters "(" and ")" from the field description
  
  * replace the character "-" by "_"
  
  * modify the column headings by finding out the position of the newly added fields "activity" and "activity_desc", visually

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

  * as per tidy data set rules create the required field names for mean, this is to ensure that we have field names in the final data frame mentioning that they are mean
  
  * calculate the mean of all the fields grouped by activity description and subject
  
  * rename the fields by verifying that their order has not changed
