include <eixo da polia.scad>
include <rolamento.scad>
module encaixeRolamento(baixo,cima,recorteDoRecipiente){
    
        if(cima){
            translate([0,0,(r - esfera)-espessuraDoAnel])
            rotate([90,0,0])rolamento();
            color("green"){
    difference(){
        cylinder( profundidadeParaRolamento+espessuraDoEncaixeRolamento,raioDoRolamento,raioDoRolamento,$fn=100);
    
        translate([0,0,-espessuraDoEncaixeRolamento])cylinder( profundidadeParaRolamento,raioDoRolamento-espessuraDoEncaixeRolamento,raioDoRolamento-espessuraDoEncaixeRolamento,$fn=100);
        
    translate([0,0,profundidadeParaRolamento/2])cylinder(profundidadeParaRolamento,(raioDoRolamento-espessuraDoEncaixeRolamento)-1.9,(raioDoRolamento-espessuraDoEncaixeRolamento)-1.9,$fn=100);
    }
}
}
    if(baixo){
    difference(){
        cylinder( profundidadeParaRolamento,raioDoRolamento,raioDoRolamento,$fn=100);
    
        translate([0,0,-espessuraDoEncaixeRolamento])cylinder( profundidadeParaRolamento,raioDoRolamento-espessuraDoEncaixeRolamento,raioDoRolamento-espessuraDoEncaixeRolamento,$fn=100);
        
    translate([0,0,profundidadeParaRolamento/2])cylinder(profundidadeParaRolamento,raioDoEixoDaPoliaComRolamento,raioDoEixoDaPoliaComRolamento,$fn=100);
    }
}
    if(recorteDoRecipiente)
        cylinder( profundidadeParaRolamento *4,raioDoRolamento,raioDoRolamento,$fn=100);
        
}
//encaixeRolamento(cima = false,baixo = false, recorteDoRecipiente = true);
//encaixeRolamento(cima = false,baixo = true,recorteDoRecipiente =false);
//translate([0,0,0])encaixeRolamento(cima = true,baixo = false,recorteDoRecipiente =false);