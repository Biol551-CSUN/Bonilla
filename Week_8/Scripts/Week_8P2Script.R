######################
### Advanced plotting 
### Created by: Brandon Bonilla 
### Created on: 2022-17-03
#####################

### Load Libraries ###
library(tidyverse)
library(here)
library(ggrepel)
library(patchwork)
library(magick)
library(gganimate)
library(palmerpenguins)
library(PNWColors)

#############
glimpse(penguins)

################
# New functions
#1 Name that makes sense
#2 List inputs or arguments
#3 Code placed in body of the function
#4 Return functions

df <- tibble::tibble(
  a = rnorm(10), # draws 10 random values from a normal distribution
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
head(df)

df<-df %>%
  mutate(a = (a-min(a, na.rm = TRUE))/(max(a, na.rm = TRUE)-min(a, na.rm = TRUE)))

rescale01 <- function(x) {
  value<-(x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x, na.rm = TRUE))
  return(value)
}
df %>%
  mutate(a = rescale01(a),
         b = rescale01(b),
         c = rescale01(c),
         d = rescale01(d))

###### Equations ####
temp_C<-(temp_F-32)*5/9

F_to_C<-function(temp_F){
  temp_C<-(temp_F-32)*5/9
  return(temp_C)
  }

F_to_C(32)

temp_K<-(temp_C+273.15)

C_to_K<-function(temp_C){
  temp_K<-(temp_C+273.15)
  return(temp_K)
  }
C_to_K(1)

pal<-pnw_palette("Lake",3, type = "discrete") # color palette 
ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, color = island))+
  geom_point()+
  geom_smooth(method = "lm")+ # linear model
  scale_color_manual("Island", values=pal)+   
  theme_bw()

myplot<-function(data = penguins, x, y){
  pal<-pnw_palette("Lake",3, type = "discrete") # color palette  
  ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
    geom_point()+
    geom_smooth(method = "lm")+ # linear model
    scale_color_manual("Island", values=pal)+   
    theme_bw()

  myplot(x = body_mass_g, y = flipper_length_mm)+
    labs(x = "Body mass (g)",
         y = "Flipper length (mm)")
  
  a <- 4
  b <- 5
  
  if (a > b) { # my question
    f <- 20 # if it is true give me answer 1
  } else { # else give me answer 2
    f <- 10
  }
  
myplot<-function(data = penguins, x, y, lines=TRUE ){ # add new argument for lines
pal<-pnw_palette("Lake",3, type = "discrete") # color palette 
if(lines==TRUE){
ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
  geom_point()+
  geom_smooth(method = "lm")+ # linear model
  scale_color_manual("Island", values=pal)+   # pretty colors and change the legend title
  theme_bw()
}
else{
ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
  geom_point()+
  scale_color_manual("Island", values=pal)+   # pretty colors and change the legend title
  theme_bw()
}
}