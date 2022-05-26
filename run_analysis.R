#Load library
library(dplyr)
        
#Download data files and unzip them
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
unzip(temp)

#Open datafiles
features <- read.table(".//UCI HAR Dataset//features.txt")
activity <- read.table(".//UCI HAR Dataset//activity_labels.txt")

xtest <- read.table(".//UCI HAR Dataset//test//X_test.txt")
ytest <- read.table(".//UCI HAR Dataset//test//y_test.txt")
subtest <- read.table(".//UCI HAR Dataset//test//subject_test.txt")

xtrain <- read.table(".//UCI HAR Dataset//train//X_train.txt")
ytrain <- read.table(".//UCI HAR Dataset//train//y_train.txt")
subtrain <- read.table(".//UCI HAR Dataset//train//subject_train.txt")

unlink(temp)

#4. Appropriately labels the data set with descriptive variable names.
colnames(features) <- c("number", "functions")
colnames(activity) <- c('code', 'activity') 
colnames(xtest) <- features$functions
colnames(ytest) <- 'code'
colnames(subtest) <- 'subject'
colnames(xtrain) <- features$functions
colnames(ytrain) <- 'code'
colnames(subtrain) <- 'subject'

#1. Merges the training and the test sets to create one data set.
x <- rbind(xtest, xtrain)
y <- rbind(ytest, ytrain)
sub <- rbind(subtest, subtrain)

df <- cbind(sub, y, x)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
df2 <- select(df, subject, code, contains('mean'), contains('std'))

#3. Uses descriptive activity names to name the activities in the data set
df2$code[df2$code == 1] <- activity$activity[1]
df2$code[df2$code == 2] <- activity$activity[2]
df2$code[df2$code == 3] <- activity$activity[3]
df2$code[df2$code == 4] <- activity$activity[4]
df2$code[df2$code == 5] <- activity$activity[5]
df2$code[df2$code == 6] <- activity$activity[6]

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df3 = df2 %>% group_by(code, subject) %>% summarise(across(everything(), list(mean)))
