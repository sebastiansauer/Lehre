
library(rtweet)

source("/home/sebastian/Documents/credentials/hate-speech2-twitter.R")


auth_setup_default()


auth <- rtweet_bot(api_key = api_key, 
                   api_secret = api_secret, 
                   access_token = access_token, 
                   access_secret = access_secret)


tweets <- get_timeline(user = "Karl_Lauterbach", n = 5)
tweets
