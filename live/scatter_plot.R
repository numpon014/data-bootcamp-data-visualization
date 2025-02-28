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
       mapping = aes(x = price, y = carat)) +
  geom_point()

# sampling
# in case of overplotting, we can sample the data
# the sample size should be large enough to represent the population
small_diamonds <- diamonds %>%
  sample_n(5000)

ggplot(data = small_diamonds,
       mapping = aes(x = price, y = carat)) +
  geom_point()

# set seed for reproducibility
# if we want the same random sample every time we run the code
set.seed(42)
small_diamonds <- diamonds %>%
  sample_n(5000)

ggplot(data = small_diamonds,
       mapping = aes(x = price, y = carat)) +
  geom_point()


# styling
ggplot(data = small_diamonds,
       mapping = aes(x = price, y = carat)) +
  geom_point(alpha = 0.5, shape = "+")

## mapping color to a variable
ggplot(
  data = small_diamonds,
  mapping = aes(
    x = price,
    y = carat,
  )
) +
  geom_point(
    mapping = aes(color = cut),
    alpha = 0.5
  )

## using theme
# load the theme -> https://www.datanovia.com/en/blog/ggplot-themes-gallery/
ggplot(
  data = small_diamonds,
  mapping = aes(
    x = price,
    y = carat,
  )
) +
  geom_point(
    mapping = aes(color = cut),
    alpha = 0.5
  ) +
  theme_minimal()

# 2 approaches to statistical transformation
# [1] graphical [2] numerical
small_diamonds %>%
  group_by(cut) %>%
    summarise(
      n = n(),
      avg_price = mean(price),
      avg_carat = mean(carat)
    )

ggplot(
  data = small_diamonds,
  mapping = aes(
    x = price,
    y = carat,
  )
) +
  geom_point(
    mapping = aes(color = cut),
    alpha = 0.5
  ) +
  theme_minimal()

# interactive plot
library(plotly)
plot1 <- ggplot(mtcars, aes(hp, mpg)) +
  geom_point()

ggplotly(plot1)

## ggplot2: 2D
## Add more variables
## mapped to aesthetic of the chart
# shape should no more than 6; to make it easier to distinguish
ggplot(diamonds %>% sample_n(1500),
       aes(x = carat, y = price)) +
  geom_point(
    aes(
      color = clarity,
      shape = cut
    ),
    size = 3
  ) +
  theme_minimal()

## faceting breaks down big chart into small multiples
ggplot(diamonds %>% sample_n(5000),
       aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  facet_wrap(~cut)

ggplot(diamonds %>% sample_n(5000),
       aes(x = carat, y = price)) +
  geom_point(color = "red", alpha=0.5) +
  facet_wrap(~color, ncol = 2)

ggplot(diamonds %>% sample_n(5000),
       aes(x=carat, y=price)) +
  geom_point() +
  facet_grid(cut ~ clarity) ## 40 sub plots


## show three charts in one point, rug, smooth
ggplot(mtcars, aes(hp, mpg)) +
  geom_point() +
  geom_smooth() +
  geom_rug()