//$fn=60;

module socket_split(){
split_height = 180/2;

  translate([0,0,-10]) 
  union() {
    difference(){
      socket();
      translate([0,0,split_height]) cylinder(180, d=50, $fn=60);
    }

    translate([9.5,9.5,split_height]) 
    cylinder(2, d=2, $fn=60);

    translate([-9.5,9.5,split_height]) 
    cylinder(2, d=2, $fn=60);

    translate([9.5,-9.5,split_height]) 
    cylinder(2, d=2, $fn=60);

    translate([-9.5,-9.5,split_height]) 
    cylinder(2, d=2, $fn=60);
  }

  difference(){
    socket();
    cylinder(split_height, d=50, $fn=60);

    translate([9.5,9.5,split_height]) 
    cylinder(1.6, d=2.1, $fn=60);

    translate([-9.5,9.5,split_height]) 
    cylinder(1.6, d=2.1, $fn=60);

    translate([9.5,-9.5,split_height]) 
    cylinder(1.6, d=2.1, $fn=60);
    
    translate([-9.5,-9.5,split_height]) 
    cylinder(1.6, d=2.1, $fn=60);
  }
}


// socket_split();
socket();



module connector()
{
  difference(){
    cylinder(1, d=23, $fn=60);
    cube([5.35,13,2], center=true);
    translate([7,0,-1])cylinder(3, d=5, $fn=60);
    translate([-7,0,-1])cylinder(3, d=5, $fn=60);
    }
}

module socket()
{
  union()
  {
     ledstrips();
    translate([0,0,10])connector();
  }
}

module ledstrips()
{
  difference() 
  {
    cylinder(180, d=31, $fn=60);
     
      // holes top and bottom
    translate([15,0,170])
     cylinder(20, d=15, $fn=60);
      
    translate([-15,0,170])
     cylinder(20, d=15, $fn=60);
      
    translate([0,15,170])
     cylinder(20, d=15, $fn=60);
      
      translate([0,-15,170])
     cylinder(20, d=15, $fn=60);
      
    translate([0,0,170])
     cylinder(4, d=23, $fn=60);
      
    // Nut holder
      union(){
      translate([0,0,180-1.5-3])
    cylinder(d=7,h=3,$fn=6);
      translate([0,-6/2,180-1.5-3])
    cube([30,6,3]);
      }
      translate([0,0,170])
    cylinder(d=3.5,h=20,$fn=60);
    


     // LED grooves
    translate([0,15,175/2-1])
      cube([11,5,175], center=true);
    translate([0,-15,175/2-1])
      cube([11,5,175], center=true);
    translate([15,0,175/2-1])
      cube([5,11,175], center=true);
    translate([-15,0,175/2-1])
      cube([5,11,175], center=true);
    
     // subtract center cylinder
    translate([0,0,-.05])
    cylinder(170+.1, d=23, $fn=60);
    
    translate([-12.4,12.4,5])
    rotate([90,0,45])
      cylinder(35, d=5, $fn=60);
    
    translate([-12.4,-12.4,5])
    rotate([90,0,45+90])
      cylinder(35, d=5, $fn=60);
    
    translate([-12.4,12.4,165])
    rotate([90,0,45])
      cylinder(35, d=5, $fn=60);   
      
    translate([-12.4,-12.4,165])
    rotate([90,0,45+90])
      cylinder(35, d=5, $fn=60);       
     
    /*translate([9,9,165])
    rotate([0,0,45])
    {
      cylinder(3,d=6.5,$fn=6); 
      translate([3.25,0,1.5])
        cube([5.5,5.5,3], center=true);
      translate([0,0,-15])
      cylinder(20,d=3.5);
    }
    
    rotate([0,0,180])
    translate([9,9,165])
    rotate([0,0,45])
    {
      cylinder(3,d=6.5,$fn=6); 
      translate([3.25,0,1.5])
        cube([5.5,5.5,3], center=true);
      translate([0,0,-15])
      cylinder(20,d=3.5);
    }
    */
  }
  
  
}