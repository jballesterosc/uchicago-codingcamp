# In this section, you'll use group_by() and summarize() to answer questions about state prision counts by decade
## which decade saw the largest percentage growth in state prisons? Measure percent growth as (Cde-Cds/Cds) where Cde 
## is the count at the end of decade and Cds is the start of the decade. You can use the first() and last() functions.

### percent_growth = (count at end of decade − count at start of decade) / count at start of decade

library(tidyverse)

getwd()
setwd("/Users/jayballesteros/_github/uchicag-codingcamp/_data/")

data <- read_csv("data.csv")

head(data)

count(data,decade)

summary(data)


data %>%
  arrange(decade,year) %>%
  group_by(decade) %>%
  filter(decade != 1920 & decade != 2010) %>%
  summarize(
    start = first(counts), 
    year_start = first(year), 
    end = last(counts), 
    year_end = last(year),
    percentage_growth = (last(counts)-first(counts)) / first(counts)) %>%
  arrange(desc(percentage_growth))

### percent_growth = (count at end of decade − count at start of decade) / count at start of decade



