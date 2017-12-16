## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: merge_db_dt.R
## Date: Dec 16th, 2017
## Description:
##  merge available scopes from both DB and DT, and then ruturn matching data and corresonding flag values
##  Args:
##      r.DB: logical matrix of DB availability
##      r.DT: logical matrix of DT availability
##      dir.data.DB: directory of DB data
##      dir.data.DT: directory of DT data
##      dir.data.DB.FG: directory of DB flag data
##      dir.data.DT.FG: directory of DBT flag data
##  Returns:
##      df: all available data as a data frame
Merge.DB.DT <- function(r.DB,r.DT, dir.data.DB, dir.data.DT, dir.data.DB.FG, dir.data.DT.FG){
  # Get the logical matrix which both DB and DT are TRUE
  filter.modis <- r.DB & r.DT
  # Whether all elements are FALSE
  if (sum(filter.modis==FALSE) != length(filter.modis)){
    # Define a function Filter which returns d if f is TRUE
    Filter <- function(f, d){
      if(f) {
        #print(d)
        return(d)
      }
    }
    # Read DB and DB flag
    data.DB = read.csv(dir.data.DB)
    data.DB = matrix(unlist(data.DB), ncol = length(data.DB), byrow = TRUE)
    flag.DB <- read.csv(dir.data.DB.FG)
    flag.DB <- matrix(unlist(flag.DB), ncol = length(flag.DB), byrow = TRUE)
    # Get available DB and DB flag
    result.DB <- mapply(Filter, f = filter.modis, d = data.DB)
    result.DB.FG <- mapply(Filter, f = filter.modis, d = flag.DB) 
    
    # Read DT and DT flag
    data.DT = read.csv(dir.data.DT)
    data.DT = matrix(unlist(data.DT), ncol = length(data.DT), byrow = TRUE)
    flag.DT <- read.csv(dir.data.DT.FG)
    flag.DT <- matrix(unlist(flag.DT), ncol = length(flag.DT), byrow = TRUE)
    # Get available DT and DT flag
    result.DT <- mapply(Filter, f = filter.modis, d = data.DT)
    result.DT.FG <- mapply(Filter, f = filter.modis, d = flag.DT) 
    
    # Return all available data as a data frame
    df <- data.frame(db = unlist(result.DB), dt = unlist(result.DT), db.fg = unlist(result.DB.FG), dt.fg = unlist(result.DT.FG))
    return(df)      
  } else {
    return(NULL)
  }
}


