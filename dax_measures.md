# DAX Measures

Total Loan Amount := SUM('Loan_default'[LoanAmount])
Total Loans Count := DISTINCTCOUNT('Loan_default'[LoanID])
Total Defaults := CALCULATE(COUNTROWS('Loan_default'), 'Loan_default'[DefaultFlag] = 1)
Default Rate % := DIVIDE([Total Defaults], [Total Loans Count], 0)
Average Loan Amount := AVERAGE('Loan_default'[LoanAmount])

YOY Loan Amount Change % := 
VAR Curr = [Total Loan Amount]
VAR Prev = CALCULATE([Total Loan Amount], SAMEPERIODLASTYEAR('Calendar'[Date]))
RETURN DIVIDE(Curr - Prev, Prev, 0)

YOY Default Change % := 
VAR Curr = [Total Defaults]
VAR Prev = CALCULATE([Total Defaults], SAMEPERIODLASTYEAR('Calendar'[Date]))
RETURN DIVIDE(Curr - Prev, Prev, 0)
