run_analysis <- function() {  
      
      # Assignment: You should create one R script called run_analysis. R that does the following. 
      # 1. Merges the training and the test sets to create one data set.
      # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      # 3. Uses descriptive activity names to name the activities in the data set
      # 4. Appropriately labels the data set with descriptive variable names. 
      # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
      
      library(reshape2)
      
      # relative location of train(ing) data. X_train.txt = training Set, subject_train.txt = subjects (1:30), y_train = activity (1:6)
      fileUrl_train_data <- "./UCI HAR Dataset/train/X_train.txt"
      fileUrl_train_subject <- "./UCI HAR Dataset/train/subject_train.txt"
      fileUrl_train_activity <- "./UCI HAR Dataset/train/y_train.txt"
      
      # relative location of test data. X_test.txt = test Set, subject_test.txt = subjects (1:30), y_test = activity (1:6)
      fileUrl_test_data <- "./UCI HAR Dataset/test/X_test.txt"
      fileUrl_test_subject <- "./UCI HAR Dataset/test/subject_test.txt"
      fileUrl_test_activity <- "./UCI HAR Dataset/test/y_test.txt"
      
      # relative location of features.txt which lists all 561 variables (of features)
      fileUrl_features <- "./UCI HAR Dataset/features.txt"
      
      # read training dataset (7,352 obs of 561 variables)
      train_data <- read.table(fileUrl_train_data)
      train_subject <- read.table(fileUrl_train_subject)
      train_activity <- read.table(fileUrl_train_activity)
      
      # read test dataset (2,947 obs of 561 variables)
      test_data <- read.table(fileUrl_test_data)
      test_subject <- read.table(fileUrl_test_subject)
      test_activity <- read.table(fileUrl_test_activity)
      
      # to the right of train/test data, bind subject column vector then activity vector. Datasets widen from 561 to 563 wide
      # I slightly prefer to bind new columns to the right: if i wanted to create new "working" columns, they'd expand rather than insert
      all_train <- cbind(train_data, train_subject, train_activity)
      all_test <- cbind(test_data, test_subject, test_activity)
      
      # row bind test data to (below) training data. all_data is the merged dataset
      # This achieves Step 1: Merges the training and the test sets to create one data set.
      # all_data contains 10,299 obs x 561 variables [if we include subject and activity, then +2 is 563 columns]
      all_data <- rbind(all_train, all_test)
      
      # retrive features (i.e., 561 variables) and use them as column names (+ subject and activity)
      features_data <-read.table(fileUrl_features)
      colnames(all_data) <- c(as.character(features_data$V2),"subject","activity")
      
      # From 563 features, all_data_sub_MF retrieves subset of 79 with mean or std. But this includes MeanFreq()
      # all_data_sub subsets to exclude 13 with MeanFreq(), such that all_data_sub includes 66 = 79 - 13 feature variables (w/ subject and activity is 81 columns)
      # This achieves Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement"
      all_data_sub_MF <- all_data[,grepl("mean|std|subject|activity",colnames(all_data))]
      all_data_sub <- all_data_sub_MF[,!grepl("meanFreq",colnames(all_data_sub_MF))]
      
      # Initially I used the simplest approach; i.e., all_data$activityDesc[all_data$activity == 1]  <- "Walking" etc
      # But I think it's more elegant to replace activity integers using activity_frame as a lookup table
      # This achieves Step 3: "Uses descriptive activity names to name the activities in the data set"
      activity_frame <- data.frame(a = 1:6, b=c("walking","walkingup","walkingdown","sitting","standing","laying"))
      all_data_sub$activity <- activity_frame[all_data_sub$activity, 2]
      
      # I realize lecture 4-1 (edit text variables) advised "all lower case when possible" 
      # but due to permutation logic and length, I think these variables are ideal for camelCase
      # 1st gsub() removes dashed and parens; 2nd and 3rd restore camelCase; 4th fixes erroneous "BodyBody" in final 3 measures
      # This achieves Step 4: Appropriately labels the data set with descriptive variable names.
      colnames(all_data_sub) <- gsub("-|\\()", "", colnames(all_data_sub))
      colnames(all_data_sub) <- gsub("mean", "Mean", colnames(all_data_sub))
      colnames(all_data_sub) <- gsub("std", "Std", colnames(all_data_sub))
      colnames(all_data_sub) <- gsub("BodyBody", "Body", colnames(all_data_sub))
      
      # With 2 id variables and 66 measures, melt reshapes all_data_sub to data_melted 
      # data_melted is NOT aggregated, it contains 679,734 observations = 66 measure var * 10,299 obs
      # tidy_df is the tidy dataframe (180 obs of 66 + 2 variables): 180 obs = 30 subjects * 6 activities each
      # This achived Step 5:"Creates a second, independent tidy data set with the average of each variable for each activity and each subject"
      data_melted <- melt(all_data_sub, id=c("subject","activity"))
      tidy_df <- dcast(data_melted, subject+activity ~ variable, mean)
      write.table(tidy_df, file="tidySamsung.txt", row.names=FALSE)
      
      # Note that tidy_df is the WIDEST tidy dataset, but not the only tidy dataset. There are (at least) three other tidy datasets
      # The narrowest tidy dataset is returned by:
      # tidy_df_tall <- aggregate(value ~ subject + activity + variable, data = data_melted, mean)
      # This tall, tidy dataframe is 11,880 obs of 4 variables, where each row is a single value 
      # for a combination of subject+activity+measure which is 30*6*66 = 11,880 observations
}