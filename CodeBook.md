
# Getting and Cleaning Data Course Project code book

Author: "Venkat Vasam"


#Introduction 

Getting and Cleaning Data project creates run_analysis.R script that downloads and clean "Human Activity Recognition Using Smartphones" data set. After cleaning source data set the final tidy data set will be created with averages of all (mean and standard deviation) variables of each activity and  subject (group by activity name and subject id).  This project reads downloaded source data files and produces tidyHARDataSetAvg.txt file


# Data

 This section describes the source and result data sets

## Source Data Set

Human Activity Recognition Using Smartphones" data set: 
  
The source data is available at the URL shown below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The above zip file has wearable computing data that is collected from the accelerometers from the Samsung Galaxy's smartphone. 

More details of the data is available at the url shown below

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Result Data Set

The following result data file will be created by **run_analysis.R**

  + tidyHARDataSetAvg.txt

# Variables

The variable in the result data set are shown below

1.	ActivityName	
2.	SubjectId
3.	TimeDomainBodyAccelerationMeanX	
4.	TimeDomainBodyAccelerationMeanY	
5.	TimeDomainBodyAccelerationMeanZ	
6.	TimeDomainBodyAccelerationStandardDeviationX	
7.	TimeDomainBodyAccelerationStandardDeviationY	
8.	TimeDomainBodyAccelerationStandardDeviationZ	
9.	TimeDomainGravityAccelerationMeanX	
10.	TimeDomainGravityAccelerationMeanY	
11.	TimeDomainGravityAccelerationMeanZ	
12.	TimeDomainGravityAccelerationStandardDeviationX	
13.	TimeDomainGravityAccelerationStandardDeviationY	
14.	TimeDomainGravityAccelerationStandardDeviationZ	
15.	TimeDomainBodyAccelerationJerkMeanX	
16.	TimeDomainBodyAccelerationJerkMeanY	
17.	TimeDomainBodyAccelerationJerkMeanZ	
18.	TimeDomainBodyAccelerationJerkStandardDeviationX	
19.	TimeDomainBodyAccelerationJerkStandardDeviationY	
20.	TimeDomainBodyAccelerationJerkStandardDeviationZ	
21.	TimeDomainBodyAngularVelocityMeanX	
22.	TimeDomainBodyAngularVelocityMeanY	
23.	TimeDomainBodyAngularVelocityMeanZ	
24.	TimeDomainBodyAngularVelocityStandardDeviationX
25.	TimeDomainBodyAngularVelocityStandardDeviationY
26.	TimeDomainBodyAngularVelocityStandardDeviationZ	
27.	TimeDomainBodyAngularVelocityJerkMeanX	
28.	TimeDomainBodyAngularVelocityJerkMeanY	
29.	TimeDomainBodyAngularVelocityJerkMeanZ	
30.	TimeDomainBodyAngularVelocityJerkStandardDeviationX
31.	TimeDomainBodyAngularVelocityJerkStandardDeviationY
32.	TimeDomainBodyAngularVelocityJerkStandardDeviationZ
33.	TimeDomainBodyAccelerationMagnitudeMean
34.	TimeDomainBodyAccelerationMagnitudeStandardDeviation
35.	TimeDomainGravityAccelerationMagnitudeMean
36.	TimeDomainGravityAccelerationMagnitudeStandardDeviation
37.	TimeDomainBodyAccelerationJerkMagnitudeMean
38.	TimeDomainBodyAccelerationJerkMagnitudeStandardDeviation
39.	TimeDomainBodyAngularVelocityMagnitudeMean
40.	TimeDomainBodyAngularVelocityMagnitudeStandardDeviation
41.	TimeDomainBodyAngularVelocityJerkMagnitudeMean
42.	TimeDomainBodyAngularVelocityJerkMagnitudeStandardDeviation
43.	FrequencyDomainBodyAccelerationMeanX	
44.	FrequencyDomainBodyAccelerationMeanY	
45.	FrequencyDomainBodyAccelerationMeanZ	
46.	FrequencyDomainBodyAccelerationStandardDeviationX
47.	FrequencyDomainBodyAccelerationStandardDeviationY
48.	FrequencyDomainBodyAccelerationStandardDeviationZ	
49.	FrequencyDomainBodyAccelerationMeanFreqX
50.	FrequencyDomainBodyAccelerationMeanFreqY	
51.	FrequencyDomainBodyAccelerationMeanFreqZ
52.	FrequencyDomainBodyAccelerationJerkMeanX	
53.	FrequencyDomainBodyAccelerationJerkMeanY	
54.	FrequencyDomainBodyAccelerationJerkMeanZ
55.	FrequencyDomainBodyAccelerationJerkStandardDeviationX
56.	FrequencyDomainBodyAccelerationJerkStandardDeviationY
57.	FrequencyDomainBodyAccelerationJerkStandardDeviationZ
58.	FrequencyDomainBodyAccelerationJerkMeanFreqX
59.	FrequencyDomainBodyAccelerationJerkMeanFreqY
60.	FrequencyDomainBodyAccelerationJerkMeanFreqZ	
61.	FrequencyDomainBodyAngularVelocityMeanX	
62.	FrequencyDomainBodyAngularVelocityMeanY	
63.	FrequencyDomainBodyAngularVelocityMeanZ
64.	FrequencyDomainBodyAngularVelocityStandardDeviationX
65.	FrequencyDomainBodyAngularVelocityStandardDeviationY
66.	FrequencyDomainBodyAngularVelocityStandardDeviationZ
67.	FrequencyDomainBodyAngularVelocityMeanFreqX
68.	FrequencyDomainBodyAngularVelocityMeanFreqY
69.	FrequencyDomainBodyAngularVelocityMeanFreqZ
70.	FrequencyDomainBodyAccelerationMagnitudeMean
71.	FrequencyDomainBodyAccelerationMagnitudeStandardDeviation
72.	FrequencyDomainBodyAccelerationMagnitudeMeanFreq
73.	FrequencyDomainBodyAccelerationJerkMagnitudeMean
74.	FrequencyDomainBodyAccelerationJerkMagnitudeStandardDeviation
75.	FrequencyDomainBodyAccelerationJerkMagnitudeMeanFreq
76.	FrequencyDomainBodyAngularVelocityMagnitudeMean
77.	FrequencyDomainBodyAngularVelocityMagnitudeStandardDeviation
78.	FrequencyDomainBodyAngularVelocityMagnitudeMeanFreq
79.	FrequencyDomainBodyAngularVelocityJerkMagnitudeMean
80.	FrequencyDomainBodyAngularVelocityJerkMagnitudeStandardDeviation
81.	FrequencyDomainBodyAngularVelocityJerkMagnitudeMeanFreq


# Transformations

The source zip file has several data files that construct a record and each record has details shown below:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity labels. 
- An identifier of the subject who carried out the experiment.


For producing a final tiny data set the following files are used

1) A 561-feature vector with time and frequency domain variables 

      +  features.txt,train/X_train.txt, test/X_train.txt
2) Its activity label 

     + activity_labels.txt,train/Y_train.txt, test/Y_train.txt
     
3) An identifier of the subject who carried out the experiment 

    +  train/subject_train.txt and test/subject_train.txt.

The files in following folder are not used in this project. 

  UCI HAR Dataset\train\Inertial Signals and  UCI HAR Dataset\test\Inertial Signals:  

  These folders have files with the following information, which is collected using sensor signals to compute feature set mean, standard deviation and magnitude by    calculating variables from the time and frequency domain
    1) Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
    2) Triaxial Angular velocity from the gyroscope


The dataset in the zip file includes the following files:

- 'README.txt'

- 'features_info.txt':  has information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the activity labels with their activity name.

- 'train/X_train.txt': Training set with the features.

- 'train/y_train.txt': Training activity labels.

- 'test/X_test.txt': Test set with the features.

- 'test/y_test.txt': Test activity labels.

The following files are available for the train and test data. . 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The **run_analysis.R** script does the following 

 1. Prepare data
 
    + Define variables for labels
    + Load data from original data set files for further analysis
    + Extract required feature columns only from the feature set 
    
2.  Merges the training and the test sets with required variables to create one data set.

3.  Uses descriptive activity names to name the activity codes in the data set
      + WALKING for code 1
      + WALKING_UPSTAIRS for code 2
      + WALKING_DOWNSTAIRS for code 3
      + SITTING for code 4
      + STANDING for code 5
      + LAYING for code 6
      
4. Appropriately labels the data set with descriptive variable names.
    + Replace non digit and alphabet characters with blank("")
    + Replace BodyBody with Body
    + Replace mean with Mean
    + Replace std with StandardDeviation
    + Replace Mag with Magnitude
    + Replace first character t with TimeDomain
    + Replace first character f with FrequencyDomain
    + Replace Acc with Acceleration
    + Replace Gyro with AngularVelocity
    
5.  Using merged data set creates a second, independent tidy data set with the average of each variable for each activity and each subject (group by activity name and subject id).


