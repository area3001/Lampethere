use <rim.scad>;
use <lid.scad>;
use <models\lamp_shell.scad>;
use <socket_adapter.scad>;
use <models\screw.scad>;

*color([.6,.6,.7])
  translate([0,0,198-9.8])
    screw_with_magnet();


translate([0,0,198])
{
  color([1,1,.8,1])
    rim();
  color([.5,.5,.4,.5])
  
  color([.5,.5,.5,1])
    logo();
}

//intersection()
  {  
    %translate([0,0,198])
      translate([0,0,20])
        rotate([180,0,0])
          lid();
    
  //  translate([0,0,198-9.8])
    //screw_with_magnet();
  }

color([1,1,1,1])
  translate([0,0,10])
    socket();

color([.9,.9,1,.5])   
  lamp_shell(200); 



