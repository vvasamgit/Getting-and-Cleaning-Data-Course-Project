
# Getting and Cleaning Data Course Project Readme file



The purpose of this project is to collect and clean "Human Activity Recognition Using Smartphones" data set. After cleaning source data set the final tidy data set will be created with averages of all (mean and standard deviation) variables of each activity and subject (group by activity name and subject id).  This project creates the following files:

1) run_analysis.R  
    Reads source data files and produces tidyHARDataSetAvg.txt file
2) README.md (this file)
3) CodeBook.md
  Describes the variables, the data, and the transformations used for producing final tidy data set


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




