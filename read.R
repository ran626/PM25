## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: read.R
## Date: Dec 16th, 2017
## Description:
##  read and work on all corresponding csv files of db and dt data in one folder
##  Args:
##      path.dir: the path of object folder
##  Returns:
##      df: the data frame with 4 columns: 
##          db: values of db
##          dt: values of dt
##          db.fg: values of db flags
##          dt.fg: values of dt flags
##  Plot:
##		the summary of linear regression on all <db,dt> pairs
##		+
##		the summary of linear regression on <db,dt> pairs whose db.fg or dt.fg is 3(the highest quality)

# load scripts
source("read_hdf.R")
source("split_prefix.R")
source("linear_regression.R")
source("merge_modis.R")

Read.Folder <- function(path.dir){
	# Get all files ended with "DB.csv" in the directory
	l <- as.vector(list.files(path = path.dir , pattern = "DB.csv", full.names = TRUE))
	# Get the prefixs of all files (i.e."MYD04_L2A200218502550062014195194443hdf")
	l2 <- lapply(l, Split.Prefix,"DB")
	# Get a list of all available db and dt data
	df <- lapply(l2, Read1.HDF)
	# Get a vector of all available db data
	db.vector <- numeric(0)
	db.vector <- unlist(c(db.vector,sapply(df, Merge.Modis,"db", simplify = TRUE)))
	# Get a vector of all available db.fg data
	db.fg.vector <- numeric(0)
	db.fg.vector <- unlist(c(db.fg.vector,sapply(df, Merge.Modis,"db.fg", simplify = TRUE)))
	# Get a vector of all available dt data
	dt.vector <- numeric(0)
	dt.vector <- unlist(c(dt.vector,sapply(df, Merge.Modis,"dt", simplify = TRUE)))
	# Get a vector of all available dt.fg data
	dt.fg.vector <- numeric(0)
	dt.fg.vector <- unlist(c(dt.fg.vector,sapply(df, Merge.Modis,"dt.fg", simplify = TRUE)))

	# Get the data frame with 4 columns: 
		##          db: values of db
		##          dt: values of dt
		##          db.fg: values of db flags
		##          dt.fg: values of dt flags
	df.all <- data.frame(db = db.vector, dt = dt.vector, db.fg = db.fg.vector, dt.fg = dt.fg.vector)
	# Print all summaries of linear regression models
	Linear.Regression(df.all)
	# Return the data frame 
	return(df.all)

}

