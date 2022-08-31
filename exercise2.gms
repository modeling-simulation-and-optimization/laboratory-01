$onText
Laboratory 1 - MOS
Exercise 2

Made by:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets e 'Employees' /e1, e2, e3, e4/
     j 'Jobs'      /j1, j2, j3, j4/;
     
Table t(e, j) 'Required time'

     j1 j2 j3 j4
 e1  14  5  8  7
 e2  2  12  6  5
 e3  7   8  3  9
 e4  2   4  6 10;
 
Variables x(e,j) 'Employee/Job pair selected'
          z      'Target function';
    
Binary Variable x;

Equations targetFunc           'Target Function'
          uniqueConstraintE(e) 'Every employee can only do one job'
          uniqueConstraintJ(j) 'Every job can be done by only one employee';
    
targetFunc..           z =e= sum((e,j), t(e,j)*x(e,j));
uniqueConstraintE(e).. sum((j), x(e,j)) =e= 1;
uniqueConstraintJ(j).. sum((e), x(e,j)) =e= 1;

Model Exercise2 /all/;
option MIP=CPLEX;
Solve Exercise2 using mip minimizing z;
Display x.l;
Display z.l;
