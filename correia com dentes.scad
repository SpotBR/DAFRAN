include <colher de recorte.scad>
/*["Medidas"]*/
quantidadeDeColheres = 1; //[0:20]
quantidadeDeDentes = 8; //[1:20]
anguloDoDente = 10; //[0:45]
larguraDaCorreia = 2; //[15:100]
espessuraDaCorreia = 2 * raaio * 0.95; //[1:100]
espessuraDosDentes = 0.5; //[1:50]
arredondar = 0.99; //[0.1:5]
qualidade = 30; //[30:100] 
espacoEntreAsColheres = 0.1;//[1:100]
escala = 90;

//CALCULOS
comprimentoDaCorreia = ((raaio + c) + s * 2 - aalturaa * 2 + comprimentoDaaColher * ((1 / 100) * escala));
medidaFinalDoLoopFor = comprimentoDaCorreia * (quantidadeDeColheres);
oposto = espessuraDosDentes * sin(anguloDoDente) / sin(90 - anguloDoDente);
espacoDosDentes = ((comprimentoDaCorreia / 2) + oposto * quantidadeDeDentes) / quantidadeDeDentes;
fundoDoDente = espacoDosDentes - oposto * 2;
somatoriaDoDente = espacoDosDentes * quantidadeDeDentes + quantidadeDeDentes * fundoDoDente;
echo(fundoDoDente, espacoDosDentes, comprimentoDaCorreia, somatoriaDoDente);
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
            translate([espessuraDaCorreia / 2 + espessuraDosDentes / 2, 0, -espacoDosDentes / 2])cube([espessuraDosDentes, larguraDaPolia, espacoDosDentes], true);
            translate([espessuraDaCorreia / 2, 0, 0]) rotate([0, anguloDoDente, 0])translate([comprimentoDaCorreia / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia, larguraDaPolia * 1.1, espessuraDosDentes * 2], true);
            translate([espessuraDaCorreia / 2, 0, -espacoDosDentes])rotate([0, 180 - anguloDoDente, 0]) translate([-comprimentoDaCorreia / 2, 0, espessuraDosDentes]) cube([comprimentoDaCorreia, larguraDaPolia * 1.1, espessuraDosDentes * 2], true);
        }
}
module dentes(){
    //DENTES
    for(j = [0: quantidadeDeDentes -1]) {
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a=true);
    }
}
module correiaComDentes() {    
    color("dimgray"){
    difference() {
        minkowski() {
            translate([0, 0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2])cube([espessuraDaCorreia , larguraDaCorreia-arredondar*2,comprimentoDaCorreia + espacoEntreAsColheres], true);
            sphere(arredondar, $fn = qualidade);
        }
        
        translate([ espessuraDaCorreia ,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres + arredondar * 2], true);
        
        translate([ -espessuraDaCorreia,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres + arredondar * 2], true);
        
//        translate([(espessuraDaCorreia / 2)- ((raaio / 100) * escala)  , larguraDaCorreia, -raaio - espacoEntreAsColheres]) rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        translate([espessuraDaCorreia/2-(raaio / 100) * escala, larguraDaCorreia, -espacoEntreAsColheres-(raaio / 100) * escala]) rotate([90, 0, 0])  cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        
        translate([0, 0,-fundoDoDente/2-arredondar/2-(oposto*2+fundoDoDente)*quantidadeDeDentes-fundoDoDente*quantidadeDeDentes]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, fundoDoDente+arredondar], true);
        
        translate([0, 0, arredondar]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        
        translate([0, 0,  - espacoEntreAsColheres]) rotate([0, 3.5 + 90, 0]) translate([0, 0, 0.1]) recorte();
    }
    dentes();
}
}
//dentes();
//rotate([0,90,0])colher();
//correiaComDentes();