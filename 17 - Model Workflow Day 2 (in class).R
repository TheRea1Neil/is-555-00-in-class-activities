library(tidyverse)
library(fastDummies)
library(tidymodels)
# Tip: you can pass a whole tibble to fastDummies::dummy_cols(), 
# and it will automatically dummy code any factor columns.

laptops <- read_csv('https://www.dropbox.com/scl/fi/rsetl7vzy4nfd10ihmr96/laptops.csv?rlkey=kfwdief4jpwr1008z1llbx3qa&dl=1')


# Before we jump into train/test split, let's look at the data and
# see if we can come up with any new features.
laptops %>% glimpse()



# laptops_memory_types %>% mutate(memory_type = if_else(str_detect(storage,"SSD"),))


# Okay now take the modified dataset into the initial_split() function (and beyond).

lap_split <- initial_split(laptops, strata=price)

lap_training <- lap_split %>% training()

lap_testing <- lap_split %>% testing()


linear_reg() %>% 
  set_engine('brulee') %>% 
  set_mode('regression')


linear_lr() %>% 
  set_engine('brulee') %>% 
  set_mode('regression')

lap_lr %>% 
  fir(price~ .,
      data=lap_training)

show_engines('linear_reg')


