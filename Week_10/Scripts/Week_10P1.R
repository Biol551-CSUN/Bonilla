################
### Created by: Brandon Bonilla 
### Created on: 2022-05-04
###
####################

### Load Libraries ###
library(tidyverse)
library(here)
library(reprex)
library(datapasta)
library(styler)

mpg %>%
  ggplot(aes(x = displ, y = hwy))%>%
  geom_point(aes(color = class))

lat,long,star_notibble::tribble(
  ~lat,    ~long, ~star_no,
  33.548, -117.805,      10L,
  35.534, -121.083,       1L,
  39.503, -123.743,      25L,
  32.863,  -117.24,      22L,
  33.46, -117.671,       8L
)

33.548,-117.805,10
35.534,-121.083,1
39.503,-123.743,25
32.863,-117.24,22
33.46,-117.671,8
