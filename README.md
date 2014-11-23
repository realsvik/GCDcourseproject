Data transformation is done by run_analysis.R help.
To work properly, script should be called from the folder, where the following files are present:

* x_test and x_train files with observation
* features.txt containes variable names
* y_train.txt, y_test.txt contain activity labels
* activities.txt contains activity names 
* subject_test.txt, subject_train.txt contain labels for subjects of the experiment

As output, script will create 2 files:
*result2.txt with intermediate dataset
*tidydataset.txt with final data set

Script should be sourced and called with mytransform() function.

Data transformation description

1. In function mergeds:
* files X_test.txt and X_train.txt were read into dataframes with read.table(filename) function, called with only file name parameter.
file features.txt was used as a source for column names of the merged dataset.
* the two dataframes are merged in one with dplyr rbind_list function
2. In function addactivities:
*  Activity information is read from files y_train.txt and y_test.txt and added as "Activity" variable. 
* Only variables, which contained "mean" or "str" were extracted
3. In function addsubject: Subjects of observation were extracted from files subject_test.txt and subject_train.txt and added as "Subject" column to the dataset
4. The dataset is saved into result2.txt. This allows to re-use the intermediate dataset without re-calculation
5. The final dataset is read from result2.txt
6. Dataset is arranged by Subject and Activity, using dplyr arrange function
7. Dataset is grouped by Subject and Activity.
8. Dplyr Summary is applied to get mean values for variables for each activity and each subject.
9. Dataset is saved into tidydataset.txt
10. Finally, a clean data set with one observation per row, one variable per column is returned to console


 