*library;
Libname KYRBS 'C:\Users\user\OneDrive - 경희대학교\바탕 화면\KSJ\DATASET\kyrbs_dataset\kyrbs';
Libname POP 'C:\Users\user\OneDrive - 경희대학교\바탕 화면\KSJ\DATASET\kyrbs_dataset\pop';
run;

*KYRBS;
data kyrbs; 
set KYRBS.kyrbs2008 KYRBS.kyrbs2009 KYRBS.kyrbs2010 KYRBS.kyrbs2011 KYRBS.kyrbs2012 KYRBS.kyrbs2013 KYRBS.kyrbs2014
	 KYRBS.kyrbs2015 KYRBS.kyrbs2016 KYRBS.kyrbs2017 KYRBS.kyrbs2018 KYRBS.kyrbs2019 KYRBS.kyrbs2020 KYRBS.kyrbs2021 KYRBS.kyrbs2022;
run;

*pop;
data pop; 
set POP.pop08 POP.pop09 POP.pop10 POP.pop11 POP.pop12 POP.pop13 POP.pop14
	 POP.pop15 POP.pop16 POP.pop17 POP.pop18 POP.pop19 POP.pop20 POP.pop21 POP.pop22;
drop db_y;
run;

*data saving;
data KYRBS.kyrbs; set kyrbs; run;
data POP.pop; set pop; run;

*필요 변수만 남기기(keep);
data a; set kyrbs;
keep 
OBS
YEAR
SEX
AGE AGE_M
GRADE
CITY
HT
WT
E_SES
AC_DAYS
TC_days TC_EC_MN TC_HTP_MN
E_S_RCRD
S_SI S_OS_KIS_1 S_OS_SI_2 S_SS_KIS_3 S_SS_SI_4 S_SV_VCT_5 S_SV_ATK_6
E_RES
PA_VIG PA_VIG_D PA_VIG_MM PA_MSC
M_SAD
E_EDU_F E_EDU_M
INT_WD_MM2  INT_WK_MM2 INT_WD_MM INT_WK_MM INT_SP_WD INT_SP_WK INT_SPWD_TM INT_SPWK_TM
INT_WD	INT_WK	INT_SP	INT_SPWD INT_SPWK			
E_FM_F_1 E_LT_F E_FM_M_3  E_LT_M E_FM_GF_5 E_FM_GM_6 e_fm_sf_2 E_lt_sf e_fm_sm_4 E_lt_sm E_LT_FNM
W 
CLUSTER 
STRATA;
run;

*region;
data a; set a;
if CITY in ("강원" "경남" "경북" "전남" "전북" "충남" "충북" "제주") then region = 1; *rural;
else region = 2 ; run; *urban;

data city; set a;
drop CITY;
run;

*BMI;
data db1; *BMI-결측값 존재 - 키 결측 350000, 몸무게 결측 35000;
set city;
k=ht/100;
bmi=round(wt/(k*k),0.000000001);
/*2017년 소아청소년 성장도표 연령별 체질량지수 참고*/
/*< 남 자 >*/ 
if sex=1 then do;
*12세;
if age_m=144 then do; pct05=15.5; pct85=23.0; pct95=25.1; end;
if age_m=145 then do; pct05=15.6; pct85=23.0; pct95=25.1; end;
if age_m=146 then do; pct05=15.6; pct85=23.1; pct95=25.2; end;
if age_m=147 then do; pct05=15.7; pct85=23.1; pct95=25.2; end;
if age_m=148 then do; pct05=15.7; pct85=23.2; pct95=25.3; end;
if age_m=149 then do; pct05=15.7; pct85=23.2; pct95=25.3; end;
if age_m=150 then do; pct05=15.8; pct85=23.3; pct95=25.4; end;
if age_m=151 then do; pct05=15.8; pct85=23.3; pct95=25.4; end;
if age_m=152 then do; pct05=15.8; pct85=23.4; pct95=25.5; end;
if age_m=153 then do; pct05=15.9; pct85=23.4; pct95=25.5; end;
if age_m=154 then do; pct05=15.9; pct85=23.5; pct95=25.6; end;
if age_m=155 then do; pct05=16.0; pct85=23.5; pct95=25.6; end;
*13세;
if age_m=156 then do; pct05=16.0; pct85=23.6; pct95=25.7; end;
if age_m=157 then do; pct05=16.1; pct85=23.6; pct95=25.7; end;
if age_m=158 then do; pct05=16.1; pct85=23.6; pct95=25.7; end;
if age_m=159 then do; pct05=16.1; pct85=23.7; pct95=25.8; end;
if age_m=160 then do; pct05=16.2; pct85=23.7; pct95=25.8; end;
if age_m=161 then do; pct05=16.2; pct85=23.7; pct95=25.8; end;
if age_m=162 then do; pct05=16.3; pct85=23.8; pct95=25.8; end;
if age_m=163 then do; pct05=16.3; pct85=23.8; pct95=25.9; end;
if age_m=164 then do; pct05=16.3; pct85=23.8; pct95=25.9; end;
if age_m=165 then do; pct05=16.4; pct85=23.9; pct95=25.9; end;
if age_m=166 then do; pct05=16.4; pct85=23.9; pct95=26.0; end;
if age_m=167 then do; pct05=16.5; pct85=23.9; pct95=26.0; end;
*14세;
if age_m=168 then do; pct05=16.5; pct85=23.9; pct95=26.0; end;
if age_m=169 then do; pct05=16.6; pct85=24.0; pct95=26.0; end;
if age_m=170 then do; pct05=16.6; pct85=24.0; pct95=26.1; end;
if age_m=171 then do; pct05=16.7; pct85=24.0; pct95=26.1; end;
if age_m=172 then do; pct05=16.7; pct85=24.0; pct95=26.1; end;
if age_m=173 then do; pct05=16.7; pct85=24.1; pct95=26.1; end;
if age_m=174 then do; pct05=16.8; pct85=24.1; pct95=26.1; end;
if age_m=175 then do; pct05=16.8; pct85=24.1; pct95=26.1; end;
if age_m=176 then do; pct05=16.9; pct85=24.1; pct95=26.2; end;
if age_m=177 then do; pct05=16.9; pct85=24.2; pct95=26.2; end;
if age_m=178 then do; pct05=17.0; pct85=24.2; pct95=26.2; end;
if age_m=179 then do; pct05=17.0; pct85=24.2; pct95=26.2; end;
*15세;
if age_m=180 then do; pct05=17.0; pct85=24.2; pct95=26.2; end;
if age_m=181 then do; pct05=17.1; pct85=24.3; pct95=26.2; end;
if age_m=182 then do; pct05=17.1; pct85=24.3; pct95=26.3; end;
if age_m=183 then do; pct05=17.2; pct85=24.3; pct95=26.3; end;
if age_m=184 then do; pct05=17.2; pct85=24.3; pct95=26.3; end;
if age_m=185 then do; pct05=17.2; pct85=24.4; pct95=26.3; end;
if age_m=186 then do; pct05=17.3; pct85=24.4; pct95=26.3; end;
if age_m=187 then do; pct05=17.3; pct85=24.4; pct95=26.3; end;
if age_m=188 then do; pct05=17.4; pct85=24.4; pct95=26.4; end;
if age_m=189 then do; pct05=17.4; pct85=24.5; pct95=26.4; end;
if age_m=190 then do; pct05=17.4; pct85=24.5; pct95=26.4; end;
if age_m=191 then do; pct05=17.5; pct85=24.5; pct95=26.4; end;
*16세;
if age_m=192 then do; pct05=17.5; pct85=24.5; pct95=26.4; end;
if age_m=193 then do; pct05=17.5; pct85=24.6; pct95=26.4; end;
if age_m=194 then do; pct05=17.6; pct85=24.6; pct95=26.5; end;
if age_m=195 then do; pct05=17.6; pct85=24.6; pct95=26.5; end;
if age_m=196 then do; pct05=17.6; pct85=24.6; pct95=26.5; end;
if age_m=197 then do; pct05=17.7; pct85=24.7; pct95=26.5; end;
if age_m=198 then do; pct05=17.7; pct85=24.7; pct95=26.5; end;
if age_m=199 then do; pct05=17.7; pct85=24.7; pct95=26.6; end;
if age_m=200 then do; pct05=17.8; pct85=24.7; pct95=26.6; end;
if age_m=201 then do; pct05=17.8; pct85=24.7; pct95=26.6; end;
if age_m=202 then do; pct05=17.8; pct85=24.8; pct95=26.6; end;
if age_m=203 then do; pct05=17.9; pct85=24.8; pct95=26.6; end;
*17세;
if age_m=204 then do; pct05=17.9; pct85=24.8; pct95=26.6; end;
if age_m=205 then do; pct05=17.9; pct85=24.8; pct95=26.7; end;
if age_m=206 then do; pct05=18.0; pct85=24.9; pct95=26.7; end;
if age_m=207 then do; pct05=18.0; pct85=24.9; pct95=26.7; end;
if age_m=208 then do; pct05=18.0; pct85=24.9; pct95=26.7; end;
if age_m=209 then do; pct05=18.1; pct85=24.9; pct95=26.7; end;
if age_m=210 then do; pct05=18.1; pct85=25.0; pct95=26.7; end;
if age_m=211 then do; pct05=18.1; pct85=25.0; pct95=26.8; end;
if age_m=212 then do; pct05=18.1; pct85=25.0; pct95=26.8; end;
if age_m=213 then do; pct05=18.2; pct85=25.0; pct95=26.8; end;
if age_m=214 then do; pct05=18.2; pct85=25.1; pct95=26.8; end;
if age_m=215 then do; pct05=18.2; pct85=25.1; pct95=26.8; end;
*18세;
if age_m=216 then do; pct05=18.3; pct85=25.1; pct95=26.9; end;
if age_m=217 then do; pct05=18.3; pct85=25.1; pct95=26.9; end;
if age_m=218 then do; pct05=18.3; pct85=25.2; pct95=26.9; end;
if age_m=219 then do; pct05=18.3; pct85=25.2; pct95=26.9; end;
if age_m=220 then do; pct05=18.4; pct85=25.2; pct95=26.9; end;
if age_m=221 then do; pct05=18.4; pct85=25.2; pct95=26.9; end;
if age_m=222 then do; pct05=18.4; pct85=25.2; pct95=27.0; end;
if age_m=223 then do; pct05=18.5; pct85=25.3; pct95=27.0; end;
if age_m=224 then do; pct05=18.5; pct85=25.3; pct95=27.0; end;
if age_m=225 then do; pct05=18.5; pct85=25.3; pct95=27.0; end;
if age_m=226 then do; pct05=18.5; pct85=25.3; pct95=27.0; end;
if age_m=227 then do; pct05=18.6; pct85=25.4; pct95=27.0; end;
end;
/*< 여 자 >*/
if sex=2 then do;
 *12세;
if age_m=144 then do; pct05=15.3; pct85=22.1; pct95=24.1; end;
if age_m=145 then do; pct05=15.3; pct85=22.2; pct95=24.2; end;
if age_m=146 then do; pct05=15.4; pct85=22.2; pct95=24.2; end;
if age_m=147 then do; pct05=15.4; pct85=22.3; pct95=24.3; end;
if age_m=148 then do; pct05=15.5; pct85=22.3; pct95=24.4; end;
if age_m=149 then do; pct05=15.5; pct85=22.4; pct95=24.4; end;
if age_m=150 then do; pct05=15.6; pct85=22.4; pct95=24.5; end;
if age_m=151 then do; pct05=15.6; pct85=22.5; pct95=24.5; end;
if age_m=152 then do; pct05=15.7; pct85=22.5; pct95=24.6; end;
if age_m=153 then do; pct05=15.7; pct85=22.6; pct95=24.6; end;
if age_m=154 then do; pct05=15.8; pct85=22.7; pct95=24.7; end;
if age_m=155 then do; pct05=15.8; pct85=22.7; pct95=24.7; end;
*13세;
if age_m=156 then do; pct05=15.9; pct85=22.8; pct95=24.8; end;
if age_m=157 then do; pct05=15.9; pct85=22.8; pct95=24.8; end;
if age_m=158 then do; pct05=16.0; pct85=22.8; pct95=24.8; end;
if age_m=159 then do; pct05=16.0; pct85=22.9; pct95=24.9; end;
if age_m=160 then do; pct05=16.0; pct85=22.9; pct95=24.9; end;
if age_m=161 then do; pct05=16.1; pct85=23.0; pct95=25.0; end;
if age_m=162 then do; pct05=16.1; pct85=23.0; pct95=25.0; end;
if age_m=163 then do; pct05=16.2; pct85=23.0; pct95=25.0; end;
if age_m=164 then do; pct05=16.2; pct85=23.1; pct95=25.1; end;
if age_m=165 then do; pct05=16.3; pct85=23.1; pct95=25.1; end;
if age_m=166 then do; pct05=16.3; pct85=23.2; pct95=25.1; end;
if age_m=167 then do; pct05=16.4; pct85=23.2; pct95=25.2; end;
*14세;
if age_m=168 then do; pct05=16.4; pct85=23.3; pct95=25.2; end;
if age_m=169 then do; pct05=16.5; pct85=23.3; pct95=25.2; end;
if age_m=170 then do; pct05=16.5; pct85=23.3; pct95=25.2; end;
if age_m=171 then do; pct05=16.6; pct85=23.3; pct95=25.3; end;
if age_m=172 then do; pct05=16.6; pct85=23.4; pct95=25.3; end;
if age_m=173 then do; pct05=16.6; pct85=23.4; pct95=25.3; end;
if age_m=174 then do; pct05=16.7; pct85=23.4; pct95=25.3; end;
if age_m=175 then do; pct05=16.7; pct85=23.5; pct95=25.3; end;
if age_m=176 then do; pct05=16.8; pct85=23.5; pct95=25.4; end;
if age_m=177 then do; pct05=16.8; pct85=23.5; pct95=25.4; end;
if age_m=178 then do; pct05=16.9; pct85=23.6; pct95=25.4; end;
if age_m=179 then do; pct05=16.9; pct85=23.6; pct95=25.4; end;
*15세;
if age_m=180 then do; pct05=16.9; pct85=23.6; pct95=25.4; end;
if age_m=181 then do; pct05=17.0; pct85=23.6; pct95=25.4; end;
if age_m=182 then do; pct05=17.0; pct85=23.6; pct95=25.5; end;
if age_m=183 then do; pct05=17.0; pct85=23.7; pct95=25.5; end;
if age_m=184 then do; pct05=17.1; pct85=23.7; pct95=25.5; end;
if age_m=185 then do; pct05=17.1; pct85=23.7; pct95=25.5; end;
if age_m=186 then do; pct05=17.1; pct85=23.7; pct95=25.5; end;
if age_m=187 then do; pct05=17.2; pct85=23.7; pct95=25.5; end;
if age_m=188 then do; pct05=17.2; pct85=23.7; pct95=25.5; end;
if age_m=189 then do; pct05=17.2; pct85=23.7; pct95=25.5; end;
if age_m=190 then do; pct05=17.3; pct85=23.8; pct95=25.5; end;
if age_m=191 then do; pct05=17.3; pct85=23.8; pct95=25.5; end;
*16세;
if age_m=192 then do; pct05=17.3; pct85=23.8; pct95=25.5; end;
if age_m=193 then do; pct05=17.3; pct85=23.8; pct95=25.5; end;
if age_m=194 then do; pct05=17.3; pct85=23.8; pct95=25.5; end;
if age_m=195 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=196 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=197 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=198 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=199 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=200 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=201 then do; pct05=17.4; pct85=23.8; pct95=25.5; end;
if age_m=202 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
if age_m=203 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
*17세;
if age_m=204 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
if age_m=205 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
if age_m=206 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
if age_m=207 then do; pct05=17.5; pct85=23.8; pct95=25.5; end;
if age_m=208 then do; pct05=17.5; pct85=23.7; pct95=25.5; end;
if age_m=209 then do; pct05=17.5; pct85=23.7; pct95=25.5; end;
if age_m=210 then do; pct05=17.5; pct85=23.7; pct95=25.5; end;
if age_m=211 then do; pct05=17.5; pct85=23.7; pct95=25.5; end;
if age_m=212 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=213 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=214 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=215 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
*18세;
if age_m=216 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=217 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=218 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=219 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=220 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=221 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=222 then do; pct05=17.6; pct85=23.7; pct95=25.5; end;
if age_m=223 then do; pct05=17.6; pct85=23.6; pct95=25.5; end;
if age_m=224 then do; pct05=17.6; pct85=23.6; pct95=25.4; end;
if age_m=225 then do; pct05=17.6; pct85=23.6; pct95=25.4; end;
if age_m=226 then do; pct05=17.6; pct85=23.6; pct95=25.4; end;
if age_m=227 then do; pct05=17.7; pct85=23.6; pct95=25.4; end; end; 
run; *비만도 기준 프로그램;

data db1; set db1;
if bmi^=. and age^=. and ht^=. and wt^=. and pct95^=. and 
pct85^=. and pct05^=. then do;
 if bmi>=pct95 then g_BMI=4; /*비만*/
 else if pct85<=bmi<pct95 then g_BMI=3; /*과체중*/
 else if pct05<=bmi<pct85 then g_BMI=2;
 else if bmi<pct05 then g_BMI=1; /*저체중*/ 
end;
run;

data db1; set db1;
if g_BMI=. then g_BMI=0;*Unknown 처리;
drop ht wt;
run;

*음주;
/* proc freq data = money; table AC_DAYS; by YEAR; run; */
data alcohol; set db1;
if AC_DAYS in (2 3 4 5 6 7) then alcohol=1; *음주자;
else alcohol=0 ;*비음주;
run;

/* proc freq data = alcohol; table TC_days TC_EC_MN TC_HTP_MN; run; */
data smoking; set alcohol;
*2005~2010: 모든담배,궐련;
if YEAR in (2005 2006 2007 2008 2009 2010) then do;
if TC_DAYS in (1 9999) then smoking = 0;*비흡연자;
else if TC_DAYS in (2 3 4 5 6 7) then smoking =1;  *흡연자;
else smoking=0;
end;

*2011~2018: TC_DAYS, TC_EC_MN;
if YEAR in (2011 2012 2013 2014 2015 2016 2017 2018) then do;
if TC_DAYS in (1 9999) or TC_EC_MN in (1 9999) then smoking = 0;*비흡연자;
else if TC_DAYS in (2 3 4 5 6 7) or TC_EC_MN in (2 3 4 5 6 7) then smoking = 1;*흡연자;
end;

*2019~2022: TC_DAYS, TC_EC_MN,TC_HTP_MN ;
if YEAR in (2019 2020 2021 2022) then do;
if TC_DAYS in (1 9999) or TC_EC_MN in (1 9999) or TC_HTP_MN in (1 9999) then smoking = 0;*비흡연자;
else if TC_DAYS in (2 3 4 5 6 7) or TC_EC_MN in (2 3 4 5 6 7) or TC_HTP_MN in (2 3 4 5 6 7) then smoking = 1;*흡연자;
end;
run;
/* proc freq data = smoking noprint; table smoking/ out = s; run; */

/*proc freq data = smoking; table E_S_RCRD ; run;*/
*학교성적;
data score; set smoking;
rename E_S_RCRD = sc_SCORE; 
run;



*2005년 성적 (중) 없음. 3-->4 / 4-->5 ;
data score; set score; 
if YEAR = 2005 then do;
if sc_SCORE =3 then sc_SCORE = 4;
else if sc_SCORE =4 then sc_SCORE = 5;
end;
run;

/* proc freq data = test; table S_SI S_OS_KIS_1 S_OS_SI_2 S_SS_KIS_3 S_SS_SI_4 S_SV_VCT_5 S_SV_ATK_6; run;*/

*성행태;
data s_ex; set score;
* 2008~2012 전부;
if YEAR in (2008 2009 2010 2011 2012) then do;
    if S_OS_KIS_1 = 1 or S_SS_KIS_3 = 3 or S_OS_SI_2 = 2 or S_SS_SI_4 = 4 or S_SV_VCT_5 = 5 or S_SV_ATK_6 = 6 then s_ex = 1; /* 성행태 O */
    else if S_OS_KIS_1 = 9999 and S_SS_KIS_3 = 9999 and S_OS_SI_2 = 9999 and S_SS_SI_4 = 9999 and S_SV_VCT_5 = 9999 and S_SV_ATK_6 = 9999 then s_ex = 0; /*성행태 X*/
  end;

*동성이성 ;
 if YEAR in (2013 2014 2015 2016) then do;
    if S_OS_SI_2 = 2 or S_SS_SI_4 = 4 then s_ex = 1; /* 성행태 O */
    else if S_OS_SI_2 = 9999 and S_SS_SI_4 = 9999 then s_ex = 0;
  end;

*S_SI;
 if YEAR in ( 2017 2018 2019 2020 2021 2022) then do;
    if S_SI = 1 then s_ex = 0;
    else if S_SI = 2 then s_ex = 1;
  end;
 
run;

*주거형태;
/* proc freq data = test; table E_RES; run;*/

data jip; set s_ex;
if year>=2018 and e_res in ( 4 3) then e_res=3;
if year>=2018 and e_res=5 then e_res=4; run;

data jip1; set jip;
if year=2008 then do;
if e_res=1 and E_FM_F_1=1 and (E_LT_FNM in (1 2)) then fa=1; *아버지 거주;
if e_res =1 and  E_FM_M_3=3 and (E_LT_FNM in (1 3)) then mo=1; *어머니와 거주;
if e_res =1 and (E_FM_GF_5=5 or E_FM_GM_6=6) then jo=1; *조부모님과 거주;
if e_res =1 and e_fm_sf_2=2 and (E_LT_FNM in (1 2)) then fa_s=1; *양아버지와 거주;
if e_res =1 and e_fm_sm_4=4 and (E_LT_FNM in (1 3)) then mo_s=1; *양어머니와 거주;

if  fa=1 and mo=1 and jo^=1 and fa_s^=1 and mo_s^=1 then family_=1; *친부모 핵가족;
if fa=1 and mo^=1 and mo_s^=1 and fa_s^=1 and jo^=1 then family_=2; *친 한부모 ;
if mo=1 and fa^=1 and fa_s^=1 and mo_s^=1 and jo^=1 then family_=2; *친 한부모;
if (((mo_s=1 and mo^=1) and ((fa=1 and fa_s^=1) or (fa^=1 and fa_s=1))) or ((fa_s=1 and fa^=1) and ((mo=1 and mo_s^=1) or (mo^=1 and mo_s=1)))) and jo^=1 then family_=3; * 한명이라도 양부모;
if jo=1 and mo^=1 and fa^=1 and mo_s^=1 and fa_s^=1 then family_=4; * 조부모;
/*if jo^=1 and mo^=1 and fa^=1 and mo_s^=1 and fa_s^=1 and (E_FM_OBS_7=7 or E_FM_YBS_8=8 ) then family_=5; *형제만 살기. 근데 해보니 없음;*/
if e_res=2 and E_LT_FNM = 4 then family_=5; *친척집;
if e_res=3 and E_LT_FNM = 4 then family_=6; *하숙 자취 기숙사;
if e_res=4 and E_LT_FNM = 4 then family_=7;*보육시설;
end;


if year>=2009 then do;
if e_res=1 and E_FM_F_1=1 and E_LT_F=1 then fa=1; *아버지 거주;
if e_res =1 and  E_FM_M_3=3 and E_LT_M=1 then mo=1; *어머니와 거주;
if e_res =1 and (E_FM_GF_5=5 or E_FM_GM_6=6) then jo=1; *조부모님과 거주;
if e_res =1 and e_fm_sf_2=2 and E_lt_sf=1 then fa_s=1; *양아버지와 거주;
if e_res =1 and e_fm_sm_4=4 and E_lt_sm=1 then mo_s=1; *양어머니와 거주;

if fa=1 and mo=1 and jo^=1 and fa_s^=1 and mo_s^=1 then family_=1; *친부모 핵가족;
if fa=1 and mo^=1 and mo_s^=1 and fa_s^=1 and jo^=1 then family_=2; *친 한부모 ;
if mo=1 and fa^=1 and fa_s^=1 and mo_s^=1 and jo^=1 then family_=2; *친 한부모;
if (((mo_s=1 and mo^=1) and ((fa=1 and fa_s^=1) or (fa^=1 and fa_s=1))) or ((fa_s=1 and fa^=1) and ((mo=1 and mo_s^=1) or (mo^=1 and mo_s=1)))) and jo^=1 then family_=3; * 한명이라도 양부모;
if jo=1 and mo^=1 and fa^=1 and mo_s^=1 and fa_s^=1 then family_=4; * 조부모;
/*if jo^=1 and mo^=1 and fa^=1 and mo_s^=1 and fa_s^=1 and (E_FM_OBS_7=7 or E_FM_YBS_8=8 ) then family_=5; *형제만 살기;*/
if e_res=2 and E_LT_M^=1 and E_LT_F^=1 and E_lt_sf^=1 and E_lt_sm^=1 then family_=5; *친척집;
if e_res=3 and  E_LT_M^=1 and E_LT_F^=1 and E_lt_sf^=1 and E_lt_sm^=1 then family_=6; *하숙 자취 기숙사;
if e_res=4 and  E_LT_M^=1 and E_LT_F^=1 and E_lt_sf^=1 and E_lt_sm^=1 then family_=7;*보육시설;
end;
run;

data jip2; set jip1;
if family_ in (1 2 3) then family = 1;*1= nuclear family ;
else if family_ in (4 5) then family = 2; * 2= living with relatives w/o parents;
else if family_ = 6 then family = 3;* 3= living alone;
else if family_ = 7 then family = 4; * 4 = orphanage ;
else if family_=. then family = 5; *Unknown;
run;

/*proc freq data= jip; table year*family; run;*/


/*proc freq data=a20; table ctype; run;*/

* 신체활동;
/*고강도 유산소(20분이상) 일주일에 3회 이상&근력운동 일주일에 3회 이상=2 / 둘 중 하나만 = 1 / 둘 다 안 함 or unknown = 0 */
data p_activity; set jip2;
if 2008<=YEAR<=2021 then do;
if PA_VIG >=4 and PA_MSC >=4 then p_activity = 2;
else if PA_VIG >=4 or PA_MSC >=4 then p_activity = 1;
else if PA_VIG in (1 2 3) and PA_MSC in (1 2 3) then p_activity = 0;
end;

if YEAR>2021 then do;
if PA_VIG_D >=4 and PA_VIG_MM >= 20 and PA_MSC >=4 then p_activity = 2;
else if (PA_VIG >=4 and PA_VIG_MM >= 20) or PA_MSC >=4 then p_activity = 1;
else if ((PA_VIG >=4 and PA_VIG_MM<20) or PA_VIG in (1 2 3)) and PA_MSC in (1 2 3) then p_activity = 0;
end;
run;

data p_activity1; set p_activity;
if p_activity =. then p_activity = 0; run;

*우울감;
data sad; set p_activity1;
Sadness = M_SAD -1;
run;
data sad; set sad;
drop M_SAD;
run;

data sad; set sad;
if sadness = . then sadness = 0; run;
/*proc freq data = jip; table M_SAD; run; *결측 3명;*/

data P_EDU; set sad; 
if E_EDU_F=3 or E_EDU_M=3 then P_EDU=2;*college or higher;
else if E_EDU_F=2 or E_EDU_M=2 or E_EDU_F=1 or E_EDU_M=1 then P_EDU=1; *High school or lower;
else if E_EDU_F=4 or E_EDU_M=4 or E_EDU_F=9999 or E_EDU_M=9999 or E_EDU_F=8888 or E_EDU_M=8888 then P_EDU=3 or E_EDU_F=. or E_EDU_M=.; run; *Unknown;

data P_EDU; set P_EDU;
drop E_EDU_F E_EDU_M 
AC_DAYS TC_DAYS TC_EC_MN TC_HTP_MN AGE_M
pct05 pct85 pct95
K CITY;
run;

/*screentime 명목화 시키기*/
data sc_time;
set P_EDU;
rename INT_WD_MM2=screentime1;
rename INT_WK_MM2=screentime2;
rename INT_WD_MM=screentime3;
rename INT_WK_MM=screentime4;
rename INT_SP_WD=screentime5;
rename INT_SP_WK=screentime6;
rename INT_SPWD_TM=screentime7;
rename INT_SPWK_TM=screentime8;
run;

data sc_time1;
set sc_time;
newscreentime11 = (5*screentime1 + 2*screentime2)/7;
newscreentime22 = (5*screentime3 + 2*screentime4)/7;
newscreentime33 = (5*screentime5 + 2*screentime6)/7;
newscreentime44 = (5*screentime7 + 2*screentime8)/7;
run;

data sc_time2;
set sc_time1;

if INT_WD=1 and INT_WK=1 then newscreentime55=0;
else if INT_SP=1 then newscreentime55 =0;
else if INT_SPWD =1 and INT_SPWK =1 then newscreentime55 =0;

run;

data sc_time2;
set sc_time2;
if INT_WD=1 then nscreentime_wd=0;
else if INT_WK=1 then nscreentime_wk=0;
else if INT_SP=1 then nscreentime_wd=0 and nscreentime_wk=0 ;
else if INT_SPWD =1 then nscreentime_wd =0;
else if INT_SPWK =1 then nscreentime_wk = 0;
run;

data sc_time3; set sc_time2;
if newscreentime55 ^=. then screentime = newscreentime55;
else if newscreentime11 ^=. and newscreentime22 =. and newscreentime33 =. and newscreentime44 =. then screentime = newscreentime11;
else if newscreentime11 =. and newscreentime22 ^=. and newscreentime33 =. and newscreentime44 =. then screentime = newscreentime22;
else if newscreentime11 =. and newscreentime22 =. and newscreentime33 ^=. and newscreentime44 =. then screentime = newscreentime33;
else if newscreentime11 =. and newscreentime22 =. and newscreentime33 =. and newscreentime44 ^=. then screentime = newscreentime44;
run;

data sc_time4; set sc_time3;
if nscreentime_wd^=. then screentime_wd = nscreentime_wd;
else if screentime1 =. and screentime3 ^=. and screentime5 =. and screentime7 =. and nscreentime_wd=. then screentime_wd = screentime3;
else if screentime1 =. and screentime3 =. and screentime5 ^=. and screentime7 =. and nscreentime_wd=. then screentime_wd = screentime5;
else if screentime1 =. and screentime3 =. and screentime5 =. and screentime7 ^=. and nscreentime_wd=. then screentime_wd = screentime7;
else if screentime1 ^=. and screentime3 =. and screentime5 =. and screentime7 =. and nscreentime_wd=. then screentime_wd = screentime1;
else if nscreentime_wk^=. then screentime_wk = nscreentime_wk;
else if screentime2 ^=. and screentime4 =. and screentime6 =. and screentime8 =. and nscreentime_wk=. then screentime_wk = screentime2;
else if screentime2 =. and screentime4 ^=. and screentime6 =. and screentime8 =. and nscreentime_wk=. then screentime_wk = screentime4;
else if screentime2 =. and screentime4 =. and screentime6 ^=. and screentime8 =. and nscreentime_wk=. then screentime_wk = screentime6;
else if screentime2 =. and screentime4 =. and screentime6 =. and screentime8 ^=. and nscreentime_wk=. then screentime_wk = screentime8;
run;


data sc_time5;
set sc_time4;
 if screentime =. then screentime=99999;
 if screentime_wk =. and screentime_wd =. then screentime_wd =99999;
 if screentime_wk =. and screentime_wd =. then screentime_wk =99999;

run;
/*
proc sort data = sc_time4  ; by obs year; run;
proc sort data =sc_time4 nodupkey out=test; by obs year; run;
*/
data sc_time5; set sc_time5; 
if screentime = 99999 then SUBJECT = 0; 
/*if screentime_wd = 99999 and screentime_wk^=. then SUBJECT = 1; */

run;

*age 결측치 mean값으로 채우기;

proc sort data = sc_time5;
by grade ; run;
proc means data=sc_time5; 
by grade;run;

data age_modified; set sc_time5;
if grade=1 and age=. then age=12.5812798;
if grade=2 and age=. then age=13.5690283;
if grade=3 and age=. then age=14.5542801;
if grade=4 and age=. then age=15.5449252;
if grade=5 and age=. then age=16.5242815;
if grade=6 and age=. then age=17.4966422;
run;


data b; set age_modified; 
if year in (2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019) then period=1;
if year in (2020 2021 2022) then period=2;
run;

data year; set  b;
wt_total=w*(1/15);*1/총 연도수;
if period=1 then w_pandemic=w*(1/12);*1/묶인 연도수;
if period=2 then w_pandemic=w*(1/3);
run;

/*proc means data=age_modified; by subject ; var age; run;*/
data year; set year;
if  AGE=. or
    SEX =. or
    GRADE =. or
    region =. or
    smoking =. or
    Alcohol =. or
    sc_SCORE =. or
    s_ex =. or
    p_activity =. or
    sadness =. or
    e_res =. or
    family =. or
    g_BMI =. or
    P_EDU =. then SUBJECT = 0;
else if SUBJECT ^=0  then SUBJECT =1; run;

data year1; set year;
if YEAR in (2008 2009) then year_m=1;
if YEAR in (2010 2011) then year_m=2;
if YEAR in (2012 2013) then year_m=3;
if YEAR in (2014 2015) then year_m=4;
if YEAR in (2016 2017) then year_m=5;
if YEAR in (2018 2019) then year_m=6;
if YEAR in (2020 2021 2022) then year_m=7;
run;

data year1; set year1;
w_g_total=w*(1/15);*1/총 연도수;
if year_m=1 then w_g=w*(1/2);*1/묶인 연도수;
if year_m=2 then w_g=w*(1/2);
if year_m=3 then w_g=w*(1/2);
if year_m=4 then w_g=w*(1/2);
if year_m=5 then w_g=w*(1/2);
if year_m=6 then w_g=w*(1/2);
if year_m=7 then w_g=w*(1/3);
run;

proc sort data= year1; by year_m; run;




Libname Y 'C:\Users\user\OneDrive - 경희대학교\바탕 화면\KSJ\trend\screentime\데이터';
run;

data Y.data_preprocessed; set year1; run;

data year1; set Y.data_preprocessed; run;

/*table1*/
*table 1, overall, 결측치는 지우는게 아니라 이렇게 where로 구분하는 것 (차이?);
proc surveyfreq data=year1 nomcar ;
where subject =1;
  table
    SEX
    GRADE
    region
    smoking
    Alcohol
    sc_SCORE
    s_ex
    p_activity
    sadness
    family
    g_BMI
    P_EDU
    / cl row column; 
run;

*table1, year group별로;
proc surveyfreq data=year1 nomcar ;
where subject =1;
by year_m;
  table
    AGE
    SEX
    GRADE
    region
    smoking
    Alcohol
    sc_SCORE
    s_ex
    p_activity
    sadness
    e_res
    family
    g_BMI
    P_EDU
    / cl row column; 
run;

*table 1, mean (SD);
proc means data=year1; 
run;

proc means data=year1; 
by year_m;run;
;run;
/*여기까지 table1*/

/*weighted table1-total;*/
proc surveyfreq data=year1 nomcar total=pop;
strata strata;
cluster year cluster;
weight wt_total; 
where subject = 1;
table 
  GRADE
  AGE 
  SEX 
  region 
  smoking
  Alcohol
  sc_SCORE 
  s_ex 
  p_activity
  sadness
  e_res
  family 
  g_BMI
  P_EDU
/ cl row column;
run;

/*weighted table1-pre pandemic;*/
proc surveyfreq data=year1 nomcar total=pop;
strata strata;
cluster year cluster;
weight w_pandemic; 
where subject = 1 and period =1;
table 
  GRADE
  AGE 
  SEX 
  region 
  smoking
  Alcohol
  sc_SCORE 
  s_ex 
  p_activity
  sadness
  e_res
  family 
  g_BMI
  P_EDU
/ cl row column;
run;

/*weighted table1-intra pandemic;*/
proc surveyfreq data=year1 nomcar total=pop;
strata strata;
cluster year cluster;
weight w_pandemic; 
where subject = 1 and period =2;
table 
  GRADE
  AGE 
  SEX 
  region 
  smoking
  Alcohol
  sc_SCORE 
  s_ex 
  p_activity
  sadness
  e_res
  family 
  g_BMI
  P_EDU
/ cl row column;
run;





/*table2*/
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and SEX =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and SEX =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =6   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and region=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and region=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and smoking=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and smoking=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and alcohol=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and alcohol=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and s_ex=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and s_ex=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sadness=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sadness=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and P_EDU=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and P_EDU=2   ; var screentime;   ods graphics off; run;

proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and SEX =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and SEX =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and GRADE =6   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and region=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and region=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and smoking=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and smoking=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and alcohol=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and alcohol=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sc_SCORE=5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and s_ex=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and s_ex=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and p_activity=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sadness=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and sadness=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and g_BMI=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and P_EDU=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and P_EDU=2   ; var screentime; by year_m; ods graphics off; run;


data beta_pre beta_intra ; set year1;
if 2008<= year <2020  then output beta_pre;
if 2018<= year <=2022  then output beta_intra; run;

data pop_pre; set POP.pop08 POP.pop09	POP.pop10	POP.pop11	POP.pop12	POP.pop13	POP.pop14	POP.pop15	POP.pop16	POP.pop17	POP.pop18	POP.pop19; run;
data pop_intra; set POP.pop18	POP.pop19 POP.pop20	POP.pop21	POP.pop22 ; run;


%macro beta(dataaa=, totalaa=);
ods graphics off;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  ; RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and SEX =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and SEX =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and GRADE =6;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and region=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and region=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and smoking=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and smoking=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and alcohol=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and alcohol=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1   and sc_SCORE=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sc_SCORE=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sc_SCORE=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sc_SCORE=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sc_SCORE=5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and s_ex=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and s_ex=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and p_activity=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and p_activity=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and p_activity=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sadness=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and sadness=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and g_BMI=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and g_BMI=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and g_BMI=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and g_BMI=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and P_EDU=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and P_EDU=2;RUN;
%mend;

%beta(dataaa=pre, totalaa=pre);
%beta(dataaa=intra, totalaa=intra)


/*tableS1*/
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1; var screentime; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and SEX =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and SEX =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =6   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and region=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and region=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and smoking=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and smoking=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and alcohol=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and alcohol=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and s_ex=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and s_ex=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sadness=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sadness=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and P_EDU=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and P_EDU=2   ; var screentime;   ods graphics off; run;

proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and SEX =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and SEX =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and GRADE =6   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and region=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and region=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and smoking=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and smoking=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and alcohol=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and alcohol=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sc_SCORE=5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and s_ex=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and s_ex=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and p_activity=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sadness=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and sadness=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and g_BMI=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and P_EDU=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =1 and P_EDU=2   ; var screentime; by year_m; ods graphics off; run;

%macro beta(dataaa=, totalaa=);
ods graphics off;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1; RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and SEX =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and SEX =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and GRADE =6;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and region=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and region=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and smoking=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and smoking=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and alcohol=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and alcohol=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =1 and sc_SCORE=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sc_SCORE=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sc_SCORE=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sc_SCORE=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sc_SCORE=5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and s_ex=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and s_ex=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and p_activity=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and p_activity=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and p_activity=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sadness=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and sadness=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and g_BMI=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and g_BMI=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and g_BMI=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and g_BMI=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and P_EDU=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =1 and P_EDU=2;RUN;
%mend;

%beta(dataaa=pre, totalaa=pre);
%beta(dataaa=intra, totalaa=intra)

/*tableS2*/
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2; var screentime; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and SEX =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and SEX =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =6   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and region=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and region=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and smoking=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and smoking=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and alcohol=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and alcohol=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and s_ex=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and s_ex=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sadness=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sadness=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and P_EDU=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and P_EDU=2   ; var screentime;   ods graphics off; run;

proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and SEX =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and SEX =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and GRADE =6   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and region=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and region=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and smoking=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and smoking=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and alcohol=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and alcohol=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sc_SCORE=5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and s_ex=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and s_ex=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and p_activity=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sadness=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and sadness=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and g_BMI=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and P_EDU=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =2 and P_EDU=2   ; var screentime; by year_m; ods graphics off; run;

%macro beta(dataaa=, totalaa=);
ods graphics off;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2; RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and SEX =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and SEX =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and GRADE =6;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and region=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and region=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and smoking=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and smoking=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and alcohol=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and alcohol=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =2 and sc_SCORE=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sc_SCORE=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sc_SCORE=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sc_SCORE=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sc_SCORE=5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and s_ex=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and s_ex=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and p_activity=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and p_activity=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and p_activity=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sadness=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and sadness=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and g_BMI=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and g_BMI=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and g_BMI=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and g_BMI=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and P_EDU=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =2 and P_EDU=2;RUN;
%mend;

%beta(dataaa=pre, totalaa=pre);
%beta(dataaa=intra, totalaa=intra)

/*tableS3*/
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3; var screentime; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and SEX =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and SEX =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =6   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and region=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and region=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and smoking=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and smoking=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and alcohol=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and alcohol=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and s_ex=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and s_ex=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sadness=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sadness=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and P_EDU=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and P_EDU=2   ; var screentime;   ods graphics off; run;

proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and SEX =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and SEX =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and GRADE =6   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and region=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and region=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and smoking=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and smoking=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and alcohol=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and alcohol=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sc_SCORE=5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and s_ex=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and s_ex=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and p_activity=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sadness=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and sadness=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and g_BMI=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and P_EDU=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =3 and P_EDU=2   ; var screentime; by year_m; ods graphics off; run;

%macro beta(dataaa=, totalaa=);
ods graphics off;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3; RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and SEX =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and SEX =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and GRADE =6;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and region=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and region=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and smoking=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and smoking=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and alcohol=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and alcohol=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =3 and sc_SCORE=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sc_SCORE=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sc_SCORE=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sc_SCORE=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sc_SCORE=5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and s_ex=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and s_ex=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and p_activity=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and p_activity=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and p_activity=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sadness=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and sadness=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and g_BMI=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and g_BMI=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and g_BMI=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and g_BMI=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and P_EDU=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =3 and P_EDU=2;RUN;
%mend;

%beta(dataaa=pre, totalaa=pre);
%beta(dataaa=intra, totalaa=intra)

/*tableS4*/
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4; var screentime; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and SEX =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and SEX =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =6   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and region=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and region=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and smoking=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and smoking=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and alcohol=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and alcohol=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=5   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and s_ex=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and s_ex=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sadness=0   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sadness=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=2   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=3   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=4   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and P_EDU=1   ; var screentime;   ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and P_EDU=2   ; var screentime;   ods graphics off; run;

proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and SEX =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and SEX =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and GRADE =6   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and region=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and region=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and smoking=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and smoking=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and alcohol=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and alcohol=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sc_SCORE=5   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and s_ex=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and s_ex=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and p_activity=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sadness=0   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and sadness=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=2   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=3   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and g_BMI=4   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and P_EDU=1   ; var screentime; by year_m; ods graphics off; run;
proc surveymeans DATA=year1 MEAN STD CLM; strata strata; cluster cluster; weight w_g;  where subject =1 and family =4 and P_EDU=2   ; var screentime; by year_m; ods graphics off; run;

%macro beta(dataaa=, totalaa=);
ods graphics off;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4; RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and SEX =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and SEX =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and GRADE =6;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and region=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and region=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and smoking=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and smoking=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and alcohol=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and alcohol=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1  and family =4 and sc_SCORE=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sc_SCORE=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sc_SCORE=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sc_SCORE=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sc_SCORE=5;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and s_ex=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and s_ex=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and p_activity=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and p_activity=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and p_activity=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sadness=0;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and sadness=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and g_BMI=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and g_BMI=2;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and g_BMI=3;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and g_BMI=4;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and P_EDU=1;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=beta_&dataaa nomcar total=pop_&totalaa; strata strata; cluster cluster; weight w_g; MODEL screentime = year_m / stb clparm; where subject =1 and family =4 and P_EDU=2;RUN;
%mend;

%beta(dataaa=pre, totalaa=pre);
%beta(dataaa=intra, totalaa=intra)

/*table 2 끝*/

/*table3. association*/

data betaa_pre betaa_intra ; set year1;
if 2008<= year <2020  then output betaa_pre;
if 2020<= year <=2022  then output betaa_intra; run;

data popp_pre; set POP.pop08 POP.pop09	POP.pop10	POP.pop11	POP.pop12	POP.pop13	POP.pop14	POP.pop15	POP.pop16	POP.pop17	POP.pop18	POP.pop19; run;
data popp_intra; set POP.pop20	POP.pop21	POP.pop22 ; run;


data betaa_pre; set betaa_pre ;
w_pre = w/12 ; run;
data betaa_intra; set betaa_intra ;
w_intra = w/3 ; run;

*table 3;
%macro beta1(dataaa=, totalaa=, weight=);
*Biological factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sex / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = g_BMI  / stb clparm; where subject =1 ;RUN;

*Social factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = grade / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = region  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = smoking  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = alcohol  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sc_SCORE  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = s_ex  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = p_activity  / stb clparm; where subject =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sadness  / stb clparm; where subject =1 ;RUN;

*familial status;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = P_EDU  / stb clparm; where subject =1 ;RUN;

*전부
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = year age sex grade region smoking alcohol sc_SCORE s_ex p_activity sadness g_BMI P_EDU / stb clparm; where subject =1;RUN;
%mend;

%beta1(dataaa=pre, totalaa=pre, weight=pre);
%beta1(dataaa=intra, totalaa=intra, weight=intra)

*table S5;
%macro beta1(dataaa=, totalaa=, weight=);
*Biological factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sex / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = g_BMI  / stb clparm; where subject =1 and family =1 ;RUN;

*Social factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = grade / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = region  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = smoking  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = alcohol  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sc_SCORE  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = s_ex  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = p_activity  / stb clparm; where subject =1 and family =1 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sadness  / stb clparm; where subject =1 and family =1 ;RUN;

*familial status;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = P_EDU  / stb clparm; where subject =1 and family =1 ;RUN;

*전부
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = year age sex grade region smoking alcohol sc_SCORE s_ex p_activity sadness g_BMI P_EDU / stb clparm; where subject =1 and family =1;RUN;
%mend;

%beta1(dataaa=pre, totalaa=pre, weight=pre);
%beta1(dataaa=intra, totalaa=intra, weight=intra)

*table S6;
%macro beta1(dataaa=, totalaa=, weight=);
*Biological factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sex / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = g_BMI  / stb clparm; where subject =1 and family =2 ;RUN;

*Social factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = grade / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = region  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = smoking  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = alcohol  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sc_SCORE  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = s_ex  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = p_activity  / stb clparm; where subject =1 and family =2 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sadness  / stb clparm; where subject =1 and family =2 ;RUN;

*familial status;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = P_EDU  / stb clparm; where subject =1 and family =2 ;RUN;

*전부
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = year age sex grade region smoking alcohol sc_SCORE s_ex p_activity sadness g_BMI P_EDU / stb clparm; where subject =1 and family =2;RUN;
%mend;

%beta1(dataaa=pre, totalaa=pre, weight=pre);
%beta1(dataaa=intra, totalaa=intra, weight=intra)

*table S7;
%macro beta1(dataaa=, totalaa=, weight=);
*Biological factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sex / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = g_BMI  / stb clparm; where subject =1 and family =3 ;RUN;

*Social factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = grade / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = region  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = smoking  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = alcohol  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sc_SCORE  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = s_ex  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = p_activity  / stb clparm; where subject =1 and family =3 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sadness  / stb clparm; where subject =1 and family =3 ;RUN;

*familial status;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = P_EDU  / stb clparm; where subject =1 and family =3 ;RUN;

*전부
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = year age sex grade region smoking alcohol sc_SCORE s_ex p_activity sadness g_BMI P_EDU / stb clparm; where subject =1 and family =3;RUN;
%mend;

%beta1(dataaa=pre, totalaa=pre, weight=pre);
%beta1(dataaa=intra, totalaa=intra, weight=intra)

*table S8;
%macro beta1(dataaa=, totalaa=, weight=);
*Biological factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sex / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = g_BMI  / stb clparm; where subject =1 and family =4 ;RUN;

*Social factors;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = grade / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = region  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = smoking  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = alcohol  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sc_SCORE  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = s_ex  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = p_activity  / stb clparm; where subject =1 and family =4 ;RUN;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = sadness  / stb clparm; where subject =1 and family =4 ;RUN;

*familial status;
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = P_EDU  / stb clparm; where subject =1 and family =4 ;RUN;

*전부
ods select ParameterEstimates;PROC SURVEYreg DATA=betaa_&dataaa nomcar total=popp_&totalaa; strata strata; cluster cluster; weight w_&weight; MODEL screentime = year age sex grade region smoking alcohol sc_SCORE s_ex p_activity sadness g_BMI P_EDU / stb clparm; where subject =1 and family =4;RUN;
%mend;

%beta1(dataaa=pre, totalaa=pre, weight=pre);
%beta1(dataaa=intra, totalaa=intra, weight=intra)

