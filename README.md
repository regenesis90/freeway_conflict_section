# [PR] 도로상충
**고속도로 상충구간 주행행태 분석 및 교통안전정책 효과평가 모델 개발(2021-2022)**
## 상충구간 유형
### 1차년도(2021)
* 오르막차로
* 공사구간
### 2차년도(2022)
* 2점 분합류(금호JC)
* 영업소(서울TG)
* 오르막차로 미설치 오르막구간
## 분석 과정
### 1. 구간별 LOS 계산(LOS_analysis)
* 구간별 용량 계산
* 구간별 교통량과 용량을 바탕으로 V/C 계산
* V/C를 바탕으로 구간별 LOS 산출
### 2. 기하구조 분석 · 대상지 평균 통계(draw_graph)
* 대상지 특징 일부를 시각화
  * 각 대상지의 연도별 사고 발생건수
  * 시간에 따른 주간 평균 교통량
  * 2016년 이후 교통사고 발생건수
### 3. 차량궤적데이터 분석(drone_analysis)
* 드론 고공촬영 영상을 바탕으로 추출된 차량궤적데이터 분석
* 데이터 가공 및 시각화
  * 프레임별 밀도와 서비스 수준 산정
  * 구간별/서비스 수준별 평균속도(SMS, 공간평균속도) 및 평균가속도, 속도와 가속도의 표준편차
  * 차로변경 횟수 및 속도, 가속도 산정
  * 과속, 급앞지르기, 급진로변경 횟수 산정
## Laboratory Info
**Traffic Engineering Lab., Yonsei University**
* **Tel.** : +82-2-2123-7237
* **Fax.** : +82-2-393-6298
* **Location** : S306, Engineering hall 1, Yonsei University, 50 Yonsei-ro, Seodaemun-gu, Seoul 03722, Republic of Korea
* **Website** : [Dept. of Urban Planning & Engineering](https://urban.yonsei.ac.kr/urban/research/traffic_engineering_overview.do)
