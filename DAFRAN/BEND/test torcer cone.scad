include<bend.scad>
raioDaBoca =  1;
alturaDoCone = 1;

g = atan(alturaDoCone/raioDaBoca);

   cylindric_bend([ raioDaBoca*2, 2*PI*raioDaBoca, alturaDoCone * 2],raioDaBoca , 190)
    translate([-1,  -1, -alturaDoCone]) 
    rotate([ 0, 0, 0])
                    translate([raioDaBoca, 0,0 ]) 
                    #cylinder(alturaDoCone,0,raioDaBoca,$fn = 100);