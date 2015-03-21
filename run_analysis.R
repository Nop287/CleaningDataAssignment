run_analysis <- function () {
  ## read the names of the features
  features <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, sep = " ", stringsAsFactor = FALSE)

  ## we only want the columns containing means or standard deviations
  columns <- grepl("std\\(|mean\\(", features$V2, perl = TRUE)
  columns[columns == TRUE] <- "numeric"
  columns[columns == FALSE] <- "NULL"

  ## read the training data set and set the names of the features
  x_train <- read.fwf("UCI HAR Dataset/train/X_train.txt", rep(16, 561), colClasses = columns, n = 100)
  ## read the test data set and set the names of the features
  x_test <- read.fwf("UCI HAR Dataset/test/X_test.txt", rep(16, 561), colClasses = columns, n = 100)

  ## merge the training and test data sets
  data <- rbind(x_train, x_test)
  
  ## assign the correct names
  names(data) = features$V2[grep("std\\(|mean\\(", features$V2, perl = TRUE)]

  ## read activities for test data set
  y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", nrows = 100)
  ## read activities for training data set
  y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", nrows = 100)

  ## merge the training and test activities
  activities <- rbind(y_train, y_test)

  ## add to result data
  data$Activity <- activities$V1
  
  ## recode the activities
  data$Activity[data$Activity == 1] <- "WALKING"
  data$Activity[data$Activity == 2] <- "WALKING_UPSTAIRS"
  data$Activity[data$Activity == 3] <- "WALKING_DOWNSTAIRS"
  data$Activity[data$Activity == 4] <- "SITTING"
  data$Activity[data$Activity == 5] <- "STANDING"
  data$Activity[data$Activity == 6] <- "LAYING"

  ## read subjects for test data set
  subjects_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "", nrows = 100)
  ## read activities for training data set
  subjects_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "", nrows = 100)
    
  ## merge the training and test subjects
  subjects <- rbind(subjects_train, subjects_test)
  
  ## add to result data
  data$Subject <- subjects$V1

  return(data)
}

## Note: remove n = 100 and nrows = 100 before creating the actual data set!
## I did not have enough memory ....

test <- run_analysis()
dt <- data.table(test)
tidy_data <- dt[, lapply(.SD, mean), by = list(Activity, Subject)]
write.table(tidy_data, file = "tidy_data.txt", row.names=FALSE)