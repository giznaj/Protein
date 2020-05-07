# Assignment #2 - part 1
# 
# 1. Import data file (.csv) into 1 R object
# 2. Clustering with 2 attributes and 3 clusters
# 3. Compare the results
# 4. Visualize the results

# Load dplyr - used for 'select' function
library(dplyr)

# Get the cuurent working directory of the running script
WD = dirname(rstudioapi::getSourceEditorContext()$path)
if (!is.null(WD)) setwd(WD)
print(WD)

# Set the working directory through the script (instead of session in IDE)
# This script assumes you have source .csv file(s) in the following folder.  Switch appropriately based on environment
#setwd("E:/school/University.Guelph/8020002 - DEOL Data Mining and Machine Learning/Project Assignment 2/data")

# Read in rows from the file in the working directory
protein <- read.csv(file="../data/protein.csv",head=TRUE,sep=",")

## PART 1 ##
# Create copy of protein object (protein1)
protein1 <- protein

# Remove columns not included in p (part 1 just uses 'RedMeat' and 'WhiteMeat' attributes)
protein1 <- select(protein1, RedMeat, WhiteMeat)

# Clustering with 3 clusters:
kmeans.result1 <- kmeans(protein1, 3)

# The clustering result is then compared with the class label.  Each row (n) is set to a particular cluster.  No country falls into 2 ore more clusters
table(protein$Country, kmeans.result1$cluster)

# Plot the clusters: (below attributes are what is clustered in the plot)
plot(protein1[c("RedMeat", "WhiteMeat")], col = kmeans.result1$cluster)

# Plot cluster centers:
points(kmeans.result1$centers[,c("RedMeat", "WhiteMeat")], col = 1:3, pch = 8, cex=2)


## PART 2 ##
# Create copy of protein object (protein2)
protein2 <- protein

# Remove the 'country' column: (Part #2 clusters all attribs and only removes the country column which is a categorical attrib)
protein2$Country <- NULL

# Clustering with 7 clusters:
kmeans.result2 <- kmeans(protein2, 7)

# The clustering result is then compared with the class label.  Each row (n) is set to a particular cluster.  No country falls into 2 ore more clusters
table(protein$Country, kmeans.result2$cluster)

# Plot the clusters: (below attributes are what is clustered in the plot)
plot(protein2[c("Milk", "Cereals")], col = kmeans.result2$cluster)

# Plot cluster centers:
points(kmeans.result2$centers[,c("Milk", "Cereals")], col = 1:3, pch = 4, cex=1)


## Analysis - adding as comments in code because assignment asks for one file ##
# Part 1 - Plot is very easy to see the 3 clusters.  There is 1 point (sweeden) that could almost go into
# any of the 3 groups.  The cluster furthest to the right (5 points) is unique to the other 2 with respect
# to the RedMeat, where the other 2 clusters more to the left are similar in RedMeat, but unique in WhiteMeat
# The 'withinss' is relatively small as all data points are close the centroid.

# Part 2 - Plot is a little harder to visualize and see the clusters.  The clusters don't look as defined and the
# 'withinss' values being higher reflects this.

# The points I took away that resonate with me from this section are 'what are you asking' when doing the clustering
# exercise on the data points?  I like the example of putting a bunch of pictures of various objects and having
# the algorithm put them into groups. Groups could end up as "cars", "houses", "People" and "Places".