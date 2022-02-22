###########################
### Today we are going to practice tidy with biogeochemisrty data from LA ###
### Created by: Brandon Bonilla ###############
### Created on: 2022-02-17 ####################

### load libraries ###
library(tidyverse)
library(here)
library(beyonce)

### Load data ###
ChemData<-read_csv(here("Week_4", "Data", "chemicaldata_maunalua.csv"))

ChemData_clean<-ChemData %>%
  filter(complete.cases(.))%>% #remove missing values
  separate(col = Tide_time, #choose the tide time col
           into = c("Tide", "Time"), #separate it into two columns Tide and time 
           sep = "_") #separate by _
ChemData_long<-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot
               names_to = "Variables", # the names of the new cols with all variables 
               values_to = "Values") #names of the new columns with all values

ChemData_long %>%
  group_by(Variables, Zone, Tide, Site)%>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE),
            Param_sd = sd(Values, na.rm = TRUE)) # get variance
ChemData_long%>%
  ggplot(aes(x = Site, #plotting the data
             y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") #arranging the plot more efficiently 

ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names 
              values_from = Values)

ChemData_clean<-ChemData %>%
  filter(complete.cases(.)) %>% #remove missing values
  separate(col = Tide_time,
           into = c("Tide","Time"),
           sep = "_",
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd,# the cols you want to pivot
               names_to = "Variables",# the names of the new cols with all variables
               values_to = "Values") %>% #names of the new columns with all values
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>% #creating new dataframe with desired means
  pivot_wider(names_from = Variables,
              values_from = mean_vals) %>%
  write_csv(here("Week_4","Output","summary.csv"))


  
view(ChemData_long)


