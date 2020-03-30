
library(tidyverse)
library(classdata)
library(Lahman)


LahmanData %>% head(24)

#Who was inducted in the Hall of Fame in 2017?
HallOfFame %>% dplyr::filter(yearID == 2017) %>% head()
