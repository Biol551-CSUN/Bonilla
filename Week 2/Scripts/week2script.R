##################################################
### This is my first script. I am leasrning how to import data
### Created by: Brandon Bonilla 
### Created on: 2022-02-07
#############################################################

### load libraries ########
library(tidyverse)
library(here)

### Read in data #####
WeightData<-read_csv(here("Week_2","Data","weightdata.csv"))

# Data analysis #####
head(WeightData) # look at top 6 lines
tail(WeightData) # look at bottom 6 lines of dataframe
View(WeightData) # view the dataset