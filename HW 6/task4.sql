
use resthw5;

select restbill.bill_total, restbill.cust_name, reststaff.staff_no, reststaff.headwaiter,reststaff.first_name  from restbill 
join reststaff on restbill.waiter_no=reststaff.staff_no 
where bill_total>450 and reststaff.headwaiter in (select reststaff.staff_no from reststaff where first_name="Charles") ;



SELECT cust_name, bill_total AS firstTotal
FROM restbill
WHERE bill_total IN (
    SELECT MIN(bill_total)
    FROM restbill
    GROUP BY cust_name
);

/*select cust_name from restbill where bill_total in (select MIN(bill_total) from restbilll group by cust_name);*/

select distinct waiter_no from restbill where waiter_no NOT IN (select staff_no from reststaff);
select staff_no from reststaff where staff_no NOT IN (select distinct waiter_no from restbill);
SELECT cust_name, bill_total AS firstTotal
FROM restbill join restrest_table on restrest_table.table_no=restbill.table_no 
join restbill on restbill/waiter_no=reststaff.staff_no
WHERE bill_total IN (
    SELECT MAX(bill_total)
    FROM restbill
    GROUP BY cust_name
);