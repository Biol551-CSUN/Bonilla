#######################################################
### Today we are doing group work in lab ###
### Created by: Brandon Bonilla ################
### Updated on: 2022-02-15 #####################

### load libraries ####
library(here)
library(tidyverse)
library(palmerpenguins)
library(beyonce)

### Load data ######
# The data is part of the package and is called penguins
# How else besides glimpse can we inspect the data?
glimpse(penguins)
view(penguins)
###################################

penguin_summary<-penguins %>% #New dataframe
  drop_na(sex,species,island) %>% #removes columns with a missing value
  group_by(species,sex,island) %>% #group the specified data
  summarise(mean_body_mass = mean(body_mass_g , na.rm = TRUE), #creating new dataframe with desired means
            variance = var(body_mass_g , na.rm = TRUE))

view(penguin_summary)

penguin_plot<-penguins %>% #new dataframe
  filter(sex != "male") %>% #removing males
  mutate(log_mass = log(body_mass_g))%>% #adding column for log mass
  select(species, island, sex, log_mass) #selecting specific categories of data
view(penguin_plot)

ggplot(data = penguin_plot, #penguin plot is the new dataset comparing species with log mass
       mapping = aes(x = species,
                     y = log_mass))+
  geom_boxplot(aes(fill = species)) + #generating a boxplot with required fill functions
  scale_fill_manual(values = beyonce_palette(30))+ #adding desired color
  labs(title = "Body Mass Comparrison Across Species of Penguins",
       x = "Species",
       y = "Log Mass (g)",
       caption = "Source:Palmer Penguins LTER/ palmerpenguin package",
       fill = "Species")+ #Updating titles for data, axis, and legend
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA, color = "Black"))+
  scale_color_discrete(name = "Species") #fixing titles and colors


  



            