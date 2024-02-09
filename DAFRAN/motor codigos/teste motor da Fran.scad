//Painel
//Peças Montadas
recipiente = false;
recipienteFurado = false;
eixoDeCimaComPolia = false;
poliaDeBaixoComEixo = false;
correiaEsticadaSemColheres = false;
correiaEsticadaComColheres =  false;

//Peças Desmontadas
colher = false;
poliaDeCima = false; 
poliaDeBaixo = false;
correiaEnrolada = false;  
encaixeDoRolamentoSolto = false;
eixoDeBaixo = false;
eixoDeCima = false;
eixoDaColher = false;
poliaDeBaixoSemEixo = false;
poliaDeCimaSemEixo = false;

//Recortes
recorteDoFuroDeBaixo = false;
recorteDoFuroDeCima = false;
colherRecortada = false;
recorteDoBuracoDaCorreia = false;

//Montagens
include <teste polia.scad>
if(recipiente){
%import("projeto_corrigido_large_print_size.stl");
}
//FURO DE CIMA
    module recipienteFurado(){
 difference(){
import("projeto_corrigido_large_print_size.stl");
rotate([ 0, 0, 45])translate([ 0, -176, 28 + comprimentoDaCorreia*6])
rotate([ -90, 0, 0])
translate([larguraDaCorreia*1.15,-comprimentoDaCorreia ,raio+espessuraDaCorreia/2])rotate([ 0, 90, 0])encaixeRolamento(cima = false,baixo = false, recorteDoRecipiente = true);
     
     rotate([ 0, 0, 45])translate([ 0, -176, (28 + comprimentoDaCorreia)-(comprimentoDaCorreia-comprimentoDaCorreia1)])rotate([ -90, 0, 0])
translate([-(larguraDaCorreia/2)+( larguraDaCorreia / 2) - (comprimentoDoEixoDeBaixo / 2),0,espessuraDaCorreia / 2 + raio])
rotate([ 0, 90, 0])eixoPolia(cima = false,baixo = true);
 }
 difference(){
     rotate([ 0, 0, 45])translate([ 0, -176, 28 + comprimentoDaCorreia*6])
rotate([ -90, 0, 0])
translate([larguraDaCorreia*1.15,-comprimentoDaCorreia,raio+espessuraDaCorreia/2])rotate([ 0, 90, 0])encaixeRolamento(cima = false,baixo = false, recorteDoRecipiente = true);
     
 rotate([ 0, 0, 45])translate([ 0, -176, 28 + comprimentoDaCorreia*6])
rotate([ -90, 0, 0])
translate([larguraDaCorreia*1.14,-comprimentoDaCorreia,raio+espessuraDaCorreia/2])rotate([ 0, 90, 0])cylinder(profundidadeParaRolamento*3,raioDoRolamento,raioDoRolamento,$fn=100);
 }
 

}
if(recipienteFurado){
recipienteFurado();
}
if(correiaEsticadaSemColheres){
rotate([ 0, 0, 45])translate([ 0, -176, 28 + comprimentoDaCorreia])rotate([ -90, 0, 0])esticada(comColher = false,semColher=true);
}
if(correiaEsticadaComColheres){
rotate([ 0, 0, 45])translate([ 0, -176, 28 + comprimentoDaCorreia])rotate([ -90, 0, 0])esticada(comColher = true,semColher=false);
}
if(eixoDeCimaComPolia){
rotate([ 0, 0, 45])translate([ 0, -176, 28+comprimentoDaCorreia * 6])
rotate([ -90, 0, 0])
translate([-larguraDaCorreia/2,-comprimentoDaCorreia * quantidadeDeColheres,raio+espessuraDaCorreia/2])polia(eixo = true,rolamento=false);
}
if(poliaDeBaixoComEixo){
rotate([ 0, 0, 45])translate([ 0, -176, (28 + comprimentoDaCorreia)-(comprimentoDaCorreia-comprimentoDaCorreia1)])rotate([ -90, 0, 0])
translate([ -larguraDaCorreia/2,0,espessuraDaCorreia / 2 + raio])
polia(eixo = false,rolamento=true);
}
if(colher){
    color([0.05, 0.43, 0.84])
    translate([-100,0,0])scale([(1 / 100) * escala, (1 / 100) * escala, (1 / 100) * escala])colher(comFuro=true,semFuro=false);
}
if(poliaDeCima){
    translate([-200,0,0])polia(eixo = true,rolamento=false);
}
if(poliaDeBaixo){
translate([-200,-50,0])polia(eixo = false,rolamento=true);
}
if(correiaEnrolada){
    translate([-200,50,0])enrolada();
}
if(encaixeDoRolamentoSolto){
    translate([-100,-50,0])rotate([0,90,0])encaixeRolamento(cima = true,baixo = false,recorteDoRecipiente=false);
}
if(eixoDeBaixo){
translate([-10,80,0])rotate([90,0,0])eixoPolia(cima = false,baixo = true);
}
if(eixoDeCima){
translate([-20,100,0])rotate([90,0,0])eixoPolia(cima = true,baixo = false);
}
if(eixoDaColher){
    translate([-raaio,-larguraDoEixo, 0]) 
            rotate([90, 0, 0])cylinder(larguraDoEixo * 2, raaio / 5, raaio / 5, $fn = quaalidaade);
}
if(poliaDeBaixoSemEixo){
    translate([-50,50,0])poliaSolta(baixo = true,cima = false);
}
if(poliaDeCimaSemEixo){
    translate([-50,25,0])poliaSolta(baixo = false,cima = true);
}
if(recorteDoFuroDeCima){
    translate([0,0,-323])
    difference(){
    recipienteFurado();
    translate([0,0,68])cube(511,true);
    }
}

    module cub(){
    difference(){
    recipienteFurado();
    translate([0,0,328])cube(511,true);
        translate([0,0,150/2])rotate([0,0,45])cube(200,true);
    }
}
if(recorteDoFuroDeBaixo){
     cub();
}
if(colherRecortada){
    color([0.05, 0.43, 0.84])
    difference(){
    colher();
    translate([28,0,0])cube(40,true);
    }
}
if(recorteDoBuracoDaCorreia){
    difference(){
    correiaComDentes();
    translate([0,0,-(larguraDaCorreia*1.05)])cube(larguraDaCorreia*1.1,true);
    }
}