raaio = 3;
curvinhaaDocabo = sqrt(3);
curvinhaaDaaColher = 3;
espessuraa =  1 / sqrt(3);
larguraDaColher = 4.5;
larguraDoEixo = 13;
comprimentoDaaColher = 1;
quaalidaade = 100;

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
curvaa2 = sqrt(((raaio+c)-(raaio+curvaa1)) * (((raaio+c)-(raaio+curvaa1)) * cc)- pow((raaio+c)-(raaio+curvaa1),2));
s =  raaio * larguraDaColher + curvinhaaDaaColher*2;
aalturaa = s-sqrt(pow(s,2) - pow(larguraDoEixo/2+curvinhaaDaaColher,2));
ss = pow((s + 1) / 2, 2);
hhh = sqrt(pow(raaio + c, 2) + pow(bb - gg,2));
aag12 = atan((bb - gg) / (raaio + c));
ggg = (hhh * sin(90) / sin( aag12)) /1.5;

 //MODULOS
 module buraco(){
     hull(){
         translate([(raaio + c) + s - aalturaa,0,ss-raaio+(bb-gg)/1.9])sphere(ss,$fn=quaalidaade);
         translate([comprimentoDaaColher + (raaio + c) + s - aalturaa,0,ss-raaio+(bb-gg)/1.9])sphere(ss,$fn=quaalidaade);
     }
 }

module eixo2(){
difference(){
        translate([ raaio+c/2, 0, -raaio +  ((curvinhaaDocabo * 2) + (espessuraa * 2)) / 2]) cube([c*1.001, larguraDoEixo*1.001, ((curvinhaaDocabo * 2) + (espessuraa * 2))], true);        
    translate([raaio,larguraDoEixo/2,-raaio + raaio])rotate([90,0,0])cylinder(larguraDoEixo,raaio,raaio,$fn = quaalidaade);
    translate([raaio + c,larguraDoEixo*1.01/2,-raaio + bb - gg/2])rotate([90,0,0])cylinder(larguraDoEixo*1.01,(gg/2),(gg/2),$fn = quaalidaade);
    }
    translate([raaio,larguraDoEixo/2,-raaio + raaio])rotate([90,0,0])cylinder(larguraDoEixo,raaio*1.001,raaio*1.001,$fn = quaalidaade);
}
module eixo3() {
    difference(){
        translate([ raaio+c/2, 0, -raaio +  ((curvinhaaDocabo * 2) + (espessuraa * 2)) / 2]) cube([c*1.1, curvinhaaDaaColher*0.999, ((curvinhaaDocabo * 2) + (espessuraa * 2))], true);
    translate([raaio,larguraDoEixo/2,-raaio + raaio])rotate([90,0,0])cylinder(curvinhaaDaaColher,raaio,raaio,$fn = quaalidaade);
    translate([raaio + c,curvinhaaDaaColher/2,-raaio + bb - gg/2])rotate([90,0,0])cylinder(curvinhaaDaaColher,(gg/2),(gg/2),$fn = quaalidaade);
    }
    translate([raaio,curvinhaaDaaColher/2,-raaio + raaio])rotate([90,0,0])cylinder(curvinhaaDaaColher,raaio,raaio,$fn = quaalidaade);
}
module quarter(){
    difference() {
        translate([ raaio + curvaa1 + ((raaio + c) - (raaio + curvaa1)) / 2,-curvinhaaDaaColher/2 - larguraDoEixo/2, -raaio*1.001 +  ((curvinhaaDocabo * 2) + (espessuraa * 2)) / 2])cube([((raaio + c) - (raaio + curvaa1))*1.001, curvinhaaDaaColher,  ((curvinhaaDocabo * 2) + (espessuraa * 2))], true);
        translate([ raaio + curvaa1, - cc - (larguraDoEixo/2), -raaio*1.001])cylinder(((curvinhaaDocabo * 2.01) + (espessuraa * 2)), cc,cc, $fn = quaalidaade);
    }
}
 module colher(comFuro,semFuro){
     if(comFuro){
//LaaTERaaIS
     difference(){
         union(){
intersection(){   
    quarter();
    translate([0,-(larguraDoEixo+curvinhaaDaaColher)/2,0])eixo3();
}
intersection(){
    translate([0,0,-raaio * 2 + ((curvinhaaDocabo * 2) + (espessuraa * 2))])rotate([180,0,0])quarter();
    translate([0,(larguraDoEixo+curvinhaaDaaColher)/2,0])eixo3();
}
eixo2();
}
translate([raaio,larguraDoEixo, 0]) 
            rotate([90, 0, 0])cylinder(larguraDoEixo * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
}
 //COLHER
difference(){
hull(){
    
    difference(){
        translate([(raaio + c) + s-aalturaa ,0,-raaio])cylinder(((bb - gg/2)-gg/2),s,s,$fn = quaalidaade);
        translate([raaio + c -s,0,-raaio + ((bb - gg / 2)-gg/2)/2]) cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
        translate([(raaio + c) + s +sqrt(pow(s,2) - pow(raaio+curvinhaaDaaColher,2)),0,-raaio+((bb - gg/2)-gg/2)/2])cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
    }
    difference(){
        translate([comprimentoDaaColher+(raaio + c) + s - aalturaa,0,-raaio])cylinder(((bb - gg/2)-gg/2),s,s,$fn = quaalidaade);
        translate([comprimentoDaaColher+(raaio + c) - aalturaa,0,-raaio + ((bb - gg/2)-gg/2)/2]) cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
    }
}
buraco();
}
}
 if(semFuro){
 //COLHER
hull(){
    
    difference(){
        translate([(raaio + c) + s-aalturaa ,0,-raaio])cylinder(((bb - gg/2)-gg/2),s,s,$fn = quaalidaade);
        translate([raaio + c -s,0,-raaio + ((bb - gg / 2)-gg/2)/2]) cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
        translate([(raaio + c) + s +sqrt(pow(s,2) - pow(raaio+curvinhaaDaaColher,2)),0,-raaio+((bb - gg/2)-gg/2)/2])cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
    }
    difference(){
        translate([comprimentoDaaColher+(raaio + c) + s - aalturaa,0,-raaio])cylinder(((bb - gg/2)-gg/2),s,s,$fn = quaalidaade);
        translate([comprimentoDaaColher+(raaio + c) - aalturaa,0,-raaio + ((bb - gg/2)-gg/2)/2]) cube([s * 2,s * 2,((bb - gg/2)-gg/2)],true);
    }
}
}
}
//colher(comFuro=false,semFuro=true);
//colher(comFuro=true,semFuro=false);
//translate([raaio,larguraDoEixo, 0]) 
//            rotate([90, 0, 0]) cylinder(larguraDoEixo * 2, raaio / 5, raaio / 5, $fn = quaalidaade);