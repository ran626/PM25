## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: read_hdf.R
## Date: Dec 16th, 2017
## Description:
##  read data based on dir.data 
##  then ruturn matching data and corresonding flag values
##  Args:
##    dir.data: path + name of hdf prefix (i.e. '../PM25_TEST/MYD04_L2A200218504300062014195194225hdf')
##  Returns:matching data and corresonding flag values
##    the data.frame oa all matching data and corresonding flag values

Read1.HDF <- function(dir.data){
	source('get_avail.R')
	source('merge_db_dt.R')
	# Set file path
	
	dir.data.DB = paste(dir.data , 'DB.csv',sep="")
	dir.data.DB.FG = paste(dir.data , 'DB_FG.csv',sep="")
	# Get available scope of DB data
	r.DB <- Get.Avail(dir.data.DB, dir.data.DB.FG)

	# Set file path
	dir.data.DT = paste(dir.data , 'DT.csv',sep="")
	dir.data.DT.FG = paste(dir.data , 'DT_FG.csv',sep="")
	# Get available scope of DT data
	r.DT <- Get.Avail(dir.data.DT, dir.data.DT.FG)

	# Merge available scopes from both DB and DT, 
	# and then ruturn matching data and corresonding flag values
	df <- Merge.DB.DT(r.DB, r.DT, dir.data.DB, dir.data.DT, dir.data.DB.FG, dir.data.DT.FG)
	return(df)
}