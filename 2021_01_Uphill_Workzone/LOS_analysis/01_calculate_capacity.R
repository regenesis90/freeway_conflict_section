# Define Function
f_iw_expwy_basic <- function(design_speed = NULL, weather = NULL, precip = NULL){
  if (weather == "sunny"){f_iw <- 1.00}
  else if (weather == "rainy"){
    if (design_speed == 80){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.97}
      else if (precip >= 5 & precip < 10){f_iw <- 0.92}
      else if (precip >= 10){f_iw <- 0.90}
      else {f_iw <- 'Error : [precip] must be positive. Please check that.'}
    }
    else if (design_speed == 100){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.94}
      else if (precip >= 5 & precip < 10){f_iw <- 0.90}
      else if (precip >= 10){f_iw <- 0.86}
    }
    else if (design_speed == 120){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.92}
      else if (precip >= 5 & precip < 10){f_iw <- 0.86}
      else if (precip >= 10){f_iw <- 0.81}
      else {f_iw <- 'Error : [precip] must be positive. Please check that.'}
    }
    else {f_iw <- 'Error : [design_speed] must be one of [80], [100], [120]. Please check that.'}
  }
  else if (weather == "snowy"){
    if (design_speed == 80){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.87}
      else if (precip >= 5 & precip < 10){f_iw <- 0.75}
      else if (precip >= 10){f_iw <- 0.67}
      else {f_iw <- 'Error : [precip] must be positive. Please check that.'}
    }
    else if (design_speed == 100){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.87}
      else if (precip >= 5 & precip < 10){f_iw <- 0.75}
      else if (precip >= 10){f_iw <- 0.67}
      else {f_iw <- 'Error : [precip] must be positive. Please check that.'}
    }
    else if (design_speed == 120){
      if (precip == 0){f_iw <- 1.00}
      else if (precip > 0 & precip < 5){f_iw <- 0.87}
      else if (precip >= 5 & precip < 10){f_iw <- 0.75}
      else if (precip >= 10){f_iw <- 0.67}
      else {f_iw <- 'Error : [precip] must be positive. Please check that.'}
    }
    else {f_iw <- 'Error : [design_speed] must be one of [80], [100], [120]. Please check that.'}
  }
  else {f_iw <- 'Error : [weather] must be one of [sunny], [rainy], [snowy]. Please check that.'}
  f_iw
}

f_dk <- function(design_speed = NULL, day_night = NULL){
  if (day_night == 'day'){f_dk <- 1.00}
  else if (day_night == 'night'){
    if (design_speed == 80){f_dk <- 0.97}
    else if (design_speed == 100){f_dk <- 0.93}
    else if (design_speed == 120){f_dk <- 0.91}
    else {'Error : [design_speed] must be one of [80], [100], [120]. Please check that.'}
  }
  else {'Error : [day_night] must be one of [day], [night]. Please check that.'}
  f_dk
}

capa_expwy_basic_j <- function(design_speed = NULL){
  if (design_speed == 80){result <- 2000}
  else if (design_speed == 100){result <- 2200}
  else if (design_speed == 120){result <- 2300}
  else {result <- 'Error : [design_speed] must be one of [80], [100], [120]. Please check that.'}
  result
}

capa_expwy_basic <- function(c_j = NULL, N = NULL, f_w = NULL, f_hv = NULL, f_iw = NULL, f_dk = NULL){
  if (c_j > 0){
    if (N >= 1){
      if (f_w > 0){
        if (f_hv > 0){
          if (f_iw > 0){
            if (f_dk > 0){res <- c_j * N * f_w * f_hv * f_iw * f_dk}
            else{res <- 'Error : [f_dk] must be positive. Please check that. See [f_dk()].'}
          }
          else {res <- 'Error : [f_iw] must be positive. Please check that. See [f_iw_expwy_basic()].'}
        }
        else {res <- 'Error : [f_hv] must be positive. Please check that. See [f_hv_expwy_basic()].'}
      }
      else{res <- 'Error : [f_w] must be positive. Please check that. See [f_w_expwy_basic()].'}
    }
    else{res <- 'Error : [N] must be >= 1 and integer. Please check that.'}
  }
  else {res <- 'Error : [c_j] must be positive(pcphpl). Please check that. See [capa_expwy_basic_wz_jw()] or [capa_expwy_basic_j()].'}
  res
}

f_hv_expwy_basic <- function(landform = NULL, P_T1 = NULL, P_T2 = NULL, P_T3 = NULL, P_hv = NULL, slope = NULL, slope_length = NULL){
  if (landform == 'flatland'){
    if (P_T1 >= 0 & P_T1 <= 1 & P_T2 >= 0 & P_T2 <= 1 & P_T3 >= 0 & P_T3 <= 1){
      f <- 1/(1 + P_T1 * (1.0 - 1) + P_T2 * (1.5 - 1) + P_T3 * (2.0 - 1))
    }
    else {
      f <- 'Error : [P_T1], [P_T2], [P_T3] must be >= 0 and <= 1. And [P_T1] + [P_T2] + [P_T3] must be <= 1. Please check that.'
    }
  }
  else if (landform == 'hill'){
    if (P_T1 >= 0 & P_T2 >= 0 & P_T3 >= 0 & (P_T1 + P_T2 + P_T3) <= 1){
      f <- 1/(1 + P_T1 * (1.2 - 1) + P_T2 * (3.0 - 1) + P_T3 * (3.0 - 1))
    }
    else {
      f <- 'Error : [P_T1], [P_T2], [P_T3] must be >= 0 and <= 1. And [P_T1] + [P_T2] + [P_T3] must be <= 1. Please check that.'
    }
  }
  else if (landform == 'mountain'){
    if (P_T1 >= 0 & P_T2 >= 0 & P_T3 >= 0 & (P_T1 + P_T2 + P_T3) <= 1){
      f <- 1/(1 + P_T1 * (1.5 - 1) + P_T2 * (5.0 - 1) + P_T3 * (5.0 - 1))
    }
    else {
      f <- 'Error : [P_T1], [P_T2], [P_T3] must be >= 0 and <= 1. And [P_T1] + [P_T2] + [P_T3] must be <= 1. Please check that.'
    }
  }
  else if (landform == 'specific_slope'){
    if (is.null(P_hv) == FALSE){
      if (P_hv >= 0 & P_hv <= 1){p <- P_hv}
      else {
        p <- NULL
        f <- 'Error : [P_hv] must be >= 0 and <= 1. Please check that.'}
    }
    else {
      if (P_T1 >= 0 & P_T2 >= 0 & P_T3 >= 0 & (P_T1 + P_T2 + P_T3) <= 1){
        p <- (P_T1 + P_T2 + P_T3)
      }
      else {
        p <- NULL
        f <- 'Error : [P_T1] + [P_T2] + [P_T3] must be >= 0 and <= 1. And each one must be >= 0. Please check that.'
      }
    }
    if (is.null(p) == FALSE & slope >= 0 & slope_length >= 0){
      ehv <- E_hv_expwy_basic(P_hv = p * 100, slope = slope, slope_length = slope_length)
      if (is.numeric(ehv) == TRUE){f <- 1/(1 + p * (ehv - 1))}
      else {f <- 'Error : Please check [P_hv], [slope] and [slope_length] values.'}
    }
    else {f <- 'Error : [P_hv] must be >= 0 and <= 1. Please check that.'}
  }
  else {f <- 'Error : [landform] must be one of them : [flatland], [hill], [mountain], [specific_slope]. Please check that.'}
  f
}

f_w_expwy_basic <- function(obs = NULL, side_clearance = NULL, lane = NULL, lane_width = NULL){
  if (obs == "one_side"){
    if (side_clearance >= 0 & side_clearance < 0.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.90}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.87}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.82}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.73}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.94}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.91}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.85}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.74}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 0.5 & side_clearance < 1.0){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.97}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.94}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.88}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.79}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.97}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.93}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.87}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.76}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 1.0 & side_clearance < 1.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.98}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.95}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.89}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.79}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.98}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.94}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.87}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.76}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 1.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 1.00}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.96}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.90}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.80}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 1.00}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.95}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.88}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.77}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else {factor <- 'Error : [side_clearance] must be >= 0. Please check that.'}
  }
  else if (obs == "both_sides"){
    if (side_clearance >= 0 & side_clearance < 0.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.81}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.79}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.74}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.66}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.91}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.87}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.81}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.70}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 0.5 & side_clearance < 1.0){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.94}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.91}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.86}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.76}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.96}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.92}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.85}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.75}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 1.0 & side_clearance < 1.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.96}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.93}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.87}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.77}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.97}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.93}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.86}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.76}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else if (side_clearance >= 1.5){
      if (lane == 4){
        if (lane_width >= 3.5){factor <- 0.99}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.96}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.90}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.80}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else if (lane >= 6){
        if (lane_width >= 3.5){factor <- 0.99}
        else if (lane_width >= 3.25 & lane_width < 3.5){factor <- 0.95}
        else if (lane_width >= 3.00 & lane_width < 3.25){factor <- 0.88}
        else if (lane_width >= 2.75 & lane_width < 3.00){factor <- 0.77}
        else {factor <- 'Error : [lane_width] must be eqal to or more than 2.75. Please check that'}
      }
      else {factor <- 'Error : [lane] must be 4 or 6 or more. Please check that.'}
    }
    else {factor <- 'Error : [side_clearance] must be >= 0. Please check that.'}
  }
  else{factor <- 'Error : [obs] must be one of [one_side] and [both_sides]. Please check that.'}
  factor
}

# Import Packages
library(tidyverse)

# Load Input Data : Uphill Road Information
input_dir <- 'D:/OneDrive - 연세대학교 (Yonsei University)/Projects/Yonsei_TELab/003_도로상충_210517-/2차년도_2022/02_기준설정_220110/LCS_LOS/'
input_file <- '02_LCS_info.csv'
input_path <- paste0(input_dir, input_file)
LCS <- read_csv(input_path, skip = 1)

# Calculate f_hv, f_w, capacity
for (i in 1:nrow(LCS)){
  LCS$f_hv[i] <- 
    f_hv_expwy_basic(landform = LCS$landform[i],
                     P_T1 = LCS$P_T1[i],
                     P_T2 = LCS$P_T2[i],
                     P_T3 = LCS$P_T3[i],
                     slope = LCS$slope[i],
                     slope_length = LCS$slope_length[i])
}

for (i in 1:nrow(LCS)){
  LCS$f_w[i] <- 
    f_w_expwy_basic(obs = LCS$obstacle[i],
                    side_clearance = LCS$side_clearance[i],
                    lane = LCS$lane[i]*2,
                    lane_width = LCS$lane_width[i])
}

for (i in 1:nrow(LCS)){
  LCS$f_dk[i] <-
    f_dk(design_speed = LCS$design_speed[i],
         day_night = LCS$day_night[i])
}

for (i in 1:nrow(LCS)){
  LCS$f_iw[i] <-
    f_iw_expwy_basic(design_speed = LCS$design_speed[i],
                     weather = LCS$weather[i],
                     precip = LCS$precip[i])
}


for (i in 1:nrow(LCS)){
  LCS$capa_j[i] <- 
    capa_expwy_basic_j(design_speed = LCS$design_speed[i])
}

for (i in 1:nrow(LCS)){
  LCS$capacity_closed[i] <- 
    capa_expwy_basic(c_j = LCS$capa_j[i],
                     N = LCS$lane[i],
                     f_w = LCS$f_w[i],
                     f_hv = LCS$f_hv[i],
                     f_iw = LCS$f_iw[i],
                     f_dk = LCS$f_dk[i])
}

for (i in 1:nrow(LCS)){
  LCS$capacity_opened[i] <- 
    capa_expwy_basic(c_j = LCS$capa_j[i],
                    N = LCS$lane[i] + LCS$lane_closed[i],
                    f_w = LCS$f_w[i],
                    f_hv = LCS$f_hv[i],
                    f_iw = LCS$f_iw[i],
                    f_dk = LCS$f_dk[i])
}

# Save Output .csv
output_dir <- input_dir
output_file <- 'capacity.csv'
output_path <- paste0(output_dir, output_file)
write_csv(LCS, file = output_path)