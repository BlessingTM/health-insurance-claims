/*
===========================================================
Project: Health Insurance Claims Analysis
File: 01_claim_type_cost_breakdown.sql
Purpose: Analyze healthcare spending by claim type.
===========================================================
*/


/*
-----------------------------------------------------------
Q1. CLAIM TYPE COST BREAKDOWN
-----------------------------------------------------------
*/

SELECT
    claim_type,
    SUM(billed_amount) AS total_billed,
    COUNT(claim_id) AS claim_count,
    SUM(paid_amount) AS total_paid
FROM claims
GROUP BY claim_type
ORDER BY total_paid DESC;
