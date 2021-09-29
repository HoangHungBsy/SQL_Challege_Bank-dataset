--1.Write a query to display the customer number, firstname, customer’s date of birth. 
--Display in sorted order of date of birth year and within that sort by firstname.
SELECT custid, fname, dob
FROM customer
ORDER BY dob, fname;
--2.Write a query to display the customer’s number, first name, and middle name. 
--The customer’s who don’t have a middle name, for them display the last name.

SELECT custid, fname,
CASE 
	WHEN mname is null then fname
	ELSE mname
END
FROM customer
;

--3.write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date
SELECT acnumber, customer.custid,fname, ltname,opening_balance
FROM account
INNER JOIN customer
ON account.custid= customer.custid;

--4.Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.
SELECT COUNT (city) as Cust_Count
FROM customer
WHERE city ='Delhi';

--5.Write a query to display  the customer number, customer firstname,
--account number for the customer’s whose accounts were created after 15th of any month.
SELECT acnumber, customer.custid,fname,aod
FROM account
INNER JOIN customer
ON account.custid= customer.custid 
WHERE EXTRACT (day from aod )>15;

--6.Write a query to display the female customers firstname, city and account number who are not into business, service or studies.
select customer.fname, city,acnumber 
from customer
inner join account
on customer.custid= account.custid
where occupation not in( 'Service','Student')
;
--7.Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch.
SELECT bcity, COUNT(bcity) AS count_branch
FROM branch
GROUP BY bcity;

--8.Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose account is Active.

SELECT customer.custid, customer.fname,customer.ltname
FROM customer
INNER JOIN account
ON customer.custid= account.custid
WHERE astatus = 'Active';

--9.Write a query to display the customer’s number, customer’s firstname, branch id and loan amount for people who have taken loans.

SELECT customer.custid, customer.fname,bid, loan_amount
FROM customer
INNER JOIN loan
ON customer.custid= loan.custid;

--10.Write a query to display customer number, customer name, account number where the account status is terminated.
SELECT customer.custid, customer.fname,customer.ltname, acnumber
FROM customer
INNER JOIN account
ON customer.custid= account.custid
WHERE astatus = 'Terminated';
