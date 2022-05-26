Figuring out what these data files mean

features.txt file contains 561 objects and they are the name of functions.
X_test.txt files contains 2947 objects with 561 variables. As the number of functions in features.txt is 561, these variables could be the functions.

activity_labels.txt file shows 6 activities and assigned code for each of that.
y_test.txt files contains 2947 objects and they are numbers from 1 to 6.
So this would be the codes of activities.

subject_test.txt file contains 2947 objects and they are 9 numbers (2 4 9 10 12 13 18 20 24)
subject_train.txt file contains 7352 objects and they are 21 numbers (1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30).
So the subject files show which subject the measurement belongs.

Measurements of train and test group are combined with rbind() to data frame x
Activities of train and test group are combined with rbind() to data frame y
Subject IDs are combined with rbind() to data frame sub

Data frame x, y, and sub are combined with cbind() to data frame df

df2 contain the average of each variables only the measurements on the mean and standard deviation for each measurement

df3 contains the average of each variable for each activity and each subject

