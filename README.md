---
title: "GETTING AND CLEANING DATA ASSIGNMENT"
output: html_document
---

This project implements the steps in the following resources, in order to prepare data for further Statistical Analysis :

1. <https://github.com/jtleek/datasharing> and 
2. **C**oursera course **Getting and Cleaning Data**

The main data is taken from the site: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> and then cleaned and prepared as per the instructions mentioned in CodeBook.md

## Environment

This project assumes that you have all the required software mentioned below installed and have at least 500MB of space in your hard disk

The environment used for this application is mentioned below. Please note that these steps were run in MAC OS X therefore there will be some steps in the R code which will not be immediately portable to other systems (;e.g: use of "curl" method to download file)

```
Rcommand> version
```

```
##                _                           
## platform       x86_64-apple-darwin13.1.0   
## arch           x86_64                      
## os             darwin13.1.0                
## system         x86_64, darwin13.1.0        
## status                                     
## major          3                           
## minor          2.1                         
## year           2015                        
## month          06                          
## day            18                          
## svn rev        68531                       
## language       R                           
## version.string R version 3.2.1 (2015-06-18)
## nickname       World-Famous Astronaut
```


## Data Dictionary and Description of Transformations:

All the data description, measurements, steps for cleaning up the data is mentioned in the file CodeBook.md

## R Code:

The main R code for downloading the data and running the transformations and generating the required file is in `run_analysis.R`. 

`run_analysis.R` should run without any issues provided you are using MAC OS X otherwise with minor changes in UBUNTU or Windows

The comments in the code mention where changes should be made in order to run the command in non MAC OS X Operating System.

Please also note the version of R  as this code has not been tested for R version forward and backward compatibility
