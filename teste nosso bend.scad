include<nosso bend.scad>
include<bend.scad>
include<cone obiclo.scad>

raio = 1;
raioDeBaixo = 1;
altura = 11;
raioDaCurva = 3;
numeroDeFaces = 125;
grau = 90;

x = raio * 2;
y = 2 * PI * altura ;
z = raio * 2;

////translate([ 0, 0, 0])
//cylinder_bend([ x, y, z], altura, numeroDeFaces)
//translate([raio,0,0])
//rotate([0,90,90])
//cone(raio,altura,numeroDeFaces);


translate([raio,0,0])cylindric_bend([ x, y, z], altura, numeroDeFaces)
translate([raio,0,0])
rotate([0,90,90])
cone(raio,raioDeBaixo,altura,numeroDeFaces);