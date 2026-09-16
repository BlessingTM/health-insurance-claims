# Key Findings

## Executive Summary

This analysis examined healthcare insurance claims to identify where insurer spending is concentrated, which procedures and diagnoses contribute most to costs, which members account for the highest spending, and how billed amounts compare with insurer-paid amounts.

---

## Q1 — Claim Type Cost Breakdown

### Key Results

| Claim Type | Total Billed | Total Paid | Claims | Average Paid per Claim |
|---|---:|---:|---:|---:|
| Inpatient | $1,478,601.25 | $1,092,456.00 | 99 | $11,034.91 |
| Emergency | $384,241.55 | $294,441.36 | 88 | $3,345.92 |
| Outpatient | $160,717.75 | $129,052.75 | 105 | $1,229.07 |
| Lab | $25,789.90 | $23,412.35 | 76 | $308.06 |
| Pharmacy | $12,814.60 | $11,382.45 | 81 | $140.52 |

### Finding

Inpatient claims represent the largest source of insurer-paid spending at $1.09 million. Although outpatient claims had the highest claim volume, inpatient claims had a substantially higher average paid amount per claim.

This indicates that spending is influenced not only by claim volume but also by the cost of individual claims.

---

## Q2 — CPT & ICD Cost Drivers

### Top CPT Codes by Total Paid Amount

| CPT Code | Total Paid |
|---|---:|
| 67890 | $242,735.00 |
| 23456 | $203,790.75 |
| 123 | $122,010.00 |
| 12345 | $115,236.90 |
| 99223 | $57,350.00 |
| 34567 | $54,445.00 |
| 45678 | $52,054.20 |
| 567 | $38,969.00 |
| 54321 | $36,600.00 |
| 56789 | $33,207.00 |

### Top ICD Codes by Total Paid Amount

| ICD Code | Total Paid |
|---|---:|
| I10 | $259,566.00 |
| A12.3 | $152,147.00 |
| B20 | $140,990.00 |
| B20.1 | $105,210.00 |
| C34.91 | $62,905.00 |
| B99.4 | $51,000.00 |
| E11.65 | $50,512.00 |
| J45.909 | $44,465.56 |
| E11.9 | $34,766.00 |
| A01.1 | $34,260.00 |

### Highest Average Paid CPT Codes

The CPT code with the highest average paid amount was **36512**, at **$25,600 per claim**.

### Finding

A relatively small number of CPT and ICD codes account for substantial amounts of insurer spending. The results also show that total spending and average spending per claim provide different perspectives on cost drivers.

---

## Q3 — Member-Level Analysis

### Top 10 Highest-Cost Members

| Member ID | Total Paid |
|---|---:|
| 6 | $43,300.00 |
| 32 | $40,080.00 |
| 58 | $35,920.00 |
| 82 | $30,690.00 |
| 28 | $30,560.00 |
| 20 | $30,375.00 |
| 71 | $30,230.00 |
| 1 | $30,120.00 |
| 36 | $25,530.75 |
| 8 | $23,046.80 |

### Finding

The highest-cost members show that insurer spending is concentrated among a relatively small group of members.

Inpatient claims are the main contributor to spending among the highest-cost members, with emergency and outpatient claims also contributing to several members' totals.

For example, Member 6 had total insurer-paid spending of $43,300, consisting primarily of inpatient spending.

---

## Q4 — Billed vs Paid Ratio

### Overall Result

The overall paid ratio was approximately **75.2%**.

This means total insurer-paid amounts represented approximately 75.2% of total provider-billed amounts in the dataset.

### Paid Ratio by Claim Type

| Claim Type | Paid Ratio | Unpaid Amount |
|---|---:|---:|
| Lab | 90.8% | $2,377.55 |
| Pharmacy | 88.8% | $1,432.15 |
| Outpatient | 80.3% | $31,665.00 |
| Emergency | 76.6% | $89,800.19 |
| Inpatient | 73.9% | $386,145.25 |

### Finding

Inpatient claims had the lowest paid ratio among the claim types at approximately 73.9%, while Lab claims had the highest at approximately 90.8%.

However, paid ratio alone does not identify cost drivers. Inpatient claims had a lower paid ratio but remained the largest source of insurer spending because of their much larger financial amounts.

Claims with large differences between billed and paid amounts should be investigated further to understand the reasons for the differences.

---

## Cross-Analysis Insights

The four analyses provide several complementary views of healthcare spending:

1. **Inpatient care is the largest claim-type spending category.**
2. **A relatively small number of CPT and ICD codes account for substantial spending.**
3. **Spending is concentrated among a relatively small group of members.**
4. **Paid ratio and total paid amount measure different aspects of healthcare spending.**
5. **High claim volume does not necessarily mean high financial impact.**
6. **High or low paid ratios should be considered alongside claim amounts and claim volume.**

---

## Areas for Further Investigation

The dataset does not contain detailed information explaining differences between billed and paid amounts.

Further analysis could investigate:

- Claim denial or adjustment reasons
- Contractual adjustments
- Deductibles and copayments
- Coverage limitations
- Provider-level financial impact
- High-cost procedures
- High-cost members and their underlying diagnoses
- Changes in spending over time

---

## Limitations

This analysis is based on the fields available in the synthetic claims dataset.

The dataset does not provide detailed explanations for differences between billed and paid amounts. Therefore, the analysis identifies areas for investigation but does not establish why a particular claim was paid at a specific amount.

Paid ratios should also be interpreted alongside financial magnitude and claim volume rather than in isolation.
