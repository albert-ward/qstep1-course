
# Read data
ess <- read.csv("ess9_gb.csv")

# Same as with bivariate, but creating two groups: one with the normal constant, and one with the constant plus (minus) the dummy coefficient for born in the country (7.82 + (−1.19))
ggplot(data = ess, mapping = aes(x = agea, y = imueclt, group = 1)) + 
  geom_jitter(width = 0.2, height = 0.2) + 
  geom_smooth(aes(group = 1), method = "lm", se = FALSE) +
  geom_smooth(aes(y = imueclt - 1.19, group = 2), method = "lm", se = FALSE, linetype = "dashed") +
  scale_color_manual(values=c("black", "red"), guide = FALSE)
