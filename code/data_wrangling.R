## read in libraries
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  readr,
  dplyr,
  tidyverse, 
  stringr, 
  purrr)

## set working directory
setwd("~/") 

## read in folder
csv_names <- list.files(path = "news_data",
                        pattern = "*.csv",
                        full.names = TRUE)

## create emply list
n <- length(csv_names)
news_data <- vector("list", n)


## execute loop over list
for (i in seq_along(news_data)) {
  news_data[[i]] <- read_csv(csv_names[i])
}

## create empty nested data set with network information
network_data <- tibble(network = csv_names %>% str_extract_all("Center.*|Left.*|Right.*") %>% str_replace_all("( 2019.*)", ""),
                    data = rep(list(NULL), n))

## execute loop over data frame
for (i in 1:n) {
  network_data$data[[i]] <- news_data[[i]]
}

## unnest data frame
network_data <- network_data %>% unnest(c(network, data))

## remove non-US news

us_news <- read_csv("US News.csv")
network_data <- inner_join(network_data, us_news)


