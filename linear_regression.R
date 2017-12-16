## Copyright (c) Chengxi Zhu. All rights reserved.
## Licensed under the MIT License. See LICENSE file in the project root for full license information.
## Authors: Chengxi Zhu: chengxiz@buffalo.edu
## File: linear_regression.R
## Date: Dec 16th, 2017
## Description:
##  plot multtiple linear regression of <db,dt> pairs
##  Args:
##      df: the data frame with 4 columns: 
##          db: values of db
##          dt: values of dt
##          db.fg: values of db flags
##          dt.fg: values of dt flags
##  Returns:
##      NULL
##  Plot:
##    the summary of linear regression on all <db,dt> pairs
##    +
##    the summary of linear regression on <db,dt> pairs whose db.fg or dt.fg is 3(the highest quality)
Linear.Regression <- function(df){
  if (length(df) != 0){
    fit <- lm(db ~ dt, data = df)
    print(summary(fit))
    
    df.3.3 <- df[df$db.fg==3 & df$dt.fg == 3,]
    fit.3.3 <- lm(db ~ dt, data = df.3.3)
    print(summary(fit.3.3))
    
    # df.3.2 <- df[df$db.fg==3 & df$dt.fg == 2,]
    # fit.3.2 <- lm(db ~ dt, data = df.3.2)
    # print(summary(fit.3.2))
    
    # df.3.1 <- df[df$db.fg==3 & df$dt.fg == 1,]
    # fit.3.1 <- lm(db ~ dt, data = df.3.1)
    # print(summary(fit.3.1))
    
    # df.2.3 <- df[df$db.fg==2 & df$dt.fg == 3,]
    # fit.2.3 <- lm(db ~ dt, data = df.2.3)
    # print(summary(fit.2.3))
    
    # df.2.2 <- df[df$db.fg==2 & df$dt.fg == 2,]
    # fit.2.2 <- lm(db ~ dt, data = df.2.2)
    # print(summary(fit.2.2))
    
    # df.2.1 <- df[df$db.fg==2 & df$dt.fg == 1,]
    # fit.2.1 <- lm(db ~ dt, data = df.2.1)
    # print(summary(fit.2.1))
    
    # df.1.3 <- df[df$db.fg==1 & df$dt.fg == 3,]
    # fit.1.3 <- lm(db ~ dt, data = df.1.3)
    # print(summary(fit.1.3))
    
    # df.1.2 <- df[df$db.fg==1 & df$dt.fg == 2,]
    # fit.1.2 <- lm(db ~ dt, data = df.1.2)
    # print(summary(fit.1.2))
    
    # df.1.1 <- df[df$db.fg==1 & df$dt.fg == 1,]
    # fit.1.1 <- lm(db ~ dt, data = df.1.1)
    # print(summary(fit.1.1))
  } else {
    print(" There is no data in the directory provided. Please check it and try again")
  }
}