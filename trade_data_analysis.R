setwd("/Users/ankit/Desktop/Sem8/Final Project/Data")
dyadic <- read.csv("Dyadic_COW_4.0.CSV")
national <- read.csv("National_COW_4.0.csv")
#head(national)
#length(dyadic)
## A.)PREPROCESSING TRADE DATA
trimmed_national <- national[,c(1,2,4,5,6)]
#head(trimmed_national)
trimmed_national$volume_of_trade = trimmed_national$imports + trimmed_national$exports
#head(trimmed_national)
#?where

present_trade_volumes <- trimmed_national[which(trimmed_national$year == 2014),]
head(present_trade_volumes)

## B.) MAP RELATED INSIGHTS
#install.packages(ggplot2)
library("ggplot2")
#install.packages("ggmap")
#install.packages("dplyr")
#install.packages("tidyverse")
library("ggmap")
library("dplyr")
library("tidyverse")

Combined = WorldData[present_trade_volumes$statename %in% present_trade_volumes$statename, ]
Combined = present_trade_volumes$statename
Combined$value = present_trade_volumes$volume_of_trade


ggplot(present_trade_volumes, aes(x=long, y=lat, group = group, fill = value)) + 
geom_polygon(colour = "white") +
scale_fill_continuous(low = "blue",high = "red",guide="colorbar") +
theme_bw()  +
labs(fill = "Sales Amt" ,title = "Global Trade Volumes", x="", y="") +
scale_y_continuous(breaks=c()) +
scale_x_continuous(breaks=c()) +
theme(panel.border =  element_blank())

##C.)HEAT MAP TO SHOW TOP TRADING COUNTRIES

