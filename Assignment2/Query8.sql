--8. Sales Order Shipments by Name and Combination of Year and Quarter
SELECT D.CALYEAR,D.CALQUARTER, C.NAME, SUM(EXTCOST) AS TOTAL_COST, COUNT(INVENTORYKEY) AS TOTAL_TRANSACTIONS
FROM INVENTORY_FACT F JOIN DATE_DIM D ON F.DATEKEY = D.DATEKEY
                      JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5 AND D.CALYEAR IN (2011,2012)
GROUP BY CUBE ( C.NAME, (D.CALYEAR,D.CALQUARTER)) 
ORDER BY D.CALYEAR,D.CALQUARTER, C.NAME;
