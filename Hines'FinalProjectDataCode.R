#Here, I start by uploading the dataset and installing and preparing the materials to use for my maps.#
shootings <- read.csv("shootings.csv")
install.packages("ggplot2")
install.packages("maps")
install.packages("dplyr")
library(maps)
library(ggplot2)
library(dplyr)

#First, I started to focus on the year 2008. So, I subsetted my 'shootings' dataset to the year of 2008.#
subset_data2008 <- subset(shootings, year == 2008)

#Next, I created a new dataset for the states that had mass shootings in 2008.#
state_data2008 <- data.frame(
  State = c("California", "Arizona", "Illinois", "Missouri", "Kentucky", "Arkansas"))

#From there, I separated the states by values; Democratic states or Republican states, which were based on their political leaning in 2008.#
democratic_states2008 <- c("California", "Illinois")

republican_states2008 <- c("Arizona", "Missouri", "Kentucky",
                           "Arkansas")

#To prepare my map for 2008, I made a new dataset based on the map data and state.#
massshootingsstates_2008 <- map_data("state")

#I then created a new variable in the dataset titled 'PoliticalStance' by using the $. To give the Democratic and Republican states their individual numerical values to separate them, I used an ifelse statement where Democratic states recieved a '1' and Republican states received a '0' and the other states were N/A.#
massshootingsstates_2008$PoliticalStance <- ifelse(massshootingsstates_2008$region %in% tolower(democratic_states2008), 1,  ifelse(massshootingsstates_2008$region %in% tolower(republican_states2008), 0, NA))

#This is how I plotted my map for 2008.I made sure to use the new 'PoliticalStance' variable and assigned them colors; red for Republican and 0 with blue for Democratic and 1.#
ggplot()+
  geom_polygon(data = massshootingsstates_2008, aes(x = long, y = lat, group = group, fill = as.factor(PoliticalStance)))+
  scale_fill_manual(values=c("red","blue"), name="Political Stance") +
  labs(title = "Mass Shootings in States by Political Stance in 2008",
       subtitle = "Data from Mass Shootings Dataset") +
  theme_void() +
  coord_quickmap()

#For the year of 2016, I completed the same process for 2008 here. I needed to start at the begining and subset my data from the original 'shootings' dataset by the year of 2016. And then I went through each step the same way, but for 2016.#
subset_data2016 <- subset(shootings, year == 2016)

#This time, there were twenty-four states in 2016 that held mass shootings, ten for Democratic states and fourteen for Republican states.#
state_data2016 <- data.frame(
  State = c("California", "Delaware", "Illinois", "Maryland",
            "Massachusetts", "New Jersey", "New York",
            "New Mexico", "Virginia", "Washington", "Alabama", "Arizona", "Florida", "Georgia", "Kansas",
            "Kentucky", "Louisiana", "Michigan", "Mississippi",
            "Missouri", "North Carolina", "Pennsylvania",
            "Tennessee", "Texas"))

democratic_states2016 <- c("California", "Delaware", "Illinois", "Maryland", 
                       "Massachusetts", "New Jersey", "New York", 
                       "New Mexico", "Virginia", "Washington")

republican_states2016 <- c("Alabama", "Arizona", "Florida", "Georgia", "Kansas", 
                       "Kentucky", "Louisiana", "Michigan", "Mississippi", 
                       "Missouri", "North Carolina", "Pennsylvania", 
                       "Tennessee", "Texas")

massshootingsstates_2016 <- map_data("state")

massshootingsstates_2016$PoliticalStance <- ifelse(massshootingsstates_2016$region %in% tolower(democratic_states2016), 1,  ifelse(massshootingsstates_2016$region %in% tolower(republican_states2016), 0, NA))

ggplot()+
  geom_polygon(data = massshootingsstates_2016, aes(x = long, y = lat, group = group, fill = as.factor(PoliticalStance)))+
  scale_fill_manual(values=c("red","blue"), name="Political Stance") +
  labs(title = "Mass Shootings in States by Political Stance in 2016",
       subtitle = "Data from Mass Shootings Dataset") +
  theme_void() +
  coord_quickmap()