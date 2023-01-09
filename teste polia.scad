include<correia com dentes e colher.scad>
include<bend.scad>
include<polia.scad>
module esticada(){
    raio = comprimentoDaCorreia*2 /(PI*2);
    translate([larguraDaCorreia/2,0,2*raio])rotate([0,180,0]){
    cylindric_bend([larguraDaCorreia, comprimentoDaCorreia,  espessuraDaCorreia+espessuraDosDentes],raio)
        translate([larguraDaCorreia/2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                       colheresComCorreiasDentes();
                    
        }    
    }
           translate([larguraDaCorreia/2,-quantidadeDeColheres*comprimentoDaCorreia,0]) rotate([0,0,180])
            cylindric_bend([larguraDaCorreia, comprimentoDaCorreia,  espessuraDaCorreia+espessuraDosDentes],raio)
                translate([larguraDaCorreia/2, 0, espessuraDaCorreia / 2]) rotate([0,-90,90]){
                                colheresComCorreiasDentes();
                            
                }    
                rotate([-90,-90,0]){       
            for(i = [0: quantidadeDeColheres - 1]) {
                translate([espessuraDaCorreia/2, 0, -comprimentoDaCorreia  * i]) colheresComCorreiasDentes();
            }
    }
    
    
translate([0,-comprimentoDaCorreia*quantidadeDeColheres,raio*2-espessuraDaCorreia/2])
           rotate([0,90,-90]){
                for(i = [ 0: quantidadeDeColheres - 1]) {
                   translate([0, 0, -comprimentoDaCorreia * i]) colheresComCorreiasDentes();
                }
        }
    //polias
    translate([-larguraDaCorreia/2,-comprimentoDaCorreia * quantidadeDeColheres,espessuraDaCorreia/2])polia(rolamento =true);
    
    translate([-larguraDaCorreia/2,0,espessuraDaCorreia/2])polia(eixo=true);
}

module enrolada(){
    raio = medidaFinalDoLoopFor/(PI*2);
    cylindric_bend([larguraDaCorreia, medidaFinalDoLoopFor,  espessuraDaCorreia+espessuraDosDentes],raio,100)
    translate([larguraDaCorreia/2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                for(i = [0: quantidadeDeColheres - 1]) {
                    translate([0, 0, -(comprimentoDaCorreia - arredondar + espacoEntreAsColheres) * i]) colheresComCorreiasDentes();
                }
    }
}
//colheresComCorreiasDentes();
//enrolada();   

esticada();
//translate([0,0,raio+espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(eixo=true);
//translate([0,-comprimentoDaCorreia * (quantidadeDeColheres- 2),raio + espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(rolamento =true);
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();
        
    
//esticada();
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();