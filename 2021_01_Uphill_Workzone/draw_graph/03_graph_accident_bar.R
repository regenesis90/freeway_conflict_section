# Import Packages
library(tidyverse)
library(viridis)

# Load Dataset ----
input_file <- 'D:/OneDrive - �������б� (Yonsei University)/Projects/Yonsei_TELab/003_���λ���_210517-/Github/draw_graph/accident_location.csv'
f <- read_csv(input_file)

# Data Preprocessing ----
uphill_accident <-
  f %>% group_by(target, year) %>% summarise(n = n())

void_data <-
  data.frame(target = c(1, 1, 1, 2, 2, 3, 3, 4, 4, 4, 5, 6, 6, 6, 7, 8, 8, 8, 8, 9, 9, 10, 10),
             year = c(2018, 2019, 2021, 2019, 2021, 2017, 2019, 2016, 2019, 2021, 2021, 2016, 2017, 2021, 2021, 2016, 2017, 2020, 2021, 2019, 2021, 2020, 2021),
             n = c(0) * 23)

uphill_accident <-
  rbind(uphill_accident, void_data)

uphill_accident <-
  uphill_accident %>% arrange(target, year)


# Save to .CSV file ----
output_dir <- 'D:/projects/Yonsei_TELab/210517-_road_conflict/210607-_??�?��지?��?��?��?���?/01_?��르막차로/기하구조_경사?��/'
output_file_name <- '210611_uphill_accident_num.csv'
output_path <- paste0(output_dir, output_file_name)

write_csv(uphill_accident, output_path)


# Draw Bar Graph $ Save Img: "??�?��지�? 2016?�� ?��?�� ?��?���? 교통?���? 건수" ----
for (x in 1:10){
  ggplot(uphill_accident %>% filter(target == x))+
    geom_col(mapping = aes(x = year, y = n, fill = year))+
    labs(title = paste0('Target', x),
         caption = '고속?��로공공데?��?��?��?��(http://data.ex.co.kr/)')+
    xlab('?��?��(?��)')+
    ylab('교통?���? 발생건수(�?)')+
    scale_fill_viridis()+
    theme_minimal()+
    scale_x_continuous(breaks = c(2016, 2017, 2018, 2019, 2020, 2021))+
    ylim(c(0, round(max(uphill_accident$n), 1)))

  graph_bar <- paste0('D:/OneDrive - �������б� (Yonsei University)/Projects/Yonsei_TELab/003_���λ���_210517-/Github/draw_graph/210610_graph_bar_AccidentNum_', x, '.png')
  ggsave(graph_bar)
}