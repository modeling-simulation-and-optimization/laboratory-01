$onText
Laboratorio 1 - MOS
Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText


* Ejercicio 1
Sets i articles /a1, a2, a3, a4, a5/;

Parameter v(i) valor de cada artículo /a1 12, a2 5, a3 9, a4 6, a5 4/;   
Parameter p(i) peso de cada artículo /a1 9, a2 2, a3 2, a4 1, a5 3/;
    
Scalar LIMIT máximo que puede llevar la mochila /10/;
    
Variables x(i) indica si se incluye o no el artículo
          z función objetivo;

Binary Variable x;

Equations funcObjetivo Función Objetivo
          restriction  Restricción;

funcObjetivo .. z =e= sum((i), v(i)*x(i));
restriction .. sum((i), p(i)*x(i)) =l= LIMIT;

Model Ejercicio1 /all/;
option mip=CPLEX;
Solve Ejercicio1 using mip maximizing z;

Display x.l;
Display z.l;
Display i;