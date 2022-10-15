# Import Packages
library(tidyverse)

# Load Datasets
dir_v_c_ratio <- 'D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/2차년도_2022/02_기준설정_220110/LCS_LOS/'
file_v_c_ratio <- 'v_c_ratio'
path_v_c_ratio <- paste0(dir_v_c_ratio, file_v_c_ratio)

LOS_v_c_ratio <- read_csv(path_v_c_ratio)

# Define LOS function : when design_speed == 100 kph
LOS <- function(vcr = NULL){
  if(vcr <= 0.27 & vcr > 0){l <- 'A'}
  else if(vcr <= 0.45 & vcr > 0.27){l <- 'B'}
  else if(vcr <= 0.61 & vcr > 0.45){l <- 'C'}
  else if(vcr <= 0.80 & vcr > 0.61){l <- 'D'}
  else if(vcr <= 1.00 & vcr > 0.80){l <- 'E'}
  else if(vcr > 1.00){l <- 'F'}
  else {l <- 'Error : [vcr] must be positive. Please check that.'}
  l
}

# Make LOS Columns

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$sun_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$mon_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$tue_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$wed_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$thu_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$fri_opened_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_opened_1[i] <- LOS(vcr = LOS_v_c_ratio$sat_opened_1[i])
}


for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$sun_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$mon_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$tue_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$wed_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$thu_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$fri_closed_1[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_closed_1[i] <- LOS(vcr = LOS_v_c_ratio$sat_closed_1[i])
}



### _2

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$sun_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$mon_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$tue_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$wed_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$thu_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$fri_opened_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_opened_2[i] <- LOS(vcr = LOS_v_c_ratio$sat_opened_2[i])
}


for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$sun_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$mon_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$tue_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$wed_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$thu_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$fri_closed_2[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_closed_2[i] <- LOS(vcr = LOS_v_c_ratio$sat_closed_2[i])
}


###

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$sun_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$mon_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$tue_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$wed_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$thu_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$fri_opened_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_opened_3[i] <- LOS(vcr = LOS_v_c_ratio$sat_opened_3[i])
}


for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$sun_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$mon_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$tue_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$wed_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$thu_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$fri_closed_3[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sat_closed_3[i] <- LOS(vcr = LOS_v_c_ratio$sat_closed_3[i])
}


###

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$sun_opened_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$mon_opened_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$tue_opened_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$wed_opened_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$thu_opened_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_opened_4[i] <- LOS(vcr = LOS_v_c_ratio$fri_opened_4[i])
}




for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_sun_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$sun_closed_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_mon_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$mon_closed_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_tue_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$tue_closed_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_wed_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$wed_closed_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_thu_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$thu_closed_4[i])
}

for (i in 1:nrow(LOS_v_c_ratio)){
  LOS_v_c_ratio$LOS_fri_closed_4[i] <- LOS(vcr = LOS_v_c_ratio$fri_closed_4[i])
}




# Save V/C ratio & LOS .csv file
dir_output <- dir_v_c_ratio
file_output <- 'LOS.csv'
path_output <- paste0(dir_output, file_output)

write_csv(LOS_v_c_ratio, path_output)
