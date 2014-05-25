##Script for cleaning, summarizing and reshaping data sets from the 
##"Human Activity Recognition Using Smartphones Dataset"-- see README.md

#function to install needed packages if necessary
InstallPkg <- function(x){
	if(x %in% rownames(installed.packages())==FALSE) {
        	if(x %in% rownames(available.packages())==FALSE) {
        		message(paste(x, "is not a valid package"))
        	} else {
            		install.packages(x, repos='http://cran.us.r-project.org')
            	}
	} else {
        message(paste(x,"package already installed..."))
    }
}

# install necessary packages
needed.pkgs <- c("reshape2")
lapply(needed.pkgs, InstallPkg)

#load necessary packages
library(reshape2)

#import feature names
message("\nReading features names...")
features <- read.table("UCI HAR Dataset/features.txt")[,2]

#modify feature names
features <- gsub('-','.', features)
features <- gsub('\\(\\)','', features)

#import train and test data tables
message("Reading test set...")
testf <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
colnames(testf) <- features 

message("Reading train set...")
trainf <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
colnames(trainf) <- features

#import activity labels and subject labels
message("Adding subject and activity labels ...")

testsub <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(testsub) <- "subject"

trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(trainsub) <- "subject"

#transform activity labels to activity names
act <- read.table("UCI HAR Dataset/activity_labels.txt")

testact.l <- read.table("UCI HAR Dataset/test/y_test.txt")
testact.n <- data.frame()  							#initialize activity names vector
for (i in seq(along.with=testact.l[,1])) {
	x <- testact.l[i,1]
	y <- act[x,2]
	testact.n[i,1] <- y
}
colnames(testact.n) <- "activity.name"

trainact.l <- read.table("UCI HAR Dataset/train/y_train.txt")
trainact.n <- data.frame()							#initialize activity names vector
for (i in seq(along.with=trainact.l[,1])) {
	x <- trainact.l[i,1]
	y <- act[x,2]
	trainact.n[i,1] <- y
}
colnames(trainact.n) <- "activity.name"

#Combine activity labels and subject labels
testset <- cbind(testsub, testact.n, testf)
trainset <- cbind(trainsub, trainact.n, trainf)

#merge training and test data sets into one complete data set
message("Merging train and test sets ...")
completeset <- rbind(testset, trainset)

#Extract only the measurements on the mean and standard deviation 
	#for each measurement 
message("Subsetting on mean and standard deviation columns ...")
meanstdcols <- grep('mean$|mean\\..$|std$|std\\..$', colnames(completeset)) 
meanstdset <- completeset[,c(1,2,meanstdcols)]

#Data summarization
#The average of each variable (feature) for each activity and each subject
message("Reshaping data set ...")

meltset <- melt(meanstdset, id=c("subject", "activity.name"), 
	measure.vars=colnames(meanstdset)[3:ncol(meanstdset)])

spset <- split(meltset, meltset$variable)		#split on variables

casted <- vector(length=length(spset), mode="list")
names(casted) <- names(spset)							#initialize a list for `dcast` function

DF <- data.frame()								#initialize reshaped data frame

for (i in 1:length(casted)) {
	casted[[i]] <- dcast(spset[[i]], variable + subject ~ activity.name, mean)
	DF <- rbind(DF, casted[[i]])
}

#Write the output file
message("Writing output file ...")
write.table(DF, "tidy_data.txt", sep="\t", col.names=T, row.names=F, quote=F)