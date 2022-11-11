use <models\lamp_shell.scad>;
use <models\screw_bottom_part.scad>;


rim();

module rim(){
  inside_size = [85,85];
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
      
      inside_space(height, bottom_thickness);
      
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
      
      logo();
      
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

module logo()
{
  translate([-46,-51.5,5])
      rotate([90,0,0])
        linear_extrude(1)
          text("LAMPETHERE");
}

module inside_space(height, bottom_thickness)
{
  //actual free space is height-bottom_tickness
  translate([0,0,(height/2)+bottom_thickness])
      cube([85,85,height],center=true);
}

module cover_outer_shell(height)
{
  size = 100 + 4;
  r = 2.5;
  d = r*2;
  translate([r-size/2,r-size/2,r])
    minkowski()
    {
      cube([size-d,size-d, height-d]);
      sphere(r=r,$fn=60);
    }  
}

