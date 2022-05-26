run_analysis file downloads data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip the file.

Data files:
features.txt - all the variables of the measurements (563 variables)
activity_labels.txt - codes of 6 activities such as walking and lying

Measurements of Test group
X_test.txt - measurements
y_test.txt - activities
subject_test.txt - subject ID

Measurements of Train group
X_train.txt - measurements
y_train.txt - activities
subject_train.txt - subject ID

df - merged one data set
df2 - mean and standard deviation for each measurement
df3 - average of each variable for each activity and each subject