/*
color([.6,.6,.65])
  screw(3,5.5,22.9,3);
translate([0,0,22.9+4.45-2.5])
  magnet(5);
*/

screw_with_magnet();

color([.6,.6,.65])
  nut(6.3,2.4,3);

#translate([0,0,19.9])
cylinder(d=4,h=9,$fn=30);

module screw_with_magnet()
{
  union()
  {
    screw(3,5.5,22.9,3);
    translate([0,0,22.9+4.45-2.5+.2])
      magnet(5);
    translate([0,0,22.9+4.45-2.5+2.2])
    nut(6.3,2.4,3);
  }
}

module magnet(d) 
{
  sphere(d=d,$fn=60);
}

module screw(d_screw, d_head, h_tot, h_head)
{  
  rounding = .5;
  translate([0,0,h_tot])
    rotate([180,0,0])
      difference()
      {
        union()
        {
          translate([0,0,rounding/2])
            minkowski()
            {
              sphere(d=rounding, $fn=60);
              cylinder(d=d_head-rounding,h=h_head-rounding,$fn=60);
            }
          cylinder(d=d_screw,h=h_tot,$fn=60);
        }
        cylinder(d=3,h=2,$fn=6);
        sphere(d=3.3,$fn=6);
      }
}

module nut(d,h,d_screw)
{
  rounding = .5;
  difference()
  {
    translate([0,0,rounding/2])
      minkowski()
      {
        sphere(d=rounding, $fn=15);
        cylinder(d=d-1,h=h-1,$fn=6);
      }
    cylinder(d=d_screw,h=h,$fn=60);
  }
}