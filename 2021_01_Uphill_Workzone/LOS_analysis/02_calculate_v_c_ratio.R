# Import Packages
library(tidyverse)

# Load Datasets ----
""
dir_capacity <- 'D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/2차년도_2022/02_기준설정_220110/LCS_LOS/'
file_capacity <- 'capacity.csv'
path_capacity <- paste0(dir_capacity, file_capacity)

dir_volume <- dir_capacity
file_volume <- 'target_traffic_volume.csv'
path_volume <- paste0(dir_volume, file_volume)

LCS_capacity <- read_csv(path_capacity)
LCS_volume <- read_csv(path_volume, skip = 1)

# Unify Data Type
LCS_capacity$target <-
  as.character(LCS_capacity$target)

LCS_volume$target <-
  as.character(LCS_volume$target)

# Drop Unnecessary Columns
LCS_capacity <-
  LCS_capacity %>% 
  select(target, capacity_opened, capacity_closed)

# Left Join 
joined_LCS <-
  left_join(LCS_volume, LCS_capacity, by = 'target')

joined_LCS


# Calculate V/C ratio
LCS_v_c_ratio <-
  joined_LCS %>% 
  select(target, time)

LCS_v_c_ratio$sun_opened_1 <- joined_LCS$sun_1/joined_LCS$capacity_opened
LCS_v_c_ratio$mon_opened_1 <- joined_LCS$mon_1/joined_LCS$capacity_opened
LCS_v_c_ratio$tue_opened_1 <- joined_LCS$tue_1/joined_LCS$capacity_opened
LCS_v_c_ratio$wed_opened_1 <- joined_LCS$wed_1/joined_LCS$capacity_opened
LCS_v_c_ratio$thu_opened_1 <- joined_LCS$thu_1/joined_LCS$capacity_opened
LCS_v_c_ratio$fri_opened_1 <- joined_LCS$fri_1/joined_LCS$capacity_opened
LCS_v_c_ratio$sat_opened_1 <- joined_LCS$sat_1/joined_LCS$capacity_opened

LCS_v_c_ratio$sun_closed_1 <- joined_LCS$sun_1/joined_LCS$capacity_closed
LCS_v_c_ratio$mon_closed_1 <- joined_LCS$mon_1/joined_LCS$capacity_closed
LCS_v_c_ratio$tue_closed_1 <- joined_LCS$tue_1/joined_LCS$capacity_closed
LCS_v_c_ratio$wed_closed_1 <- joined_LCS$wed_1/joined_LCS$capacity_closed
LCS_v_c_ratio$thu_closed_1 <- joined_LCS$thu_1/joined_LCS$capacity_closed
LCS_v_c_ratio$fri_closed_1 <- joined_LCS$fri_1/joined_LCS$capacity_closed
LCS_v_c_ratio$sat_closed_1 <- joined_LCS$sat_1/joined_LCS$capacity_closed

###

LCS_v_c_ratio$sun_opened_2 <- joined_LCS$sun_2/joined_LCS$capacity_opened
LCS_v_c_ratio$mon_opened_2 <- joined_LCS$mon_2/joined_LCS$capacity_opened
LCS_v_c_ratio$tue_opened_2 <- joined_LCS$tue_2/joined_LCS$capacity_opened
LCS_v_c_ratio$wed_opened_2 <- joined_LCS$wed_2/joined_LCS$capacity_opened
LCS_v_c_ratio$thu_opened_2 <- joined_LCS$thu_2/joined_LCS$capacity_opened
LCS_v_c_ratio$fri_opened_2 <- joined_LCS$fri_2/joined_LCS$capacity_opened
LCS_v_c_ratio$sat_opened_2 <- joined_LCS$sat_2/joined_LCS$capacity_opened

LCS_v_c_ratio$sun_closed_2 <- joined_LCS$sun_2/joined_LCS$capacity_closed
LCS_v_c_ratio$mon_closed_2 <- joined_LCS$mon_2/joined_LCS$capacity_closed
LCS_v_c_ratio$tue_closed_2 <- joined_LCS$tue_2/joined_LCS$capacity_closed
LCS_v_c_ratio$wed_closed_2 <- joined_LCS$wed_2/joined_LCS$capacity_closed
LCS_v_c_ratio$thu_closed_2 <- joined_LCS$thu_2/joined_LCS$capacity_closed
LCS_v_c_ratio$fri_closed_2 <- joined_LCS$fri_2/joined_LCS$capacity_closed
LCS_v_c_ratio$sat_closed_2 <- joined_LCS$sat_2/joined_LCS$capacity_closed

###

LCS_v_c_ratio$sun_opened_3 <- joined_LCS$sun_3/joined_LCS$capacity_opened
LCS_v_c_ratio$mon_opened_3 <- joined_LCS$mon_3/joined_LCS$capacity_opened
LCS_v_c_ratio$tue_opened_3 <- joined_LCS$tue_3/joined_LCS$capacity_opened
LCS_v_c_ratio$wed_opened_3 <- joined_LCS$wed_3/joined_LCS$capacity_opened
LCS_v_c_ratio$thu_opened_3 <- joined_LCS$thu_3/joined_LCS$capacity_opened
LCS_v_c_ratio$fri_opened_3 <- joined_LCS$fri_3/joined_LCS$capacity_opened
LCS_v_c_ratio$sat_opened_3 <- joined_LCS$sat_3/joined_LCS$capacity_opened

LCS_v_c_ratio$sun_closed_3 <- joined_LCS$sun_3/joined_LCS$capacity_closed
LCS_v_c_ratio$mon_closed_3 <- joined_LCS$mon_3/joined_LCS$capacity_closed
LCS_v_c_ratio$tue_closed_3 <- joined_LCS$tue_3/joined_LCS$capacity_closed
LCS_v_c_ratio$wed_closed_3 <- joined_LCS$wed_3/joined_LCS$capacity_closed
LCS_v_c_ratio$thu_closed_3 <- joined_LCS$thu_3/joined_LCS$capacity_closed
LCS_v_c_ratio$fri_closed_3 <- joined_LCS$fri_3/joined_LCS$capacity_closed
LCS_v_c_ratio$sat_closed_3 <- joined_LCS$sat_3/joined_LCS$capacity_closed


###

LCS_v_c_ratio$sun_opened_4 <- joined_LCS$sun_4/joined_LCS$capacity_opened
LCS_v_c_ratio$mon_opened_4 <- joined_LCS$mon_4/joined_LCS$capacity_opened
LCS_v_c_ratio$tue_opened_4 <- joined_LCS$tue_4/joined_LCS$capacity_opened
LCS_v_c_ratio$wed_opened_4 <- joined_LCS$wed_4/joined_LCS$capacity_opened
LCS_v_c_ratio$thu_opened_4 <- joined_LCS$thu_4/joined_LCS$capacity_opened
LCS_v_c_ratio$fri_opened_4 <- joined_LCS$fri_4/joined_LCS$capacity_opened

LCS_v_c_ratio$sun_closed_4 <- joined_LCS$sun_4/joined_LCS$capacity_closed
LCS_v_c_ratio$mon_closed_4 <- joined_LCS$mon_4/joined_LCS$capacity_closed
LCS_v_c_ratio$tue_closed_4 <- joined_LCS$tue_4/joined_LCS$capacity_closed
LCS_v_c_ratio$wed_closed_4 <- joined_LCS$wed_4/joined_LCS$capacity_closed
LCS_v_c_ratio$thu_closed_4 <- joined_LCS$thu_4/joined_LCS$capacity_closed
LCS_v_c_ratio$fri_closed_4 <- joined_LCS$fri_4/joined_LCS$capacity_closed





LCS_v_c_ratio

# Save V/C ratio .csv file
dir_output <- dir_capacity
file_output <- 'v_c_ratio.csv'
path_output <- paste0(dir_output, file_output)

write_csv(LCS_v_c_ratio, file = path_output)