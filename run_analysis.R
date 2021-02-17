# 0. Getting the data 
> setwd("C:/Users/Smilla")
> url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(url,destfile="data.zip")
> unzip("data.zip")

> setwd("C:/Users/Smilla/UCI HAR Dataset")
> trainfile<-list.files("train,full.names=TRUE")[-1]
> trainfile<-list.files("train",full.names=TRUE)[-1]
> testfile<-list.files("test",full.names=TRUE)[-1]

# In order to read in all six files
> file<-c(trainfile,testfile)
> data <- lapply( file, read.table, stringsAsFactors = FALSE, header = FALSE )


# 1. Merges the training and the test sets to create one data set.

# Binding the test and train file by each variable
> data_1<-mapply(rbind,data[ c(1:3) ],data[ c(4:6) ])
> data_2<-do.call(cbind,data_1)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

> feature<-fread(list.files()[2],header=FALSE,stringsAsFactors = FALSE)
# Setting the labels for the data (required in Step 4)
> setnames(data_2,c(1:563),c("subject",feature$V2,"activity"))

# 3. Uses descriptive activity names to name the activities in the data set

> measurement<-grep("std|mean\\(\\)",feature$V2)+1
> data_3<-data_2[,c(1,measurement,563)]
> activitynames<-fread(list.files()[1],header=FALSE,stringsAsFactors = FALSE)
> data_3$activity<-activitynames$V2[ match(data_3$activity,activitynames$V1)]

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. Creating an independent data set with the average of each variable for each subject and activity.

> data_4<-aggregate(.~subject+activity, data=data_3,FUN=mean)
> setwd("C:/Users/Smilla")
> write.table(data_4,"averagedata.txt",row.names=FALSE)