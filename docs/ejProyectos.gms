*************************************************************************
***      Seleccionar Proyectos                                        ***
***                                                                   ***
***      Autor: Germán Montoya                                       ***
*************************************************************************
$ontext
Tenemos 8 proyectos que retornan una cierta ganancia, por lo cuál deseamos
seleccionar la mayor cantidad de proyectos posible que nos generen la mayor
ganancia. Sin embargo, supongamos que solo podemos escoger 2 proyectos.

Cuales proyectos se escogerian?

$offtext

Sets
  i      proyectos /p1, p2, p3, p4, p5, p6, p7, p8/;

Parameter  g(i)   ganancia de cada proyecto i
                     /    p1 2, p2 5, p3 4, p4 2, p5 6, p6 3, p7 1, p8 4/;

Variables
x(i)                         Determina si se escoge o no el proyecto i
z                            Funcion Objetivo;

Binary Variable x;

Equations
funcObjetivo                 Funcion Objetivo

res1                         Restriccion 1
;

funcObjetivo                ..      z =e= sum((i), g(i) * x(i));

res1                        ..      sum((i), x(i)) =e= 2;

Model model1 /all/ ;

option mip=CPLEX;
Solve model1 using mip maximizing z;

Display x.l;
Display z.l;


