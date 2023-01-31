include <correia com dentes.scad>
include <bend.scad>
include <eixo da polia.scad>
include <encaixe do rolamento.scad>
/*["Medidas"]*/
dentesPolia = quantidadeDeDentes * 2 - retirarDentesPolia;
cumprimentoPolia = (espacoDosDentes + fundoDoDente) * dentesPolia;
raio = ((comprimentoDaCorreia - (fundoDoDente * retirarDentesPolia + oposto * retirarDentesPolia)) * 2 /(PI * 2));
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
        union(){
    translate([0,0,-raio]){
    color("silver") {
        difference(){
        union(){
        translate([0, 0, raio]) rotate([0, 270, 0]) cylinder(larguraDaCorreia / 10, raio+espessuraDaCorreia / 2, raio+espessuraDaCorreia / 2, $fn = 100);
    translate([larguraDaCorreia, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia /10, raio+espessuraDaCorreia / 2, raio+espessuraDaCorreia / 2, $fn = 100);
    translate([0, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raio - espessuraDosDentes, raio - espessuraDosDentes, $fn = 100);
        }
       translate([0,0,raio])rotate([0,90,0])eixoPolia(cima = true,baixo = false);
    } 
        cylindric_bend([larguraDaCorreia * 2, cumprimentoPolia, espessuraDosDentes], raio, 400)
    rotate([0, 180, 0]) translate([-larguraDaCorreia/2, 0, -espessuraDaCorreia / 2 - espessuraDosDentes]) rotate([0, -90, 90]) {
        dentesPolia(dentesPolia);
    }
}
}
//EIXO DA POLIA
rotate([0,90,0])eixoPolia(cima = true,baixo = false);
translate([larguraDaCorreia*2+(profundidadeParaRolamento/2),0,0])rotate([0,-90,0])encaixeRolamento(cima = true,baixo = false,recorteDoRecipiente=false);
}
}
if(rolamento){
    
    color("silver") {
     translate([0,0,-raio]){
    difference(){
        union(){
        translate([-profundidadeParaRolamento, 0, raio]) rotate([0, 90, 0])encaixeRolamento(cima = false,baixo = true,recorteDoRecipiente = false);
    
    translate([larguraDaCorreia+profundidadeParaRolamento, 0, raio]) rotate([0, -90, 0])encaixeRolamento(cima = false,baixo = true);
    
    translate([0, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia , raio - espessuraDosDentes, raio - espessuraDosDentes, $fn = 100);
        }
    translate([-larguraDaCorreia/2, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia * 3, raioDoEixoDaPoliaComRolamento,raioDoEixoDaPoliaComRolamento, $fn = 100);
        
}  
    cylindric_bend([larguraDaCorreia*2, cumprimentoPolia, espessuraDosDentes], raio, 400)
    rotate([0, 180, 0]) translate([-larguraDaCorreia/2, 0, -espessuraDaCorreia / 2 - espessuraDosDentes]) rotate([0, -90, 90]) {
        dentesPolia(dentesPolia);
    }
}
}
translate([(larguraDaCorreia/2)-(comprimentoDoEixoDeBaixo/2),0,0])rotate([0,90,0])eixoPolia(cima = false,baixo = true);
}
}
 //translate([0,20,0])polia(eixo = true,rolamento=false);
//polia(eixo = false,rolamento=true);