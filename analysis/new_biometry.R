# Nouvelle étude sur la biométrie humaine
# author : Elisa, Eva, Marie, Mathilde
# date: 11-09-2018



# Packages ----
SciViews::R
library(skimr)
library(visdat)

# Import data ----

n_bio <- readr::read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQoVtSWbENWzxbALxD0qyNDqxV4uSYqzLCtJgcNGE7ciT6nkWOjA9b6dMBHaSUY8Nw5f-mSpUEeN-3S/pub?output=csv", locale = locale(decimal_mark = ","))

View(n_bio)
summary(n_bio)

vis_dat(n_bio)

# filter
n_bio_fill <- filter(n_bio, taille != "NA")

vis_dat(n_bio_fill)

# change type

n_bio_fill$genre <- factor(n_bio_fill$genre, levels = c("h", "f"))
n_bio_fill$hainaut <- factor(n_bio_fill$hainaut, levels = c("o", "n"))

vis_dat(n_bio_fill)

# save rds

write(n_bio_fill, file = "data/biometry.rds", type = "rds", compress = "xz")



# Graphique

chart(data = n_bio_fill, ~ factor (0) %fill=% genre) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis_d()

chart(data = n_bio_fill, ~ masse) +
  geom_bar(na.rm=TRUE)

chart(data = n_bio_fill, taille ~ masse | genre) +
  geom_point(na.rm=TRUE)

chart(data = n_bio_fill, acti_profession ~ masse %col=%acti_profession) +
  geom_point(na.rm=TRUE)


