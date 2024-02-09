     //include<recipiente.scad>
include <bend.scad>

larguraTopoDoCone = 30;
larguraSaidaDoCone = 30;
alturaCone = 50;
qualidadeComprimento = 30;
grauSaidaCone = 90;
larguraCorredor = 1;



module cone(height = 90, firstCylRay = 20, isInverted = false, circleOnCenter = false, endTubeRadius = 10, plusPosition = 25, fn = 30, circunferenceMultiplier = 1, bendRay = 10, percentageOfStep = 1, lastOnly = false, customChildren = false) {

    invertedRay = isInverted ? firstCylRay : firstCylRay - firstCylRay * 2;
    //    circleOnCenter = false;
    raio = bendRay;

    difference() {
        cylindric_bend([firstCylRay * 2, height, firstCylRay * 2 + plusPosition], raio, 1000, percentageOfSteps = percentageOfStep, lastOnly = lastOnly)
        rotate([-90, isInverted ? 180 : 0, 180]) translate([isInverted ? firstCylRay : -firstCylRay, invertedRay, 0])
        //        difference(){
        hull() {

            if (customChildren == false) {
                cylinder(h = 0.0001, r = firstCylRay, $fn = fn);
            } else {
                children();
            }
            translate([0, circleOnCenter ? 0 : -(firstCylRay - endTubeRadius) - plusPosition, -height]) rotate([0, 0, 0]) cylinder(h = 0.0001, r = endTubeRadius, $fn = fn);
        }
     }



}



neededCircunference = larguraSaidaDoCone * (PI / 180 * (400));
echo(neededCircunference);
difference(){
    rotate([-grauSaidaCone, 0, 0]) translate([larguraSaidaDoCone / 2, larguraSaidaDoCone, 0]) rotate([-90, 0, 180]) cone(height = neededCircunference, firstCylRay = larguraSaidaDoCone / 2, circleOnCenter = false, endTubeRadius = larguraCorredor / 2, plusPosition = 100, fn = qualidadeComprimento, isInverted = false, circunferenceMultiplier = 3, bendRay = larguraSaidaDoCone + 20.0, percentageOfStep = 0.255, lastOnly = false);
    translate([-20,-30,8]) cube([50,50,50]);
}