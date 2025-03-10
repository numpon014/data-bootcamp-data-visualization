# build color palette

library(ggplot2)
library(dplyr)

# color palette
# - if fill -> scale_fill_manual
diamonds %>%
  ggplot(
    aes(cut, fill = cut)
  ) +
  geom_bar() +
  theme_minimal() +
  scale_fill_manual(
    values = c(
      "#440154",
      "#3B528B",
      "#21908C",
      "#5DC863",
      "#FDE725")
  )

# without color palette
mtcars %>%
  ggplot(
    aes(hp, mpg, color = hp)
  ) +
  geom_point(size = 5) +
  theme_minimal()

## gradient color
mtcars %>%
  ggplot(
    aes(hp, mpg, color = hp)
  ) +
  geom_point(size = 5) +
  theme_minimal() +
  scale_color_gradient(
    low = "blue",
    high = "red"
  )