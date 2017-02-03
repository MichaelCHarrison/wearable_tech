run_analysis <- function(){
        
        test_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/test"
        train_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/train"
        labels_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset"
        
        test_set <- read.table(paste(test_dir, "X_test.txt", sep = "/"))
        train_set <- read.table(paste(train_dir, "X_train.txt", sep = "/"))
        
        test_lab <- read.table(paste(test_dir, "y_test.txt", sep = "/"))
        train_lab <- read.table(paste(train_dir, "y_train.txt", sep = "/"))
        
        features <- read.table(paste(labels_dir, "features.txt", sep = "/"))
        activities <- read.table(paste(labels_dir, "activity_labels.txt", sep = "/"))
        
        colnames(test_set) <- features[,2]
        colnames(train_set) <- features[,2]
        
}