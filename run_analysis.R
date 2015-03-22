library(dplyr)
library(tidyr)

#get file

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="hardata.zip")
unzip("hardata.zip")

#Merges the training and the test sets to create one data set.
        # tran data
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names= "subject")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names= "activity")
data_train <- cbind(train_x, train_sub, train_y)
        #test data
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names= "subject")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names= "activity")
data_test <- cbind(train_x, train_sub, train_y)
        #merge
data <- rbind(data_train, data_test)

#Extracts only the measurements on the mean and standard deviation for each measurement.
feature_list <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "name"))
features <- c(as.vector(feature_list[, "name"]), "subject", "activity")
select_feature_ids <- grepl("mean()|std()|subject|activity", features) & !grepl("meanFreq", features)
data_select = data[, select_feature_ids]

#Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("id", "name"))
for(i in 1:nrow(activities)){
        data_select$activity[data_select$activity == activities[i, "id"]] <- as.character(activities[i, "name"])
}

#Appropriately labels the data set with descriptive variable names.
namecol <- features[select_feature_ids]
namecol <- gsub("^t", "Time-", namecol)
namecol <- gsub("^f", "Frequency-", namecol)
namecol <- gsub("\\(\\)", "", namecol)
colnames(data_select) <- namecol

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_summary <- data_select %>%
        group_by(activity,subject) %>%
        summarise_each(funs(mean))
write.table(data_summary,"TidyData.txt", sep = "\t", col.names=TRUE, row.names=FALSE)