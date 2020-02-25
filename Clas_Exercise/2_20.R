library(dplyr)
library(nycflights13)
data(flights, package = "nycflights13")
flights
flights %>% glimpse()


#Find all flights that had an arrival delay of two or more hours.

flights %>% filter(arr_delay >=120)

#Find all flights that were delayed by at least an hour, but made up over 30 minutes in flight
flights %>% filter(dep_delay >=60 , dep_delay - arr_delay>30)

#Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.

flights %>% select(dep_time, dep_delay, arr_time,arr_delay,arr_delay)
flights %>% select(starts_with("arr_"),starts_with("dep_"))
flights %>% select(4,6,7,9)

#ignore duplicate in select

#Sort flights to find the most delayed flights. Find the flights that left earliest.
flights %>% arrange(desc(dep_delay)) %>% slice(1:1)

#Find the flights that left earliest.
flights %>% arrange(dep_delay) %>% slice(1:1)

#Which flights traveled the longest? 
flights %>% arrange(desc(distance)) %>% slice(1:1)

#Which traveled the shortest?
flights %>% arrange(distance) %>% slice(1:1)

flights %>% arrange(air_time) %>% slice(1:1)


flights %>%
  mutate(gain = dep_delay - arr_delay) %>% 
  filter(dep_delay>60, gain>30)

flights %>%
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours
  )