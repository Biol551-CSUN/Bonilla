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


###Load data###

CondData<-read_csv(here("Week_5","Data","CondData.csv"))
DepthData<-read_csv(here("Week_5","Data","DepthData.csv"))

###data analysis###
CondData_time<- CondData%>%
  mutate(datetime = mdy_hms(depth),# dates by month,date,year
         datetime = round_date(datetime, "10 seconds"))%>% #round to 10 seconds
  drop_na()
View(ConData_Time)
DepthData_Time<- DepthData%>%
  mutate(datetime = ymd_hms(date), #dates by month,date,year
         datetime = round_date(datetime, "10 seconds"))%>% #rounding to 10 seconds
  drop_na()
View(DepthData_Time)

CondandDepth<-inner_join(ConData_Time,DepthData_Time)%>% #connecting the two data sets
  select(datetime, Depth, TempInSitu, SalinityInSitu_1pCal)%>% #getting the columns needed
  mutate(hours = hour(datetime),
         minutes = minute(datetime))%>% #separate time by hours and minutes
  group_by(minutes)%>%
  summarize(mean_datetime = mean(datetime, na.rm = TRUE),#calculating means for selected columns
            mean_Depth = mean(Depth, na.rm = TRUE),
            mean_TempInSitu = mean(TempInSitu, na.rm = TRUE),
            mean_SalinityInSitu_1pCal = mean(SalinityInSitu_1pCal, na.rm = TRUE))
view(CondandDepth)

###plotting###
CondandDepth%>% #running the script
  ggplot(aes(x = mean_TempInSitu,
             y = mean_SalinityInSitu_1pCal,
             color = mean_Depth))+ #coding the color
  geom_point()+
  geom_smooth()+
  labs(title = "Salinity and Depth Over Temperature",
       x = "Temperature (c)",
       y = "Salinity",
       fill = "Depth")+ #this should have changed the legend title but it did not seem to :/
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA,
                                    color = "black"))# appropriate border
