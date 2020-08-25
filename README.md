# Introduction

This is the repository for the Getting and Cleaning Data course project. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# Source 

The data we use has been collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Furthermore, the dataset includes two self-explanatory files, "README.txt" and "features_info.txt".

# Files

The files in this repository are:

1. "README.md", this file. 
2. "run_analysis.R", the code for the analysis.
3. "CodeBook.md", the markdown file explaining the project and code.
4. "means_by_group.txt", a tidy data set with the average of each variable for each activity and each subject.

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