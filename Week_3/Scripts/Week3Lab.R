### Today we are going to plot penguin data ####
### Created by: Brandon Bonilla ################
### Updated on: 2022-02-10 #####################

### Load Libraries ######
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)

### Load data ######
# The data is part of the package and is called penguins
# How else besides glimpse can we inspect the data?
glimpse(penguins)

ggplot(data = penguins,
       mapping = aes(x = species,
                     y = body_mass_g))+
  geom_boxplot(aes(fill = species))+
  geom_dotplot(binaxis = "y",
               dotsize = 0.3,
               stackdir = "center")+
  scale_fill_manual(values = beyonce_palette(39))+
  labs(title = "Body Mass Across Penguin Species",
       x = "Species",
       y = "Body Mass (G)")+
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA, color = "Black"))
  

