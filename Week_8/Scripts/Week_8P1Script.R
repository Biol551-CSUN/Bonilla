######################
### Advanced plotting 
### Created by: Brandon Bonilla 
### Created on: 2022-15-03
#####################

### Load Libraries ###

library(tidyverse)
library(here)
library(ggrepel)
library(patchwork)
library(magick)
library(gganimate)
library(palmerpenguins) 
#############
glimpse(penguins)

################
# p1 
p1<-penguins%>%
  ggplot(aes(x=body_mass_g,
             y=bill_length_mm,
             color=species))+
  geom_point()


# p2
p2<-penguins%>%
  ggplot(aes(x=sex,
             y=body_mass_g,
             color=species))+
  geom_point()
p1+p2 +
  plot_layout(guides = 'collect')+
  plot_annotation(tag_levels = 'A')

p1/p2+
  plot_layout(guides = 'collect')+
  plot_annotation(tag_levels = 'A')

view(mtcars)

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   label = rownames(mtcars))) +
  geom_text() + # create text label
  geom_label_repel()+ # repel them
  geom_point(color = 'red')
########################
# Animations

penguins %>%
  ggplot(aes(x = body_mass_g, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point()+
  transition_states(
    year, # what we are animating by
    transition_length = 2, # length of transition
    state_length = 1)+ # length between transition
  ease_aes("sine-in-out")+
  ggtitle('Year: {closest_state}')+
  anim_save(here("Week_8","Output", "mypenguinif.gif"))
#################################
# Magick

penplot<-penguins%>%
  ggplot(aes(x=sex,
             y=body_mass_g,
             color=species))+
  geom_point()+
  ggsave(here("Week_8","Output","penguinplot.png")

  
penguin<-image_read("https://pngimg.com/uploads/penguin/pinguin_PNG9.png")
penguin

penplot<-image_read(here("Week_8","Output","penguinplot.png"))

out <- image_composite(penplot, penguin, offset = "+70+30")
out
