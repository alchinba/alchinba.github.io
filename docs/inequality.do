gen hhpoverty = HouseholdswithIncomeinthepa/Numberofhouseholds*100
gen hhassistance = Householdwithpublicassistance/Numberofhouseholds*100
gen degree = PopulationwithaBachelorsdeg/TotalPopulation*100
gen whiteratio = Whitealonepopulation/TotalPopulation*100
gen blackratio = BlackorAfricanAmericanalone/TotalPopulation*100
gen hispanicratio = HispanicorLatinopopulation/TotalPopulation*100
gen married = Marriedpopulation/TotalPopulation*100

label var hhpoverty "Households below poverty as % of total"
label var hhassistance "Households with assistance income as % of total"
label var degree "Bachelors or higher as % of population"
label var whiteratio "White as % of total population"
label var blackratio "Black as % of total population"
label var hispanicratio "Hispanic as % of total population"
label var married "Married as % of population"

******

estpost corr Incomeshareofthetop5 degree UnemploymentRate whiteratio blackratio  hispanicratio married hhassistance hhpoverty, matrix listwise
esttab using Inequality_table_correlation.rtf, ///
       replace ///
       plain ///
       nonumbers ///
       unstack ///
       not ///
       compress ///
       title("Table 1. Correlation between Income share of the top 5% and some of the potential main explanatory variables") ///
       addnote("Note:  ." ///
               "Source:  Data provided by instructor.")
			   
******

estpost corr GiniIndex degree UnemploymentRate whiteratio blackratio  hispanicratio married hhassistance hhpoverty, matrix listwise
esttab using Gini_table_correlation.rtf, ///
       replace ///
       plain ///
       nonumbers ///
       unstack ///
       not ///
       compress ///
       title("Table 1. Correlation between Gini Index and some of the potential main explanatory variables") ///
       addnote("Note:  ." ///
               "Source:  Data provided by instructor.")
			   
********

estpost tabstat *, stats(n mean sd sk min p5 p25 p50 p75 p95 max) ///
                      column(statistics)
   esttab using ineq2019_tabstat_WORD.rtf, ///
           cells("count mean(fmt(2)) sd(fmt(2)) skewness(fmt(2)) min(fmt(2)) p5(fmt(2)) p25(fmt(2)) p50(fmt(2)) p75(fmt(2)) p95(fmt(2)) max(fmt(2))") ///
           replace ///
           label ///
           varwidth(30) ///
           nomtitles ///
           nonumbers ///
           title("Table 1. Summary statistics: Income Inequality across Urban Areas." ///
		   "Average values from 2015 to 2019") ///
           addnote("Note: Removed COLI (Cost of Living Index) due to the missing data and format issues." ///
                   "Source: Data provided by instructor.")

*****

graph twoway (scatter Incomeshareofthetop5 degree if Year==2009) (lfit Incomeshareofthetop5 degree if Year==2009), ///
      title("Scatter plot: Income share of the top 5% vs. Percent" ///
"of population with Bachelors or higher") ///
	  ylabel(15(5)35, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(10)40)  ///
	  subtitle(Average 2005-2009)  ///
	  note("Note:   Number of observations is 953." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")
		  
*****

graph twoway (scatter Incomeshareofthetop5 degree if Year==2019) (lfit Incomeshareofthetop5 degree if Year==2019), ///
      title("Scatter plot: Income share of the top 5% vs. Percent" ///
"of population with Bachelors or higher") ///
	  ylabel(15(5)35, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(10)40)  ///
	  subtitle(Average 2015-2019)  ///
	  note("Note:   Number of observations is 938." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")

*****

graph twoway (scatter Incomeshareofthetop5 UnemploymentRate if Year==2009) (lfit Incomeshareofthetop5 UnemploymentRate if Year==2009), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Unemployment Rate") ///
	  ylabel(15(5)35, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(20(10)50)  ///
	  subtitle(Average 2005-2009)  ///
	  note("Note:   Number of observations is 953." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")
	
*****

graph twoway (scatter Incomeshareofthetop5 UnemploymentRate if Year==2019) (lfit Incomeshareofthetop5 UnemploymentRate if Year==2019), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Unemployment Rate") ///
	  ylabel(15(5)30, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(5)25)  ///
	  subtitle(Average 2015-2019)  ///
	  note("Note:   Number of observations is 938." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")

*****

graph twoway (scatter Incomeshareofthetop5 blackratio if Year==2009) (lfit Incomeshareofthetop5 blackratio if Year==2009), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Black as % of total population") ///
	  ylabel(15(5)35, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(20)80)  ///
	  subtitle(Average 2005-2009)  ///
	  note("Note:   Number of observations is 953." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")

*****

graph twoway (scatter Incomeshareofthetop5 blackratio if Year==2019) (lfit Incomeshareofthetop5 blackratio if Year==2019), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Black as % of total population") ///
	  ylabel(15(5)30, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(20)80)  ///
	  subtitle(Average 2015-2019)  ///
	  note("Note:   Number of observations is 938." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")
		  
*****

graph twoway (scatter Incomeshareofthetop5 hhpoverty if Year==2009) (lfit Incomeshareofthetop5 hhpoverty if Year==2009), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Households below poverty as % of total") ///
	  ylabel(15(5)35, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(10)60)  ///
	  subtitle(Average 2005-2009)  ///
	  note("Note:   Number of observations is 953." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")

*****
	
graph twoway (scatter Incomeshareofthetop5 hhpoverty if Year==2019) (lfit Incomeshareofthetop5 hhpoverty if Year==2019), ///
      title("Scatter plot: Income share of the top 5% vs." ///
	  "Households below poverty as % of total") ///
	  ylabel(15(5)30, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Income share of the top 5%", size(medsmall)) ///
	  xlabel(0(20)80)  ///
	  subtitle(Average 2015-2019)  ///
	  note("Note:   Number of observations is 938." ///
          "Source:  NHGIS (National Historic Geographic Information System), U.S. Census Bureau")
		  
*****

hist  Incomeshareofthetop5 if Year==2009, ///
     start(14) width(1) percent addlabels addlabopts(yvarformat(%4.1f)) mlabsize(minuscule) ///
     xlabel(15(5)30, labsize(small) format(%-9.0gc)) ///
     xtick(15(5)30)  ///
     xtitle("Income share of the top 5%", size(medsmall))  ///
     ylabel(0(5)20, angle(horizontal) format(%9.0gc))  ///
     title("Histogram: Income share of the top 5%") ///
     subtitle(2009)  ///
     note("Note:  Number of observations is 953." ///
          "Source: NHGIS (National Historic Geographic Information System), U.S. Census Bureau") ///
	 name(graph1, replace)

*****	 
	 
hist  Incomeshareofthetop5 if Year==2019, ///
     start(14) width(1) percent addlabels addlabopts(yvarformat(%4.1f)) mlabsize(minuscule) ///
     xlabel(15(5)30, labsize(small) format(%-9.0gc)) ///
     xtick(15(5)30)  ///
     xtitle("Income share of the top 5%", size(medsmall))  ///
     ylabel(0(5)20, angle(horizontal) format(%9.0gc))  ///
     title("Histogram: Income share of the top 5%") ///
     subtitle(2019)  ///
     note("Note:  Number of observations is 938." ///
          "Source: NHGIS (National Historic Geographic Information System), U.S. Census Bureau") ///
	 name(graph2, replace)
	 
graph combine graph1 graph2

*****	

gen ln_degree = ln( PopulationwithaBachelorsdeg)
gen ln_unemploy = ln( UnemploymentRate)
gen ln_blackratio = ln(BlackorAfricanAmericanalone)
gen ln_hhpoverty = ln(HouseholdswithIncomeinthepa)



eststo clear   /* clear any regressions that may be already stored in memory */
  eststo:  quietly  reg Incomeshareofthetop5 ln_degree, r
  eststo:  quietly  reg Incomeshareofthetop5 ln_degree ln_unemploy, r
  eststo:  quietly  reg Incomeshareofthetop5 ln_degree ln_unemploy ln_blackratio, r
  eststo:  quietly  reg Incomeshareofthetop5 ln_degree ln_unemploy ln_blackratio ln_hhpoverty, r
  esttab using wage_sidebyside_regressions_WORD.rtf, ///
          r2 ar2 se scalar(F rmse) ///
          star(* 0.10 ** 0.05 *** 0.01) ///
          label ///
          depvars ///
          varwidth(30) ///
		  replace ///
          title("Table 1. Regression results for Income share of the top 5%") ///
          nonotes ///
          addnote("Note 1:  Robust standard errors are displayed in parenthesis." ///
                  "Significance levels:  * p<0.10; ** p<0.05; *** p<0.01" ///
                  "Source: NHGIS (National Historic Geographic Information System), U.S. Census Bureau.")
				  
				  
	*****
	
xtreg Incomeshareofthetop5 ln_degree ln_unemploy ln_blackratio ln_hhpoverty, r fe

eststo clear   /* clear any regressions that may be already stored in memory */
  eststo:  quietly  xtreg Incomeshareofthetop5 ln_degree, r fe
  eststo:  quietly  xtreg Incomeshareofthetop5 ln_degree ln_unemploy, r fe
  eststo:  quietly  xtreg Incomeshareofthetop5 ln_degree ln_unemploy ln_blackratio, r fe
  eststo:  quietly  xtreg Incomeshareofthetop5 ln_degree ln_unemploy ln_blackratio ln_hhpoverty, r fe
  esttab using inequality_sidebyside_regressions_WORD.rtf, ///
          r2 ar2 se scalar(F rmse) ///
          star(* 0.10 ** 0.05 *** 0.01) ///
          label ///
          depvars ///
          varwidth(30) ///
		  replace ///
          title("Table 1. Regression results for Income share of the top 5%") ///
          nonotes ///
          addnote("Note 1:  Robust standard errors are displayed in parenthesis." ///
                  "Significance levels:  * p<0.10; ** p<0.05; *** p<0.01" ///
                  "Source: NHGIS (National Historic Geographic Information System), U.S. Census Bureau.")
		
*****
		
eststo clear   /* clear any regressions that may be already stored in memory */
  eststo:  quietly  xtreg ln_incshare ln_degree, r fe
  eststo:  quietly  xtreg ln_incshare ln_degree ln_hhpoverty, r fe
  eststo:  quietly  xtreg ln_incshare ln_degree ln_hhpoverty ln_unemploy ln_blackratio, r fe
  esttab using inequality2_sidebyside_regressions_WORD.rtf, ///
          r2 ar2 se scalar(F rmse) ///
          star(* 0.10 ** 0.05 *** 0.01) ///
          label ///
          depvars ///
          varwidth(30) ///
		  replace ///
          title("Table 1. Fixed Effects Regression results for Income share of the top 5%") ///
          nonotes ///
          addnote("Note 1:  Robust standard errors are displayed in parenthesis." ///
                  "Significance levels:  * p<0.10; ** p<0.05; *** p<0.01" ///
                  "Source: NHGIS (National Historic Geographic Information System), U.S. Census Bureau.")