## data visualization or charts
## 1. number of variables: one, two, more than two vars
## 2. data types: number (numeric), not a number (factor)

library(ggplot2)
library(dplyr)

## Q: one variable, number
## A: histogram / density

## mapping
base <- ggplot(data = diamonds,
       mapping = aes(x = price)) 

## setting
base + geom_histogram(bins=10, 
                      fill="gold", 
                      color="black")

base + geom_density()
base + geom_freqpoly()

## discrete = non-number = factor
## one variable, factor
ggplot(data = diamonds,
       mapping = aes(x = cut) ) +
  geom_bar(fill = "salmon", alpha = 0.8)

base2 <- ggplot(data = diamonds,
       mapping = aes(x = cut) )

base2 + 
  geom_bar(mapping = aes(fill = cut), 
           alpha = 0.6)

## two variables, number x number
## scatter plot (statistician love this)

set.seed(42)
small_diamonds <- diamonds %>%
  sample_n(5000)

## overplotting
library(ggthemes)

ggplot(data = small_diamonds,
       mapping = aes(x=price, y=carat)) +
  geom_point(mapping = aes(color = cut),
             alpha = 0.7) +
  theme_minimal()

## Two approaches to statistics
## [1] graphical [2] numerical
diamonds %>%
  group_by(cut) %>%
  summarise(
    n = n(),
    avg_price = mean(price),
    avg_carat = mean(carat)
  )

library(plotly)
plot1 <- ggplot(mtcars, aes(hp, mpg)) +
  geom_point()

ggplotly(plot1)

## ggplot2: 2D
## add more variables
## mapped to aesthetic of the chart

ggplot(diamonds %>% sample_n(1500),
       aes(x=carat, y=price)) +
  geom_point(aes(color = clarity,
                 shape = cut),
             size = 3) +
  theme_minimal()

## faceting breaks down big chart
## into small multiples

ggplot(diamonds %>% sample_n(5000),
       aes(x=carat, y=price)) +
  geom_point() +
  facet_grid(cut ~ clarity) ## 40 sub plots

## let's look at mtcars
mtcars %>%
  filter(hp < 130, mpg > 16) %>%
  ggplot(aes(hp, mpg)) +
  geom_point() +
  geom_smooth(method = "loess",
              se = F,
              color = "red") +
  theme_minimal() +
  ## add labels to chart
  labs(title = "Scatter Plot HP x MPG",
       subtitle = "Positive relationship between two variables",
       caption = "Data Source: mtcars dataframe",
       x = "horse power",
       y = "mile per gallon")

## dplyr + ggplot
diamonds %>%
  filter(carat >= 0.5, 
         price >= 4000,
         cut == "Ideal") %>%
  count(clarity) %>%
  ggplot(aes(clarity, n)) +
  geom_col()

## boxplot
ggplot(diamonds %>% sample_n(1000),
       aes(x=cut, y=price)) +
  geom_boxplot()

## violin plot
ggplot(diamonds %>% sample_n(1000),
       aes(x=cut, y=price)) +
  geom_violin()

ggplot(diamonds %>% sample_n(1000),
       aes(price)) +
  geom_histogram(aes(fill=cut), alpha=0.4) +
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

## change color manually













