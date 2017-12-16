## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: main.R
## Date: Dec 16th, 2017
## Description:
##  main.R conducts the functions. 

# Remove all from the workspace
rm(list=ls(all=TRUE))

source('read.R')

# Get your current working directory
getwd()
setwd('F://Ran_Li/PM25')
# Read all each 4 csv files (db.csv, df.csv, db_fg.csv, df_fg.csv) 
# For all in a folder

df <- Read.Folder('../2002185')
# Read.Folder('../mod04_L2_new')


