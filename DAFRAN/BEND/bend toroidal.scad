include <correia com dentes.scad>
raio = (espessuraDaCorreia + espessuraDosDentes) / 2;
altura = comprimentoDaCorreia*quantidadeDeColheres;
largura = larguraDaCorreia;
faces = 2;//Quantidade De Faces
curvatura = 36 * 5;//Graus De Curvatura
module bendTorus(raio,largura,altura,faces,curvatura){
    fatia = altura / faces;
    grau = curvatura / faces;
    rai =  (fatia / 2) * sin(90 - (grau / 2)) / sin(grau / 2);
    pendulo = sqrt(pow(rai,2 ) + pow(fatia / 2,2 ));
for(i = [ 0: faces-1]){
    translate([-rai + raio,0,0])
    rotate([ 0, -grau * i,0])
    translate([0,0,-i * fatia])
intersection(){
translate([ rai - raio, 0, -fatia/2])children();
    translate([0,0,i * fatia])
    union(){
rotate([0,grau / 2,0])translate([pendulo / 2, 0, fatia / 4])cube([pendulo,largura  * 2,fatia / 2],true);
rotate([ 0, -grau / 2,0])translate([ pendulo / 2, 0, -fatia / 4])cube([ pendulo, largura * 2, fatia / 2],true);
    }
}
}
}
bendTorus( raio,largura, altura, faces,curvatura)
rotate([0,180,0])correias();
//cylinder( altura, raio, raio,$fn = 50);//Geometria A Ser Invergada