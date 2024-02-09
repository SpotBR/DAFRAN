module cylinder_bend(medidasDaGeomedtria, raio, numeroDeFaces) {
  passoAngulo = numeroDeFaces == 0 ? $fa : atan(medidasDaGeomedtria.y/(raio * numeroDeFaces));
  faces = ceil(numeroDeFaces == 0 ? medidasDaGeomedtria.y/ (tan(passoAngulo) * raio) : numeroDeFaces);
  larguraDoPasso = medidasDaGeomedtria.y / faces;
  {
intersection() {
      children();
      cube([medidasDaGeomedtria.x, larguraDoPasso / 2, medidasDaGeomedtria.z]);
    }  
    
    for (step = [ 1:numeroDeFaces + 1]) {
      translate([0, raio * (1-sin(step * passoAngulo)), raio * (1 - cos(step * passoAngulo))])
        rotate( passoAngulo * step, [1, 0, 0])
          translate([0, -step * larguraDoPasso, 0])
            intersection() {
              children();
              translate([0, (step - 0.5) * larguraDoPasso, 0])
                cube([medidasDaGeomedtria.x, larguraDoPasso, medidasDaGeomedtria.z]);
            }
    }
  }
}