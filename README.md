# Getting-and-Cleaning-Data-Peer-Assignment

This is the course assignment for the Getting and Cleaning Data Course course. 

CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

The R script, run_analysis.R, does the following:
1. Loads activity and feature files
2. Loads both the training and test datasets, keeping only the mean and standard deviation data
3. Loads the activity and subject data for each dataset, and binds those columns with the dataset
4. Merges the two datasets
5. Converts the activity and subject columns into factors
6. Creates a tidy dataset that consists of the mean value of each variable for each subject and activity pair.

final_data.txt is the exported final data after going through all the sequences described above.
