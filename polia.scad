include <correia com dentes.scad>
include <bend.scad>
/*["Medidas"]*/
dentesPolia = 10;
cumprimentoPolia = (espacoDosDentes + fundoDoDente) * dentesPolia;
raio = cumprimentoPolia / (PI * 2);
escala = 90;
module dentesPolia(quantidadeDeDentes = 10) {
    //DENTES
    for(j = [0: quantidadeDeDentes - 1]) {
        translate([0, 0, -j * espacoDosDentes - fundoDoDente * j])
        dente(a = true);
    }
}
color("dimgray") {
    translate([0, 0, raio]) rotate([0, 90, 0]) cylinder(larguraDaCorreia / 2, raio - espessuraDosDentes, raio - espessuraDosDentes, $fn = 100);
    cylindric_bend([larguraDaCorreia, cumprimentoPolia, espessuraDosDentes], raio, 400)
    rotate([0, 180, 0]) translate([0, 0, -espessuraDaCorreia / 2 - espessuraDosDentes]) rotate([0, -90, 90]) {
        dentesPolia(dentesPolia);
    }
}