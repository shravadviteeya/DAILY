INTERVIW SQL FUNCTIONS:
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

