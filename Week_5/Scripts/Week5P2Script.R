#########################################
### Today we are learning how to make dates and times
### Created by: Brandon Bonilla
### Created on: 2022-02-24
### Notes ####
### Unique idea for each data set to match
###
#########################################

#### load libraries #####
library(here)
library(tidyverse)
library(beyonce)
library(lubridate)
library(dplyr)

###Load data###
today("GMT")

am(now()) #if its in morning

ymd("2022-02-24")
mdy("02/24/2021")
dmy("24/02/2021")
ymd_hms("2021-02-24 10:22:20 PM")

#character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
#convert to datetime
datetimes<- mdy_hms(datetimes)

month(datetimes,label = TRUE, abbr = FALSE) #spell it out

day(datetimes) #extract day

wday(datetimes, label = TRUE) #extract day of week

hour(datetimes)
minute(datetimes)
second(datetimes)

datetimes + hours(4) # this adds 4 hours

round_date(datetimes, "minute") #round to nearest minute
round_date(datetimes, "5 mins") #round to nearest 5 minute

###TPS###
ConData<-read_csv(here("Week_5","Data","CondData.csv"))%>% #adding data to R
  mutate(datetime = mdy_hms(depth))%>% #adding a new named column, drop NA
  drop_na()
#install_github catterplots

  