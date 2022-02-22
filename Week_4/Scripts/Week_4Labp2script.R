###########################
### Today we are going to practice tidy with biogeochemisrty data from LA ###
### Created by: Brandon Bonilla ###############
### Created on: 2022-02-17 ####################

### load libraries ###
library(tidyverse)
library(here)
library(beyonce)

### Load Data ###
ChemData<-read_csv(here("Week_4", "Data", "chemicaldata_maunalua.csv"))

ChemData_clean<-ChemData %>%
  filter(complete.cases(.),
         Site == "BP")%>%
  separate(col = Tide_time, #choose the tide time col
           into = c("Tide", "Time"), #separate it into two columns Tide and time 
           sep = "_",
           remove = FALSE) #separate by _
ChemData_long<-ChemData_clean %>%
  pivot_longer(cols = Salinity:TA, # the cols you want to pivot
               names_to = "Variables", # the names of the new cols with all variables 
               values_to = "Values") #names of the new columns with all values

ChemData_Short<-ChemData_long %>%
  group_by(Variables,Season,Tide,Time)%>% #gathering the data to be plotted
  summarise(mean_vals = mean(Values, na.rm = TRUE))

ChemData_long%>%
  ggplot(mapping = aes(x = Season,
             y = Values, fill = Season))+ #providing desired x and y axis
  geom_violin()+ #creating the type of plot desired
  facet_wrap(~Variables, scale = "free")+
  scale_fill_manual(values = beyonce_palette(30)) + #giving my data the desired color
  labs(title = "Difference of the Seasons") #Labeling the title of my data

View(ChemData_Short)

