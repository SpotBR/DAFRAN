include <colher de recorte.scad>
include<bend.scad>
/*["Medidas"]*/
quantidadeDeColheres = 1; //[0:20]
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
module dentes(quantidadeDeDentes=10){
    //DENTES
    for(j = [0: quantidadeDeDentes - 1]) {
        color("dimgray")
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a=true);
    }
}

dentesPolia = 10;
cumprimentoPolia = (espacoDosDentes+fundoDoDente)*dentesPolia;
raio =cumprimentoPolia/(PI*2);

cylindric_bend([larguraDaCorreia, cumprimentoPolia,  espessuraDosDentes],raio,400)
    rotate([0,180,0]) translate([0, 0,-espessuraDaCorreia/2-espessuraDosDentes]) rotate([0,-90,90]){
                dentes( dentesPolia);
                
    }