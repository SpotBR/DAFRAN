include<colher.scad>
//CaaLCULOS
curvaa = 2 * sqrt((curvinhaaDocabo) * (raaio)- pow(curvinhaaDocabo,2));
curvaa1 = 2 * sqrt((curvinhaaDocabo +espessuraa) * (raaio)- pow(curvinhaaDocabo + espessuraa,2));
aag = atan((2 * curvinhaaDocabo) / (curvaa));
gt =  (2 * curvinhaaDocabo) * sin(aag) / sin(90 - aag);
gg = (curvaa1 + gt) * sin(aag) / sin(90 - aag);
h = sqrt(pow( curvaa1, 2) + pow(curvinhaaDocabo * 2 + espessuraa * 2,2));
aag1 = atan((2 * curvinhaaDocabo + 2 * espessuraa) / (curvaa1));
aa =  (gg) * sin(aag1) / sin(90);
bb =  (aa + h) * sin(aag1) / sin(90);
c =  (aa + h) * sin(90 - aag1) / sin(90);
//caalculos secretos
h1 = sqrt(pow((raaio + c) - (raaio + curvaa1),2) + pow(curvinhaaDaaColher,2));
aag2 = atan(curvinhaaDaaColher/((raaio + c) - (raaio + curvaa1)));
cc = h1 * sin(90)/sin(aag2)/2;
curvaa2 = sqrt(((raaio + c) - (raaio + curvaa1)) * (((raaio + c)-(raaio + curvaa1)) * cc) - pow((raaio + c) - (raaio + curvaa1),2));
s = raaio * larguraDaColher + curvinhaaDaaColher * 2;
aalturaa = s-sqrt(pow(s,2) - pow(larguraDoEixo/2+curvinhaaDaaColher,2));
ss = pow((s + 1) / 2, 2);
hhh = sqrt(pow(raaio + c, 2) + pow(bb - gg,2));
aag12 = atan((bb - gg) / (raaio + c));
ggg = (hhh * sin(90) / sin( aag12)) /2;
 //MODULOS
//module buraco(){
//     hull(){
//         translate([(raaio + c) + s - aalturaa,0,ss-raaio+(bb-gg)/1.5])sphere(ss,$fn=quaalidaade);
//         translate([comprimentoDaaColher + (raaio + c) + s - aalturaa,0,ss-raaio+(bb-gg)/1.5])sphere(ss,$fn=quaalidaade);
//     }
// }
module canto(){
        translate([ raaio/2, 0, -raaio/2]) cube([raaio,larguraDoEixo, raaio ], true);
}
//REBARBAS
module recorte(){
translate([ raaio + c,(larguraDoEixo*5)/2,-raaio-ggg+((bb - gg))])rotate([90,0,0])cylinder(larguraDoEixo*5,ggg,ggg,$fn = quaalidaade);
canto();
colher();
}
//recorte();