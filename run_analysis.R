rm(list=ls())

Features<-read.table("features.txt")

#Only keep mean and std, not including the "meanFreq" set 
IndexOfInterest<-grep("std|mean[^Freq]",Features[,2])
FeaturesOfInterest<-Features[IndexOfInterest,2]
rm(Features)

#clean up names: remove parentheses
FeaturesOfInterest<-gsub("\\(|\\)","",FeaturesOfInterest)
#add a space prior to capital letters to split words.
#also add a space prior to "mean" and "std" terms
FeaturesOfInterest<-gsub("(.)([A-Z]|mean|std)", "\\1 \\2", FeaturesOfInterest)
#remove the dash
FeaturesOfInterest<-gsub("-","",FeaturesOfInterest)
#convert from caps to lower-case
FeaturesOfInterest<-tolower(FeaturesOfInterest)
#replace "t" in the beginning of a name, with "time" 
FeaturesOfInterest<-gsub("^t","time",FeaturesOfInterest)
#replace "f" in the beginning of a name, with "frequency" 
FeaturesOfInterest<-gsub("^f","freq",FeaturesOfInterest)

X_train<-read.table("train/X_train.txt")
X_test<-read.table("test/X_test.txt")
#unite train and test set
X<-rbind(X_train,X_test)
rm(X_train,X_test)
#isolate data columns of interest
X<-X[,IndexOfInterest]
rm(IndexOfInterest)
names(X)<-FeaturesOfInterest

#Similarly combine the activity labels for each run
Y_train<-read.table("train/y_train.txt")
Y_test<-read.table("test/y_test.txt")
Y<-rbind(Y_train,Y_test)
rm(Y_train,Y_test)
#load the true activity label names index
activity_labels<-read.table("activity_labels.txt")[,2]
activity_labels<-gsub("_"," ",activity_labels)
#convert from caps to lower-case
activity_labels<-tolower(activity_labels)

#add the activity labels as the first column of X, using their descriptive names
X<-cbind(activity_labels[Y[,1]],X)
rm(Y)
names(X)[1]<-"activity"
rm(activity_labels)

#load the subject id per row
subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")
subject<-rbind(subject_train,subject_test)
rm(subject_train,subject_test)
#add them as the (new) first column of X, as a categorical variable
X<-cbind(as.factor(subject[,1]),X)
rm(subject)
names(X)[1]<-"subject"

#form a unique index for subjects
Subjects<-sort(unique(X$subject))
#form a unique index for activities
Activities<-sort(unique(X$activity))

#Build a data frame where each row is the mean of all samples from
#each subject-activity combination
Tidy<-data.frame()
for (i in 1:length(Subjects)) {
  for ( j in 1:length(Activities)) {
    #Find all rows for the given subject-activity combination
    TempInd<-(X$subject==Subjects[i])&(X$activity==Activities[j])
    #Calculate each feature's mean for the given combination
    Temp<-colMeans(X[TempInd,FeaturesOfInterest])
    #Append it as a row to "Tidy"
    Tidy<-rbind(Tidy,Temp)
  }
}
#The subject index has the form 1 1 1 1 1 1 2 2 2 2 2 2... etc
subject_index<-rep(Subjects,each=length(Activities))
#The activity index has the form 1 2 3 4 5 6 1 2 3 4 5 6... etc
activity_index<-rep(Activities,times=length(Subjects))
names(Tidy)<-names(X[,FeaturesOfInterest])
Tidy<-cbind(subject_index,activity_index,Tidy)
names(Tidy)[1:2]<-c("subject index", "activity")


rm(FeaturesOfInterest,i,j,activity_index,subject_index,TempInd,Temp,Activities,Subjects)

write.csv(X,"means-stds.csv")
write.csv(Tidy,"Tidy.csv")
