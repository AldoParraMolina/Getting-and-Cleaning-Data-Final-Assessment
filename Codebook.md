## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Processing data

From the data mentioned before, were extracted only the measurements on the mean and standard deviation for each measurement. Then the columns are appropriately rename with descriptive variable names.
Finally a independent tidy data set with the average of each variable for each activity and each subject was created.

## Variables 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
'...X', '...Y' and '...Z' is used to denote 3-axial signals in the X, Y and Z directions. 'Mean' and 'STD' are used to denote the type of measurement.


|ID | Variable |
|---|---|
|1 |                                 Subject|
|2  |                              Activity|
|3   |                TimeBodyAccelerometer|
|4    |            TimeGravityAccelerometer|
|5     |          TimeBodyAccelerometerJerk|
|6      |                 TimeBodyGyroscope|
|7       |            TimeBodyGyroscopeJerk|
|8|          TimeBodyAccelerometerMagnitude|
|9 |      TimeGravityAccelerometerMagnitude|
|10 |     TimeBodyAccelerometerJerkMagnitude|
|11  |            TimeBodyGyroscopeMagnitude|
|12   |       TimeBodyGyroscopeJerkMagnitude|
|13    |          FrequencyBodyAccelerometer|
|14     |     FrequencyBodyAccelerometerJerk|
|15      |            FrequencyBodyGyroscope|
|16|     FrequencyBodyAccelerometerMagnitude|
|17 |FrequencyBodyAccelerometerJerkMagnitude|
|18  |       FrequencyBodyGyroscopeMagnitude|
|19   |  FrequencyBodyGyroscopeJerkMagnitude|
|20    |                         Activity_id|
