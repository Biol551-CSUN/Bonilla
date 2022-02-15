##################
# Week 3 Penguins
# Created by: Brandon Bonilla 
# Created on: 2022-02-08
###############

### load libraries #######
library(palmerpenguins)
library(tidyverse)

##### Data analysis ######
glimpse(penguins)

#### dataframe ####
ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island,
                     size = body_mass_g,
                     alpha = flipper_length_mm)) +
  geom_point()+
  facet_grid(sex~species)+
  labs(title = "Bill depth and length",
      subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
      x = "Bill depth (mm)", y = "Bill length (mm)",
      color = "Species",
      caption = "Source: Palmer Station LTER/ palmer penguin package") +
  scale_color_viridis_d() 
    
  



