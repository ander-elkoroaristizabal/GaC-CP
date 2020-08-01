### GaC course project

# # The source for the data is 
# # http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphoness
# 
# # We download the data from the given url using
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#               destfile = "CPdata.zip", method = "curl")
# 
# # and unzip it with
# unzip("CPdata.zip")

# We first get the column names:

col_names = read.table("UCI HAR Dataset/features.txt")$V2

#  Now we read the two datasets we want, train, test and corresponding subject:

X_train_dir = "UCI HAR Dataset/train/X_train.txt"
X_train = read.table(X_train_dir, header = FALSE, sep = "", dec = ".",col.names = col_names)

Y_train_dir = "UCI HAR Dataset/train/Y_train.txt"
Y_train = read.table(Y_train_dir, header = FALSE, sep = "", dec = ".", col.names = "Activity")

train_subject_dir = "UCI HAR Dataset/train/subject_train.txt"
subject_train = read.table(train_subject_dir, header = FALSE, sep = "", dec = ".", col.names = "Subject")

train = cbind(X_train, Y_train, subject_train)

X_test_dir = "UCI HAR Dataset/test/X_test.txt"
X_test = read.table(X_test_dir, header = FALSE, sep = "", dec = ".", col.names = col_names)

Y_test_dir = "UCI HAR Dataset/test/Y_test.txt"
Y_test = read.table(Y_test_dir, header = FALSE, sep = "", dec = ".", col.names = "Activity")

test_subject_dir = "UCI HAR Dataset/test/subject_test.txt"
subject_test = read.table(test_subject_dir, header = FALSE, sep = "", dec = ".", col.names = "Subject")

test = cbind(X_test, Y_test, subject_test)

# We remove the uninteresting data in the workspace:

remove(X_train_dir,X_train,Y_train_dir,Y_train)
remove(X_test_dir,X_test,Y_test_dir,Y_test)
remove(train_subject_dir,test_subject_dir,subject_train,subject_test)

# We now put together the two datasets. Since they are train and test datasets, 
# the rows in each are different examples, and therefore we need to put one 
# dataframe under the other:

data = rbind(train,test)

remove(train,test)

# We get the indexes of the mean or std variables as follows:

rel_vars = grep("-(mean|std).*", col_names)

# and keep the columns related to them, together with the "Activity" and the "Subject":

data = data[,c(rel_vars,dim(data)[2]-1,dim(data)[2])]
col_names = c(col_names[c(rel_vars)], "Activity", "Subject")

# We now reformat the names in order to improve legibility,

col_names = sub("-mean", "Mean",col_names)
col_names = sub("-std", "Std",col_names)
col_names = gsub("[()]", "",col_names)

# and change the names of the columns in our dataset:

colnames(data) = col_names

remove(rel_vars,col_names)

# We also factor in a more understandable way the activity label:

labels_data = read.table("UCI HAR Dataset/activity_labels.txt")
levels = labels_data$V1
labels = labels_data$V2
data[,"Activity"] = factor(data$Activity, levels = levels, labels = labels)

remove(labels_data,levels,labels)

# We create a new dataset with the average of each variable for
# each activity and each subject. Before, we bind together the
# "data" dataframe and the "subject" one, and convert it to factor:

data = cbind(data,subject)
remove(subject)
data[,"Subject"] = factor(data$Subject)

# And do the final task:

means_by_group = aggregate(data[ , 1:80], list(data$Subject,data$Activity), mean, na.rm =TRUE)

write.table(means_by_group, row.names = FALSE, file = "means_by_group.txt")