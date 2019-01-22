# Assignment #2 - part 1
# 
# 1. Import data file (.csv) into 1 R object
# 2. Clustering with 2 attributes and 3 clusters
# 3. Compare the results
# 4. Visualize the results

# Load dplyr - used for select function
library(dplyr)

# Set the working directory through the script (instead of session in IDE)
# This script assumes you have source .csv files in the following folder
setwd("C:/Users/aaron/Desktop/R")
#setwd("E:/school/University.Guelph/8020002 - DEOL Data Mining and Machine Learning/Project Assignment 2/data")

# Read in rows from the file in the working directory
protein <- read.csv(file="protein.csv",head=TRUE,sep=",")

## PART 1 ##
# Create copy of protein object (protein1)
proteinTest <- protein

# Remove columns not included in P (part 1 just use 'RedMeat' and 'WhiteMeat' attributes)
proteinTest <- select(proteinTest, RedMeat, WhiteMeat, Eggs)

# Clustering with 3 clusters:
kmeans.result1 <- kmeans(proteinTest, 3)

# The clustering result is then compared with the class label
table(protein$Country, kmeans.result1$cluster)

# Plot the clusters:
plot(proteinTest[c("RedMeat", "WhiteMeat")], col = kmeans.result1$cluster)

# Plot cluster centers:
points(kmeans.result1$centers[,c("RedMeat", "WhiteMeat")], col = 1:3, pch = 8, cex=2)
