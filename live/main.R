## data visualization or charts
## 1. number of variables: one, two, more than two vars
## 2. data types: number (numeric), not number (factor)

library(ggplot2)
library(dplyr)

# diamonds dataset is included in ggplot2 package
diamonds

View(diamonds)
glimpse(diamonds)

## Q: one variable, number
## A: histogram

# mapping is to tell ggplot how to map variables to visual properties
# geom is to tell ggplot what kind of geometric object to use to represent the data
ggplot(
  data = diamonds,
  mapping = aes(x = price)
) +
  geom_histogram()

ggplot(
  data = diamonds,
  mapping = aes(x = price)
) +
  geom_density()

# use bases instead
base <- ggplot(
  data = diamonds,
  mapping = aes(x = price)
)

base + geom_histogram()
base + geom_density()

# Q: How many Bin, should we decide?
# A: There is no rule of Bin, depand of situation and what we would like to see
#    But 30 is a good start
base + geom_histogram(bins = 30)