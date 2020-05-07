# Protein

Find groups of data in sample set (countries, meat, food, protein, consumption)

### High Level
* Import data file (.csv) into 1 R object
* Clustering with 2 attributes and 3 clusters
* Compare the results
* Visualize the results

### Low Level
* load libraries
* set environment variables
* import the data
* create copy of object
* remove columns not needed
* apply kmeans cluster to data
* compare result to class label
* plot clusters
* plot cluster centers
* repeat for 2nd part

### Analysis
Part 1 - Plot is very easy to see the 3 clusters.  There is 1 point (sweeden) that could almost go into	Part 1 - Plot is very easy to see the 3 clusters.  There is 1 point (sweeden) that could almost go into
any of the 3 groups.  The cluster furthest to the right (5 points) is unique to the other 2 with respect	any of the 3 groups.  The cluster furthest to the right (5 points) is unique to the other 2 with respect
to the RedMeat, where the other 2 clusters more to the left are similar in RedMeat, but unique in WhiteMeat	to the RedMeat, where the other 2 clusters more to the left are similar in RedMeat, but unique in WhiteMeat.
The 'withinss' is relatively small as all data points are close the centroid.	The 'withinss' is relatively small as all data points are close the centroid.

#### Notes
This project makes use of the library(dplyr) for all 'select' functions.  
To use the script, clone the repo and run the protein1.R script.  Script contains relative paths so this project can be cloned in any location.
