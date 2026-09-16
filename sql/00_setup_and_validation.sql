/*
===========================================================
Project: Health Insurance Claims Analysis
File: 00_setup_and_validation.sql
Purpose: Prepare and validate the claims dataset before
         performing business analysis.
===========================================================
*/


/*
-----------------------------------------------------------
1. SCHEMA INSPECTION
-----------------------------------------------------------
*/

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'claims'
ORDER BY ordinal_position;


/*
-----------------------------------------------------------
2. DATA TYPE CORRECTIONS
-----------------------------------------------------------
*/

ALTER TABLE claims
ALTER COLUMN claim_date TYPE date
USING claim_date::date;

ALTER TABLE claims
ALTER COLUMN billed_amount TYPE numeric;

ALTER TABLE claims
ALTER COLUMN paid_amount TYPE numeric;


/*
-----------------------------------------------------------
3. ROW COUNT VALIDATION
-----------------------------------------------------------
*/

SELECT
    COUNT(*) AS total_claims
FROM claims;


/*
-----------------------------------------------------------
4. CLAIM ID UNIQUENESS
-----------------------------------------------------------
*/

SELECT
    COUNT(DISTINCT claim_id) AS distinct_claim_ids
FROM claims;


/*
-----------------------------------------------------------
5. NULL / COMPLETENESS CHECK
-----------------------------------------------------------
*/

SELECT
    COUNT(claim_id) AS claim_id_count,
    COUNT(member_id) AS member_id_count,
    COUNT(provider_id) AS provider_id_count,
    COUNT(claim_date) AS claim_date_count,
    COUNT(claim_type) AS claim_type_count,
    COUNT(cpt_code) AS cpt_code_count,
    COUNT(icd_code) AS icd_code_count,
    COUNT(billed_amount) AS billed_amount_count,
    COUNT(paid_amount) AS paid_amount_count
FROM claims;


/*
-----------------------------------------------------------
6. CLAIM TYPE VALIDATION
-----------------------------------------------------------
*/

SELECT DISTINCT
    claim_type
FROM claims;


/*
-----------------------------------------------------------
7. CLAIM VOLUME BY CLAIM TYPE
-----------------------------------------------------------
*/

SELECT
    claim_type,
    COUNT(claim_id) AS number_of_claims
FROM claims
GROUP BY claim_type;


/*
-----------------------------------------------------------
8. PROVIDER AND CODE COUNTS
-----------------------------------------------------------
*/

SELECT
    COUNT(DISTINCT provider_id) AS number_of_providers
FROM claims;

SELECT
    COUNT(DISTINCT cpt_code) AS number_of_cpt_codes
FROM claims;

SELECT
    COUNT(DISTINCT icd_code) AS number_of_icd_codes
FROM claims;


/*
-----------------------------------------------------------
9. FINANCIAL RANGE VALIDATION
-----------------------------------------------------------
*/

SELECT
    MIN(billed_amount) AS min_billed,
    MAX(billed_amount) AS max_billed,
    AVG(billed_amount) AS avg_billed,
    MIN(paid_amount) AS min_paid,
    MAX(paid_amount) AS max_paid,
    AVG(paid_amount) AS avg_paid
FROM claims;


/*
-----------------------------------------------------------
10. PAID AMOUNT VALIDATION
-----------------------------------------------------------
Check for claims where the insurer paid more than
the provider's billed amount.
-----------------------------------------------------------
*/

SELECT *
FROM claims
WHERE paid_amount > billed_amount;
