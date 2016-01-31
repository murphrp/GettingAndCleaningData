
##  This script merges several data sets and tidies them up, including
##  column naming and replacing identifiers with descriptions.

# read in all six data sets as data frames
xtest <- read.table("test/X_test.txt")
xtrain <- read.table("train/X_train.txt")
ytest <- read.table("test/y_test.txt")
ytrain <- read.table("train/y_train.txt")
subjecttest <- read.table("test/subject_test.txt")
subjecttrain <- read.table("train/subject_train.txt")

# bind rows from y test and y train data sets
ytesttrain <- rbind(ytest, ytrain)
# bind rows from x test and x train data sets
xtesttrain <- rbind(xtest, xtrain)
# bind rows from subject test and subject train data sets
subjecttesttrain <- rbind(subjecttest, subjecttrain)


# extract only mean and standard deviation variables
meanstdind <- grep("mean|std", features[, 2])
xtesttrain <- xtesttrain[, meanstdind]

# set variable names to feature names from lookup file
names(xtesttrain) <- features[meanstdind, 2]

# clean variable names
names(xtesttrain) <- gsub("^f", "freq.", names(xtesttrain)) # replace leading f with freq and .
names(xtesttrain) <- gsub("^t", "time.", names(xtesttrain)) # replace leading t with time and .
names(xtesttrain) <- tolower(names(xtesttrain)) # lowercase
names(xtesttrain) <- gsub("\\(\\)", ".", names(xtesttrain)) # remove ()
names(xtesttrain) <- gsub("-", ".", names(xtesttrain)) # remove -

# assign activity label to y data set
ytesttrain[, 1] <- actlabels[ytesttrain[, 1], 2]
names(ytesttrain) <- "activity"

# assign descriptive subject column name
names(subjecttesttrain) <- "subject"

# bind columns from x, y, and subject data sets
z <- cbind(subjecttesttrain, ytesttrain, xtesttrain)

# output resulting clean data set to text file
write.table(z, "cleandata.txt")


