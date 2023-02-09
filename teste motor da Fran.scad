include <teste polia.scad>
%import("projeto_corrigido_large_print_size.stl");
 //difference(){
//union(){
//import("projeto_corrigido_large_print_size.stl");
  //  rotate([ 0, 0, 45])
//translate([larguraDaCorreia*0.7,-168,50+comprimentoDaCorreia * 6])
//rotate([ 90, 12, 90])resize([0,18,30])cylinder(18,18,18);
//}

 //}
 difference(){
     rotate([ 0, 0, 45])translate([ 0, -176, 51+comprimentoDaCorreia * 5])
rotate([ -90, 0, 0])
translate([larguraDaCorreia*1.15,-comprimentoDaCorreia * quantidadeDeColheres,raio+espessuraDaCorreia/2])rotate([ 0, 90, 0])encaixeRolamento(cima = false,baixo = false, recorteDoRecipiente = true);
     
 rotate([ 0, 0, 45])translate([ 0, -176, 51+comprimentoDaCorreia * 5])
rotate([ -90, 0, 0])
translate([larguraDaCorreia*1.14,-comprimentoDaCorreia * quantidadeDeColheres,raio+espessuraDaCorreia/2])rotate([ 0, 90, 0])cylinder(profundidadeParaRolamento*3,raioDoRolamento,raioDoRolamento,$fn=100);
 }
  


//rotate([ 0, 0, 45])translate([ 0, -176, 51])rotate([ -90, 0, 0])
//translate([-larguraDaCorreia/2,0,espessuraDaCorreia/2+raio])
//translate([( larguraDaCorreia / 2) - (comprimentoDoEixoDeBaixo / 2),0,0])
//rotate([ 0, 90, 0])eixoPolia(cima = false,baixo = true); 
//}

//rotate([ 0, 0, 45])translate([ 0, -176, 51+comprimentoDaCorreia * 5])rotate([ -90, 0, 0])esticada();

rotate([ 0, 0, 45])translate([ 0, -176, 51+comprimentoDaCorreia * 5])
rotate([ -90, 0, 0])
translate([-larguraDaCorreia/2,-comprimentoDaCorreia * quantidadeDeColheres,raio+espessuraDaCorreia/2])polia(eixo = true,rolamento=false);
//rotate([ 0, 0, 45])translate([ -larguraDaCorreia/2, -178, 90])polia(eixo = false,rolamento=true);
//rotate([ 0, 0, 45])translate([ 0, -140, 312])sphere(17,$fn=50);
//rotate([ 0, 0, 45])translate([ 0, -140, 275])sphere(17,$fn=50);
//rotate([ 0, 0, 45])translate([ 0, -140, 227])sphere(17,$fn=50);
