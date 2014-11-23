#####This file describes the variables, the data, and any transformations or work that I performed to clean up the data

######Experiment description
======================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


######Dataset description
======================================
Each row contains contains an observation of mean and standard deviation values of an activity by a subject.
79 variables are included into observation. Variables contain mean and standard deviation values of activity measurements.
For each record, the following is provided:
- A 79-feature vector with mean and standard deviation of variables, belong to time and frequency domain. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

######Files needed to create the dataset, in the same folder with run_analysis.R:
=========================================
x_test and x_train files with observation
features.txt containes variable names
ty_train.txt, y_test.txt contain activity labels
activities.txt contains activity names 
subject_test.txt, subject_train.txt contain labels for subjects of the experiment


######Data transformation description
=========================================
1. files X_test.txt and X_train.txt were read into dataframes with read.table(filename) function, called with only file name parameter.
file features.txt was used as a source for column names of the merged dataset.
2. The two dataframes are merged in one with dplyr rbind_list function
3. Activity information is read from files y_train.txt and y_test.txt and added as "Activity" variable. Only variables, which contained "mean" or "str" were extracted
4. Subjects of observation were extracted from files subject_test.txt and subject_train.txt and added as "Subject" column to the dataset
5. The dataset is saved into result2.txt. This allows to re-use the intermediate dataset without re-calculation
6. The final dataset is read from result2.txt
7. Dataset is arranged by Subject and Activity, using dplyr arrange function
8. Dataset is grouped by Subject and Activity.
9. Dplyr Summary is applied to get mean values for variables for each activity and each subject.
10. Dataset is saved into tidydataset.txt
11. Finally, a clean data set with 1 observation per row, one variable per column is returned to console


######Variables description
=========================================
According to the assignment description, only the measurements on the mean and standard deviation were extracted for each measurement.
Only there variables, which had mean or str in their names were extracted. 
This is the list of variables, selected for the final dataset:

[1] "tBodyAcc-mean()-X"              
 [2] "tBodyAcc-mean()-Y"              
 [3] "tBodyAcc-mean()-Z"              
 [4] "tBodyAcc-std()-X"               
 [5] "tBodyAcc-std()-Y"               
 [6] "tBodyAcc-std()-Z"               
 [7] "tGravityAcc-mean()-X"           
 [8] "tGravityAcc-mean()-Y"           
 [9] "tGravityAcc-mean()-Z"           
[10] "tGravityAcc-std()-X"            
[11] "tGravityAcc-std()-Y"            
[12] "tGravityAcc-std()-Z"            
[13] "tBodyAccJerk-mean()-X"          
[14] "tBodyAccJerk-mean()-Y"          
[15] "tBodyAccJerk-mean()-Z"          
[16] "tBodyAccJerk-std()-X"           
[17] "tBodyAccJerk-std()-Y"           
[18] "tBodyAccJerk-std()-Z"           
[19] "tBodyGyro-mean()-X"             
[20] "tBodyGyro-mean()-Y"             
[21] "tBodyGyro-mean()-Z"             
[22] "tBodyGyro-std()-X"              
[23] "tBodyGyro-std()-Y"              
[24] "tBodyGyro-std()-Z"              
[25] "tBodyGyroJerk-mean()-X"         
[26] "tBodyGyroJerk-mean()-Y"         
[27] "tBodyGyroJerk-mean()-Z"         
[28] "tBodyGyroJerk-std()-X"          
[29] "tBodyGyroJerk-std()-Y"          
[30] "tBodyGyroJerk-std()-Z"          
[31] "tBodyAccMag-mean()"             
[32] "tBodyAccMag-std()"              
[33] "tGravityAccMag-mean()"          
[34] "tGravityAccMag-std()"           
[35] "tBodyAccJerkMag-mean()"         
[36] "tBodyAccJerkMag-std()"          
[37] "tBodyGyroMag-mean()"            
[38] "tBodyGyroMag-std()"             
[39] "tBodyGyroJerkMag-mean()"        
[40] "tBodyGyroJerkMag-std()"         
[41] "fBodyAcc-mean()-X"              
[42] "fBodyAcc-mean()-Y"              
[43] "fBodyAcc-mean()-Z"              
[44] "fBodyAcc-std()-X"               
[45] "fBodyAcc-std()-Y"               
[46] "fBodyAcc-std()-Z"               
[47] "fBodyAcc-meanFreq()-X"          
[48] "fBodyAcc-meanFreq()-Y"          
[49] "fBodyAcc-meanFreq()-Z"          
[50] "fBodyAccJerk-mean()-X"          
[51] "fBodyAccJerk-mean()-Y"          
[52] "fBodyAccJerk-mean()-Z"          
[53] "fBodyAccJerk-std()-X"           
[54] "fBodyAccJerk-std()-Y"           
[55] "fBodyAccJerk-std()-Z"           
[56] "fBodyAccJerk-meanFreq()-X"      
[57] "fBodyAccJerk-meanFreq()-Y"      
[58] "fBodyAccJerk-meanFreq()-Z"      
[59] "fBodyGyro-mean()-X"             
[60] "fBodyGyro-mean()-Y"             
[61] "fBodyGyro-mean()-Z"             
[62] "fBodyGyro-std()-X"              
[63] "fBodyGyro-std()-Y"              
[64] "fBodyGyro-std()-Z"              
[65] "fBodyGyro-meanFreq()-X"         
[66] "fBodyGyro-meanFreq()-Y"         
[67] "fBodyGyro-meanFreq()-Z"         
[68] "fBodyAccMag-mean()"             
[69] "fBodyAccMag-std()"              
[70] "fBodyAccMag-meanFreq()"         
[71] "fBodyBodyAccJerkMag-mean()"     
[72] "fBodyBodyAccJerkMag-std()"      
[73] "fBodyBodyAccJerkMag-meanFreq()" 
[74] "fBodyBodyGyroMag-mean()"        
[75] "fBodyBodyGyroMag-std()"         
[76] "fBodyBodyGyroMag-meanFreq()"    
[77] "fBodyBodyGyroJerkMag-mean()"    
[78] "fBodyBodyGyroJerkMag-std()"     
[79] "fBodyBodyGyroJerkMag-meanFreq()"



