/*
===========================================================
Project: Health Insurance Claims Analysis
File: 03_member_level_analysis.sql
Purpose: Identify high-cost members and the claim types
         contributing to their healthcare spending.
===========================================================
*/


/*
-----------------------------------------------------------
Q3A. TOP 10 HIGHEST-COST MEMBERS
-----------------------------------------------------------
*/

SELECT
    c.member_id,
    SUM(c.paid_amount) AS member_payout
FROM claims c
GROUP BY member_id
ORDER BY member_payout DESC
LIMIT 10;


/*
-----------------------------------------------------------
Q3B. CLAIM TYPE SPENDING FOR TOP 10 MEMBERS
-----------------------------------------------------------
*/

WITH top_members AS (
    SELECT
        c.member_id,
        SUM(c.paid_amount) AS member_payout
    FROM claims c
    GROUP BY member_id
    ORDER BY member_payout DESC
    LIMIT 10
)

SELECT
    t.member_id,
    c.claim_type,
    SUM(c.paid_amount) AS claim_type_payout
FROM top_members t
JOIN claims c
    ON c.member_id = t.member_id
GROUP BY
    t.member_id,
    c.claim_type
ORDER BY
    t.member_id,
    claim_type_payout DESC;
