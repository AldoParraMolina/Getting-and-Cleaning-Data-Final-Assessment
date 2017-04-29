# Getting-and-Cleaning-Data-Final-Assessment

This repo contains the sript used to crearte a tidy data set from data collected from the accelerometers from the Samsung Galaxy S smartphone. 

First, run_analysis.R downloads the data from the UCI Machine Learning Repository page. A working directory is created to save and unzip the data. 

Then, training and test data tables are loaded and merged by rows to created only one data set per Subject, X and Y tables. With the full data sets available, the features.txt file is used to subset the data by intesest's columns, i.e. mean and standard deviation for each measurement. Next, a unique data set is created merging data by colums.

Each row in the data set mentioned before is tagged by activity, and the columns are appropriately rename with descriptive variable names.



