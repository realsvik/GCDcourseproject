library(dplyr)
mergeds <- function(ds1,ds2, features){
#reads experiment data, variable name and creates an initial dataset
        testdf <- read.table(ds1)
        traindf <- read.table(ds2)
        alldf <- rbind_list(testdf, traindf)
        varsdf <- read.table(features, stringsAsFactors=FALSE)
        colnames(alldf) <- varsdf[,2] 
        rm(testdf)
        rm(traindf)
        rm(varsdf)
        alldf
}
addsubject <- function(alldf, tests, trains){
#adds subject data to dataset
        testsdf <- read.table(tests)
        trainsdf <- read.table(trains)
        allsdf <- rbind_list(testsdf, trainsdf) 
        colnames(allsdf) <-c("Subject")
        alldf <- cbind(allsdf, alldf)
}
addactivities <- function(alldf, testact, trainact, actnames){
#adds activity data to dataset
        testactdf <-read.table(testact)
        trainactdf <- read.table(trainact)
        namesdf <-read.table(actnames, stringsAsFactors=FALSE)
        allactdf <- rbind_list(testactdf, trainactdf)
        
        actlength <- nrow(allactdf)
        activities <- data.frame()     
         
        for (i in 1:actlength){
                activities[i,1] <- namesdf$V2[allactdf$V1[i]]   
        }
		colnames(activities) <-c("Activity")
        
        alldf <- cbind(activities, alldf)
        
        rm(testactdf)
        rm(trainactdf)
        rm(namesdf)
        rm(allactdf)
        rm(activities)
        alldf
}
extractcols <- function(alldf, features){
#extracts variables, containing the measurements of mean and standard deviation
        alldf <- alldf[,grepl("std|mean", colnames(alldf))]
        alldf
}

mydfprint <- function(alldf, destfile="result.txt"){
#prints dataframe into file, row data = true
        write.table(alldf, destfile, sep=";") 
}
mytransform <- function(trainf="X_train.txt", testf="X_test.txt", features="features.txt", trainact="y_train.txt", testact="y_test.txt",actnames="activities.txt", tests="subject_test.txt", trains="subject_train.txt"){
        # read, merge, assign column names to source data sets
       
        alldf <- mergeds(trainf, testf, features)         
        # extract mean and standard deviation-related variables
        alldf <- extractcols(alldf, features)
        
        # add activity information, as a column
        alldf <- addactivities(alldf, testact, trainact, actnames)
        # add subject information, as a column
        alldf <- addsubject(alldf, tests, trains)
        # save subset to result1.txt, free memory
        mydfprint(alldf, "result2.txt")
        rm(alldf)
        
        # new dataset creation. no separate function, as each operation can be done with 1 dplyr command
        
        newdf <- read.table("result2.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, quote = "\"'", check.names=FALSE)
     
        #sort new dataset by subject, then by activity
        newdf <- arrange(newdf, Subject, Activity)
        newdf <- group_by(newdf, Subject, Activity)
        newdf <- summarise_each(newdf, funs(mean))
        # print result in file
        write.table(newdf, "tidydataset.txt", sep=";", row.name=FALSE)
        newdf
        
        
}
