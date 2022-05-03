######################
### Looping Purrs
### Created by:Brandon Bonilla
### Created on: 2022-04-26
###################


#### Load Libraries ####
library(tidyverse)
library(here)

### Learning Looping ###
print(paste("The year is", 2000))

years<-c(2015:2021)
for (i in years){ # set up the for loop where i is the index
  print(paste("The year is", i)) # loop over i
}

#Pre-allocate space for the for loop
# empty matrix
year_data<-data.frame(matrix(ncol = 2, nrow = length(years)))
# add column names
colnames(year_data)<-c("year", "year_name")
year_data

for (i in 1:length(years)){ # set up the for loop where i is the index
  year_data$year_name[i]<-paste("The year is", years[i]) # loop over i
  year_data$year[i]<-years[i] # loop over year
}
year_data

testdata<-read_csv(here("Week_13", "data", "cond_data","011521_CT316_1pcal.csv"))
glimpse(testdata)

CondPath<-here("Week_13", "data", "cond_data")
# list all the files in that path with a specific pattern
# In this case we are looking for everything that has a .csv in filename
# you can use regex to be more specific if you are looking for certain patterns in filenames
files <- dir(path = CondPath,pattern = ".csv")
files

# make an empty dataframe that has one row for each file and 3 columns
cond_data<-data.frame(matrix(nrow = length(files), ncol = 3))
# column names
colnames(cond_data)<-c("filename","mean_temp", "mean_sal")
cond_data

raw_data<-read_csv(paste0(CondPath,"/",files[1])) # reading in the first file and see if it works
head(raw_data)

for (i in 1:length(files)){ # loop over 1:3 the number of files 
  raw_data<-read_csv(paste0(CondPath,"/",files[i]))
  #glimpse(raw_data)
  cond_data$filename[i]<-files[i]
  cond_data$mean_temp[i]<-mean(raw_data$Temperature, na.rm =TRUE)
  cond_data$mean_sal[i]<-mean(raw_data$Salinity, na.rm =TRUE)
}

### Map Functions ###
1:10 %>% # a vector from 1 to 10 (we are going to do this 10 times) %>% # the vector to iterate over
  map(rnorm, n = 15)  %>% # calculate 15 random numbers based on a normal distribution in a list 
  map_dbl(mean) # calculate the mean. It is now a vector which is type "double"

1:10 %>% # list 1:10
  map(function(x) rnorm(15, x)) %>% # make own function
  map_dbl(mean)
1:10 %>%
  map(~ rnorm(15, .x)) %>% # changes the arguments inside the function
  map_dbl(mean)

# location on the computer of the folder
CondPath<-here("Week_13", "data", "cond_data")
files <- dir(path = CondPath,pattern = ".csv")
files
files <- dir(path = CondPath,pattern = ".csv", full.names = TRUE)
#save the entire path name
files

data<-files %>%
  set_names()%>% # set's the id of each list to the file name
  map_df(read_csv,.id = "filename") %>% # map everything to a dataframe and put the id in a column called filename
  group_by(filename) %>%
  summarise(mean_temp = mean(Temperature, na.rm = TRUE),
            mean_sal = mean(Salinity,na.rm = TRUE))
data

Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
remotes::install_github("jespermaag/gganatogram")

library(gganatogram)
gganatogram(data = hgFemale_key,
            organism = "human", sex = "female",
            fill = "colour", fillOutline = "#a6bddb") +
  theme_void() + 
  coord_fixed()
hgMale_key %>%
  filter(type %in% "nervous_system") %>%
  gganatogram(organism = "human", sex = "male",
              fill = "colour", outline = FALSE) +
  theme_void() + 
  coord_fixed()
gganatogram(data = cell_key$cell,
            organism = "cell",
            fillOutline = "#a6bddb", fill = "colour") +
  theme_void() +
  coord_fixed()