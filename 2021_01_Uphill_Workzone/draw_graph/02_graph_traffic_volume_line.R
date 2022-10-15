# Import Packages
library(tidyverse)
library(viridis)

# Load Dataset ----
input_file <- 'D:/OneDrive - ¿¬¼¼´ëÇĞ±³ (Yonsei University)/Projects/Yonsei_TELab/003_µµ·Î»óÃæ_210517-/Github/draw_graph/traffic_volume.csv'
V <- read_csv(input_file, skip = 1)


# Data Preprocessing ----

## Calculate average traffic volume
V$Average_Volume <-
  (V$sun + V$mon + V$tue + V$wed + V$thu + V$fri + V$sat)/7

## Time
for (i in 1:nrow(V)){
  V$time[i] <- substr(V$time[i], 1, 2)
}

V$time <- as.numeric(V$time)

# Draw Line Graph & Save Img : "??€?ƒì§€ë³? ì£¼ê°„ ?‰ê·? êµí†µ?Ÿ‰ ----

for (x in 1:10){
  ggplot(V %>% filter(target == x))+
    geom_line(mapping = aes(x = time, y = Average_Volume, color = target),
              size = 1.05, show.legend = FALSE)+
    scale_color_viridis('inferno')+
    theme_minimal()+
    labs(title = paste0('Target', x))+
    xlab('?‹œê°?')+
    ylab('ì£¼ê°„ ?‰ê·? êµí†µ?Ÿ‰(??€/?‹œ')+
    ylim(c(0,round(max(V$Average_Volume), -3)))
  
  graph_line <- paste0('D:/OneDrive - ¿¬¼¼´ëÇĞ±³ (Yonsei University)/Projects/Yonsei_TELab/003_µµ·Î»óÃæ_210517-/Github/draw_graph/volume/210610_graph_line_Traffic_Volume_', x, '.png')
  ggsave(graph_line)
}

