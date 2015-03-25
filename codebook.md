---
title: "Codebook"
author: "Sean"
date: "Thursday, March 26, 2015"
output: html_document
---

This is an codebook to describe "TidyData.txt"
activity: activity tested
subject: 1-30, different subject participated in the test
all others£ºmean of The features selected for this database during test time
come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time-BodyAcc-XYZ and time-GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time-BodyAccJerk-XYZ and time-BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time-BodyAccMag, time-GravityAccMag, time-BodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency-BodyAcc-XYZ, frequency-BodyAccJerk-XYZ, frequency-BodyGyro-XYZ, frequency-BodyAccJerkMag, frequency-BodyGyroMag, frequency-BodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 
time-BodyAcc-XYZ
time-GravityAcc-XYZ
time-BodyAccJerk-XYZ
time-BodyGyro-XYZ
time-BodyGyroJerk-XYZ
time-BodyAccMag
time-GravityAccMag
time-BodyAccJerkMag
frequency-BodyGyroMag
frequency-BodyGyroJerkMag
frequency-BodyAcc-XYZ
frequency-BodyAccJerk-XYZ
frequency-BodyGyro-XYZ
frequency-BodyAccMag
frequency-BodyAccJerkMag
frequency-BodyGyroMag
frequency-BodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
