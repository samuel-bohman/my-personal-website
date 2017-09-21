+++
# Date this page was created.
date = "2017-09-22"

# Project title.image = "projects/Titanic_md_files/Titanic.jpg"
title = "Most Harmful Weather Events"

# Project summary to display on homepage.
summary = "A Study of the U.S. National Oceanic and Atmospheric Administration’s storm database 1950-2011."

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "r-200x232.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["r"]

# Optional external URL for project (replaces project detail page).
# external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
# image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++

![noaa](https://www.ncdc.noaa.gov/cdo-web/images/promos/cdo_cover_hex.png)

# Synopsis

Storms and other severe weather events can cause both public health and economic problems for communities and municipalities. Many severe events can result in fatalities, injuries, and property damage, and preventing such outcomes to the extent possible is a key concern. This project involves an analysis of the U.S. [National Oceanic and Atmospheric Administration's](http://www.noaa.gov/) (NOAA) storm database. The analysis shows that tornadoes are the most harmul severe weather events with respect to population health, followed by excessive heat, flash floods, heat, and lightning. With respect to economic consequences, floods are the most harmful weather events followed by hurricane/typhoon, tornado, storm surge, and hail. 

# Data Processing

```r
library(tidyverse)
library(forcats)
```

We first read in the data in the form of a comma-separated-value file included in the bzip2 compressed file. We code missing values as blank or empty fields or NAs. 

```r
df <- read_csv(file = "repdata_data_StormData.csv.bz2", na = c(" ", "", "NA"))
```

For question 1, the columns we are interested in are EVTYPE, FATALITIES, and INJURIES. We extract those columns and save to a new dataframe. 

```r
df1 <- df %>% select(EVTYPE, FATALITIES, INJURIES)
```

Next, we calculate the sums of fatalities and injuries by event type and save the results. 

```r
df1b <- df1 %>% group_by(EVTYPE) %>% 
  summarize(
    FATALITIES = sum(FATALITIES, na.rm = T), 
    INJURIES = sum(INJURIES, na.rm = T)) %>% 
  arrange(desc(FATALITIES), desc(INJURIES))
```

For question 2, the columns we are interested in are EVTYPE, PROPDMG, PROPDMGEXP, CROPDMG, and CROPDMGEXP. We extract those columns and save to a new dataframe. 

```r
df2 <- df %>% select(EVTYPE, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)
```

The PROPDMGEXP is the exponent values for PROPDMG. In the same way, CROPDMGEXP is the exponent values for CROPDMG (B or b = Billion, M or m = Million, K or k = Thousand, H or h = Hundred). The number from 0 to 8 represent x times ten to the power of one, or $X \times 10^1$. The symbols "-", "+" and "?" are treated as zero so that the damage result becomes zero too: $X \times 0 = 0$. For more information, see [this](https://rstudio-pubs-static.s3.amazonaws.com/58957_37b6723ee52b455990e149edde45e5b6.html) link. 

```r
unique(df2$PROPDMGEXP)
```

```r
unique(df2$CROPDMGEXP)
```

Next, we calculate the sums of property damage and crop damage by event type and save the results. 

```r
df2b <- df2 %>% group_by(EVTYPE) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "-", PROPDMG *    0, PROPDMG)) %>% # PROP
  mutate(PROPDMG = ifelse(PROPDMGEXP == "?", PROPDMG *    0, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "+", PROPDMG * 10^0, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "0", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "1", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "2", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "3", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "4", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "5", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "6", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "7", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "8", PROPDMG * 10^1, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "H", PROPDMG * 10^2, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "h", PROPDMG * 10^2, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "K", PROPDMG * 10^3, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "M", PROPDMG * 10^6, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "m", PROPDMG * 10^6, PROPDMG)) %>%
  mutate(PROPDMG = ifelse(PROPDMGEXP == "B", PROPDMG * 10^9, PROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "?", CROPDMG *    0, CROPDMG)) %>% # CROP
  mutate(CROPDMG = ifelse(CROPDMGEXP == "0", CROPDMG * 10^1, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "2", CROPDMG * 10^1, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "K", CROPDMG * 10^3, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "k", CROPDMG * 10^3, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "M", CROPDMG * 10^6, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "m", CROPDMG * 10^6, CROPDMG)) %>%
  mutate(CROPDMG = ifelse(CROPDMGEXP == "B", CROPDMG * 10^9, CROPDMG)) %>%
  summarize(
    PROPDMG = sum(PROPDMG, na.rm = T), 
    CROPDMG = sum(CROPDMG, na.rm = T),
    TOT_DMG = sum(PROPDMG + CROPDMG)) %>% 
  arrange(desc(TOT_DMG))
```

# Results

## Question 1

*Across the United States, which types of events (as indicated in the EVTYPE variable) are most harmful with respect to population health?*

```r
head(df1b, 5)
```

As can be seen in the table above, tornadoes are the most harmul severe weather events with respect to population health, followed by excessive heat, flash floods, heat, and lightning. 

## Question 2

*Across the United States, which types of events have the greatest economic consequences?*

```r
head(df2b, 5)
```

```r
ggplot(df2b[1:5, ]) +
  aes(fct_inorder(EVTYPE), TOT_DMG / 10^9) +
  geom_bar(stat = "identity", fill = "darkseagreen") +
  labs(
    x = "Type of Event", 
    y = "Total Damage in Billion USD", 
    title = "Most Harmful Events in USA between 1950-2011")
```

![plot](/img/plot-1.png) 

As can be seen in the plot above, floods have the greatest economic consequences followed by hurricane/typhoon, tornado, storm surge, and hail.