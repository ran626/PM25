## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: get_avail.R
## Date: Dec 16th, 2017
## Description:
##  get available subset of db or dt data, whose value is not -9999 and flag is not 0
##  Args:
##		dir.data: the directory of data
##		dir.flag: the directory of flag
##  Returns:
##		the logical matrix of availability
Get.Avail <- function(dir.data, dir.flag){

  data <- read.csv(dir.data)
  data <- matrix(unlist(data), ncol = length(data), byrow = TRUE)
  
  flag <- read.csv(dir.flag)
  flag <- matrix(unlist(flag), ncol = length(flag), byrow = TRUE)
  
  filter.modis <- !(flag == -9999 | flag == 0 | data == -9999)
  return(filter.modis)
}