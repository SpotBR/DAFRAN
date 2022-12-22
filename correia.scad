include <colher com correia em modulo.scad >
//include <teste colher.scad >
/*["Medidas"]*/
raio = 50; //[1:900]
qualidade = 30; //[0:100]
inclinacaoDaColher = 2.7; //[0:45]
abrirColher = 90; //[0:100]
arredondar = 1; //[0:10]
largura = 55; //[ 1:500]
larguraDoDente = 16; //[1:50]
quantidadeDeDentes = 4; //[1:150]
quantidadeDeColheres = 0; //[0:20]
profundidadeDoDente = 7.5; //[1:100]
grauDoDente = 15; //[0:45]
//Calculos
espessura = (raio / 5) * 2 + profundidadeDoDente;
faceDeCimaDoDente = larguraDoDente + (profundidadeDoDente * sin(grauDoDente) / sin(90 - grauDoDente)) * 2;
comprimento = quantidadeDeDentes * faceDeCimaDoDente + quantidadeDeDentes * larguraDoDente + faceDeCimaDoDente;
espacoEntreAsColheres = raio * 4;
color("silver")
minkowski() {
    difference() {
        translate([0, 0, raio / 7])
        rotate([180, 0, 90])
        difference() {
            translate([comprimento / 2, 0, espessura / 2]) cube([comprimento, largura, espessura], true);
            for(i = [0: quantidadeDeDentes]) {
                translate([i * faceDeCimaDoDente + i * larguraDoDente, 0, 0])
                hull() {
                    translate([faceDeCimaDoDente / 2, 0, espessura]) cube([faceDeCimaDoDente, largura * 1.1, 0.01], true);
                    translate([faceDeCimaDoDente / 2, 0, espessura - profundidadeDoDente * 1.3]) cube([larguraDoDente, largura * 1.1, 0.0001], true);
                }
            }
        }
        colher(buraco = false, minkowski = false);
    }
    sphere(arredondar, $fn = qualidade);
}