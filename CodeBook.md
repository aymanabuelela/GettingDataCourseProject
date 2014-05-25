##Variable Description
The features selected for this data set `tidy_data.txt` come from extractinf the means and standard deviation variables for a set of features collected for "Human Activity Recognition Using Smartphones Dataset" by Anguita et al -- see README.md file for more details. 

###Data Set Structure
`tidy_data.txt` is a tab delimited file of 8 columns.<br />
* Columns:
	* `variable`: contains all the extracted features from the original data set.
	* `subject`: represents subject labels. from 1 to 30.
	* columns from 3 to 8 represent calculated averages for each extracted feature per each subject per each activity from the following: `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`.
*Rows: each row is a full record; contains 'feature name', 'subject label' and 6 average feature values for 6 activities

###Variable Nomenclature
* subject: 30
	from 1 to 30
* Columns from 3 to 8 (Activity names):
	LAYING
	SITTING
	STANDING
	WALKING
	WALKING_DOWNSTAIRS
	WALKING_UPSTAIRS
* variable: 66
	each variable term is composed of 4 parts: (1) prefix, (2) base, (3) mean or std and (4) axis
	(1) Prefix:
		t, time domain signal
		f, frequency domain signal
	(2) Base:
		BodyAcc
		GravityAcc
		BodyAccJerk
		BodyGyro
		BodyGyroJerk
		BodyAccMag
		GravityAccMag
		BodyAccJerkMag
		BodyGyroMag
		BodyGyroJerkMag
		
		Signal from: body or gravity.
		Raw signals: Accelerometer (Acc) or Gyroscope (Gyr)
		Derivations: Jerk or Mag
		see feature_info.txt in the original data directory for more information.
	(3)Mean or std:
		mean or Mean: Mean value
		std: Standard deviation
	(4)Axis:
		X or Y or Z
	full list of features in `feature.txt`

###Transformation of the Original Data
Original data came in the form of test and train data sets. Subjects and activity labels in rows and feature values in 561 columns.
* Test and train data sets were merged.
* Mean and standard deviation features of measurements were extracted.
* data rearranged in the form of features and subjects in rows and average values of extracted features per activity in columns.
