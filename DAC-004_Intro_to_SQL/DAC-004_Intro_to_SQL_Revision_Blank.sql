-- Tutorial: Getting used to SQL is a very important step in landing a job or an internship in tech! 
-- Lets practise using adventureworks

-- Be sure to keep praticising!
-- Here are some questions to practise your skill using the Adventureworks db.

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q1: From the following table humanresources.employee write a query in SQL to retrieve all the rows and columns from the employee table in the Adventureworks database. 
-- Sort the result set in ascending order on jobtitle.
-- humanresources.employee table

--Answer

-- Selecting all columns from the employee table in the humanresources schema
SELECT *  
-- Ordering the result set by the job title column in ascending order
FROM humanresources.employee  
ORDER BY jobtitle;


-------------------------------------------------------------------------------------------------------------------------------------------

-- Q2: From the following table person.person write a query in SQL to return all rows and a subset of the columns (firstName, lastName, businessentityid) from the person table in the AdventureWorks database. 
-- The third column heading is renamed to employee_id. Arranged the output in ascending order by lastname.

--Answer
-- Selecting specific columns (firstname, lastname, and businessentityid with an alias 'Employee_id') from the person table
SELECT firstname, lastname, businessentityid as Employee_id  
-- Specifying the table from which the data will be retrieved, with "person" being the schema name and "person" being the table name. The alias 'e' is assigned to the table for easier reference.
FROM person.person AS e  
-- Ordering the result set by the LastName column in ascending order
ORDER BY lastname;



-------------------------------------------------------------------------------------------------------------------------------------------

-- Q3: From the following table write a query in SQL to return only the rows for product that have a sellstartdate that is not NULL and a productline of 'T'. 
-- Return productid, productnumber, and name. Change the name to productname. Arranged the output in ascending order on name.

-- production.product

--Answer
-- Selecting specific columns (productid, productnumber, and name with an alias 'producName') from the production.product table
SELECT productid, productnumber, name as productName
-- Specifying the table from which the data will be retrieved, with "production" being the schema name and "product" being the table name.
FROM production.product
-- Filtering the result set to include only records where sellstartdate is not NULL and productline is 'T'
WHERE sellstartdate IS NOT NULL
AND production.product.productline= 'T'
-- Ordering the result set by the 'name' column in ascending order
ORDER BY name;


-------------------------------------------------------------------------------------------------------------------------------------------

-- Q4:From the following table write a query in SQL to calculate the total freight paid by each customer. Return customerid and total freight. 
-- Sort the output in ascending order on customerid

-- sales.salesorderheader

--Answer
-- Selecting the customer ID and the sum of freight for each customer from the 'salesorderheader' table
SELECT customerid, sum(freight) as total_freight 
-- Grouping the results by customer ID
FROM sales.salesorderheader
-- Ordering the result set by customer ID in ascending order
GROUP BY customerid
ORDER BY customerid ASC;


-------------------------------------------------------------------------------------------------------------------------------------------

-- Q5:From the following table write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. 
-- Sort the result in ascending order on city.

-- person.businessentityaddress

--Answer
-- Selecting the city and counting the number of employees in each city
SELECT a.City, COUNT(b.AddressID) NoOfEmployees
-- Retrieving data from the 'BusinessEntityAddress' table aliased as 'b'
FROM Person.BusinessEntityAddress AS b   
    -- Joining the 'BusinessEntityAddress' table with the 'Address' table aliased as 'a'
    INNER JOIN Person.Address AS a  
        ON b.AddressID = a.AddressID  
-- Grouping the results by city
GROUP BY a.City  
-- Ordering the results by city
ORDER BY a.City;




-------------------------------------------------------------------------------------------------------------------------------------------

-- Q6: From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. 
-- Return BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.

-- person.businessentitycontact, person.contacttype, person.person

--Answer
-- Selecting BusinessEntityID, LastName, and FirstName from multiple tables based on specified conditions
SELECT pp.BusinessEntityID, LastName, FirstName
    -- Retrieving BusinessEntityID, LastName, and FirstName columns
    FROM Person.BusinessEntityContact AS pb 
        -- Joining Person.BusinessEntityContact with Person.ContactType based on ContactTypeID
        INNER JOIN Person.ContactType AS pc
            ON pc.ContactTypeID = pb.ContactTypeID
        -- Joining Person.BusinessEntityContact with Person.Person based on BusinessEntityID
        INNER JOIN Person.Person AS pp
            ON pp.BusinessEntityID = pb.PersonID
    -- Filtering the results to include only records where the ContactType Name is 'Purchasing Manager'
    WHERE pc.Name = 'Purchasing Manager'
    -- Sorting the results by LastName and FirstName
    ORDER BY LastName, FirstName;

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q7: From the following table sales.salesorderdetail  write a query in  SQL to retrieve the total cost of each salesorderID that exceeds 100000. 
-- Return SalesOrderID, total cost. Round to 2 decimal place and add the dollar sign at the front.

--Answer
SELECT 
    SalesOrderID, -- Selecting the SalesOrderID column
    '$' || ROUND(SUM(orderqty * unitprice), 2) AS OrderIDCost -- Rounding to 2 decimals and adding $
FROM 
    Sales.SalesOrderDetail -- Selecting data from the SalesOrderDetail table
GROUP BY 
    SalesOrderID -- Grouping the results by SalesOrderID
HAVING 
    SUM(orderqty * unitprice) > 100000.00 -- Filtering groups where the total cost is greater than 100000.00
ORDER BY 
    SalesOrderID; -- Sorting the results by SalesOrderID



-------------------------------------------------------------------------------------------------------------------------------------------

-- Q8:From the following person.person table write a query in  SQL to retrieve those persons whose last name begins with letter 'R' and firstname end with 'n'. 
-- Return lastname, and firstname and display the result in ascending order on firstname and descending order on lastname columns.

--Answer
-- Selecting specific columns from the Person table
SELECT LastName, FirstName 

-- From the Person schema's Person table
FROM Person.Person  

-- Filtering the results to include only rows where the LastName starts with 'R'
-- LIKE operator is used for pattern matching, 'R%' means any LastName starting with 'R'
WHERE LastName LIKE 'R%'  and FirstName LIKE '%n'

-- Ordering the results first by FirstName in ascending order
-- Then by LastName in descending order
ORDER BY FirstName ASC, LastName DESC ;


-------------------------------------------------------------------------------------------------------------------------------------------

-- Q9: From the following humanresources.department table write a query in  SQL to skip the first 5 rows and return the next 5 rows from the sorted result set.

--Answer
-- Selecting specific columns from the Department table
SELECT DepartmentID, Name, GroupName  

-- From the HumanResources schema's Department table
FROM HumanResources.Department  

-- Ordering the results by DepartmentID
-- OFFSET clause is used to skip the first 5 rows in the ordered result set
-- FETCH NEXT clause is used to retrieve the next 5 rows after the offset
ORDER BY DepartmentID   
    OFFSET 5 ROWS  
    FETCH NEXT 5 ROWS ONLY;



-------------------------------------------------------------------------------------------------------------------------------------------

-- Q10:From the following tables write a query in  SQL to find the persons whose last name starts with letter 'L'. 
-- Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.

-- person.person, person.personphone

--Answer
-- Selecting specific columns from the 'Person' table and the 'PersonPhone' table
SELECT p.BusinessEntityID, FirstName, LastName, PhoneNumber AS Person_Phone  
-- Retrieving data from the 'Person' table with an alias 'p'
FROM Person.Person AS p  
-- Joining the 'Person' table with the 'PersonPhone' table based on the 'BusinessEntityID' column
JOIN Person.PersonPhone AS ph 
ON p.BusinessEntityID  = ph.BusinessEntityID  
-- Filtering the results to include only rows where the last name starts with 'L'
WHERE LastName LIKE 'L%'  
-- Ordering the results first by last name and then by first name
ORDER BY LastName, FirstName;


-------------------------------------------------------------------------------------------------------------------------------------------