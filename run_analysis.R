# Libraries -------------------------------------------------------------------------------------------------------

library(dplyr)
library(plyr)

# Download data ---------------------------------------------------------------------------------------------------

# Set the directory where you want to work
setwd("C:\\Users\\ADMIN\\Documents\\Graduate\\COURSERA\\3.Getting_and_cleaning_data\\Final_project")

# Create a directory to download data
dir.create("UCI_HAR_Dataset")

# Enter in that folder
setwd(".\\UCI_HAR_Dataset")

# Path to download data
data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download data
download.file(data, "UCI_HAR_dataset.zip", method = "curl")

# Unzip data
unzip("UCI_HAR_dataset.zip")

# Enter in the unzip directory
setwd(".\\UCI HAR Dataset")



# 1.- Merges the training and the test sets to create one data set. -----------------------------------------------

# Set the directory to load data from train
setwd(".\\train")

# Object to only read txt files
train_data <- sort(dir()[grep("txt$",dir())])

# Set the name of the data frames for train 
train_dataframes  <- c("Subject_train", "X_train", "Y_train")

# Read data whit help of a loop function
for(i in 1:length(train_data)) {
    assign(train_dataframes[i], read.table(train_data[i]))
}

# Set the directory to load data from test
setwd("..") ; setwd(".\\test")

# Object to only read txt files
test_data <- sort(dir()[grep("txt$",dir())])

# Set the name of the data frames for test
test_dataframes  <- c("Subject_test", "X_test", "Y_test")

# Read data whit help of a loop function
for(i in 1:length(train_data)) {
    assign(test_dataframes[i], read.table(test_data[i]))
}

# Retur to the unzip directory
setwd("..")

# Merge data
Subject_data <- rbind(Subject_train, Subject_test)
X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)

# Rename columns
names(Subject_data) <- "Subject"
names(Y_data) <- "Activity_id"

# Release memory and remove useless enviroment objects 
rm(test_dataframes, train_dataframes, train_data, test_data, Subject_train, X_train, Y_train, Subject_test, X_test, Y_test)


# 2.- Extracts only the measurements on the mean and standard deviation for each measurement. ---------------------

# Load features data
features <- read.table("features.txt", col.names = c("Index", "Features"))

# Extracts mean and standard deviation measurements
features_mean_sd <- grep("-(mean|std)\\(\\)", features$Features)

# Merge data
bind_data <- cbind(Subject_data, X_data[, features_mean_sd], Y_data)



# 3.- Uses descriptive activity names to name the activities in the data set --------------------------------------

# Load activity names
activity_labels <- read.table("activity_labels.txt")

# Rename columns to merge data
names(activity_labels) <- c("Activity_id", "Activity")

# Merge data by activity
bind_data <- left_join(bind_data, activity_labels)


# 4.- Appropriately labels the data set with descriptive variable names. ------------------------------------------

# Rename colums with correct labels
names(bind_data)[grep("^V", names(bind_data))] <-  as.character(features$Features[features_mean_sd])

# Enhance the columns names by recplacing respective abreviations
names(bind_data)<-gsub("Acc", "Accelerometer", names(bind_data))
names(bind_data)<-gsub("Gyro", "Gyroscope", names(bind_data))
names(bind_data)<-gsub("BodyBody", "Body", names(bind_data))
names(bind_data)<-gsub("Mag", "Magnitude", names(bind_data))
names(bind_data)<-gsub("^t", "Time", names(bind_data))
names(bind_data)<-gsub("^f", "Frequency", names(bind_data))
names(bind_data)<-gsub("tBody", "TimeBody", names(bind_data))
names(bind_data)<-gsub("-mean()", "Mean", names(bind_data), ignore.case = TRUE)
names(bind_data)<-gsub("-std()", "STD", names(bind_data), ignore.case = TRUE)
names(bind_data)<-gsub("-freq()", "Frequency", names(bind_data), ignore.case = TRUE)
names(bind_data)<-gsub("angle", "Angle", names(bind_data))
names(bind_data)<-gsub("gravity", "Gravity", names(bind_data))


# 5.- From the data set in step 4, creates a second, independent tidy data set with the average of each va --------

# Average of each variable for each activity and each subject data frame
bind_data_mean <- ddply(bind_data, c("Subject","Activity"), numcolwise(mean))


# Save data -------------------------------------------------------------------------------------------------------

setwd("..")
write.table(bind_data_mean, "tidy_average_data.txt", row.names = F)
