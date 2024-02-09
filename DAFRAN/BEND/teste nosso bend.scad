include<bend.scad>

raio = 15;
raioDeBaixo = 0;
altura = raio;
raioDaCurva = 1;
numeroDeFaces = 55;
grau =  180;

centroDeCima = 1 ;
centroDeBaixo = 0;


x = raio * 2;
y = altura;
z = raio * 4;
cylindric_bend([ x, y, z], ((y / (2*PI))*(360/grau)), numeroDeFaces)
translate([1/2,0,0])
//rotate([0,90,90])
cube([1,raio*2,1],true);

    