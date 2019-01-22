# Reference library for usage later on in the script
# library(tidyverse)
setwd("E:/school/University.Guelph/8020002 - DEOL Data Mining and Machine Learning/Project Assignment 2/data")

iris2 <- iris

# Then we remove species:
iris2$Species <- NULL

# Clustering with 3 clusters:
kmeans.result <- kmeans(iris2, 3)

# write the objects to the output directory
write.csv(iris, "../output/iris.raw.csv")
write.csv(iris2, "../output/iris2.raw.csv")

# The clustering result is then compared with the class label (Species) to check whether similar objects are grouped together. The result shows that cluster "setosa" can be easily separated from the other clusters, and the clusters "versicolor" and "virginica" are to a small degree overlapped with each other.
table(iris$Species, kmeans.result$cluster)

# K-means Clustering Visualizations
# We plot the clusters:
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)

# And we plot cluster centers:
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex=2)