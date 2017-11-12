
#R script run_analysis.R that does the following.
#0.1 downlaod and extract zip file
#0.2 Define variables for labels
#0.3 Load data from original data set files for further analysys
#0.4 Extract required feature columns only from the feature set 
#1.Merges the training and the test sets with required variables to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. (Peformed this step before merge to save memory space)
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Human Activity Recognition (HAR) using smart phone  data for the project
# is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


library(dplyr)

#setwd("C:/Wrksps/dev/DataScienceCE/datasciencecoursera/GettingAndCleaningData/Getting-and-Cleaning-Data-Course-Project")

##### 0.1. downlaod and extract zip file

dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

dataZipFilePath<-"./UCIHARDataSet.zip"

download.file(dataURL, dataZipFilePath)

#Extract zip file 
unzip(dataZipFilePath)


#####0.2.Define variables for labels  ###################


# Define data root folder relative to current working directory
dataRootFolder<-"./UCI HAR Dataset"

trainingSetFolder<-"train"

testSetFolder<-"test"

# Define subject id column name

subjectIdColName<-"SubjectId"

# Define activity info column names
activityInfoColNames<-c("ActivityId", "ActivityName")



##### 0.3. Load data from original data set files for further analysys  ###################

#Load activty info from file
activityInfo<-read.table(file.path(dataRootFolder,"activity_labels.txt"),stringsAsFactors=FALSE )

#Set activity info column names 
colnames(activityInfo)<-activityInfoColNames

#load feature id and name 

featureInfo<-read.table(file.path(dataRootFolder,"features.txt"),stringsAsFactors=FALSE )



# load Human Activity Recognition (HAR) trainig subject ids 

trainingSetSubjectIds<-read.table(file.path(dataRootFolder,trainingSetFolder, "subject_train.txt"),stringsAsFactors=FALSE )

# load Human Activity Recognition (HAR) trainig features

trainingSetFeatures<-read.table(file.path(dataRootFolder,trainingSetFolder, "X_train.txt"),stringsAsFactors=FALSE )

# load Human Activity Recognition (HAR) trainig activity ids

trainingSetActivitIds<-read.table(file.path(dataRootFolder,trainingSetFolder, "Y_train.txt"),stringsAsFactors=FALSE )


# load Human Activity Recognition (HAR) test subject ids 

testSetSubjectIds<-read.table(file.path(dataRootFolder,testSetFolder, "subject_test.txt"),stringsAsFactors=FALSE )

# load Human Activity Recognition (HAR) trainig features

testSetFeatures<-read.table(file.path(dataRootFolder,testSetFolder, "X_test.txt"),stringsAsFactors=FALSE )

# load Human Activity Recognition (HAR) trainig activity ids

testSetActivitIds<-read.table(file.path(dataRootFolder,testSetFolder, "Y_test.txt"),stringsAsFactors=FALSE )


##### 0.4. Extract required feature columns only from the feature set  ###################

#Extract required feature columns only from the feature set

requiredFeatureColNames <- grep("mean|std", featureInfo[,2])

##### 5. Merges the training and the test sets to create one data set  ###################

#create final variable data sets

requiredFeaturesSet <- rbind(trainingSetFeatures[,requiredFeatureColNames], testSetFeatures[,requiredFeatureColNames])

finalSubjecIds<-rbind(trainingSetSubjectIds, testSetSubjectIds)

finalActivitIds<-rbind(trainingSetActivitIds, testSetActivitIds)



finalDataSet<-cbind(finalSubjecIds,finalActivitIds, requiredFeaturesSet )

##### 6. Appropriately labels the data set with descriptive variable names.  ###################


#create final data set column names
finalDataSetColNames<-c(subjectIdColName,activityInfoColNames[1], featureInfo[,2][requiredFeatureColNames] )


#cleanup names by removing special chars and giving descriptive names

tidyFinalDataSetColNames<-gsub("[^0-9a-zA-Z *]","",finalDataSetColNames)

tidyFinalDataSetColNames<-gsub("BodyBody","Body",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("mean","Mean",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("std","StandardDeviation",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("Mag","Magnitude",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("^t","TimeDomain",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("^f","FrequencyDomain",tidyFinalDataSetColNames)

tidyFinalDataSetColNames<-gsub("Acc","Acceleration",tidyFinalDataSetColNames)
tidyFinalDataSetColNames<-gsub("Gyro","AngularVelocity",tidyFinalDataSetColNames)


# set descriptive column names
colnames(finalDataSet)<-tidyFinalDataSetColNames

#create table data frame for further processing 

finalDataSetTable<-tbl_df(finalDataSet)

finalDataSetTable<-finalDataSetTable%>%mutate(ActivityName=activityInfo[finalDataSetTable$ActivityId,2])



#Create Data Set with the average of each variable for each activity and each subject. Remove ActivityId column
  
finalDataSetTableAvg<-finalDataSetTable%>%
                    select(ActivityName,SubjectId, tidyFinalDataSetColNames,-ActivityId)%>%
                    group_by(SubjectId,ActivityName)%>%
                    summarise_all(funs(mean))%>%unique


# Export the fina; tidyData set with average of each variable for each activity and each subject 
write.table(finalDataSetTableAvg, './tidyHARDataSetAvg.txt',row.names=FALSE,sep='\t')
