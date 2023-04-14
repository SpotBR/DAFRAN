raio = 3;
raioDeBaixo = 1;
altura = 5;
numeroDeFaces = 25;

module cone(raio,raioDeBaixo,altura,numeroDeFaces){
    hull(){
    translate([-raio,0, altura])cylinder(0.00001,raio,raio,$fn=numeroDeFaces);
    
    translate([-raioDeBaixo,0, 0])cylinder(0.00001,raioDeBaixo,raioDeBaixo,$fn=numeroDeFaces);
}
}
cone(raio,raioDeBaixo,altura,numeroDeFaces);