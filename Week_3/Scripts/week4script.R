### Today we are going to plot penguin data ####
### Created by: Brandon Bonilla ################
### Updated on: 2022-02-10 #####################

### Load Libraries ######
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)

### Load data ######
# The daata is part of the package and is called penguins
# How else besides glimpse can we inspect the data?
glimpse(penguins)

plot1<-ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species))+
  geom_point()+
  geom_smooth(method = "lm")+
  labs(x = "Bill depth (mm)",
       y = "Bill length (mm)")+
  #scale_color_viridis_d()+
  scale_color_manual(values = beyonce_palette(2))+
  theme_classic()+
  theme(axis.title = element_text(size = 20,
                                  color = "red"))
  scale_x_continuous(breaks = c(14,17,21),
                     labels = c("low","medium","high"))
  
  ggsave(here("Week_3","output","penguins.png"),
              width = 7, height = 5)
