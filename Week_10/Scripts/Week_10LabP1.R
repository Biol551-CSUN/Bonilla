#################
### Week 10 Lab 
### Created by: Brandon Bonilla
### Group 5: Brandon, Alex, Vivian, Sophia

## Libraries ##
library(tidyverse)
library(palmerpenguins)

## Data Analysis ##
penguin%>%
  ggplot(aes(x = bill_depth_mm,
             y = bill_depth_mm), #Bill depth x and y same variable 
         color = islands)+ #Island misspelled 
  geom_point()+
  geom_smooth(method = "lm")+ #Lm error
  labs(title = "Penguin Bills",
       x = "Length (mm)",
       y = "Depth (mm)",
       color = "Islands")

## Group 1 Debugged ##
stars %>%
  ggplot(aes(x = lat,
             y = long)) +
  geom_point() +
  theme(axis.title = element_text(size = 2),
        panel.background = element_rect(fill = 'blue'),
        plot.background = element_rect(fill = 'white')) +
  labs( x = "Latitude",
        y = "Longitude")

