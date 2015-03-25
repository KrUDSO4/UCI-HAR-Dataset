---
title: "Readme"
author: "Sean"
date: "Sunday, March 22, 2015"
output: html_document
---
Purpose: Create tidy data sets from the UCI HAR Dataset
This Repo contains the following files:
TidyData.txt - The Objective tidy data set
CodeBook.md - A description of variables in the txt file
run_analysis.R - The R script required to create the tidy data sets
README.md - how all of the scripts work and how they are connected
---
the original data 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
---
First, understand the files in the original data set
/Inertial Signals: original signal, no use
X_test.txt; X_train.txt : data extract from Inertial Signals
subject_test.txt; subject_train.txt : test subject of every row in X_test.txt; X_train.txt 
y_text.txt; y_train.txt : activity tested every row in X_test.txt; X_train.txt 
1.so the first thing to do is read.table() these files,and cbind() them. Then rbind() the train and test data
2.features.txt is the variables of every column in X_test.txt or X_train.txt. So i read.table() it and TRY to assign them as column names then select(..., contain()) to select mean and std. But it returns an error "duplicate column names". I googled and find it might be an error when R deal with column names contain numbers.
3.therefore i use grepl() to label every column name that contains "mean()" or "std()", and only select these columns.
4.activity_labels.txt is what the numbers in y_text.txt and y_train.txt actually means. a for(){} will replace the numbers with names.
5.alter the name using gsub(), and assign them using "colnames() <-". here i find "meanFreq"s are also selected. so i went back and dislabled them. why grepl("mean()") will also return "meanFreq" i still don't know.
6.group_by(activity,subject) and summarize_each() to get the required data set.
 

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
