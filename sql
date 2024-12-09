INTERVIW SQL FUNCTIONS:
Ranking Window Functions
Ranking functions are, RANK(), DENSE_RANK(), ROW_NUMBER() 

RANK() –  As the name suggests, the rank function assigns rank to all the rows within every partition. Rank is assigned such that rank 1 given to the first row and rows having same value are assigned same rank. For the next rank after two same rank values, one rank value will be skipped. For instance, if two rows share­ rank 1, the next row gets rank 3, not 2.
 
DENSE_RANK() – It assigns rank to each row within partition. Just like rank function first row is assigned rank 1 and rows having same value have same rank. The difference between RANK() and DENSE_RANK() is that in DENSE_RANK(), for the next rank after two same rank, consecutive integer is used, no rank is skipped. 
 
ROW_NUMBER() – ROW_NUMBER() gives e­ach row a unique number. It numbers rows from one­ to the total rows. The rows are put into groups base­d on their values. Each group is called a partition. In e­ach partition, rows get numbers one afte­r another. No two rows have the same­ number in a partition. This makes ROW_NUMBER() differe­nt from RANK() and DENSE_RANK(). ROW_NUMBER() uniquely identifies e­very row with a sequential inte­ger number. This helps with diffe­rent kinds of data analysis.
Note: ORDER BY() should be specified compulsorily while using rank window functions. 

USE OF RANK(), DENSE_RANK() AND ROW_NUMBER() FUNCTIONS IN SQL
mysql> select ENAME, SALARY, ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS SALARY_ROW_NUMBER,RANK() OVER(ORDER BY SALARY DESC) AS SALARY_RANK, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS SALARY_DENSE_RANK  FROM emp;
ENAME  | SALARY | SALARY_ROW_NUMBER | SALARY_RANK | SALARY_DENSE_RANK |
+--------+--------+-------------------+-------------+-------------------+
| KING   |   5000 |                 1 |           1 |                 1 |
| SCOTT  |   3000 |                 2 |           2 |                 2 |
| FORD   |   3000 |                 3 |           2 |                 2 |
| JONES  |   2975 |                 4 |           4 |                 3 |
| BLAKE  |   2850 |                 5 |           5 |                 4 |
| CLARK  |   2450 |                 6 |           6 |                 5 |
| MILLER |   2000 |                 7 |           7 |                 6 |
| ALLEN  |   1600 |                 8 |           8 |                 7 |
| WARD   |   1250 |                 9 |           9 |                 8 |
| MARTIN |   1250 |                10 |           9 |                 8 |
| NULL   |   NULL |                11 |          11 |                 9 |
+--------+--------+-------------------+-------------+-------------------+
11 rows in set (0.00 sec)

select CustomerID,Sales,Country, row_number() over(order by  Sales DESC) as row_number_by_sales from test.`e-commerce`;

USE OF LEAD AND LAG FOR SALES TREND ANALYSIS.

select CustomerID, InvoiceNumber, InvoiceDate,Country,Device,Sales, 
LAG(Sales) over(partition by Device,Country order by InvoiceDate) as Previous_Sales,
LEAD(Sales) over(partition by Device, Country order by InvoiceDate) as Next_Sales, 
Sales - LAG(Sales) over(partition by Device, Country order by InvoiceDate) as Sales_Difference from test.`e-commerce`;


