## Cleaning of Human Activity Recognition Using Smartphones Dataset
AbuElela A.<br />
ayman.elkhodiery@kaust.edu.sa
###Introduction
The goal of this project is to clean, summarize and reshape the input data into a tidy data set in order to be used for later analysis. 

* **Input data**: The input data are supplied in the `UCI HAR Dataset` directory. features list are in `feature.txt` and their description is in `feature_info.txt`. Each type of activity was given a label and activity labels are in `activity_labels.txt`. Data are divided into 'train' and 'test' sets. Each set has 3 text files; X text file for the recorded feature signals, y text file for the activity labels and subject text file for the subject identifiers. The first feature in `feature.txt` correspond to the first column in the X text file e.g. `X_test.txt` and so on.the first subject label in the y file corresponds to the first row record in the X file and so on. The original data was generated by Anguita et al [1] from Samsung Galaxy SII during activity experiments on 30 volunteers doing 6 types of activities. Details abouts the recorded features can be found in `CodeBook.md`. More details about the project is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. For any inquires about the original dataset contact: activityrecognition@smartlab.ws. For any inquireies about the modified data set contact: ayman.elkhodiery@kaust.edu.sa<br />
The data of this project can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 


* **Processing**: The script `run_analysis.R` does the following to the input data using R.
Tested using R version 3.1.0 (2014-04-10), Platform: x86_64-pc-linux-gnu (64-bit).
    1. *modify feature names* to comply with R naming guidelines by replacing '-' with '.' and removing '()'.
    2. Combine *corrected feature* names to the data set.
    2. Replace the *activity labels* from the y file in each data set into *activity names* using the relation in `activity_labels.txt`
    3. Combine the subject labels and activity names to the data set.
    4. *Merge train and test sets* into one data set.
    5. Extract only the data for *the mean and the standard deviation* of each measurement.
    6. *Data summarization* by calculating the average of each variable (feature) for each activity and each subject.
    7. *Writes the output file* `tidy_data.txt`. See "The output file" section for more details.

* **The output file**: `tidy_data.txt` a tab delimited file that contains the output of data cleaning and summarization. It reports the average of all extracted features for all activities done by all subjects. The first column represent the features. The second column represent the subject labels. Activities are columns from 3 to 8; everyone of which represents the calculated averages per each feature in column 1 per each subject in column 2.

###The Repository contain the following files:
* `README.md`
* `run_analysis.R`: R script that cleans, summarizes and reshapes the "Human Activity Recognition Using Smartphones Dataset"
* `CodeBook.md`: information about the variables used in the output file `tidy_data.txt`
* `feature.txt`: a list of extracted features

###Running the script
* make sure that your working directory contains both the `UCI HAR Dataset` directory and the `run_analysis.R` R script.
* Run the script inside R environment using the command `source('run_analysis.R')`

###Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
