include <colher de recorte.scad>
/*["Medidas"]*/
quantidadeDeColheres = 4; //[0:20]
larguraDaCorreia = 30; //[15:100]
espessuraDaCorreia = 14; //[1:100]
arredondar = 1; //[0.1:5]
qualidade = 30; //[30:100] 
abrirColher = 0; //[0:90]
espacoEntreAsColheres = 1;
escala = 90;
//CALCULOS
comprimentoDaCorreia = ((raaio + c) + s * 2 - aalturaa * 2 + comprimentoDaaColher * ((1 / 100) * escala));
medidaFinalDoLoopFor = comprimentoDaCorreia * (quantidadeDeColheres);
echo(medidaFinalDoLoopFor, comprimentoDaCorreia);
//MODULOS
module correiaSemDentes() {
    difference() {
        minkowski() {
            translate([0, 0, -comprimentoDaCorreia / 2 - espacoEntreAsColheres / 2]) cube([espessuraDaCorreia - arredondar * 2, larguraDaCorreia - arredondar * 2, comprimentoDaCorreia + espacoEntreAsColheres], true);
            sphere(arredondar, $fn = qualidade);
        }
        translate([-arredondar / 2, larguraDaCorreia, -raaio - arredondar - espacoEntreAsColheres]) rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        translate([0, 0, -((raaio + c) + s * 2 - aalturaa * 2 + comprimentoDaaColher * ((1 / 100) * escala)) - espacoEntreAsColheres]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        translate([0, 0, arredondar]) cube([2 * espessuraDaCorreia, larguraDaCorreia * 2, arredondar * 2], true);
        translate([0, 0, -raaio - espacoEntreAsColheres]) rotate([0, 2 + 90, 0]) translate([-(raaio / 100) * escala, 0, 0]) recorte();
    }
}
correiaSemDentes();