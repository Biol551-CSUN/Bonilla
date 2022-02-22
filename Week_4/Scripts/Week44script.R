### Today we are going to plot penguin data ####
### Created by: Brandon Bonilla ################
### Updated on: 2022-02-15 #####################

### load libraries ####
library(here)
library(tidyverse)
library(palmerpenguins)

### Load data ######
# The data is part of the package and is called penguins
# How else besides glimpse can we inspect the data? Summary
glimpse(penguins)
head(penguins)
###################################
filter(.data = penguins, #Filter to specify selected data
       sex == "females",
       year == "2008",
       body_mass_g > 5000)

filter(.data = penguins,
       year == "2008|2009",
       island != "Dream", #excluding data Dream
       species == "Adelie , 
       Ganeoo")
###################################
data2<-mutate(.data = penguins, #Mutate to add column variable
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)
data2<-mutate(.data = penguins,
              after_2008 = ifelse(year>2008, "After 2008","Before 2008"))
data2<-mutate(.data = penguins,
              flipper_length_body_mass = flipper_length_mm + body_mass_g)
data2<-mutate(.
View(data2)  
###################################
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% # calculate log biomass
  select(Species = species, island, sex, log_mass) 

penguins %>%
  group_by(island, sex) %>% # group by everything we want
  summarise(mean_flipper = mean(flipper_length_mm , na.rm=TRUE),#creating new dataframe with desired means and mins
           min_flipper = min(flipper_length_mm, na.rm = TRUE))

penguins %>%
  drop_na(sex) %>% #removes columns with a missing value
  ggplot(aes(x = sex, y = flipper_length_mm))+
  geom_boxplot() #final boxplot
