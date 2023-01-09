include <correia com dentes.scad>
/*["Medidas"]*/
abrirColher = 0; //[0:90]
//MODULOS 
module colheresComCorreiasDentes() {
    translate([-espessuraDaCorreia / 2,0,0])correiaComDentes();
    translate([-(raaio / 100) * escala, 0, 0]) {
        color([0.05, 0.43, 0.84])
        difference() {
            translate([0, 0, 0]) rotate([0, 3.5 + 90 + abrirColher, 0]) translate([espacoEntreAsColheres * 2, 0, 0]) scale([(1 / 100) * escala, (1 / 100) * escala, (1 / 100) * escala]) colher();
            translate([0, larguraDaCorreia, -espacoEntreAsColheres-(raaio / 100) * escala]) rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        }
         color("silver") translate([0, larguraDaCorreia/2, -espacoEntreAsColheres-(raaio / 100) * escala]) rotate([90, 0, 0]) cylinder(larguraDaCorreia, raaio / 5, raaio / 5, $fn = quaalidaade);
    }
}
//colher();
//dentes();
//correiaComDentes();
//colheresComCorreias();
//colheresComCorreiasDentes();