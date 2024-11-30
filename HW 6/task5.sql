use resthw5;

SELECT 
    reststaff.first_name, 
    reststaff.surname, 
    restbill.bill_date, 
    COUNT(restbill.bill_no) AS bill_count
FROM 
    resthw5.restbill
JOIN 
    reststaff
ON 
    restbill.waiter_no = reststaff.staff_no
GROUP BY 
    restbill.waiter_no, 
    restbill.bill_date, 
    reststaff.first_name, 
    reststaff.surname
HAVING 
    COUNT(restbill.bill_no) >= 2
ORDER BY 
    restbill.bill_date, 
    bill_count DESC;
    
SELECT count(*) from restrest_table where no_of_seats > 6;

SELECT SUM(restbill.bill_total) as total, restrest_table.room_name as roomType FROM restbill
join restrest_table on restbill.table_no=restrest_table.table_no GROUP BY roomType;

select cust_name,avg(bill_total) AS custTotal from restbill group by cust_name HAVING custTotal>400;

SELECT 
    reststaff.first_name, 
    reststaff.surname, 
    restbill.bill_date, 
    COUNT(restbill.bill_no) AS bill_count
FROM 
    resthw5.restbill
JOIN 
    reststaff
ON 
    restbill.waiter_no = reststaff.staff_no
GROUP BY 
    restbill.waiter_no, 
    restbill.bill_date, 
    reststaff.first_name, 
    reststaff.surname
HAVING 
    COUNT(restbill.bill_no) >= 3
ORDER BY 
    restbill.bill_date, 
    bill_count DESC;
