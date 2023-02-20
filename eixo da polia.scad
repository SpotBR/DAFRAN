comprimentoDoEixoDeCima  = 90;
comprimentoDoEixoDeBaixo = 70;
raioDoEixoDaPolia = 5.8/2;
raioDoEixoDaPoliaComRolamento = 5.8/2;
espessuraDoEncaixeRolamento = 1/2;
profundidadeParaRolamento = 5.1+espessuraDoEncaixeRolamento;
raioDoRolamento = (15.1/2)+espessuraDoEncaixeRolamento;

module eixoPolia(cima,baixo){
    color("gold"){
    if(cima)
        cylinder(comprimentoDoEixoDeCima,raioDoEixoDaPolia,raioDoEixoDaPolia,$fn=100);
    if(baixo)
        intersection(){
        cylinder(comprimentoDoEixoDeBaixo,raioDoEixoDaPoliaComRolamento,raioDoEixoDaPoliaComRolamento,$fn=100);
            
    rotate([ 0, 0, 90])translate([ -5, 22, 35])resize([72,0,0])sphere(37,$fn=100);
}
}
}
//eixoPolia(cima = false,baixo = true);