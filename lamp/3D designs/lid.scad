lid();

module lid(){
  box_depth = 18;
  pcb_max_h = 5;
  ceiling_depth = 1;
  wall = 2;
  lid_dimensions = 84;
  button_height = 3.5;
  finger_d=6;
  button_to_button=58;

  //remove from center
  //translate([-lid_dimensions/2,-lid_dimensions/2,0])
  union()
  {
    //remove from z-center
    translate([0,0,(box_depth-pcb_max_h)/2])
    {
      box(lid_dimensions, box_depth-pcb_max_h, wall, ceiling_depth);
      light_barrier(lid_dimensions, wall, box_depth-pcb_max_h, ceiling_depth);
    }
    
    nut_holder(ceiling_depth, 2.5);
       
    finger(finger_d, box_depth-button_height, button_to_button/2,1,1); 
    finger(finger_d, box_depth-button_height, button_to_button/2,1,-1); 
    finger(finger_d, box_depth-button_height, button_to_button/2,-1,1); 
    finger(finger_d, box_depth-button_height, button_to_button/2,-1,-1); 
  }
  
  module nut_holder(offset, height)
  {
    difference()
    {
      cylinder(d=12,h=height+offset,$fn=100);
      cylinder(d=6.5,h=height+offset+.01,$fn=6);
    }
  }
  
  module finger(d,h,offset,x,y)
  {
     translate([x * offset, y * offset, h / 2])
        cylinder(d = d, h = h, center = true);
  }
  
  module light_barrier(width, wall, height, ceiling_depth)
  {
    difference()
      {
        union() 
        {
          cube([wall, width, height], true);
          cube([width, wall, height], true);
          cylinder(d=14,h=height,center=true);
        }
        translate([0,0,ceiling_depth])
          cylinder(d=12,h=height,center=true);
      }
  }
  
  module box(width, height, wall, floor)
  {
    inner_width = width - 2 * wall;
    difference()
    {
      cube([width ,width, height], true);
      translate([0, 0, floor])
        cube([inner_width, inner_width, height - floor], true);
    }
  }
}