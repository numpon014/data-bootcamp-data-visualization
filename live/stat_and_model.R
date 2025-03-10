#
lm(mpg ~ hp, data = mtcars) %>%
  ggplot(aes(hp, mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()