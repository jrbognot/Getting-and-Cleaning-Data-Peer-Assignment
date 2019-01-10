#sets into the working directory 
setwd("/UCI HAR Dataset")

#loads features and activity labels
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#loads test data
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#loads train data
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#extracts means and std of test and train features
features_stdmean <- grep("std|mean", features$V2)
Xtest_stdmean <- X_test[, features_stdmean]
Xtrain_stdmean <- X_train[, features_stdmean]

#merges the features, activities, and subject sets
final_features <- rbind(Xtrain_stdmean, Xtest_stdmean)
final_activities <- rbind(Y_train, Y_test)
final_subject <- rbind(subject_train, subject_test)

#add labels to the features
colnames(final_features) <- features[features_stdmean, 2]

#connects the activity codes
final_activities$activity <- factor(final_activities$V1, levels = activity_labels$V1, labels = activity_labels$V2)

#binds the activity codes to its respective subject then labels it
subject_activities <- cbind(final_subject, final_activities$activity)
colnames(subject_activities) <- c("subject", "activity")

#binds ID, measurement and activity
tidy_data <- cbind(subject_activities, final_features)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
answer <- aggregate(IDmeasurement[,3:(ncol(tidy_data))], by = list(tidy_data$subject, tidy_data$activity), FUN = mean)
colnames(answer)[1:2] <- c("subject", "activity")
write.table(answer, file = "final_data.txt", row.names = FALSE)
