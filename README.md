##Getting and Cleaning Data
##Course Project

###Human activity recognition data collected with a waist-mounted smartphone

To reproduce the accompanying data sets, follow these steps:

+ Download and unzip the source data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
(Original data collection description in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

+ Place the "run_analysis.R" file in the same folder as the unzipped data
(the file should be at the same level as "features.txt", "features_info.txt" etc.)

+ Run "source("run_analysis.R")" from within R. This should create locally the files "Tidy.csv" and "X.csv". The contents of these two files are described in the codebook.

+ The code does not require loading any other libraries beyond the default ones loaded by RStudio

+ The code begins by cleaning the environment (running "rm(list=ls()) to avoid potential conflicts. Make sure you store any unsaved objects prior to running the code!