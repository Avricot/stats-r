install.packages("devtools")
library(devtools)

install_github("StatsWithR/statsr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("shiny")

library(statsr)
library(dplyr)
library(ggplot2)

data(ames)
ggplot(data = ames, aes(x = area)) +  geom_histogram(binwidth = 250)

summarise(ames, mu = mean(area), pop_med = median(area), 
          sigma = sd(area), pop_iqr = IQR(area),
          pop_min = min(area), pop_max = max(area), 
          pop_q1 = quantile(area, 0.25),  # first quartile, 25th percentile
          pop_q2 = quantile(area, 0.5),  # first quartile, 25th percentile
          pop_q3 = quantile(area, 0.75))  # third quartile, 75th percentile


#Take 50 examples
samp1 <- sample_n(ames, size = 50)
samp1
summarise(samp1, x_bar = mean(area))

sample_means50 <- rep_sample_n(ames, size = 50, reps = 15000, replace = TRUE) %>% summarise(x_bar = mean(area))
ggplot(data = sample_means50, aes(x = x_bar)) + geom_histogram(binwidth = 20)
sample_means_small <- rep_sample_n(ames, size = 10, reps = 25, replace = TRUE) %>% summarise(x_bar = mean(area))
sample_means_small

sample_n(ames, size = 50) %>% summarise(x_bar = mean(area))
sample_means15 <- rep_sample_n(ames, size = 15, reps = 2000, replace = TRUE) %>% summarise(x_bar = mean(price))
summarise(sample_means15, x_bar = mean(x_bar))
ggplot(data = sample_means15, aes(x = x_bar)) + geom_histogram(binwidth = 20)

sample_means150 <- rep_sample_n(ames, size = 150, reps = 2000, replace = TRUE) %>% summarise(x_bar = mean(price))
summarise(sample_means150, x_bar = mean(x_bar))
ggplot(data = sample_means150, aes(x = x_bar)) + geom_histogram(binwidth = 20)

dbinom(92, size=100, p=0.9)
