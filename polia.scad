include <correia com dentes.scad>
include <bend.scad>
/*["Medidas"]*/
dentesPolia = 10;
raioDoEixoDaPolia = 2;
raioDoEixoDaPoliaComRolamento = 1;
raioDoRolamento = 3;
cumprimentoPolia = (espacoDosDentes + fundoDoDente) * dentesPolia;
raio = (cumprimentoPolia / (PI * 2));
escala = 90;
module dentesPolia(quantidadeDeDentes = 10) {
    //DENTES
    for(j = [0: quantidadeDeDentes - 1]) {
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a = true);
    }
}
module polia(eixo,rolamento){
    if(eixo){
    color("silver") {
    difference(){
        union(){
        translate([0, 0, raio]) rotate([0, 270, 0]) cylinder(larguraDaCorreia /10, raio+espessuraDosDentes/2, raio+espessuraDosDentes/2, $fn = 100);
    translate([larguraDaCorreia, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia /10, raio+espessuraDosDentes/2, raio+espessuraDosDentes/2, $fn = 100);
    translate([0, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raio - espessuraDosDentes, raio - espessuraDosDentes, $fn = 100);
        }
    translate([-larguraDaCorreia/2, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia * 3, raioDoEixoDaPolia,raioDoEixoDaPolia, $fn = 100);    
}  
        cylindric_bend([larguraDaCorreia*2, cumprimentoPolia, espessuraDosDentes], raio, 400)
    rotate([0, 180, 0]) translate([-larguraDaCorreia/2, 0, -espessuraDaCorreia / 2 - espessuraDosDentes]) rotate([0, -90, 90]) {
        dentesPolia(dentesPolia);
    }
}
}
if(rolamento){
    color("silver") {
    difference(){
        union(){
        translate([0, 0, raio]) rotate([0, 270, 0]) cylinder(larguraDaCorreia /10, raio+espessuraDosDentes/2, raio+espessuraDosDentes/2, $fn = 100);
    translate([larguraDaCorreia, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia /10, raio+espessuraDosDentes/2, raio+espessuraDosDentes/2, $fn = 100);
    translate([0, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raio - espessuraDosDentes, raio - espessuraDosDentes, $fn = 100);
        }
    translate([-larguraDaCorreia/2, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia * 3, raioDoEixoDaPoliaComRolamento,raioDoEixoDaPoliaComRolamento, $fn = 100);
      
    translate([-larguraDaCorreia/1.5, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raioDoRolamento,raioDoRolamento, $fn = 100);
      translate([larguraDaCorreia/1.5, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raioDoRolamento,raioDoRolamento, $fn = 100);  
}  
        cylindric_bend([larguraDaCorreia*2, cumprimentoPolia, espessuraDosDentes], raio, 400)
    rotate([0, 180, 0]) translate([-larguraDaCorreia/2, 0, -espessuraDaCorreia / 2 - espessuraDosDentes]) rotate([0, -90, 90]) {
        dentesPolia(dentesPolia);
    }
}
}
}
rotate([20,0,0])translate([0,0,-raio])polia(eixo = false,rolamento=true);