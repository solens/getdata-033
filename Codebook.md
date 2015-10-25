#Getting and cleaning Data - Course Project
##DATA
original data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Read Data
 The files used for this data set:
in UCI HAR Dataset\test\
1. x_test.txt
2. y_test.txt
3.subject_test.txt

Similarly in UCI HAR Dataset\train\
1. x_train.txt
2. y_train.txt
3.subject_train.txt

As labels in UCI HAR Dataset:
1. activity_labels.txt
2. features.txt

these are all used as variables as is, without the extension

## Available datasets from the tidying process
### Run run_analysis.R

usable_index, usable index2 (combined to use_index): features containing a measuring on respectively the mean and the standard deviation

values: full measurement set (training + test data) from the relevant features in use_index

activity: full activity index list (training + test data), corresponding to the rows in values

subject: full subject list (training + test data), corresponding to the rows in values

full_act_label: character vector of all relevant features as in use_index, corresponds to the columns in values


melt_data: tidy data set of all relevant features as a variable with subject and activity. This table i written to melt_data.txt

averages: 3D matrix of the average of a feature per activity and per subject

melt_average: 2D data frame of the average of a feature per activity and per subject (feature as another variable). This table gets written to melt_average.txt

## Required packages
dply, plyr, tidyr
