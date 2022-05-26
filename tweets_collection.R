# Load libraries
library(rtweet)
library(tidyverse)

# Get Constituyentes Data

# constituyentes <- lists_members(list_id = "1395879401858994179")
# constituyentes <- constituyentes %>% filter(screen_name != "convencioncl")
# saveRDS(constituyentes, file = "data/constituyentes.rds")

constituyentes <- readRDS(file = "data/constituyentes.rds")
 
constituyentes_tweets <- get_timeline(constituyentes$screen_name, n = 10)

constituyentes_tweets <- constituyentes_tweets %>% 
    filter(created_at >= today() - 7)

write_rds(constituyentes_tweets, "data/constituyentes_tweets.rds")
