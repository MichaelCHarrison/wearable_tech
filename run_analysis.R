run_analysis <- function(){
        test_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/test"
        test_list <- list.files(path = test_dir, pattern = ".txt")
        test_list <- lapply(paste(test_dir, test_list, sep = "/"), function(x)read.table(x))
        test_list

        # train_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/train"
        # train_list <- list.files(path = train_dir, pattern = ".txt")
        # train_list <- lapply(paste(test_dir, train_list, sep = "/"), function(x)read.table(x))
        # trian_list
        
}