## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: split_prefix.R
## Date: Dec 16th, 2017
## Description:
##  return the first part after string split. For example, 
##    '../PM25_TEST/MYD04_L2A200218504300062014195194225hdfDB.csv' is split into two parts
##    '../PM25_TEST/MYD04_L2A200218504300062014195194225hdf' and '.csv, and return
##    prefix '../PM25_TEST/MYD04_L2A200218504300062014195194225hdf'
##  Args:
##        str: the string to be splited
##        keyword: the keyword used to split
##  Returns:
##        prefix: the first part after string split
Split.Prefix <- function(str, keyword){
  prefix <- strsplit(str,keyword)[[1]][1]
  return(prefix)
}