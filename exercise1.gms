$onText
Laboratory 1 - MOS
Exercise 1

Made by:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'articles' /a1, a2, a3, a4, a5/;

Parameter v(i) 'Value of each article' /a1 12, a2 5, a3 9, a4 6, a5 4/;
Parameter p(i) 'Weigth of each article' /a1 9, a2 2, a3 2, a4 1, a5 3/;
    
Scalar LIMIT 'Maximum weight that the backpack can carry' /10/;
    
Variables x(i) 'Indicates if the article is included or not'
          z    'Target function';

Binary Variable x;

Equations targetFunc 'Target function'
          constraint 'Restriction';

targetFunc.. z =e= sum((i), v(i)*x(i));
constraint.. sum((i), p(i)*x(i)) =l= LIMIT;

Model exercise1 /all/;
option mip=CPLEX;
Solve exercise1 using mip maximizing z;

Display x.l;
Display z.l;
