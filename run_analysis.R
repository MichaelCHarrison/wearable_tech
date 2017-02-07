run_analysis <- function(){
        
        test_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/test"
        train_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/train"
        labels_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset"
        
        test_subs <- read.table(paste(test_dir, "subject_test.txt", sep = "/"))
        test_set <- read.table(paste(test_dir, "X_test.txt", sep = "/"))
        test_lab <- read.table(paste(test_dir, "y_test.txt", sep = "/"))
        
        train_subs <- read.table(paste(train_dir, "subject_train.txt", sep = "/"))
        train_set <- read.table(paste(train_dir, "X_train.txt", sep = "/"))
        train_lab <- read.table(paste(train_dir, "y_train.txt", sep = "/"))
        
        features <- read.table(paste(labels_dir, "features.txt", sep = "/"))
        activities <- read.table(paste(labels_dir, "activity_labels.txt", sep = "/"))
        
        colnames(test_subs) <- "subject"
        colnames(train_subs) <- "subject"
        colnames(test_lab) <- "activity"
        colnames(train_lab) <- "activity"
        colnames(test_set) <- features[,2]
        colnames(train_set) <- features[,2]
        
        test_set <- test_set[,grepl("mean[()]*$|std[()]*$", colnames(test_set))]
        train_set <- train_set[,grepl("mean[()]*$|std[()]*$", colnames(train_set))]        
        
        df_list <- c(rbind(test_subs, train_subs),
                     rbind(test_lab, train_lab),
                     rbind(test_set, train_set))

        library(dplyr)
        combined_tbl <- tbl_df(do.call("cbind", df_list))
        
        variables <- names(combined_tbl)[1:12]
        
        tidy_tbl <- combined_tbl %>%
                select(subject,
                       activity,
                       "bodyacceleration-mean" = starts_with(variables[3]),
                       "bodyacceleration-std" = starts_with(variables[4]),
                       "gravityacceleration-mean" = starts_with(variables[5]),
                       "gravityacceleration-std" = starts_with(variables[6]),
                       "bodyjerkacceleration-mean" = starts_with(variables[7]),
                       "bodyjerkacceleration-std" = starts_with(variables[8]),
                       "bodygyroscope-mean" = starts_with(variables[9]),
                       "bodygyroscope-std" = starts_with(variables[10]),
                       "bodyjerkgyroscope-mean" = starts_with(variables[11]),
                       "bodyjerkgyroscope-std" = starts_with(variables[12])) %>%
                mutate(activity = plyr::mapvalues(activity,
                                                  from = c(1:6), 
                                                  to = as.character(activities[,2])),
                       activity = tolower(gsub("_", "", activity))) %>%
                arrange(subject, activity)
}