# Health Insurance Claims — Where Is the Money Going?

## Project Overview

This project analyzes a synthetic health insurance claims dataset to identify where insurer healthcare spending is concentrated and which factors are contributing to overall claim costs.

The analysis uses **SQL and Python (Pandas)** to examine claims from multiple perspectives, including claim type, medical procedures, diagnoses, members, providers, and the relationship between billed and paid amounts.

The goal is to demonstrate how data analysis can be used to answer business questions and support healthcare cost management.

---

## Business Problem

An insurance company wants to understand where its healthcare spending is going.

The analysis focuses on four key questions:

1. Which claim types are driving insurer healthcare costs?
2. Which procedures and diagnoses are driving spending?
3. Which members are responsible for the highest healthcare costs?
4. How much of the amount providers bill does the insurer actually pay?

---

## Dataset

The project uses two synthetic datasets:

- **[claims.csv](data/claims.csv)** — Contains healthcare claim-level information, including claim type, CPT and ICD codes, billed amounts, and insurer-paid amounts.
- **[members.csv](data/members.csv)** — Contains member-level information, including age, gender, plan type, and enrollment dates.

### Claims Dataset

The claims dataset contains:

- Claim ID
- Member ID
- Provider ID
- Claim Date
- Claim Type
- CPT Code
- ICD Code
- Billed Amount
- Paid Amount

### Members Dataset

The members dataset contains:

- Member ID
- Member Age
- Member Gender
- Plan Type
- Enrollment Start Date
- Enrollment End Date

### Dataset Access

The raw datasets are available directly in this repository:

- **[View claims.csv](data/claims.csv)**
- **[View members.csv](data/members.csv)**

These files can be opened directly on GitHub or downloaded for local analysis.

---

## Data Validation

Before conducting the analysis, the datasets were inspected and validated using both SQL and Python.

Validation included:

- Row counts
- Duplicate checks
- Missing-value checks
- Data types
- Unique values
- Financial data inspection
- Date validation

The claims dataset contains **449 claims**, while the members dataset contains **100 members**.

The claims dataset contains **449 unique claim IDs** and no duplicate claim IDs.

---

## Tools & Technologies

- **PostgreSQL**
- **DBeaver**
- **Python**
- **Pandas**
- **Jupyter Notebook**
- **Git**
- **GitHub**

---

## Analysis Approach

The project follows a structured analytical workflow:

### 1. Data Setup & Validation

The datasets were imported and inspected using both SQL and Python.

The data was checked for:

- Missing values
- Duplicate records
- Appropriate data types
- Unique identifiers
- Date fields
- Financial fields
- Distinct claim types, providers, CPT codes, and ICD codes

### 2. Claim Type Cost Breakdown

Claims were grouped by claim type to compare:

- Total billed amount
- Total paid amount
- Number of claims
- Average paid amount per claim

This analysis helps identify whether healthcare spending is driven primarily by claim volume or by the cost of individual claims.

### 3. CPT & ICD Cost Drivers

The analysis identified:

- Top CPT codes by total paid amount
- Top ICD codes by total paid amount
- CPT codes with the highest average paid amount per claim

This provides a procedure- and diagnosis-level view of healthcare spending.

### 4. Member-Level Analysis

Members were ranked by total insurer-paid amounts.

The highest-cost members were then analyzed by claim type to identify the sources of their healthcare spending.

### 5. Billed vs Paid Analysis

A paid ratio was calculated as:

**Paid Ratio = Total Paid Amount / Total Billed Amount**

The ratio was compared across:

- Claim types
- Providers
- CPT codes

The analysis also considered the financial magnitude of the difference between billed and paid amounts.

---

## Key Findings

The analysis identified several important patterns.

### Claim Type Spending

**Inpatient claims were the largest source of insurer-paid spending**, with approximately **$1.09 million** paid across 99 claims.

Although outpatient claims had a higher number of claims, inpatient claims had a substantially higher average paid amount per claim.

The average paid amount for an inpatient claim was approximately **$11,034.91**.

### CPT & ICD Cost Drivers

A relatively small number of CPT and ICD codes accounted for substantial amounts of insurer spending.

The highest CPT code by total paid amount was:

**CPT 67890 — $242,735**

The highest ICD code by total paid amount was:

**ICD I10 — $259,566**

The CPT code with the highest average paid amount per claim was:

**CPT 36512 — $25,600 per claim**

These results demonstrate that total spending and average spending per claim provide different perspectives on healthcare cost drivers.

### Member-Level Spending

Healthcare spending was concentrated among a relatively small group of members.

The highest-cost member was:

**Member 6 — $43,300**

The member-level analysis also showed that inpatient claims were the main contributor to spending among the highest-cost members, with emergency and outpatient claims contributing to several members' totals.

### Billed vs Paid

The overall paid ratio was approximately:

**75.2%**

The paid ratio varied across claim types.

| Claim Type | Paid Ratio | Unpaid Amount |
|---|---:|---:|
| Lab | 90.8% | $2,377.55 |
| Pharmacy | 88.8% | $1,432.15 |
| Outpatient | 80.3% | $31,665.00 |
| Emergency | 76.6% | $89,800.19 |
| Inpatient | 73.9% | $386,145.25 |

Inpatient claims had the lowest paid ratio among the claim types at approximately 73.9%.

However, paid ratio alone does not identify cost drivers. Inpatient claims had a lower paid ratio but remained the largest source of insurer spending because of their much larger financial amounts.

---

## Cross-Analysis Insights

The four analyses provide complementary views of healthcare spending:

1. **Inpatient care represents the largest claim-type spending category.**
2. A relatively small number of **CPT and ICD codes account for substantial spending**.
3. Healthcare spending is concentrated among a relatively small group of members.
4. **Paid ratio and total paid amount measure different aspects of healthcare spending.**
5. High claim volume does not necessarily mean high financial impact.
6. High or low paid ratios should be considered alongside financial magnitude and claim volume.

---

## Areas for Further Investigation

The analysis identifies several areas that could be investigated further.

These include:

- Claim denial or adjustment reasons
- Contractual adjustments
- Deductibles and copayments
- Coverage limitations
- Provider-level financial impact
- High-cost procedures
- High-cost members and their underlying diagnoses
- Changes in healthcare spending over time
- Claims with large differences between billed and paid amounts

The current dataset does not contain enough information to determine the specific reason why an individual claim was not paid in full.

---

## Limitations

This project uses a **synthetic health insurance claims dataset**.

The dataset does not contain detailed information explaining differences between billed and paid amounts, such as:

- Claim denial reasons
- Adjustment reasons
- Contractual adjustments
- Deductibles
- Copayments
- Coverage limitations

Therefore, the analysis identifies **patterns and areas for further investigation** rather than establishing the underlying cause of every payment difference.

Paid ratios should also be interpreted alongside financial magnitude and claim volume rather than in isolation.

---

## Project Structure

```text
health-insurance-claims/
│
├── data/
│   ├── claims.csv
│   └── members.csv
│
├── sql/
│   ├── 00_setup_and_validation.sql
│   ├── 01_claim_type_cost_breakdown.sql
│   ├── 02_cpt_icd_cost_drivers.sql
│   ├── 03_member_level_analysis.sql
│   └── 04_billed_vs_paid_ratio.sql
│
├── python/
│   ├── 00_data_setup_and_inspection.ipynb
│   ├── 01_claim_type_cost_breakdown.ipynb
│   ├── 02_cpt_icd_cost_drivers.ipynb
│   ├── 03_member_level_analysis.ipynb
│   └── 04_billed_vs_paid_ratio.ipynb
│
├── findings/
│   └── findings.md
│
└── README.md
Before conducting the analysis, the datasets were inspected and validated using both SQL and Python.

Validation included:

- Row counts
- Duplicate checks
- Missing-value checks
- Data types
- Unique values
- Financial data inspection
- Date validation

The claims dataset contains **449 claims**, while the members dataset contains **100 members**.

The claims dataset contains **449 unique claim IDs** and no duplicate claim IDs.

---

## Tools & Technologies

- **PostgreSQL**
- **DBeaver**
- **Python**
- **Pandas**
- **Jupyter Notebook**
- **Git**
- **GitHub**

---

## Analysis Approach

The project follows a structured analytical workflow:

### 1. Data Setup & Validation

The datasets were imported and inspected using both SQL and Python.

The data was checked for:

- Missing values
- Duplicate records
- Appropriate data types
- Unique identifiers
- Date fields
- Financial fields
- Distinct claim types, providers, CPT codes, and ICD codes

### 2. Claim Type Cost Breakdown

Claims were grouped by claim type to compare:

- Total billed amount
- Total paid amount
- Number of claims
- Average paid amount per claim

This analysis helps identify whether healthcare spending is driven primarily by claim volume or by the cost of individual claims.

### 3. CPT & ICD Cost Drivers

The analysis identified:

- Top CPT codes by total paid amount
- Top ICD codes by total paid amount
- CPT codes with the highest average paid amount per claim

This provides a procedure- and diagnosis-level view of healthcare spending.

### 4. Member-Level Analysis

Members were ranked by total insurer-paid amounts.

The highest-cost members were then analyzed by claim type to identify the sources of their healthcare spending.

### 5. Billed vs Paid Analysis

A paid ratio was calculated as:

**Paid Ratio = Total Paid Amount / Total Billed Amount**

The ratio was compared across:

- Claim types
- Providers
- CPT codes

The analysis also considered the financial magnitude of the difference between billed and paid amounts.

---

## Key Findings

The analysis identified several important patterns.

### Claim Type Spending

**Inpatient claims were the largest source of insurer-paid spending**, with approximately **$1.09 million** paid across 99 claims.

Although outpatient claims had a higher number of claims, inpatient claims had a substantially higher average paid amount per claim.

The average paid amount for an inpatient claim was approximately **$11,034.91**.

### CPT & ICD Cost Drivers

A relatively small number of CPT and ICD codes accounted for substantial amounts of insurer spending.

The highest CPT code by total paid amount was:

**CPT 67890 — $242,735**

The highest ICD code by total paid amount was:

**ICD I10 — $259,566**

The CPT code with the highest average paid amount per claim was:

**CPT 36512 — $25,600 per claim**

These results demonstrate that total spending and average spending per claim provide different perspectives on healthcare cost drivers.

### Member-Level Spending

Healthcare spending was concentrated among a relatively small group of members.

The highest-cost member was:

**Member 6 — $43,300**

The member-level analysis also showed that inpatient claims were the main contributor to spending among the highest-cost members, with emergency and outpatient claims contributing to several members' totals.

### Billed vs Paid

The overall paid ratio was approximately:

**75.2%**

The paid ratio varied across claim types.

| Claim Type | Paid Ratio | Unpaid Amount |
|---|---:|---:|
| Lab | 90.8% | $2,377.55 |
| Pharmacy | 88.8% | $1,432.15 |
| Outpatient | 80.3% | $31,665.00 |
| Emergency | 76.6% | $89,800.19 |
| Inpatient | 73.9% | $386,145.25 |

Inpatient claims had the lowest paid ratio among the claim types at approximately 73.9%.

However, paid ratio alone does not identify cost drivers. Inpatient claims had a lower paid ratio but remained the largest source of insurer spending because of their much larger financial amounts.

---

## Cross-Analysis Insights

The four analyses provide complementary views of healthcare spending:

1. **Inpatient care represents the largest claim-type spending category.**
2. A relatively small number of **CPT and ICD codes account for substantial spending**.
3. Healthcare spending is concentrated among a relatively small group of members.
4. **Paid ratio and total paid amount measure different aspects of healthcare spending.**
5. High claim volume does not necessarily mean high financial impact.
6. High or low paid ratios should be considered alongside financial magnitude and claim volume.

---

## Areas for Further Investigation

The analysis identifies several areas that could be investigated further.

These include:

- Claim denial or adjustment reasons
- Contractual adjustments
- Deductibles and copayments
- Coverage limitations
- Provider-level financial impact
- High-cost procedures
- High-cost members and their underlying diagnoses
- Changes in healthcare spending over time
- Claims with large differences between billed and paid amounts

The current dataset does not contain enough information to determine the specific reason why an individual claim was not paid in full.

---

## Limitations

This project uses a **synthetic health insurance claims dataset**.

The dataset does not contain detailed information explaining differences between billed and paid amounts, such as:

- Claim denial reasons
- Adjustment reasons
- Contractual adjustments
- Deductibles
- Copayments
- Coverage limitations

Therefore, the analysis identifies **patterns and areas for further investigation** rather than establishing the underlying cause of every payment difference.

Paid ratios should also be interpreted alongside financial magnitude and claim volume rather than in isolation.

---

## Project Structure

```text
health-insurance-claims/
│
├── sql/
│   ├── 00_setup_and_validation.sql
│   ├── 01_claim_type_cost_breakdown.sql
│   ├── 02_cpt_icd_cost_drivers.sql
│   ├── 03_member_level_analysis.sql
│   └── 04_billed_vs_paid_ratio.sql
│
├── python/
│   ├── 00_data_setup_and_inspection.ipynb
│   ├── 01_claim_type_cost_breakdown.ipynb
│   ├── 02_cpt_icd_cost_drivers.ipynb
│   ├── 03_member_level_analysis.ipynb
│   └── 04_billed_vs_paid_ratio.ipynb
│
├── findings/
│   └── findings.md
│
└── README.md
