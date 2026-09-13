clear all
use "D:\indigo_presentation\mia\20222.dta" 

rename GDPpercapitagrowthannual gdp
rename PoliticalStabilityandAbsence pol
rename GovernmentEffectivenessEstima gov
rename GrosssavingsofGNINYGNS gross
gen Consumerpriceindex20101002=Consumerpriceindex2010100/1000
drop Consumerpriceindex2010100
rename Consumerpriceindex20101002 Consumerpriceindex2010100
gen log_gdp_level3=log(GDPpercapitaPPPconstant20)

reg gdp Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level3 YR2022 i.region5 if gdp <6 , robust
outreg2 using model1a.doc, replace dec(3)  

reg pol Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level3   i. region5, robust
outreg2 using model1a.doc, append dec(3)  

reg gov Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level3   i. region5, robust
outreg2 using model1a.doc, append dec(3)  

reg gross Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level3  i. region5 , robust
outreg2 using model1a.doc, append dec(3)  





clear all
use "D:\indigo_presentation\mia\20222.dta"

gen region5 = .

* Europe
replace region5 = 1 if region=="Europe_Central_Asia"

* Asia
replace region5 = 2 if region=="East_Asia_Pacific"
replace region5 = 2 if region=="South_Asia"
replace region5 = 2 if region=="Middle_East_North_Africa"

* Africa
replace region5 = 3 if region=="Sub_Saharan_Africa"

* Americas
replace region5 = 4 if region=="North_America"
replace region5 = 4 if region=="Latin_America_Caribbean"

* Oceania
replace region5 = 5 if CountryCode=="AUS"
replace region5 = 5 if CountryCode=="NZL"
replace region5 = 5 if CountryCode=="FJI"
replace region5 = 5 if CountryCode=="PNG"
replace region5 = 5 if CountryCode=="SLB"
replace region5 = 5 if CountryCode=="VUT"
replace region5 = 5 if CountryCode=="WSM"
replace region5 = 5 if CountryCode=="TON"
replace region5 = 5 if CountryCode=="TUV"
replace region5 = 5 if CountryCode=="KIR"
replace region5 = 5 if CountryCode=="PLW"
replace region5 = 5 if CountryCode=="FSM"
replace region5 = 5 if CountryCode=="MHL"

rename Laborforceparticipationrate lobor
rename Lifeexpectancyatbirthtotal life
rename RuleofLawEstimateRLEST rule 
gen Consumerpriceindex20101002=Consumerpriceindex2010100/1000
drop Consumerpriceindex2010100
rename Consumerpriceindex20101002 Consumerpriceindex2010100


reg lobor Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5, robust
outreg2 using model2a.doc, replace dec(3)  


reg M Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5, robust
outreg2 using model2a.doc, append dec(3)  

reg life Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5, robust
outreg2 using model2a.doc, append dec(3)  

reg rule Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5 , robust
outreg2 using model2a.doc, append dec(3)  







clear all
use "D:\indigo_presentation\mia\20222.dta" 

gen region5 = .

* Europe
replace region5 = 1 if region=="Europe_Central_Asia"

* Asia
replace region5 = 2 if region=="East_Asia_Pacific"
replace region5 = 2 if region=="South_Asia"
replace region5 = 2 if region=="Middle_East_North_Africa"

* Africa
replace region5 = 3 if region=="Sub_Saharan_Africa"

* Americas
replace region5 = 4 if region=="North_America"
replace region5 = 4 if region=="Latin_America_Caribbean"

* Oceania
replace region5 = 5 if CountryCode=="AUS"
replace region5 = 5 if CountryCode=="NZL"
replace region5 = 5 if CountryCode=="FJI"
replace region5 = 5 if CountryCode=="PNG"
replace region5 = 5 if CountryCode=="SLB"
replace region5 = 5 if CountryCode=="VUT"
replace region5 = 5 if CountryCode=="WSM"
replace region5 = 5 if CountryCode=="TON"
replace region5 = 5 if CountryCode=="TUV"
replace region5 = 5 if CountryCode=="KIR"
replace region5 = 5 if CountryCode=="PLW"
replace region5 = 5 if CountryCode=="FSM"
replace region5 = 5 if CountryCode=="MHL"







rename Researchanddevelopmentexpendi rnd
*rename CarbondioxideCO2emissions co2
rename VoiceandAccountabilityNumber voice
rename Literacyrateadulttotalof literacy
gen Consumerpriceindex20101002=Consumerpriceindex2010100/1000
drop Consumerpriceindex2010100
rename Consumerpriceindex20101002 Consumerpriceindex2010100


reg rnd Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i.i. region5 if gdp<8, robust
outreg2 using model3a.doc, replace dec(3)  


reg co2 Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5 if co2 < 9000, robust
outreg2 using model3a.doc, append dec(3)  

reg YR2022 Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5 if gdp<8, robust
outreg2 using model3a.doc, append dec(3)  

reg literacy Educationalattainmentatleast InflationGDPdeflatorannual  log_gdp_level2 i. region5, robust 
outreg2 using model3a.doc, append dec(3)  
