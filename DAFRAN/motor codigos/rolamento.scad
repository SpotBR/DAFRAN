esfera = 1;
vetor = 16;
grau = 360/vetor;
espessuraDoAnel = (esfera/2)/2;
r = esfera*sin(90)/sin(grau/2);
module esferas(){
for(i = [1:vetor]){
    rotate([0,grau*i,0])translate([r,0,0])sphere(esfera,$fn=100);
}
}
module capinhas(){
    difference(){
    union(){
    translate([0,esfera+espessuraDoAnel,0])rotate([90,0,0])cylinder(espessuraDoAnel,r+esfera,r+esfera,$fn = 100);
translate([0,-esfera-espessuraDoAnel,0])rotate([-90,0,0])cylinder(espessuraDoAnel,r+esfera,r+esfera,$fn = 100);
}
translate([0,esfera*2,0])rotate([90,0,0])cylinder(esfera*4,r-esfera,r-esfera,$fn = 100);
}
}
module anel(){
difference(){
difference(){
    translate([0,esfera+espessuraDoAnel,0])rotate([90,0,0])cylinder(esfera*2+espessuraDoAnel*2,r+esfera+espessuraDoAnel,r+esfera+espessuraDoAnel,$fn = 100);
    
    translate([0,esfera*2,0])rotate([90,0,0])cylinder(esfera*4,r-esfera-espessuraDoAnel,r-esfera-espessuraDoAnel,$fn = 100);
}

difference(){
    translate([0,r,0])rotate([90,0,0])cylinder(r*2,r+esfera,r+esfera,$fn = 100);

    translate([0,esfera*2,0])rotate([90,0,0])cylinder(esfera*4,r-esfera,r-esfera,$fn = 100);
}
}
}
module rolamento(){
color("blue")anel();
//color("red")capinhas();
color("silver")esferas();
}
//rolamento();