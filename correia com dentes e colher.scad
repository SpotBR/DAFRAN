include <correia com dentes.scad>
/*["Medidas"]*/
abrirColher = 90; //[0:90]
//MODULOS 
module colheresComCorreiasDentes() {
    translate([-espessuraDaCorreia/2,0,0])correiaComDentes();
    translate([arredondar-(raaio / 100) * escala, 0, -raaio - arredondar / 2]) {
        color([0.05, 0.43, 0.84])
        difference() {
            translate([-arredondar, 0, -espacoEntreAsColheres]) rotate([0, 2 + 90 + abrirColher, 0]) translate([-(raaio / 100) * escala, 0, 0]) scale([(1 / 100) * escala, (1 / 100) * escala, (1 / 100) * escala]) colher();
            translate([-arredondar, larguraDaCorreia, -espacoEntreAsColheres]) rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        }
        color("silver") translate([-arredondar, larguraDaCorreia / 2, -espacoEntreAsColheres]) rotate([90, 0, 0]) cylinder(larguraDaCorreia, raaio / 5, raaio / 5, $fn = quaalidaade);
    }
   
    
}
//colher();
//dentes();
//correiaComDentes();
//colheresComCorreias();
colheresComCorreiasDentes();