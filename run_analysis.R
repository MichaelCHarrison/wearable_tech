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

        df_list <- c(rbind(test_subs, train_subs),
                     rbind(test_lab, train_lab),
                     rbind(test_set, train_set))

        combined_df <- as.data.frame(do.call("cbind", df_list))
        
        master_df <- combined_df[,grepl("mean[()]*$|std[()]*$", colnames(combined_df))]
        

}