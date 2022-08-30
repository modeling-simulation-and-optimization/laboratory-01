$onText
Laboratorio 1 - MOS
Ejercicio 3

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Origin CPUs'           /i1, i2, i3/
     j 'Destination CPUs'      /j1, j2, j3, j4/;
     
Parameter a(i) 'Amount of processes supplied by Origin'      /i1 300, i2 500, i3 200/;
Parameter b(j) 'Amount of processes needed by Destination' /j1 200, j2 300, j3 100, j4 400/;
     
Table t(i, j) 'Transmission costs between CPUs' 
     j1 j2 j3 j4
 i1  8  6  10  9
 i2  9  12 13  7
 i3  14 9  16  5;
 
Variables
    x(i,j) 'CPU link selected'
    z 'Target Function';
    
Binary Variable
    x;
    
Equations
    targetFunc 'Target Function'
*minOperations 'Minimum Number of Operations'
    totalProcessesNeeded(i) 'Total processes needed'
    maxProcesses(j) 'Max proccesses per destination CPU';
    
targetFunc .. z =e= sum((i,j), t(i,j)*x(i,j));
*minOperations .. sum((i,j), x(i,j)) =g= 4;
totalProcessesNeeded(i) .. sum((j), b(j)*x(i,j)) =l= a(i);
maxProcesses(j) .. sum((i), a(i)*x(i,j) - b(j)*x(i,j)) =e= b(j);


Model Exercise3 /all/;
option MIP=CPLEX;
Solve Exercise3 using mip minimizing z;
Display x.l;