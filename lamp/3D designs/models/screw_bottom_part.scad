screw_bottom();

module screw_bottom()
{
  height = 10;
  width = 20;
  screw = 4;


  difference()
  {    
    union()
    {
      translate([0,2,0])
        rotate([90,0,0])
          linear_extrude(screw)
          {
            difference()
            {
              translate([0,height/2,0])
                square([width, height], center=true);
              translate([width/2,height,0])
                circle(r=(width-screw)/2, $fn=60);
              translate([-(width/2),height,0])
                circle(r=(width-screw)/2, $fn=60);
            }
          }
    translate([0,0,height/2])
      cylinder(d=5.5, height, $fn=60, center=true);
    }
    translate([0,0,height/2])
      cylinder(d=3.1, height+1, $fn=60, center=true);
    
    translate([0,0,2+height-1])
      cylinder(d=6, 4, $fn=60, center=true);
  }
}