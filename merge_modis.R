## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: merge_modis.R
## Date: Dec 16th, 2017
## Description:
##  return the vector with input keyword from the list
##  Args:
##      df: the data frame of all merged available modis data
##      keyword: the keyword of the vector we want to extract
##  Returns:
##      the vector (of db or dt or db.fg or dt.fg)
Merge.Modis <- function(df, keyword){
  if (!is.null(df)){
    return(df[[keyword]])
  }
}