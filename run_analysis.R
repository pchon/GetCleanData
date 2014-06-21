
#Read test data
tstsub <-read.table("./peer/test/subject_test.txt", col.names="ID")

tstXcolnames <- read.table("./peer/features.txt", header=F, as.is=T, col.names=c("featID", "featName"))
tstX <- read.table("./peer/test/x_test.txt", header=F, col.names=tstXcolnames$featName)

tsty <-read.table("./peer/test/y_test.txt", col.names="ActivityID")
tstdata<-cbind(tstsub, tsty, tstX)
  
#read train data  
trnsub <-read.table("./peer/train/subject_train.txt", col.names="ID")

features <- read.table("./peer/features.txt", header=F, as.is=T, col.names=c("featID", "featName"))
trnX <- read.table("./peer/train/x_train.txt", header=F, col.names=features$featName)

trny <-read.table("./peer/train/y_train.txt", col.names="ActivityID")
trndata<-cbind(trnsub, trny, trnX)

#merge dataset
dim(tstdata)
dim(trndata)
data <-rbind(tstdata, trndata)
dim(data)
names(data)
##--
##Extract only the measurements on the mean and standard deviation for each measurement. 
##--

dim(features)
dim(data)

subdata <- grep("*mean()", features[,2])
dim(subdata)

dataset <-data[,subdata]
names(dataset)

dataset <- data[, grep("*mean()", names(data))] 
names(dataset)
##Use descriptive activity names to name the activities in the data set

dataset$ID <-data$ID
dataset$ActivityID <-data$ActivityID

index <- with(dataset, order(ID, ActivityID))
dataset[index, ]

dataset$ActivityID <- factor(dataset$ActivityID,levels = c(1,2,3,4,5,6),labels = c("WALKING", "WALKING UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

##Appropriately label the data set with descriptive activity names. 
names(dataset)

##Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(data.table)
dt<- data.table(dataset)
meanData<- dt[, lapply(.SD, mean), by=c("ID", "ActivityID")]
names(meanData)
names(dt)

library(plyr)
dataset2<-arrange(meanData,ID)
dim(dataset2)
str(dataset2)
write.table(dataset2, file = "dataset_mean.txt", sep = "\t", col.names = TRUE)




