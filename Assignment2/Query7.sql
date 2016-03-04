--7. Rewritten Query 3 without the ROLLUP or GROUPING SETS operators
SELECT C.COMPANYNAME, BR.BPNAME,SUM(EXTCOST) AS TOTAL_COST, SUM(QUANTITY) AS TOTAL_QUANTITY 
FROM INVENTORY_FACT F JOIN BRANCH_PLANT_DIM BR ON F.BRANCHPLANTKEY = BR.BRANCHPLANTKEY
                      JOIN COMPANY_DIM C ON C.COMPANYKEY = BR.COMPANYKEY
WHERE TRANSTYPEKEY = 2
GROUP BY C.COMPANYNAME, BR.BPNAME
UNION 
SELECT C.COMPANYNAME, NULL,SUM(EXTCOST), SUM(QUANTITY) 
FROM INVENTORY_FACT F JOIN BRANCH_PLANT_DIM BR ON F.BRANCHPLANTKEY = BR.BRANCHPLANTKEY
                      JOIN COMPANY_DIM C ON C.COMPANYKEY = BR.COMPANYKEY
WHERE TRANSTYPEKEY = 2
GROUP BY C.COMPANYNAME
UNION
SELECT NULL, NULL,SUM(EXTCOST), SUM(QUANTITY) 
FROM INVENTORY_FACT F JOIN BRANCH_PLANT_DIM BR ON F.BRANCHPLANTKEY = BR.BRANCHPLANTKEY
                      JOIN COMPANY_DIM C ON C.COMPANYKEY = BR.COMPANYKEY
WHERE TRANSTYPEKEY = 2
ORDER BY 1,2;