# scatter plot (statistician love this)
# two variables, number x number

library(ggplot2)
library(dplyr)

# diamonds dataset is included in ggplot2 package
glimpse(diamonds)

# the relationship between price and carat
# positive correlation = price increase as carat increase
# negative correlation = price decrease as carat increase

# overplotting
ggplot(data = diamonds,
       mapping = aes(x=price, y=carat)) +
    geom_point()

# sampling
# in case of overplotting, we can sample the data
# the sample size should be large enough to represent the population
small_diamonds <- diamonds %>%
    sample_n(5000)

ggplot(data = small_diamonds,
       mapping = aes(x=price, y=carat)) +
    geom_point()

# set seed for reproducibility
# if we want the same random sample every time we run the code
set.seed(42)
small_diamonds <- diamonds %>%
  sample_n(5000)

ggplot(data = small_diamonds,
       mapping = aes(x=price, y=carat)) +
  geom_point()


# styling
ggplot(data = small_diamonds,
       mapping = aes(x=price, y=carat)) +
  geom_point(alpha = 0.5, shape = "+")