include <correia com dentes.scad>
/*["Medidas"]*/
abrirColher = 90; //[0:90]
//MODULOS 
module colheresComCorreiasDentes(abre,fecha) {
    if(abre){
    translate([-espessuraDaCorreia / 2,0,0])correiaComDentes();
        color([0.05, 0.43, 0.84])
        difference() {
          translate([-(raaio / 100) * escala,0,-espacoEntreAsColheres-(raaio / 100) * escala])
            scale([(1 / 100) * escala, (1 / 100) * escala, (1 / 100) * escala])
            rotate([0, 3.5 + 90 + abrirColher, 0]) 
            translate([-(raaio / 100) * escala, 0, 0])
            colher();
            
            translate([-(raaio / 100) * escala, larguraDaCorreia, -espacoEntreAsColheres-(raaio / 100) * escala]) 
            rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        }
         color("silver") 
        translate([-(raaio / 100) * escala, larguraDaCorreia/2, -espacoEntreAsColheres-(raaio / 100) * escala]) 
            rotate([90, 0, 0]) cylinder(larguraDaCorreia, raaio / 5, raaio / 5, $fn = quaalidaade);
    }
    if(fecha){
    translate([-espessuraDaCorreia / 2,0,0])correiaComDentes();
        color([0.05, 0.43, 0.84])
        difference() {
          translate([-(raaio / 100) * escala,0,-espacoEntreAsColheres-(raaio / 100) * escala])
            scale([(1 / 100) * escala, (1 / 100) * escala, (1 / 100) * escala])
            rotate([0, atan((espessuraDaCorreia/2) / (comprimentoDaCorreia)) + 90 , 0]) 
            translate([-(raaio / 100) * escala, 0, 0])
            colher();
            
            translate([-(raaio / 100) * escala, larguraDaCorreia, -espacoEntreAsColheres-(raaio / 100) * escala]) 
            rotate([90, 0, 0]) cylinder(larguraDaCorreia * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
        }
         color("silver") 
        translate([-(raaio / 100) * escala, larguraDaCorreia/2, -espacoEntreAsColheres-(raaio / 100) * escala]) 
            rotate([90, 0, 0]) cylinder(larguraDaCorreia, raaio / 5, raaio / 5, $fn = quaalidaade);
    }
}
//colher();
//dentes();
//correiaComDentes();
//colheresComCorreias();
//colheresComCorreiasDentes(abre=true,fecha=false);
//colheresComCorreiasDentes(abre=false,fecha=true);