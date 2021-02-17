Introduction 

In this project I used the six data sets, which are x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt. 
All of these can be found within the dataset (URI HAR Dataset)

The features.txt contains the correct variable name, which corresponds to each column of x_train.txt and x_test.txt. 

The acitivity_labels.txt contains the descriptive names for each activity labels. These correspond to both y files. 

Tidy Data Set

The dataset is created within the run_analysis.R, called data_4. This is the tidy data set which is achieved through the run_analysis program, containing 180 observations. 
The first column represents the subject that took part in the experiment. 
The following columns show the feature variables (in this case the standard deviation, the means). 
The last column gives the activity each subject is doing (including SITTING, WALKING and others).
