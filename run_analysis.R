library(dplyr)

#Read the data
test_data <-  read.table("UCI\ HAR\ Dataset/test/X_test.txt")
train_data <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
#Read the lables
test_labels <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
train_lables <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
#Read the subjects
test_subjects <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
train_subjects <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
#Read the activity names
activity_names <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")

#Merges the training and the test sets to create one data set.
merged_data <- rbind(test_data,train_data)
merged_labels <- rbind(test_labels,train_lables)
merged_subjects <- rbind(test_subjects, train_subjects)

#Extracts only the measurements on the mean and standard deviation for each measurement

#1. read the names and numbers of the columns
col_names_and_numbers_table <- read.table("/home/boaz/datasciencecoursera/hw4/UCI HAR Dataset/features.txt")

#2.extract only column names and numbers containing mean and std
col_numbers <- grep("mean|std",names_table[,2])
col_names <- grep("mean|std",names_table[,2],value = TRUE)

#3. extract only relevant col from merged table
merged_only_mean_std <- select(merged_data,col_nums)

#Uses descriptive activity names to name the activities in the data set
# replace integer labels with names
merged_labels = activity_names[match(merged_labels[,1],activity_names[,1]),2]

# Combine data, labels and subjects
merged_only_mean_std_combined = cbind(merged_only_mean_std, merged_labels, merged_subjects)

#Appropriately labels the data set with descriptive variable names.
names(merged_only_mean_std_combined) =c(col_names, "activity", "subject")

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
#1.group the data by activity and subject
grouped_combined_data <- group_by(merged_only_mean_std_combined, activity, subject)

#2.get avrages of the data
avrage_all <- summarize_all(grouped_combined_data, funs(mean))
