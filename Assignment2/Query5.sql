--5. Adjustments by Part Number
SELECT D.CALYEAR, D.CALQUARTER, C.NAME, SUM(F.EXTCOST) as TOTAL_COST, COUNT(F.INVENTORYKEY) as TOTAL_TRANSACTIONS
FROM INVENTORY_FACT F JOIN DATE_DIM D ON F.DATEKEY = D.DATEKEY
                      JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5 AND D.CALYEAR IN (2011,2012)
GROUP BY ROLLUP(D.CALYEAR, D.CALQUARTER), C.NAME
ORDER BY D.CALYEAR, D.CALQUARTER, C.NAME;