library(tidyverse)
library(haven)


# name dataframe as to pull info easier
data_frame1 <- select(IAHR52FL)


#total number of households is the same as cases? suspect it should be using the max house number assignmnert?
house_num <- select(IAHR52FL, hhid,
                   contains('hv002'))

#resrtict variables from over 3500 to 196
question_3 <- select(IAHR52FL, hhid:shstruc) 


# new DF only containing hv025 'urban households'    //    FIRST IS INCORRECT // USE PRIME VERSION 

urban_homes <- select(IAHR52FL, hhid,
                      contains(hv025 = 1))


urban_homes1 <- filter(IAHR52FL, hv025 == 1)




# distribution plot of number household members for sample  //  add in boxplot // ?PIPING? still yielding errors 

household_members <- select(IAHR52FL, hhid, hv009)
  ggplot(data = household_members) +
  geom_histogram(mapping = aes(x = hv009), binwidth = 1) +
  xlab('household members')+

geom_boxplot(aes(x = hv009))


  # question 6 // means & medians  of household members by urban type  [0,1,2]

large_city <- filter(IAHR52FL, hv026 == 0)
  summarise(large_city, hv009)
  large_city_hous_num <- select(large_city, hv009)
  max(large_city_hous_num)
  sum(large_city_hous_num)
  sum(large_city_hous_num) / 23847


small_city <- filter(IAHR52FL, hv026 == 1)
  summarise(small_city, hv009)
  small_city_hous_num <- select(small_city, hv009)
  max(small_city_hous_num)
  sum(small_city_hous_num)
  sum(small_city_hous_num) / 7761
  group_by(small_city_hous_num)


town <- filter(IAHR52FL, hv026 == 2)
  summarise(town, hv009)
  town_hous_num <- select(town, hv009)
  max(town_hous_num)
  sum(town_hous_num)
  sum(town_hous_num) / 18628
