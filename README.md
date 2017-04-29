# Getting-and-Cleaning-Data-Final-Assessment

This repo contains **run_analysis.R** sript, used to create a tidy data set from data collected from the accelerometers from the Samsung Galaxy S smartphone. Bellow you will find a little explanaition abuot how the code works.

## run_analysis.R

* 1.- **run_analysis.R** downloads the data from the UCI Machine Learning Repository page. A working directory is created to save and unzip the data. 
* 2.- Training and test data tables are loaded and merged by rows to created only one data set per Subject, X and Y tables. 
* 3.- With the full data sets available, the features.txt file is used to subset the data by interest's columns, i.e. mean and standard deviation for each measurement. 
* 4 .- A unique data set is created merging the three data sets by colums.
* 5.- Each row in the data set in 4 is tag by activity, and the columns are appropriately rename with descriptive variable names.
* 6.- Finally, the average of each variable for each activity and each subject are cumputed and saved in a new data frame.



