include<correia com dentes e colher.scad>
include<bend.scad>
include<polia.scad>

module esticada(comColher,semColher,semCorreia){
    if(semCorreia){
    
        
    rotate([-90,-90,0]){       
            for(i = [0: quantidadeDeColheres-1]) {
                translate([espessuraDaCorreia/2, 0, -comprimentoDaCorreia  * i]) colheresComCorreiasDentes(abre=false,fecha=false,abreSemCorreia=false,fechaSemCorreia=true);          
            }
    }
    translate([0,(comprimentoDaCorreia-comprimentoDaCorreia1)-comprimentoDaCorreia*quantidadeDeColheres,-espessuraDaCorreia/2+(raio+espessuraDaCorreia)*2-espessuraDaCorreia])
    rotate([0,90,-90]){
                for(i = [ 0:quantidadeDeColheres-1]) {
                   translate([0, 0, -comprimentoDaCorreia * i]) colheresComCorreiasDentes(abre=false,fecha=false,abreSemCorreia=true,fechaSemCorreia=false);
                }
         }
     }
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
            for(i = [0: quantidadeDeColheres-1]) {
                translate([espessuraDaCorreia/2, 0, -comprimentoDaCorreia  * i]) colheresComCorreiasDentes(abre=false,fecha=true,abreSemCorreia=false,fechaSemCorreia=false);          
            }
    }
    translate([0,(comprimentoDaCorreia-comprimentoDaCorreia1)-comprimentoDaCorreia*quantidadeDeColheres,-espessuraDaCorreia/2+(raio+espessuraDaCorreia)*2-espessuraDaCorreia])
    rotate([0,90,-90]){
                for(i = [ 0:quantidadeDeColheres-1]) {
                   translate([0, 0, -comprimentoDaCorreia * i]) colheresComCorreiasDentes(abre=true,fecha=false,abreSemCorreia=false,fechaSemCorreia=false);
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
    
   cylindric_bend([larguraDaCorreia, medidaFinalDoLoopFor,  (espessuraDaCorreia+espessuraDosDentes)],raio,resolucao)
    translate([larguraDaCorreia / 2, 0, espessuraDaCorreia/2]) 
    rotate([ 0, -90, 90])
                for(i = [ 0: quantidadeDeColheres - 1]) {
                    translate([ 0, 0, -(comprimentoDaCorreia - arredondar + espacoEntreAsColheres) * i]) 
                    correiaComDentes();
                    }
}
//colheresComCorreiasDentes();
//enrolada();
esticada(comColher = false,semColher=false,semCorreia=true);
//esticada(comColher = true,semColher=false,semCorreia=false);
//esticada(comColher = false,semColher=true,semCorreia=false);
//translate([0,0,raio+espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(eixo=true);
//translate([0,-comprimentoDaCorreia * (quantidadeDeColheres- 2),raio + espessuraDosDentes])rotate([10,0,0])translate([0,0,-raio])polia(rolamento =true);
//translate([0,0,medidaFinalDoLoopFor/(PI*2)*2]) enrolada();