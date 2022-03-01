#########################################
### Today we are learning how to make joins and tibble
### Created by: Brandon Bonilla
### Created on: 2022-02-22
### Notes ####
### Unique idea for each data set to match
###
#########################################

#### load libraries #####
library(here)
library(tidyverse)
library(beyonce)


#### read in data ####
#Environmental data from each site
EnviroData<-read_csv(here("Week_5","data","site.characteristics.data.csv"))

#Thermal performance data
TPCData<-read_csv(here("Week_5","data","Topt_data.csv"))

glimpse(EnviroData)
glimpse(TPCData)

EnviroData_wide <- EnviroData %>%
  pivot_wider(names_from = parameter.measured,
              values_from = values) %>%
  arrange(site.letter) #arrange dataframe by site

View(EnviroData_wide)

FullData_left<-left_join(TPCData, EnviroData_wide)%>% ## joining by ="site letter"
  relocate(where(is.numeric), .after = where(is.character)) %>%
  pivot_longer(cols = E:substrate.cover,
               names_to = "Variables",
               values_to = "Values")# relocate data
FullData_left<group_by(Variables, Values, fragment.ID, name)%>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE),
            Param_sd = sd(Values, na.rm = TRUE)) # get variance
sum<-FullData_left%>%
  group_by(site.letter)%>%
  summarise_if(is.numeric, 
               list(mean = mean,
                    var = var),
               na.rm = TRUE)

head(FullData_left)

#summarise_at(vars(E:substrate.cover), list(mean = mean, variance = vars), na.rm = TRUE)

#TIBBLES
T1<-tibble(Site.ID = c("A","B","C","D"),
           Temperature = c(14.1,16.2,17.2,18.2))
T1

T2<-tibble(Site.ID = c("A","B","C","D"),
           pH = c(4.1,6.2,7.2,8.2))
T2

left_join(T1,T2)

inner_join(T1,T2)

semi_join(T1,T2)

anti_join(T1,T2)

#install.packages("cowsay")