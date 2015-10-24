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

values<-rbind(x_test[,use_index],x_train[,use_index])
activity<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
feat<-as.character(features[use_index,2])

full_act_label<-mapvalues(simplify2array(activity),from=activity_labels[,1],to=activity_labels[,2])

tidy_data<-cbind(subject,full_act_label,values)

names(tidy_data)<-c("subject","activity",feat)

##melt features data into long dataframe, then separate the feature components to get cols:
##subject / activity / motion / statElement / direction / value
## long_data is the tidy data required for further analysis
melt_data<-melt(tidy_data,names(tidy_data[1:2]),names(tidy_data[-c(1,2)])) 
averages<-with(melt_data,tapply(value,list(subject,activity,variable),mean))
melt_average<-melt(averages)
long_data<-separate(melt_data,variable,c("motion","statElement","direction"))







