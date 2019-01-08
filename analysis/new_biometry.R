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
n_bio_fil <- filter(n_bio, taille != "NA")

vis_dat(n_bio_fil)

# change type

n_bio_fil$genre <- factor(n_bio_fil$genre, levels = c("h", "f"))
n_bio_fil$hainaut <- factor(n_bio_fil$hainaut, levels = c("o", "n"))

vis_dat(n_bio_fil)

# save rds

write(n_bio_fil, file = "data/biometry.rds", type = "rds", compress = "xz")



# Graphique
# graphique 1
chart(data = n_bio_fil, ~ factor (0) %fill=% genre) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis_d()


#graphique 2
chart(data = n_bio_fil, ~ masse) +
  geom_bar(na.rm=TRUE)


#graphique 3
chart(data = n_bio_fil, taille ~ masse | genre) +
  geom_point(na.rm=TRUE)


#graphique 4
chart(data = n_bio_fil, masse ~ acti_profession %fill=%acti_profession) +
  geom_violin(show.legend = FALSE)


#graphique 5
chart(data = n_bio_fil, ~ age %fill=% genre)+
  geom_histogram(bins = 30)


#graphique 6
chart(data = n_bio_fil, tour_taille ~ tour_hanche)+
  geom_point(na.rm = TRUE)


#graphique 7
chart(data = n_bio_fil, ~ fastfood)+
  geom_bar(na.rm = TRUE)


#graphique 8
chart(data = n_bio_fil, alcool ~ age)+
  geom_point(na.rm = TRUE)


#graphique 9
chart(data = n_bio_fil, ~ grignotage %fill=% genre)+
  geom_bar()


#graphique 10
chart(data = n_bio_fil, ~ tour_poignet %col=% genre)+
  geom_density()
