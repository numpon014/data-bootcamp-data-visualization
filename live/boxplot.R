library(ggplot2)
library(dplyr)

# diamonds dataset is included in ggplot2 package
glimpse(diamonds)

# Boxplot is a graphical representation of the distribution of a dataset.
# It is a standardized way of displaying the distribution of data based on a five-number summary:
# -- minimum, first quartile, median, third quartile, and maximum.
# -- It is also known as a box-and-whisker plot.
ggplot(
  diamonds %>% sample_n(100),
  aes(price)
) +
  geom_boxplot()

ggplot(
  diamonds %>% sample_n(1000),
  aes(x = cut, y = price)
) +
  geom_boxplot()

## violin plot
# A violin plot is similar to a box plot, but it also shows the probability density of the data at different values.
# -- It is a combination of a box plot and a kernel density plot.

ggplot(
  diamonds %>% sample_n(1000),
  aes(x = cut, y = price)
) +
  geom_violin()


# Histogram is a graphical representation of the distribution of a dataset.
# violin is histogram rotated and mirrored
ggplot(
  diamonds %>% sample_n(1000),
  aes(price)
) +
  geom_histogram(aes(fill = cut), alpha = 0.4) +
  theme_minimal()

## multiple datasets
premium_di <- diamonds %>%
  filter(cut == "Premium", carat>=2) %>%
  sample_n(500)

good_di <- diamonds %>%
  filter(cut == "Good") %>%
  sample_n(500)

ggplot() +
  geom_point(data = premium_di,
             mapping = aes(carat, price),
             color = "red") +
  geom_point(data = good_di,
             mapping = aes(carat, price),
             color = "blue", alpha=0.5) +
  theme_minimal()