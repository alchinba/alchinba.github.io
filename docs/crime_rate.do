label var crmrte "crimes committed per person (ratio of # of crimes to county population)"
label var prbconv "probability of conviction (100 * ratio of convictions to arrests)"
label var prbarr "'probability' of arrest (100 * ratio of arrests to offenses)"
label var prbpris "'probability' of prison sentence (100 * 'ratio of prison sentences to convictions')"
label var prbpris "'probability' of prison sentence (100 * ratio of prison sentences to convictions)"
label var avgsen "average sentence, days"
label var polpc "police per capita"
label var density "thousands of people per sq. mile"
label var taxpc "tax revenue per capita"
label var west "=1 if in western region of N.C."
label var central "=1 if in central region of N.C."
label var east "=1 if in east region of N.C."
label var urban "=1 if in SMSA"
label var pctmin80 "perc. minority, 1980"
label var pctymle "percent young male"
label var wcon "weekly wage, construction industry"
label var wtuc "wkly wge, transportation, utililty, and communications industry"
label var wtrd "wkly wge, whlesle, retail trade industries"
label var wfir "wkly wge, finance, insurance, real estate industries"
label var wser "wkly wge, service industry"
label var wmfg "wkly wge, manufacturing industry"
label var wfed "wkly wge, federal employees"
label var wsta "wkly wge, state employees"
label var wloc "wkly wge, local gov emps"
label var county "county identifier (North Carolina)"
label var year "87"

**********

estpost tabstat *, stats(n mean sd sk min p5 p25 p50 p75 p95 max) ///
                      column(statistics)
   esttab using crime_tabstat_WORD.rtf, ///
           cells("count mean(fmt(2)) sd(fmt(2)) skewness(fmt(2)) min(fmt(2)) p5(fmt(2)) p25(fmt(2)) p50(fmt(2)) p75(fmt(2)) p95(fmt(2)) max(fmt(2))") ///
           replace ///
           label ///
           varwidth(30) ///
           nomtitles ///
           nonumbers ///
           title("Table 1.  Summary statistics: North Carolina Crime Data in 1987") ///
           addnote("Note:  ." ///
                   "Source: Data provided by instructor.")
				   
**********

hist crmrte, ///
     start(0) width(0.01) percent addlabels addlabopts(yvarformat(%4.1f)) mlabsize(minuscule) ///
     xlabel(0(.02).1, labsize(small) format(%-9.0gc)) ///
     xtick(0(.02).1)  ///
     xtitle("crimes committed per person (ratio of # of crimes to county population)", size(medsmall))  ///
     ylabel(0(10)40, angle(horizontal) format(%9.0gc))  ///
     title("Histogram: Crimes Committed per Person" ///
	 "in North Carolina") ///
     subtitle(1987)  ///
     note("Note:  Number of observations is 90." ///
          "Source: Data provided by instructor")

**********

hist prbarr, ///
     start(0) width(8) percent addlabels addlabopts(yvarformat(%4.1f)) mlabsize(minuscule) ///
     xlabel(0(10)110, labsize(small) format(%-9.0gc)) ///
     xtick(0(10)110)  ///
     xtitle("probability of arrest (100 * ratio of arrests to offenses)", size(medsmall))  ///
     ylabel(0(10)40, angle(horizontal) format(%9.0gc))  ///
     title("Histogram: Probability of Arrest" ///
           "100 * ratio of arrests to offenses", span) ///
     subtitle(1987)  ///
     note("Note:  Number of observations is 90." ///
          "Source: Data provided by instructor")
		  
**********

estpost corr crmrte prbarr prbconv prbpris avgsen polpc, matrix listwise
esttab using Crimerate_table_correlation.rtf, ///
       replace ///
       plain ///
       nonumbers ///
       unstack ///
       not ///
       compress ///
       title("Table 1. Correlation between Crime Rate and some of the potential main explanatory variables") ///
       addnote("Note:  ." ///
               "Source:  Data provided by instructor.")
			   
**********

scatter residuals prbarr, ///
      title("Scatter plot:  Residuals vs. Probability of Arrest") ///
	  subtitle("NC 1987") ///
	  ylabel(-0.04(0.02)0.06, angle(horizontal)) ///
	  xlabel(0(10)110)  ///
	  note("Note 1:  Number of observations is 90." ///
           "Note 2:  Residuals of the regression of Crime Rate on Probability of Arrest" ///
          "Source: Data provided by instructor")

format(%9.0gc)
**********

eststo clear   /* clear any regressions that may be already stored in memory */
  eststo:  quietly  regress crmrte prbarr, robust
  eststo:  quietly  regress crmrte prbarr density, robust
  eststo:  quietly  regress crmrte prbarr density urban, robust
  eststo:  quietly  regress crmrte prbarr urban, robust
  esttab using crimerate_sidebyside_regressions_WORD.rtf, ///
          r2 ar2 se scalar(F rmse) ///
          star(* 0.10 ** 0.05 *** 0.01) ///
          label ///
          depvars ///
          varwidth(30) ///
		  replace ///
          title("Table 1. Regression results for Crime Rates data from North Carolina in 1987") ///
          nonotes ///
          addnote("Note 1:  Robust standard errors are displayed in parenthesis." ///
                  "Note 2: The dependent variable is crimes committed per person (ratio of # of crimes to county population)." ///
                  "Significance levels:  * p<0.10; ** p<0.05; *** p<0.01" ///
                  "Source:  Data provided by instructor.")
				  

