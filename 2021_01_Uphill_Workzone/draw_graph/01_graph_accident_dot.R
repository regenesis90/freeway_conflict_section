# Import Packages
library(tidyverse)
library(viridis)

# Load Dataset ----
input_file <- 'D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/Github/draw_graph/accident_location.csv'
f <- read_csv(input_file)


# Data Preprocessing ----
uphill_accident <-
  f %>% select(target, year, location)

uphill_accident$year <- as.character(uphill_accident$year)

accident_palette <-
  c('2016' = viridis(6)[1],
    '2017' = viridis(6)[2],
    '2018' = viridis(6)[3],
    '2019' = viridis(6)[4],
    '2020' = viridis(6)[5],
    '2021' = viridis(6)[6])

# Draw Dot Graph & Save Img ----

for (x in 1:10){
  tb <- uphill_accident %>% filter(target == x)
  ggplot(tb)+
    geom_dotplot(mapping = aes(x = location, fill = year, color = year))+
    scale_color_manual(values = accident_palette)+
    scale_fill_manual(values = accident_palette)+
    labs(title = paste0('Target', x),
         caption = '고속도로공공데이터포털(http://data.ex.co.kr/)')+
    xlab('거리(km)')+
    ylab('건수')+
    xlim(c(min(tb$location), max(tb$location)))+
    scale_x_continuous(n.breaks = 10)+
    theme_classic()
  
  graph_dot <- paste0('D:/projects/Yonsei_TELab/210517-_road_conflict/003_도로상충_210517-/graph/210610_graph_dot_AccidentLoc_', x, '.png')
  ggsave(graph_dot)
}