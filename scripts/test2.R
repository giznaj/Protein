# Assignment #2
# 
# 1. Imports each data file into R
# 2. Merges data files into one object

# Set the working directory through the script (instead of session in IDE)
# This script assumes you have source .csv files in the folder
setwd("E:/school/University.Guelph/8020002 - DEOL Data Mining and Machine Learning/Project Assignment 2/data")

# Read in rows from the file in the working directory
proteinobject <- read.csv(file="protein.csv",head=TRUE,sep=",")

# Write the data.table as-is (THIS CAN BE LARGE)
# Uncomment if you need to see the file in Excel
write.csv(proteinobject, "../merged/proteinobject.raw.csv")

kmeans.result <- kmeans(proteinobject, 3)
#table(mergedtable, kmeans.result$cluster)