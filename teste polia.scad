include<correia com dentes e colher.scad>
include<bend.scad>
include<polia.scad>

module esticada(comColher,semColher){
    if(comColher){
    translate([larguraDaCorreia/2,comprimentoDaCorreia-comprimentoDaCorreia1,(raio+espessuraDaCorreia)*2-(espessuraDaCorreia/2)])rotate([0,180,0]){
    cylindric_bend([larguraDaCorreia,comprimentoDaCorreia1,  espessuraDaCorreia+espessuraDosDentes],raio+espessuraDaCorreia )
        
        translate([larguraDaCorreia / 2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                       correiaCortada(curvaPolia = true,retaPolia = false);
                    
        }    
    }
           translate([larguraDaCorreia/2,-quantidadeDeColheres*comprimentoDaCorreia,-espessuraDaCorreia/2]) rotate([0,0,180])
            cylindric_bend([larguraDaCorreia,comprimentoDaCorreia1,  espessuraDaCorreia+espessuraDosDentes],raio+espessuraDaCorreia )
                translate([larguraDaCorreia/2, 0, espessuraDaCorreia / 2]) rotate([0,-90,90]){
                                correiaCortada(curvaPolia = true,retaPolia = false);
                            
                }    
    rotate([-90,-90,0]){       
            for(i = [0: quantidadeDeColheres - 1]) {
                translate([espessuraDaCorreia/2, 0, -comprimentoDaCorreia  * i]) colheresComCorreiasDentes(abre=false,fecha=true);
                
            }
    }
    
    
    translate([0,(comprimentoDaCorreia-comprimentoDaCorreia1)-comprimentoDaCorreia*quantidadeDeColheres,-espessuraDaCorreia/2+(raio+espessuraDaCorreia)*2-espessuraDaCorreia])
    rotate([0,90,-90]){
                for(i = [ 0: quantidadeDeColheres - 1]) {
                   translate([0, 0, -comprimentoDaCorreia * i]) colheresComCorreiasDentes(abre=true,fecha=false);
                }
         }
    //Correia Cortada 
    translate([0, -comprimentoDaCorreia*quantidadeDeColheres , (raio+espessuraDaCorreia)*2-espessuraDaCorreia])rotate([0,90,-90])correiaCortada(curvaPolia = false,retaPolia = true);
    
         translate([0, comprimentoDaCorreia-comprimentoDaCorreia1, 0])rotate([0,-90,-90])correiaCortada(curvaPolia = false,retaPolia = true);
     }
if(semColher){
    translate([larguraDaCorreia/2,comprimentoDaCorreia-comprimentoDaCorreia1,(raio+espessuraDaCorreia)*2-(espessuraDaCorreia/2)])rotate([0,180,0]){
    cylindric_bend([larguraDaCorreia,comprimentoDaCorreia1,  espessuraDaCorreia+espessuraDosDentes],raio+espessuraDaCorreia )
        
        translate([larguraDaCorreia / 2, 0, espessuraDaCorreia/2]) rotate([0,-90,90]){
                       correiaCortada(curvaPolia = true,retaPolia = false);
                    
        }    
    }
           translate([larguraDaCorreia/2,-quantidadeDeColheres*comprimentoDaCorreia,-espessuraDaCorreia/2]) rotate([0,0,180])
            cylindric_bend([larguraDaCorreia,comprimentoDaCorreia1,  espessuraDaCorreia+espessuraDosDentes],raio+espessuraDaCorreia )
                translate([larguraDaCorreia/2, 0, espessuraDaCorreia / 2]) rotate([0,-90,90]){
                                correiaCortada(curvaPolia = true,retaPolia = false);
                            
                }    
    rotate([-90,-90,0]){       
            for(i = [0: quantidadeDeColheres - 1]) {
                translate([0, 0, -comprimentoDaCorreia  * i]) correiaComDentes();
                
            }
    }
    
    
    translate([0,(comprimentoDaCorreia-comprimentoDaCorreia1)-comprimentoDaCorreia*quantidadeDeColheres,+(raio+espessuraDaCorreia)*2-espessuraDaCorreia])
    rotate([0,90,-90]){
                for(i = [ 0: quantidadeDeColheres - 1]) {
                   translate([0, 0, -comprimentoDaCorreia * i]) correiaComDentes();
                }
         }
    //Correia Cortada 
    translate([0, -comprimentoDaCorreia*quantidadeDeColheres , (raio+espessuraDaCorreia)*2-espessuraDaCorreia])rotate([0,90,-90])correiaCortada(curvaPolia = false,retaPolia = true);
    
         translate([0, comprimentoDaCorreia-comprimentoDaCorreia1, 0])rotate([0,-90,-90])correiaCortada(curvaPolia = false,retaPolia = true);
     }
     
}

module enrolada(){
    raio =  medidaFinalDoLoopFor / (PI * 2);
    
   cylindric_bend([larguraDaCorreia, medidaFinalDoLoopFor,  (espessuraDaCorreia+espessuraDosDentes)],raio,30)
    translate([larguraDaCorreia / 2, 0, espessuraDaCorreia / 2]) 
    rotate([ 0, -90, 90])
                for(i = [ 0: quantidadeDeColheres - 1]) {
                    translate([ 0, 0, -(comprimentoDaCorreia - arredondar + espacoEntreAsColheres) * i]) 
                    correiaComDentes();
                    }
}
//colheresComCorreiasDentes();
 //enrolada();
 //esticada(comColher = true,semColher=false);
 //esticada(comColher = false,semColher=true);
//translate([0,0,raio+espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(eixo=true);
//translate([0,-comprimentoDaCorreia * (quantidadeDeColheres- 2),raio + espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(rolamento =true);
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();