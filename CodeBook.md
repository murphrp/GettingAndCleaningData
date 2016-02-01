# Code Book


The cleanup script run_analysis.R does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Script Procedure

1. Read in test and training measurement data sets, X_test.txt and X_train.txt, with the read.table() function.
2. Read in test and training activity data sets, y_test.txt and y_train.txt, with the read.table() function.
3. Read in test and training subject data sets, subject_test.txt and subject_train.txt, with the read.table() function.
4. Read in features and activity label data sets, features.txt and activity_labels.txt, with the read.table() function.
5. Merge each test and training pair of data sets with the rbind() function.
6. Use grep() to find the indices of the features representing means or standard deviations.
7. Replace the column names of the merged measurement data set with the results of #6.
8. Clean up variable names:
    - Replace leading "f" with "freq" for frequency.
    - Replace leading "t" with "time" for time.
    - Convert all letters to lower case.
    - Remove all parentheses.
    - Remove all dashes.
9. Assign descriptive column names "activity" and "subject" to single columns in those data sets.
10. Use the cbind() function to merge the three data sets together into one.
11. Export the resulting tidy data set to a text file "cleandata.txt".


