
## create required directory
## the path needs to change for non-MAC OS X
if (file.exists("~/Downloads/Assignment1") == FALSE) {
  dir.create("~/Downloads/Assignment1/data", recursive = TRUE)
}
 
## download and unzip the data
setwd("~/Downloads/Assignment1/data")
## the method variable can be removed for non-MAC OS X
## in case the file download fails from R, download the file manually
if (file.exists("./getdata_projectfiles_UCI_Dataset.zip") == FALSE) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./getdata_projectfiles_UCI_Dataset.zip", method = "curl")
  unzip("getdata_projectfiles_UCI_Dataset.zip")
}

## read test data set
test_data <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
## read training data set
train_data <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")

## Assignment - Step1
## Merges the training and the test sets to create one data set
##
## comparing the classes and the number of columns and in case they are same then
## merging the test and training data set
if (length(setdiff(lapply(train_data, class),lapply(test_data, class))) == c(0) & ncol(train_data) == ncol(test_data)) {
  merge_data = rbind(train_data, test_data)
} else {
  stop("check whether the classes of columns and the number of columns are the same or not")
}



##Assignment - Step2
## Extracts only the measurements on the mean and standard deviation for each measurement
##
## read the file with the field names
field_description <- read.table("./UCI HAR Dataset/features.txt")
## select from field list mean and standard deviation related measurements
selected_fields <- subset(x = field_description, subset = grepl(pattern = ".*mean.*|.*std.*", x = field_description$V2))
## select from the merged data set only those fields selected above
selected_merged_data <- merge_data[, c(selected_fields[,1])]



##Assignment - Step3
## Uses descriptive activity names to name the activities in the data set
##
## Read the values of train and test activity into separate data frames
train_activity <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")
test_activity  <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
## now we merge the train and test activity data frame in the same order we had 
## merged the train and test measurement data frame
merged_activity <- rbind(train_activity, test_activity)
colnames(merged_activity) = c("activity")
## Read the value of train and test subject into separate data frames
train_subject <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
## now we merge the train and test subject data frame in the same order we had 
## merged the train and test measurement data frame
merged_subject <- rbind(train_subject, test_subject)
colnames(merged_subject) = c("subject")
## include the activity with the selected_merged_data dataframe 
selected_merged_activity_data <- cbind(selected_merged_data, merged_activity, merged_subject)
## read the description of the activity into a data frame 
activity_desc <- read.table(file = "./UCI HAR Dataset/activity_labels.txt", col.names = c("activity", "activity_desc"))
## left join and include the activity description in the selected_merged_activity_data
## please note that merge changes the order of the records therefore we cannot differentiate
## anymore between test and train data
main_data <- merge(x = selected_merged_activity_data, y = activity_desc, by.x = "activity", by.y = "activity", all.x = TRUE)


##Assignment - Step4
## Appropriately labels the data set with descriptive variable names
##
## remove (,) and - sign from the selected field names
format_selected_fields <- gsub(pattern = "\\(|\\)" , replacement = "" ,x = selected_fields[,2], perl =  TRUE)
format_selected_fields <- gsub(pattern = "-" , replacement = "_" ,x = format_selected_fields, perl =  TRUE)
## after finding the order of the newly added "activity" and "activity_desc" fields
## we can name the columns as mentioned below:
colnames(main_data) <- c("activity", format_selected_fields, "subject","activity_desc")


##Assignment - Step5
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## from the field names that we made earlier create another set of field names with "mean_" prepended to it
mean_format_selected_fields <- paste("mean_",format_selected_fields, sep = "")
## calculate the mean of all the fields grouped by activity description and subject
melt_frame = melt(main_data1, id.vars = c("activity_desc", "subject"), measure.vars=as.character(format_selected_fields))
final_data = dcast(melt_frame, activity_desc + subject ~ variable, mean) 
## find out whether the order of the columns are same in the final data set
if (length(setdiff(colnames(final_data)[3:81],format_selected_fields)) == c("0")) {
  colnames(final_data) <- c(colnames(final_data[1:2]), mean_format_selected_fields)
}

