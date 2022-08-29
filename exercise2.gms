$onText
Laboratorio 1 - MOS
Ejercicio 2

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets e 'Employees' /e1, e2, e3, e4/
     j 'Jobs'      /j1, j2, j3, j4/;
     
Table t(e, j) 'Required time' 
     j1 j2 j3 j4
 e1  14  5  8  7
 e2  2   12 6  5
 e3  7   8  3  9
 e4  2   4  6 10;
 
Variables
    x(e,j) 'Employee/Job pair selected'
    z 'Target function';
    
Binary Variable
    x;

Scalar minJobs 'Minimum amount of jobs done' /4/;
Scalar maxJobs 'Maximum amount of jobs done' /4/;

Equations
    targetFunc 'Target Function'
    minConstraint 'Minimum Jobs Constraint'
    maxConstraint 'Maximum Jobs Constraint'
    uniqueConstraint(e,j) 'Every employee can only do one Job';

targetFunc .. z =e= sum((e,j), t(e,j));
minConstraint .. sum((e,j), x(e,j)) =l= maxJobs;
maxConstraint .. minJobs =l= sum((e,j), x(e,j));
uniqueConstraint(e,j) .. x(e,j);

Model Exercise2 /all/;
option MIP=CPLEX;
Solve Exercise2 using mip minimizing z;
Display x.l;