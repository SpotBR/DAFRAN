include <colher de recorte.scad>
/*["Medidas"]*/
quantidadeDeColheres = 4; //[0:20]
quantidadeDeDentes = 3;//[1:20]
anguloDoDente = 45;//[0:45]
larguraDaCorreia = 30; //[15:100]
espessuraDaCorreia = 14; //[1:100]
espessuraDosDentes = 11;//[1:50]
arredondar = 1; //[0.1:5]
qualidade = 30; //[30:100] 
abrirColher = 0; //[0:90]
espacoEntreAsColheres = 1;//[1:100]
raioDaPolia = 40;
larguraDaPolia = 50;
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
    for(j = [0: quantidadeDeDentes - 1]) {
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a=true);
    }
}
module correiaComDentes() {
    color("dimgray"){
    difference() {
        minkowski() {
            translate([0, 0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia , larguraDaCorreia - arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres], true);
            sphere(arredondar, $fn = qualidade);
        }
        translate([ espessuraDaCorreia-arredondar,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia - arredondar * 2, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres+arredondar], true);
        translate([ -espessuraDaCorreia+arredondar,0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia - arredondar * 2, larguraDaCorreia + arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres+arredondar], true);
        translate([-arredondar / 2, larguraDaCorreia, -raaio - arredondar - espacoEntreAsColheres]) rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        translate([0, 0, -((raaio + c) + s * 2 - aalturaa * 2 + comprimentoDaaColher * ((1 / 100) * escala)) - espacoEntreAsColheres]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        translate([0, 0, arredondar]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        translate([0, 0, -raaio - espacoEntreAsColheres]) rotate([0, 2 + 90, 0]) translate([-(raaio / 100) * escala, 0, 0]) recorte();
    }
    dentes();
}
}
//dentes();
//correiaComDentes();