
lijphart <- read.csv("lijphart_data.csv")
my_model <- lm(data = lijphart, 
               womens_parl_representation_2010 ~ exec_parties_1945_2010)

library(ggeffects)

# This shows the predicted value of Y at different levels of exec_parties_1945_2010 (running from min to max)
# In a model with more variables, this will automatically hold them at their mean
ggpredict(my_model, "exec_parties_1945_2010 [-1.5:1.72]")
