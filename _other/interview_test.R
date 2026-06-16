# In this section, you'll use group_by() and summarize() to answer questions about state prision counts by decade
## which decade saw the largest percentage growth in state prisions? Measure percent growth as (Cde-Cds/Cds) where Cde 
## is the count at the end of decade and Cds is the start of the decade. You can use the first() and last() functions.

library(tidyverse)

getwd()
setwd("/Users/jayballesteros/_github/uchicag-codingcamp/_data/")
data <- read_csv("data.csv")

# first let's review the shape of our data

glimpse(data) # 4 colummns: type, counts, decade and year

head(data) # years are not in order!
tail(data) 

sapply(data, class)

sum(is.na(data))


count(data, decade) #  only five years in 1920, when in the other ones we have at least 10 (with the exception of 2010, that ends with 2017)


# Order the data!

## Tempting — but WRONG, because rows aren't ordered by year:
#data %>%
#  group_by(decade) %>%
#  summarize(start = first(counts), end = last(counts))

# Fix: sort by year first, so first() = earliest, last() = latest
data %>%
  arrange(decade, year) %>%
  group_by(decade) %>%
  summarize(start = first(counts), end = last(counts))



prison_growth <- data %>%
  arrange(decade, year) %>%                       # so first()/last() = start/end of decade
  group_by(decade) %>%
  summarize(
    start_count = first(counts),
    end_count   = last(counts),
    pct_growth  = (last(counts) - first(counts)) / first(counts)
  ) %>%
  arrange(desc(pct_growth))                        # biggest growth on top

prison_growth
```
