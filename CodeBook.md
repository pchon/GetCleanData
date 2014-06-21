## Data sources

* [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

* [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## data processing and variable description

* Read test and train data and combine them into a merged dataset (data) 

* Extract only the measurements on the mean and standard deviation for each measurement (search for the word mean in the names of the variables)

* Use descriptive activity names to name the activities in the data set

* Create a second, independent tidy data set with the average of each variable for each activity and each subject, employing funactionalities from the data.table and plyr packages.

* The resulting dataset contains 180 observations from 48 variables, 46 of which are the ACC variables that contain the term mean in their name 
