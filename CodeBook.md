---
title: "CodeBook for Course Project (Gettting and Cleaning Data)"
author: "by David Harper, CFA, FRM, founder of http://www.bionicturtle.com"
date: "Saturday, August 23, 2014"
output: html_document
---

The script ("run_analysis.R") produces the tidy dataset ("tidySamsung.txt"") from the original datasets. In the TABLE below are variables and their descriptions. Variable field width and value range are generally excluded as the feature dataset is normalized and bounded within [-1,1]; e.g., raw standard deviations (Std) are necessarily positive but were consequently normalized such that negatives occur. Please note the following:

* The merged training and test datasets contained 561 features variables
* The subset in "tidySamsung.txt" contains only 66 (i.e., Mean and Std) plus subject and activity
* camelCase was preserved to keep variables (they are already logical, I disagree with complexifying them!) short and the script fixed the nine __erroneous instances__ of "BodyBody"


| variable             | description/definition               | notes (width excluded as unnecessary)                 |
|----------------------|--------------------------------------|-------------------------------------------------------|
| subject              | Volunteer, aged 19-48 years          | 1:30, originally parsed into train and test           |
| activity             | One of six activities                | walking,walkingup,walkingdown,sitting,standing,laying |
| tBodyAccMeanX        | Time-Body-Acceleration-Mean(X)       | normalized and bounded within [-1,1].                 |
| tBodyAccMeanY        | Time-Body-Acceleration-Mean(Y)       |                                                       |
| tBodyAccMeanZ        | Time-Body-Acceleration-Mean(Z)       |                                                       |
| tBodyAccStdX         | Time-Body-Acceleration-Std(X)        |                                                       |
| tBodyAccStdY         | Time-Body-Acceleration-Std(Y)        |                                                       |
| tBodyAccStdZ         | Time-Body-Acceleration-Std(Z)        |                                                       |
| tGravityAccMeanX     | Time-Gravity-Acceleration-Mean(X)    |                                                       |
| tGravityAccMeanY     | Time-Gravity-Acceleration-Mean(Y)    |                                                       |
| tGravityAccMeanZ     | Time-Gravity-Acceleration-Mean(Z)    |                                                       |
| tGravityAccStdX      | Time-Gravity-Acceleration-Std(X)     |                                                       |
| tGravityAccStdY      | Time-Gravity-Acceleration-Std(Y)     |                                                       |
| tGravityAccStdZ      | Time-Gravity-Acceleration-Std(Z)     |                                                       |
| tBodyAccJerkMeanX    | Time-Body-Acceleration-Jerk-Mean(X)  |                                                       |
| tBodyAccJerkMeanY    | Time-Body-Acceleration-Jerk-Mean(Y)  |                                                       |
| tBodyAccJerkMeanZ    | Time-Body-Acceleration-Jerk-Mean(Z)  |                                                       |
| tBodyAccJerkStdX     | Time-Body-Acceleration-Jerk-Std(X)   |                                                       |
| tBodyAccJerkStdY     | Time-Body-Acceleration-Jerk-Std(Y)   |                                                       |
| tBodyAccJerkStdZ     | Time-Body-Acceleration-Jerk-Std(Z)   |                                                       |
| tBodyGyroMeanX       | Time-Body-Gyroscope-Mean(X)          |                                                       |
| tBodyGyroMeanY       | Time-Body-Gyroscope-Mean(Y)          |                                                       |
| tBodyGyroMeanZ       | Time-Body-Gyroscope-Mean(Z)          |                                                       |
| tBodyGyroStdX        | Time-Body-Gyroscope-Std(X)           |                                                       |
| tBodyGyroStdY        | Time-Body-Gyroscope-Std(Y)           |                                                       |
| tBodyGyroStdZ        | Time-Body-Gyroscope-Std(Z)           |                                                       |
| tBodyGyroJerkMeanX   | Time-Body-Gyroscope-Jerk-Mean(X)     |                                                       |
| tBodyGyroJerkMeanY   | Time-Body-Gyroscope-Jerk-Mean(Y)     |                                                       |
| tBodyGyroJerkMeanZ   | Time-Body-Gyroscope-Jerk-Mean(Z)     |                                                       |
| tBodyGyroJerkStdX    | Time-Body-Gyroscope-Jerk-Std(X)      |                                                       |
| tBodyGyroJerkStdY    | Time-Body-Gyroscope-Jerk-Std(Y)      |                                                       |
| tBodyGyroJerkStdZ    | Time-Body-Gyroscope-Jerk-Std(Z)      |                                                       |
| tBodyAccMagMean      | Time-Body-Acceleration-Mag-Mean      |                                                       |
| tBodyAccMagStd       | Time-Body-Acceleration-Mag-Std       |                                                       |
| tGravityAccMagMean   | Time-Gravity-Acceleration-Mag-Mean   |                                                       |
| tGravityAccMagStd    | Time-Gravity-Acceleration-Mag-Std    |                                                       |
| tBodyAccJerkMagMean  | Time-Body-Acceleration-Jerk-Mag-Mean |                                                       |
| tBodyAccJerkMagStd   | Time-Body-Acceleration-Jerk-Mag-Std  |                                                       |
| tBodyGyroMagMean     | Time-Body-Gryoscope-Mag-Mean         |                                                       |
| tBodyGyroMagStd      | Time-Body-Gryoscope-Mag-Std          |                                                       |
| tBodyGyroJerkMagMean | Time-Body-Gryoscope-Jerk-Mag-Mean    |                                                       |
| tBodyGyroJerkMagStd  | Time-Body-Gryoscope-Jerk-Mag-Std     |                                                       |
| fBodyAccMeanX        | FFT-Body-Acceleration-Mean(X)        |                                                       |
| fBodyAccMeanY        | FFT-Body-Acceleration-Mean(Y)        |                                                       |
| fBodyAccMeanZ        | FFT-Body-Acceleration-Mean(Z)        |                                                       |
| fBodyAccStdX         | FFT-Body-Acceleration-Std(X)         |                                                       |
| fBodyAccStdY         | FFT-Body-Acceleration-Std(Y)         |                                                       |
| fBodyAccStdZ         | FFT-Body-Acceleration-Std(Z)         |                                                       |
| fBodyAccJerkMeanX    | FFT-Body-Acceleration-Jerk-Mean(X)   |                                                       |
| fBodyAccJerkMeanY    | FFT-Body-Acceleration-Jerk-Mean(Y)   |                                                       |
| fBodyAccJerkMeanZ    | FFT-Body-Acceleration-Jerk-Mean(Z)   |                                                       |
| fBodyAccJerkStdX     | FFT-Body-Acceleration-Jerk-Std(X)    |                                                       |
| fBodyAccJerkStdY     | FFT-Body-Acceleration-Jerk-Std(Y)    |                                                       |
| fBodyAccJerkStdZ     | FFT-Body-Acceleration-Jerk-Std(Z)    |                                                       |
| fBodyGyroMeanX       | FFT-Body-Gyroscope-Mean(X)           |                                                       |
| fBodyGyroMeanY       | FFT-Body-Gyroscope-Mean(Y)           |                                                       |
| fBodyGyroMeanZ       | FFT-Body-Gyroscope-Mean(Z)           |                                                       |
| fBodyGyroStdX        | FFT-Body-Gyroscope-Std(X)            |                                                       |
| fBodyGyroStdY        | FFT-Body-Gyroscope-Std(Y)            |                                                       |
| fBodyGyroStdZ        | FFT-Body-Gyroscope-Std(Z)            |                                                       |
| fBodyAccMagMean      | FFT-Body-Acceleration-Mag-Mean       |                                                       |
| fBodyAccMagStd       | FFT-Body-Acceleration-Mag-Std        |                                                       |
| fBodyAccJerkMagMean  | FFT-Body-Acceleration-Jerk-Mag-Mean  |                                                       |
| fBodyAccJerkMagStd   | FFT-Body-Acceleration-Jerk-Mag-Std   |                                                       |
| fBodyGyroMagMean     | FFT-Body-Gyroscope-Mag-Mean          |                                                       |
| fBodyGyroMagStd      | FFT-Body-Gyroscope-Mag-Std           |                                                       |
| fBodyGyroJerkMagMean | FFT-Body-Gyroscope-Jerk-Mag-Mean     |                                                       |
| fBodyGyroJerkMagStd  | FFT-Body-Gyroscope-Jerk-Mag-Std      |                                                       |