# Import Packages
library(tidyverse)
library(viridis)

# Load Dataset ----
input_file <- 'D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/Github/draw_graph/accident_location.csv'
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
output_dir <- 'D:/projects/Yonsei_TELab/210517-_road_conflict/210607-_????긽吏??젏?꽑?젙?옄猷?/01_?삤瑜대쭑李⑤줈/湲고븯援ъ“_寃쎌궗?룄/'
output_file_name <- '210611_uphill_accident_num.csv'
output_path <- paste0(output_dir, output_file_name)

write_csv(uphill_accident, output_path)


# Draw Bar Graph $ Save Img: "????긽吏?蹂? 2016?뀈 ?씠?썑 ?뿰?룄蹂? 援먰넻?궗怨? 嫄댁닔" ----
for (x in 1:10){
  ggplot(uphill_accident %>% filter(target == x))+
    geom_col(mapping = aes(x = year, y = n, fill = year))+
    labs(title = paste0('Target', x),
         caption = '怨좎냽?룄濡쒓났怨듬뜲?씠?꽣?룷?꽭(http://data.ex.co.kr/)')+
    xlab('?뿰?룄(?뀈)')+
    ylab('援먰넻?궗怨? 諛쒖깮嫄댁닔(嫄?)')+
    scale_fill_viridis()+
    theme_minimal()+
    scale_x_continuous(breaks = c(2016, 2017, 2018, 2019, 2020, 2021))+
    ylim(c(0, round(max(uphill_accident$n), 1)))

  graph_bar <- paste0('D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/Github/draw_graph/210610_graph_bar_AccidentNum_', x, '.png')
  ggsave(graph_bar)
}