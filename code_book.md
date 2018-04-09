#Code book 

##Variables
* test_data - table of X_test.txt
* train_data - table of X_train.txt
* test_labels - table of y_test.txt
* train_lables - table of y_train.txt
* test_subjects - table of subject_test.txt
* train_subjects - table of subject_train.txt
* activity_names - table of subject_train.txt
* merged_data - the merged rows of test_data and train_data
* merged_labels - the merged rows of test_labels and train_lables
* merged_subjects - the merged rows of test_subjects and train_subjects
* col_names_and_numbers_table - table of features.txt
* col_numbers - only the numbers containing the word mean or std (subset of col_names_and_numbers_table)
* col_names - only the names containing the word mean or std(subset of col_names_and_numbers_table)
* merged_only_mean_std - the columns indicated by col_numbers from merged_data
* merged_labels - names of activity labels e.g. "STANDING", "SITTING" etc.
* merged_only_mean_std_combined - adding 2 columns to the data so far, adding merged_labels merged_subjects as 2 new columns in the end of the table. 
* grouped_combined_data - the data so far grouped by activity(merged_labels) and subject(merged_subjects)
* avrage_all - avreges of the columns, where each line represents one combination of an activity and a subject.

##Transformations
* Selecting from merged_data only the columns containing one of the strings  - "mean" or "std".
* merged_labels are replaced by names by lookup of values of merged_labels from activity_names.
* merged_only_mean_std_combined is created by adding merged_labels merged_subjects as 2 new columns in the end of the table merged_only_mean_std. 
* Names of the columns of the new table are added by utilizing col_names and adding manually  "activity" and  "subject" to the last 2 columns we added.
* Avrages are calculates by using the mean function on all non-grouping columns with the summarise_all function.