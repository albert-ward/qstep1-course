
# Changing variable names
# Creating new variable to facet_wrap

brexit$winner <- NA #creates an empty variable
brexit$winner[brexit$percent_leave > 50] <- "Leave"
brexit$winner[brexit$percent_leave < 50] <- "Remain"

# Brexit

brexit <- read.csv("brexit.csv")

ggplot(data = brexit) + 
  geom_bar(mapping = aes(x = region)) + 
  facet_wrap(~ winner)
