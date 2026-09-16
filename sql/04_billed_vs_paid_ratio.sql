/*
===========================================================
Project: Health Insurance Claims Analysis
File: 04_billed_vs_paid_ratio.sql
Purpose: Analyze the relationship between provider billed
         amounts and insurer paid amounts.
===========================================================
*/


/*
-----------------------------------------------------------
Q4A. OVERALL PAID RATIO
-----------------------------------------------------------
*/

SELECT
    SUM(paid_amount) / SUM(billed_amount) AS overall_paid_ratio
FROM claims;


/*
-----------------------------------------------------------
Q4B. PAID RATIO BY CLAIM TYPE
-----------------------------------------------------------
*/

SELECT
    claim_type,
    SUM(paid_amount) / SUM(billed_amount) AS claim_type_paid_ratio
FROM claims
GROUP BY claim_type
ORDER BY claim_type_paid_ratio DESC;


/*
-----------------------------------------------------------
Q4C. PAID RATIO BY PROVIDER
-----------------------------------------------------------
*/

SELECT
    provider_id,
    SUM(paid_amount) / SUM(billed_amount) AS provider_paid_ratio
FROM claims
GROUP BY provider_id
ORDER BY provider_paid_ratio DESC;


/*
-----------------------------------------------------------
Q4D. LOWEST PROVIDER PAID RATIOS
-----------------------------------------------------------
*/

SELECT
    provider_id,
    SUM(paid_amount) / SUM(billed_amount) AS provider_paid_ratio
FROM claims
GROUP BY provider_id
ORDER BY provider_paid_ratio ASC
LIMIT 10;


/*
-----------------------------------------------------------
Q4E. PROVIDER OUTLIER INVESTIGATION
-----------------------------------------------------------
*/

SELECT
    provider_id,
    SUM(paid_amount) AS paid_amount,
    SUM(billed_amount) AS billed_amount,
    SUM(paid_amount) / SUM(billed_amount) AS paid_ratio,
    COUNT(claim_id) AS claim_count
FROM claims
WHERE provider_id = 'PRV00214'
GROUP BY provider_id;


/*
-----------------------------------------------------------
Q4F. PROVIDER OUTLIER INVESTIGATION
-----------------------------------------------------------
*/

SELECT
    provider_id,
    SUM(paid_amount) AS paid_amount,
    SUM(billed_amount) AS billed_amount,
    SUM(paid_amount) / SUM(billed_amount) AS paid_ratio,
    COUNT(claim_id) AS claim_count
FROM claims
WHERE provider_id = 'PRV00456'
GROUP BY provider_id;


/*
-----------------------------------------------------------
Q4G. PAID RATIO BY CPT CODE
-----------------------------------------------------------
*/

SELECT
    cpt_code,
    SUM(paid_amount) / SUM(billed_amount) AS cpt_paid_ratio
FROM claims
GROUP BY cpt_code
ORDER BY cpt_paid_ratio ASC;


/*
-----------------------------------------------------------
Q4H. CPT OUTLIER INVESTIGATION
-----------------------------------------------------------
*/

SELECT
    cpt_code,
    SUM(paid_amount) AS paid_amount,
    SUM(billed_amount) AS billed_amount,
    SUM(paid_amount) / SUM(billed_amount) AS paid_ratio,
    COUNT(claim_id) AS claim_count
FROM claims
WHERE cpt_code = '10001'
GROUP BY cpt_code;
