This file is a code book that describes the variables, data, and any transformations performed to clean up the data

The R script, run_analysis.R, does the following:

1. Reads in the features, test and train feature files ("X_test", "X_train") and merges them ("final_features")
2. Uses only the mean or standard deviations from the original dataset to obtain "Xtest_stdmean" and "Xtrain_stdmean"
3. Reads in the train and test activity files and merges them ("Y_train", "Y_test", "final_activities")
4. Reads the activities labels file ("activity_labels") and links the activity names to the activity codes ("final_activities$activity")
5. Reads the subject for train and test sets ("subject_train","subject_test") and merges them in one df ("final_subject")
6. Creates a data frame called "tidy_data" with activity labels, subject ids and data from the test and train measurement files
7. Organises the "tidy_data" by subject and activity and saves the "result" as a txt file ("final_data.txt").

The data for the assignment
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
