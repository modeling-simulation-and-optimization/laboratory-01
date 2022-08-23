$onText
Laboratorio 1 - MOS
Ejercicio 1

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'articles' /a1, a2, a3, a4, a5/;

Parameter v(i) 'Valor de cada artículo' /a1 12, a2 5, a3 9, a4 6, a5 4/;
Parameter p(i) 'Peso de cada artículo' /a1 9, a2 2, a3 2, a4 1, a5 3/;
    
Scalar LIMIT 'Máximo que puede llevar la mochila' /10/;
    
Variables x(i) 'Indica si se incluye o no el artículo'
          z    'Función objetivo';

Binary Variable x;

Equations targetFunc 'Función Objetivo'
          constraint 'Restricción';

targetFunc .. z =e= sum((i), v(i)*x(i));
constraint .. sum((i), p(i)*x(i)) =l= LIMIT;

Model exercise1 /all/;
option mip=CPLEX;
Solve exercise1 using mip maximizing z;

Display x.l;
Display z.l;
