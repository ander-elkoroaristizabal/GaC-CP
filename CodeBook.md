# Codebook
### Getting and Cleaning Data: Courser Project

This is the codebook for the course project of Getting and Cleaning Data.

# Source:

The data is obtained from the url 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones,
although it can be downloaded as a zip file from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The data is explained in its own "README.txt" and "features_info.txt" files.

# Modifications:

All the modifications are done at the file run_analysis.R, 
and can be summarized as follows:

1. Download the datasets from the web. 

2. Merges the train and test data.

3. Reformates the names of the variables to improve legibility, 
and keeps only the wanted variables. 

4. Reformats the answer variable "Activity" to a understandable factor.

5. Creates a dataframe containing the mean of the relevant variables grouped by
the subject who conducted the experiment and the activity.
