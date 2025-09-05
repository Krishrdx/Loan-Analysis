-- Loan Analysis SQL Extract & Validation

CREATE TABLE staging.loan_default AS
SELECT
  LoanID,
  ApplicantID,
  CAST(LoanAmount AS DECIMAL(18,2)) AS LoanAmount,
  CAST(Income AS DECIMAL(18,2)) AS Income,
  CASE WHEN Default IN (1,'1','Y','Yes','TRUE') THEN 1 ELSE 0 END AS DefaultFlag,
  CreditScore,
  CASE
    WHEN Age BETWEEN 18 AND 35 THEN 'Adults'
    WHEN Age BETWEEN 36 AND 55 THEN 'Middle Age Adults'
    WHEN Age BETWEEN 56 AND 70 THEN 'Senior Citizen'
    ELSE 'Teen'
  END AS AgeGroup,
  EmploymentType,
  Purpose,
  Education,
  HasMortgage,
  HasCoSigner,
  CAST(LoanDate AS DATE) AS LoanDate
FROM raw.loan
WHERE LoanAmount IS NOT NULL AND LoanAmount > 0;

-- Validation examples
SELECT COUNT(*) FROM staging.loan_default;
SELECT SUM(LoanAmount) AS total_loanamount FROM staging.loan_default;
