Code Book for Getting and Cleaning Data Course Project

The task is to clean a data set containing measurements of the accelerometers of a Smartphone.

The data set is stored in the directory "UCI HAR Dataset" with two subdirectories: "test" and "train".

In this document all file and directory names are relative to the directory "UCI HAR Dataset"

There are two datasets: One for training (70% of subjects) and one for test (30% of subjects).

Both datasets are classified into five activities (activity_labels.txt):

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The actual data sets are in the files test/X_test.txt and train/X_train.txt.

Each record (line) in these two files contains 561 features described in features.txt.

An additional file classifies the record by activity number (test/y_test.txt and train/y_train.txt).

An additional file classifies the record by subject number (test/subject_test.txt and train/subject_train.txt).

For the purpose of this project the test and train data sets should be merged.

The code performing the loading and cleaning of the data set is in file run_analysis.R.

The first step is reading relevant features from both the test and training data set. 
Only columns containing mean or standard deviation of a feature are relevant here.

The second step is merging the training and test data sets.

Then we are giving the features the descriptive name from features.txt.

The activities are read from the relevant file and mapped to descriptive names and added to the data set.

Finally the subjects are read and added to the data set.

The tidy data set is created by aggregating all measures using mean for each activity and subject.

The relevant data set has the following structure:

Activity: The name of the activty carried out.
Subject: The number of the test subject.
The mean of the following measurements:                    
 "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
 "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
 "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
 "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
 "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
 "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
 "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
 "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
 "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
 "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
 "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
 "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
 "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
 "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
 "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
 "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
 "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
 "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
 "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
 "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
 "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
 "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
 "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
 "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
 "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
 "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
 "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
 "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
 "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

More detailed information on the measurements:

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


