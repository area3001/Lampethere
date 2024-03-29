use <models/lamp_shell.scad>;
use <models/screw_bottom_part.scad>;


rim();

module rim(){
  inside_size = 81.5;
  top_thickness = 2;
  bottom_thickness = 2;
  height = 20;
  
  union()
  {
    difference()
    {
      difference()
      {
        cover_outer_shell(height);
        translate([0,0,-top_thickness])
          lamp_shell(height);      
      }
      
      inside_space(height,inside_size, bottom_thickness);
      
      hull()
      {
        translate([7,0,0])
          cylinder(10,d=20);
        translate([-7,0,0])
          cylinder(10,d=20);
      }
      
      translate([0,(-85+4)/2+28.5-2,0])
        cube([20,4,bottom_thickness*2+1], center=true);
      
      translate([(85+4)/2-32.5+9,0,0])
        cube([4,10,bottom_thickness*2+1], center=true);
            
    }
    rotate([0,0,90])
      screw_bottom();
    translate([69/2,69/2,3])
      cylinder(d=2.8, 2+3, center=true, $fn=60);
    translate([69/2,-69/2,3])
      cylinder(d=2.8, 2+3, center=true, $fn=60);
    translate([-69/2,69/2,3])
      cylinder(d=2.8, 2+3, center=true, $fn=60);
    translate([-69/2,-69/2,3])
      cylinder(d=2.8, 2+3, center=true, $fn=60);
  }
}


module inside_space(height,inside_size, bottom_thickness)
{
  //actual free space is height-bottom_tickness
  translate([0,0,(height/2)+bottom_thickness])
      cube([inside_size,inside_size,height],center=true);
}

module cover_outer_shell(height)
{
  size = 100+1.5;
  r = 2.5;
  d = r*2;
  translate([r-size/2,r-size/2,r])
    minkowski()
    {
      cube([size-d,size-d, height-d]);
      sphere(r=r,$fn=60);
    }  
}

