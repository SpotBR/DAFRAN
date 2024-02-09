include <colher de recorte.scad>
/*["Medidas"]*/
phi = (1+sqrt(5))/2;
quantidadeDeColheres = 6; //[0:20]
quantidadeDeDentes = 30; //[1:30]
retirarDentesPolia = 43;//[1:30]
anguloDoDente = 10; //[0:45]
larguraDaCorreia = 20; //[15:100]
espessuraDaCorreia = phi * raaio; //[1:100]
espessuraDosDentes = 1/2; //[1:50]
arredondar = 0.99; //[0.1:5]
qualidade = 30; //[30:100]
resolucao = 20; //[20:100]
espacoEntreAsColheres = 1;//[1:100]
escala = 90;

//CALCULOS
comprimentoDaCorreia = ((raaio + c) + s * 2 - aalturaa * 2 + comprimentoDaaColher * ((1 / 100) * escala));
medidaFinalDoLoopFor = comprimentoDaCorreia * quantidadeDeColheres;
oposto = espessuraDosDentes * sin(anguloDoDente) / sin(90 - anguloDoDente);
espacoDosDentes = ((comprimentoDaCorreia / 2) + oposto * quantidadeDeDentes) / quantidadeDeDentes;
fundoDoDente = espacoDosDentes - oposto * 2;
somatoriaDoDente = espacoDosDentes * quantidadeDeDentes + quantidadeDeDentes * fundoDoDente;
comprimentoDaCorreia1 = (((comprimentoDaCorreia - (fundoDoDente * retirarDentesPolia + oposto * retirarDentesPolia)) * 2 /(PI * 2))+espessuraDaCorreia) * PI;
espacoDosDentes1 = ((comprimentoDaCorreia1 / 2) + oposto * quantidadeDeDentes) / quantidadeDeDentes;
fundoDoDente1 = espacoDosDentes1 - oposto * 2;

//MODULOS
module dente(a,b){
    if(a)
    difference() {
            translate([espessuraDaCorreia / 2 + espessuraDosDentes / 2, 0, -espacoDosDentes / 2])cube([espessuraDosDentes, larguraDaCorreia, espacoDosDentes], true);
            translate([espessuraDaCorreia / 2, 0, 0]) rotate([0, anguloDoDente, 0])translate([comprimentoDaCorreia / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia, larguraDaCorreia * 1.1, espessuraDosDentes * 2], true);
            translate([espessuraDaCorreia / 2, 0, -espacoDosDentes])rotate([0, 180 - anguloDoDente, 0]) translate([-comprimentoDaCorreia / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia, larguraDaCorreia * 1.1, espessuraDosDentes * 2], true);
        }
    if(b)
    difference() {
            translate([espessuraDaCorreia / 2 + espessuraDosDentes / 2, 0, -espacoDosDentes1 / 2])cube([espessuraDosDentes, larguraDaCorreia, espacoDosDentes1], true);
            translate([espessuraDaCorreia / 2, 0, 0]) rotate([0, anguloDoDente, 0])translate([comprimentoDaCorreia1 / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia1, larguraDaCorreia * 1.1, espessuraDosDentes * 2], true);
            translate([espessuraDaCorreia / 2, 0, -espacoDosDentes1])rotate([0, 180 - anguloDoDente, 0]) translate([-comprimentoDaCorreia1 / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia1, larguraDaCorreia , espessuraDosDentes * 2], true);
        }
}
module dentes(correia,polia){
    //DENTES
    for(j = [0: quantidadeDeDentes -1]) {
        if(correia)
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a=true);
   
    if( j <(quantidadeDeDentes*2-retirarDentesPolia))
    if(polia)
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a=true);
}
}
module correiaComDentes() {    
    color("dimgray"){
    difference() {
        minkowski() {
            translate([0, 0, -comprimentoDaCorreia / 2 ])cube([espessuraDaCorreia , larguraDaCorreia-arredondar*2,comprimentoDaCorreia], true);
            sphere(arredondar, $fn = qualidade);
        }
        
        translate([ espessuraDaCorreia ,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres + arredondar * 2], true);
        
        translate([ -espessuraDaCorreia,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres + arredondar * 2], true);
        
        translate([espessuraDaCorreia/2-(raaio / 100) * escala, larguraDaCorreia, -espacoEntreAsColheres-(raaio / 100) * escala]) rotate([90, 0, 0])  cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        
        translate([0, 0,-comprimentoDaCorreia-((fundoDoDente+arredondar)/2)-espacoEntreAsColheres+(espacoEntreAsColheres/2)]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, (fundoDoDente+arredondar)+espacoEntreAsColheres], true);
        
        translate([0, 0, arredondar]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        
        translate([0, 0,  - espacoEntreAsColheres]) rotate([0, atan((espessuraDaCorreia/2) / (comprimentoDaCorreia)) + 90, 0]) translate([0, 0, 0.1]) recorte();
    }
    dentes(correia=true,polia=false);     
}
}

module correiaCortada(curvaPolia,retaPolia){
    if(curvaPolia)
    difference(){
        correiaComDentes();
        translate([0,0,-comprimentoDaCorreia1-comprimentoDaCorreia1/2])cube([espessuraDaCorreia*2 ,larguraDaCorreia*1.2,comprimentoDaCorreia1],true);
    }
    if(retaPolia)
        translate([0,0,comprimentoDaCorreia1])
    intersection(){
        correiaComDentes();
        translate([0,0,-comprimentoDaCorreia1-comprimentoDaCorreia1/2])cube([espessuraDaCorreia*2 ,larguraDaCorreia*1.2,comprimentoDaCorreia1],true);
    }
}

//module correias(){
//    for(j=[0:quantidadeDeColheres]){
//    translate([0,0,-comprimentoDaCorreia])correiaComDentes();
//}
//}
//correias();
//translate([0,-30 ,0])correiaCortada(curvaPolia = true,retaPolia = false);
//translate([0,-30 ,0])correiaCortada(curvaPolia = false,retaPolia = true);
//dentes();
//rotate([0,90,0])colher();
//translate([0,0,0])correiaComDentes();