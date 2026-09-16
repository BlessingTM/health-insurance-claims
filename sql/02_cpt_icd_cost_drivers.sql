/*
===========================================================
Project: Health Insurance Claims Analysis
File: 02_cpt_icd_cost_drivers.sql
Purpose: Identify medical procedures and diagnoses driving
         insurer healthcare spending.
===========================================================
*/


/*
-----------------------------------------------------------
Q2A. TOP 10 CPT CODES BY TOTAL PAID
-----------------------------------------------------------
*/

SELECT
    c.cpt_code,
    SUM(c.paid_amount) AS total_paid
FROM claims c
GROUP BY c.cpt_code
ORDER BY total_paid DESC
LIMIT 10;


/*
-----------------------------------------------------------
Q2B. TOP 10 ICD CODES BY TOTAL PAID
-----------------------------------------------------------
*/

SELECT
    c.icd_code,
    SUM(c.paid_amount) AS total_paid
FROM claims c
GROUP BY c.icd_code
ORDER BY total_paid DESC
LIMIT 10;


/*
-----------------------------------------------------------
Q2C. TOP 10 CPT CODES BY AVERAGE PAID AMOUNT
-----------------------------------------------------------
*/

SELECT
    c.cpt_code,
    AVG(c.paid_amount) AS average_paid
FROM claims c
GROUP BY c.cpt_code
ORDER BY average_paid DESC
LIMIT 10;
