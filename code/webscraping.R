## Rscript scrapes articles listed in the `news_data_full` dataset and returns a dataframe with the added variable text_raw containing text scraped from the websites. 
## The function scrape_wrapper() uses `rvest` to scrape data (considering the css element associated with the website).The function returns an NA for websites with HTTP errors and times out for websites that do not load in 120 seconds. 
## For replication, I suggest using parallel computing to speed the scrapping process (https://bookdown.org/rdpeng/rprogdatascience/parallel-computation.html)

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  rvest,
  readr,
  ggplot2, 
  tidyverse, 
  purrr, 
  future.apply,
  furrr,
  RCurl, 
  R.utils
)

## If using parallel computing, check your available core using `availableCores()`. 
## core_number = the amount of cores your computer will not use (i.e., the script will run on all cores except the specified core_number).

parallel =  ## enter TRUE or FALSE for parallel computing (example: parallel = TRUE). If TRUE, assign core_number. If FALSE, leave core_number as NA. 
core_number = 

setwd("~/")

news_data <- readRDS("us_news/network_data.rds")

## web scraping function
scrape <- function(url, css){
  text <- tryCatch(read_html(url) %>% 
                     html_nodes(css = css) %>% 
                     html_text(trim = T) %>% 
                     trimws() %>% 
                     paste0(collapse = " "), error = function(e){NA}) 
  return(text)
} 

scrape_wrapper <- function(url, css){
  map2(url, css, ~withTimeout(scrape(.x, .y), timeout = 120)) 
}  


if (parallel == TRUE){
  print("Using parallel computing")
  plan(multicore(workers = availableCores()-core_number, gc = TRUE))

  news_data <- news_data %>%
    mutate(text_raw = future_map2(url, css, scrape_wrapper) %>% map_chr(1L))
} else{
  print("Not using parallel computing")
  news_data <- news_data %>%
    mutate(text_raw = map2(url, css, scrape_wrapper) %>% map_chr(1L))
}

saveRDS(news_data, "network_data_wtext.rds") ## insert desired name if saving .rds. The step is suggested if running R through a terminal
