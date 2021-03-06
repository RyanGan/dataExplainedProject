library(tidyverse)
library(ggplot2)
library(plotly)
data = read.csv('edge1.1.csv')

p = ggplot(data,
           aes(x=Male_Contributions,
               y=Female_Contributions)) 
p + geom_point() + facet_wrap(~Discipline)

plotRank = function(GROUP){
  x.string=GROUP
  df = data %>%
    group_by_(GROUP) %>%
    summarise(n = n()) %>%
    arrange(-n) %>%
    top_n(20)
  p = ggplot(df,aes_string(x=x.string,y='n'))
  p + geom_bar(stat='identity') + coord_flip()
}

plotRank('Title')
plotRank('Department')
plotRank('Id')
plotRank('PhD_Institution')
plotRank('PhD_Field')
plotRank('PhD_Year')
plotRank('Discipline')
