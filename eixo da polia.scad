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
        cylinder(comprimentoDoEixoDeBaixo,raioDoEixoDaPoliaComRolamento,raioDoEixoDaPoliaComRolamento,$fn=100);
}
}
//eixoPolia(cima = true,baixo = false);