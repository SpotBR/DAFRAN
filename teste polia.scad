include<correia com dentes e colher.scad>
include<bend.scad>
include<polia.scad>
module esticada(){
    raio = comprimentoDaCorreia*2/(PI*2);
    
    cylindric_bend([larguraDaCorreia, comprimentoDaCorreia,  espessuraDaCorreia+espessuraDosDentes],raio)
        translate([larguraDaCorreia/2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                       colheresComCorreiasDentes();
                    
        }    
    
           translate([0,-(quantidadeDeColheres-2)*comprimentoDaCorreia,raio*2]) rotate([0,180,180])
            cylindric_bend([larguraDaCorreia, comprimentoDaCorreia,  espessuraDaCorreia+espessuraDosDentes],raio)
                translate([larguraDaCorreia/2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                                colheresComCorreiasDentes();
                            
                }    
    
    translate([larguraDaCorreia/2, -(quantidadeDeColheres-2)*comprimentoDaCorreia, espessuraDaCorreia/2]) rotate([0,-90,90]){
        
            for(i = [0: quantidadeDeColheres-3]) {
                translate([0, 0, -(comprimentoDaCorreia - arredondar + espacoEntreAsColheres) * i]) colheresComCorreiasDentes();
            }
    }
    
    
     translate([larguraDaCorreia/2, 0, espessuraDaCorreia/2+raio*2-espessuraDaCorreia]) rotate([0,-90,90]){
           rotate([0,180,0]){
                for(i = [0: quantidadeDeColheres-3]) {
                    translate([0, 0, -(comprimentoDaCorreia - arredondar + espacoEntreAsColheres) * i]) colheresComCorreiasDentes();
                }
        }
    }
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
translate([0,0,raio+espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia();
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();
        
    
//esticada();
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();