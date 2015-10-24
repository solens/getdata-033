#Get all relevant data from directory
dir<-getwd()
x_test<-read.table(paste(dir,"/UCI HAR Dataset/test/X_test.txt",sep=""))
y_test<-read.table(paste(dir,"/UCI HAR Dataset/test/Y_test.txt",sep=""))
subject_test<-read.table(paste(dir,"/UCI HAR Dataset/test/subject_test.txt",sep=""))

x_train<-read.table(paste(dir,"/UCI HAR Dataset/train/X_train.txt",sep=""))
y_train<-read.table(paste(dir,"/UCI HAR Dataset/train/Y_train.txt",sep=""))
subject_train<-read.table(paste(dir,"/UCI HAR Dataset/train/subject_train.txt",sep=""))

features<-read.table(paste(dir,"/UCI HAR Dataset/features.txt",sep=""))
activity_labels<-read.table(paste(dir,"/UCI HAR Dataset/activity_labels.txt",sep=""))

#Get relevant data: all features containing "mean()" or "std()"
#assuming they are mutually exclusive
usable_index<-grepl("mean()",features[,2],fixed=TRUE)
usable_index2<-grepl("std()",features[,2],fixed=TRUE)
use_index<-as.logical(usable_index+usable_index2)

x<-rbind(x_test[use_index],x_train[use_index])
y<-rbind(y_test,y_train)
feat<-features[use_index,2]

y<-mapvalues(t(y),from=t(activity_labels[1]),to=t(activity_labels[2]))
data<-x
names(data)<-feat
data<-cbind(y,data)
split_data<-split(data,data[1])



