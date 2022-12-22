/*["Medidas"]*/
raio = 50; //[1:900]
qualidade = 30; //[0:100]
inclinacaoDaColher = 2.7; //[0:45]
abrirColher = 90; //[0:100]
arredondar = 1; //[0:10]
largura = 55; //[1:500]
larguraDoDente = 16; //[1:50]
quantidadeDeDentes = 4; //[1:150]
quantidadeDeColheres = 1; //[0:20]
profundidadeDoDente = 25; //[1:100]
grauDoDente = 15; //[0:45]
//Calculos
espessura = (raio / 5) * 2 + profundidadeDoDente;
faceDeCimaDoDente = larguraDoDente + (profundidadeDoDente * sin(grauDoDente) / sin(90 - grauDoDente)) * 2;
comprimento = quantidadeDeDentes * faceDeCimaDoDente + quantidadeDeDentes * larguraDoDente + faceDeCimaDoDente;
espacoEntreAsColheres = raio * 4;
difference() {
    translate([0, -raio / 5, raio / 6.5])
    rotate([180, 0, 90]) color("silver")
    difference() {
        translate([comprimento / 2, 0, espessura / 2]) cube([comprimento, largura, espessura], true);
        for(i = [0: quantidadeDeDentes]) {
            translate([i * faceDeCimaDoDente + i * larguraDoDente, 0, 0])
            hull() {
                translate([faceDeCimaDoDente / 2, 0, espessura]) cube([faceDeCimaDoDente, largura * 1.1, 0.01], true);
                translate([faceDeCimaDoDente / 2, 0, espessura - profundidadeDoDente]) cube([larguraDoDente, largura * 1.1, 0.0001], true);
            }
        }
    }
    for(i = [0: quantidadeDeColheres]) {
        translate([0, (raio / 5) + arredondar + espacoEntreAsColheres * i, 0])
        rotate([inclinacaoDaColher, 0, 0])
        translate([0, 0, raio / 5])
        minkowski() {
            union() {
                //COLHER
                difference() {
                    hull() {
                        translate([0, raio * 2 + (raio / 5) * 2, -(raio / 5) - arredondar]) cylinder(raio / 5, raio, raio, $fn = qualidade);
                        difference() {
                            translate([0, raio - (raio / 13) + (raio / 5) * 2, -arredondar - (raio / 4.7)]) cylinder(raio / 4.7, raio, raio, $fn = qualidade);
                            translate([0, raio - (raio / 13) - raio * 1.4 + (raio / 5) * 2, -(raio / 5) - (raio / 5)]) cube(raio * 1.5, true);
                        }
                    }
                    hull() {
                        translate([0, raio * 2 + (raio / 5) * 2, -(raio * 3.9) - (raio / 5) - arredondar]) sphere(raio * 4, $fn = qualidade);
                        translate([0, raio / 10 + raio * 1.12 + (raio / 5) * 2, -(raio * 3.9) - (raio / 5) - arredondar]) sphere(raio * 4, $fn = qualidade);
                    }
                }
                //CABO DA COLHER
                hull() {
                    difference() {
                        translate([-raio / 3.99, 0, -(raio / 10) * 2 - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 1.99, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);
                        translate([0, -(raio / 10) - arredondar / 2, -(raio / 10) - arredondar]) cube([(raio / 1.8), (raio / 10) * 2, (raio / 10) * 2], true);
                    }
                    translate([0, -(raio / 10) * 1 - arredondar / 2, -(raio / 10) - arredondar]) cube([(raio / 2), (raio / 10) * 2, (raio / 10) * 2], true);
                    translate([-raio / 4, (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                    rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                }
                intersection() {
                    hull() {
                        difference() {
                            translate([(raio / 4) + (raio / 2), 0, -(raio / 10) * 2 - arredondar])
                            rotate([0, -90, 0]) cylinder(raio / 1.99, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);
                            translate([(raio / 4) + (raio / 4), -(raio / 10), -(raio / 10) - arredondar]) cube([(raio / 2), (raio / 10) * 2, (raio / 10) * 2], true);
                        }
                        translate([(raio / 4) + (raio / 4), -(raio / 10), -(raio / 10) - arredondar]) cube([(raio / 2), (raio / 10) * 2, (raio / 10) * 2], true);
                        translate([(raio / 4) + (raio / 2), (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                        rotate([0, -90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                    }
                    difference() {
                        translate([(raio / 2) + (raio / 4), raio / 2 - raio / 5, -(raio / 5) - arredondar]) cube([raio, raio, (raio / 5) * 2], true);
                        translate([(raio) + (raio / 4), -raio / 5, -(raio / 5) + (raio / 3)]) rotate([0, 180, 0]) cylinder(raio, raio, raio, $fn = qualidade);
                    }
                }
                intersection() {
                    hull() {
                        difference() {
                            translate([-(raio / 4) - (raio / 2), 0, -(raio / 10) * 2 - arredondar])
                            rotate([0, 90, 0]) cylinder(raio / 1.99, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);
                            translate([-(raio / 4) - (raio / 4), -(raio / 10), -(raio / 10) - arredondar]) cube([(raio / 2), (raio / 10) * 2, (raio / 10) * 2], true);
                        }
                        translate([-(raio / 4) - (raio / 4), -(raio / 10), -(raio / 10) - arredondar]) cube([(raio / 2), (raio / 10) * 2, (raio / 10) * 2], true);
                        translate([-(raio / 4) - (raio / 2), (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                    }
                    difference() {
                        translate([-((raio / 2) + (raio / 4)), raio / 2 - raio / 5, -(raio / 5) - arredondar]) cube([raio, raio, (raio / 5) * 2], true);
                        translate([-((raio) + (raio / 4)), -raio / 5, -(raio / 5) + (raio / 3)]) rotate([0, 180, 0]) cylinder(raio, raio, raio, $fn = qualidade);
                    }
                }
            }
            sphere(arredondar*2, $fn = qualidade);
        }
    }
}
for(i = [0: quantidadeDeColheres]) {
    color([0.05, 0.43, 0.84]) {
        translate([0, (raio / 5) + arredondar + espacoEntreAsColheres * i, 0])
        rotate([inclinacaoDaColher + abrirColher, 0, 0])
        translate([0, 0, raio / 5])
        minkowski() {
            union() {
                //COLHER
                difference() {
                    hull() {
                        translate([0, raio * 2 + (raio / 5) * 2, -(raio / 5) - arredondar]) cylinder(raio / 5, raio, raio, $fn = qualidade);
                        difference() {
                            translate([0, raio - (raio / 13) + (raio / 5) * 2, -arredondar - (raio / 4.7)]) cylinder(raio / 4.7, raio, raio, $fn = qualidade);
                            translate([0, raio - (raio / 13) - raio * 1.4 + (raio / 5) * 2, -(raio / 5) - (raio / 5)]) cube(raio * 1.5, true);
                        }
                    }
                    hull() {
                        translate([0, raio * 2 + (raio / 5) * 2, -(raio * 3.9) - (raio / 5) - arredondar]) sphere(raio * 4, $fn = qualidade);
                        translate([0, raio / 10 + raio * 1.12 + (raio / 5) * 2, -(raio * 3.9) - (raio / 5) - arredondar]) sphere(raio * 4, $fn = qualidade);
                    }
                }
                //CABO DA COLHER
                hull() {
                    translate([-raio / 3.99, 0, -(raio / 10) * 2 - arredondar])
                    rotate([0, 90, 0]) cylinder(raio / 1.99, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);

                    translate([-raio / 4, (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                    rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                }
                intersection() {
                    hull() {
                        translate([-(raio / 4) + (raio / 2), -0, -(raio / 10) * 2 - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);

                        translate([-(raio / 4) + (raio / 2), (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                    }
                    difference() {
                        translate([(raio / 2) + (raio / 4), raio / 2 - raio / 5, -(raio / 5) - arredondar]) cube([raio, raio, (raio / 5) * 2], true);
                        translate([(raio) + (raio / 4), -raio / 5, -(raio / 5) + (raio / 3)]) rotate([0, 180, 0]) cylinder(raio, raio, raio, $fn = qualidade);
                    }
                }
                intersection() {
                    hull() {
                        translate([(-(raio / 4) - (raio / 2)), 0, -(raio / 10) * 2 - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10) * 2, (raio / 10) * 2, $fn = qualidade);
                        translate([(-(raio / 4) - (raio / 2)), (raio / 10) + (raio / 5) * 3, -(raio / 10) - arredondar])
                        rotate([0, 90, 0]) cylinder(raio / 2, (raio / 10), (raio / 10), $fn = qualidade);
                    }
                    difference() {
                        translate([-((raio / 2) + (raio / 4)), raio / 2 - raio / 5, -(raio / 5) - arredondar]) cube([raio, raio, (raio / 5) * 2], true);
                        translate([-((raio) + (raio / 4)), -raio / 5, -(raio / 5) + (raio / 3)]) rotate([0, 180, 0]) cylinder(raio, raio, raio, $fn = qualidade);
                    }
                }
            } 
            sphere(arredondar, $fn = qualidade);
        }
    }
}