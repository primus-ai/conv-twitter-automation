# Load libraries
library(rtweet)
library(tidyverse)
library(lubridate)

# Get Constituyentes Data

# constituyentes <- lists_members(list_id = "1395879401858994179")
# constituyentes <- constituyentes %>% filter(screen_name != "convencioncl")
# saveRDS(constituyentes, file = "data/constituyentes.rds")
rbot_token <- rtweet::create_token(
  app = "sentanalysisresearch",
  # the name of the Twitter app
  consumer_key = Sys.getenv("RBOT_TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("RBOT_TWITTER_CONSUMER_API_SECRET"),
  access_token = Sys.getenv("RBOT_TWITTER_ACCESS_TOKEN"),
  access_secret = Sys.getenv("RBOT_TWITTER_ACCESS_TOKEN_SECRET"),
  set_renv = FALSE
)


constituyentes <- readRDS(file = "data/constituyentes.rds")
 
constituyentes_tweets <- rtweet::get_timeline(constituyentes$screen_name, n = 10, token = rbot_token)

constituyentes_tweets <- constituyentes_tweets %>% 
    filter(created_at >= lubridate::today() - 7)

write_rds(constituyentes_tweets, "constituyentes_tweets.rds")
