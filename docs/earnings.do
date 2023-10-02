import excel "\\Client\H$\Desktop\BC_courses\Econometrics_bc\Take-home assignment #3-1\cps_2008.xlsx", sheet("Data") firstrow
label var wage "earnings per hour ($)"
label var educ "years of education"
label var age "years"
label var exper "years of work experience"
label var female "=1 if female"
label var black "=1 if black"
label var white "=1 if white"
label var married "=1 if married"
label var union "=1 if union member"
label var northeast "=1 if northeast region of U.S."
label var midwest "=1 if midwest region of U.S."
label var south "=1 if south region of U.S."
label var west "=1 if west region of U.S."
label var fulltime "=1 if full time worker (as opposed to part-time worker)"
label var metro "=1 if lives in metropolitan area"
cd "\\Client\H$\Desktop\BC_courses\Econometrics_bc\Take-home assignment #3-1"
save "\\Client\H$\Desktop\BC_courses\Econometrics_bc\Take-home assignment #3-1\accidents.dta", replace

**********

estpost tabstat *, stats(n mean sd sk min p5 p25 p50 p75 p95 max) ///
                      column(statistics)
   esttab using accidents_tabstat_WORD.rtf, ///
           cells("count mean(fmt(2)) sd(fmt(2)) skewness(fmt(2)) min(fmt(2)) p5(fmt(2)) p25(fmt(2)) p50(fmt(2)) p75(fmt(2)) p95(fmt(2)) max(fmt(2))") ///
           replace ///
           label ///
           varwidth(30) ///
           nomtitles ///
           nonumbers ///
           title("Table 1. Summary statistics: 2008 Current Population Survey (CPS)") ///
           addnote("Note:  ." ///
                   "Source: Dr. Kang Sun Lee, Louisiana Department of Health and Human Services.")
				   
**********

graph twoway (lfit wage educ) (scatter wage educ), ///
      title("Scatter plot:  Earnings per hour vs. Years of education") ///
	  ylabel(0(10)80, angle(horizontal) format(%9.0gc)) ///
	  ytitle("Earnings per hour ($)", size(medsmall)) ///
	  xlabel(0(5)20)  ///
	  subtitle(2008)  ///
	  note("Note:      Number of observations is 4733." ///
          "Source:  Dr. Kang Sun Lee, Louisiana Department of Health and Human Services")

**********

scatter wage educ, name(graph1)

scatter wage ln_educ, name(graph2)

scatter ln_wage educ, name(graph3)

scatter ln_wage ln_educ, name(graph4)

graph combine graph1 graph2 graph3 graph4

		  
**********


eststo clear   /* clear any regressions that may be already stored in memory */
  eststo:  quietly  regress ln_wage ln_educ, robust
  eststo:  quietly  regress ln_wage educ, robust
  eststo:  quietly  regress ln_wage educ exper, robust
  eststo:  quietly  regress ln_wage educ exper female, robust
  eststo:  quietly  regress ln_wage educ exper female female_educ, robust
  esttab using wage_sidebyside_regressions_WORD.rtf, ///
          r2 ar2 se scalar(F rmse) ///
          star(* 0.10 ** 0.05 *** 0.01) ///
          label ///
          depvars ///
          varwidth(30) ///
		  replace ///
          title("Table 1. Regression results for person's earnings in 2008") ///
          nonotes ///
          addnote("Note 1:  Robust standard errors are displayed in parenthesis." ///
                  "Significance levels:  * p<0.10; ** p<0.05; *** p<0.01" ///
                  "Source:  Dr. Kang Sun Lee, Louisiana Department of Health and Human Services.")
				  

