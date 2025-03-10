library(ggplot2)
library(dplyr)

# diamonds dataset is included in ggplot2 package
glimpse(diamonds)

# Boxplot is a graphical representation of the distribution of a dataset.
# It is a standardized way of displaying the distribution of data based on a five-number summary:
# -- minimum, first quartile, median, third quartile, and maximum.
# -- It is also known as a box-and-whisker plot.
ggplot(diamonds %>% sample_n(1000),
       aes(x=cut, y=price)) +
  geom_boxplot()

## violin plot
# A violin plot is similar to a box plot, but it also shows the probability density of the data at different values.
# -- It is a combination of a box plot and a kernel density plot.
ggplot(diamonds %>% sample_n(1000),
       aes(x=cut, y=price)) +
  geom_violin()