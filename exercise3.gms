$onText
Laboratorio 1 - MOS
Ejercicio 3

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Origin CPUs'           /i1, i2, i3/
     j 'Destination CPUs'      /j1, j2, j3, j4/;
     
Parameter processesSent(i) 'Amount of processes supplied by Origin'      /i1 300, i2 500, i3 200/;
Parameter processesNeeded(j) 'Amount of processes needed by Destination' /j1 200, j2 300, j3 100, j4 400/;
     
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
    
Integer Variable
    z;
    
Equations
    targetFunc 'Target Function'
    totalProcessesNeeded 'Total processes needed'
    maxSupplyCPU(i) 'Every origin can only have an x amount of processes';
    
targetFunc .. sum((i,j) t(i,j)*x(i,j));
maxSupplyCPU(i) .. 
totalProcessesNeeded .. sum()
    