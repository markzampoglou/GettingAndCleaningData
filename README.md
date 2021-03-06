##Getting and Cleaning Data: Course Final Project
###Human activity recognition data collected with a waist-mounted smartphone

To reproduce the accompanying data sets (found in the repository as <a href="https://github.com/markzampoglou/GettingAndCleaningData/blob/master/Tidy.csv">`Tidy.csv`</a> and <a href="https://github.com/markzampoglou/GettingAndCleaningData/blob/master/means-stds.csv">`means-stds.csv`</a>), follow these steps:

+ Download and unzip the raw source data from <a href=https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>here</a>
  + A description of the original data collection procedure can be found <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a>
+ Download the <a href=https://github.com/markzampoglou/GettingAndCleaningData/blob/master/run_analysis.R>`run_analysis.R`</a> file and place it in the same folder as the unzipped data.
  + The file should be at the same level as `features.txt`, `features_info.txt` etc. from the raw data.
  + The `test/` and `train/` subfolders should also exist alongside these files.
+ Change the working directory to wherever you have placed the file, and run `source("run_analysis.R")` from within R. This should locally create the files `Tidy.csv` and `means-stds.csv`. The contents of these two files are described in the <a href="https://github.com/markzampoglou/GettingAndCleaningData/blob/master/Codebook.md">codebook</a>.
  + The code also creates two data frames in memory, named `Tidy` and `X` containing the corresponding data.
+ The code does not require loading any additional libraries.
+ The code begins by cleaning the environment through `rm(list=ls()`to prevent potential conflicts. Make sure you store any unsaved objects prior to running the code!