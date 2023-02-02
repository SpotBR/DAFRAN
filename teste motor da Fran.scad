include <teste polia.scad>
//difference(){
%import("projeto_corrigido_large_print_size.stl");
//rotate([ 0, 0, 45])
//translate([larguraDaCorreia*0.6,-176,51+comprimentoDaCorreia * 6])
//rotate([ 0, 90, 0])encaixeRolamento(cima = false,baixo = false, recorteDoRecipiente = true);
//
//rotate([ 0, 0, 45])translate([ -comprimentoDoEixoDeBaixo/2, -176, 51])
//rotate([ 0, 90, 0])eixoPolia(cima = false,baixo = true);


rotate([ 0, 0, 45])translate([ 0, -176, 51])rotate([ -90, 0, 0])esticada();
////rotate([ 0, 0, 45])translate([ -larguraDaCorreia/2, -182, 160])polia(eixo = true,rolamento=false);
////rotate([ 0, 0, 45])tra nslate([ -larguraDaCorreia/2, -178, 90])polia(eixo = false,rolamento=true);
//rotate([ 0, 0, 45])translate([ 0, -140, 312])sphere(17,$fn=50);
//rotate([ 0, 0, 45])translate([ 0, -140, 275])sphere(17,$fn=50);
//rotate([ 0, 0, 45])translate([ 0, -140, 227])sphere(17,$fn=50);
