//$fn=60;

socket();

module socket()
{
  union()
  {
    translate([0,0,17]) ledstrips();
    translate([0,0,0]) base();
  }
}

module ledstrips()
{
  difference() 
  {
    cylinder(170, d=31, $fn=60);

    translate([0,15,170/2+.1])
      cube([11,5,171], center=true);
    translate([0,-15,170/2+.1])
      cube([11,5,170], center=true);
    translate([15,0,170/2+.1])
      cube([5,11,170], center=true);
    translate([-15,0,170/2+.1])
      cube([5,11,170], center=true);
    
    translate([0,0,-.05])
    cylinder(170+.1, d=20, $fn=60);
    
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


module base()
{
  union()
  {
    difference()
    {
      cylinder(d=37, 11, $fn=60);
      translate([0,0,-0.05])
        cylinder(d=33, 11+.1, $fn=8);
    }

    translate([0,0,11])
      difference()
      {
        cylinder(2,d=37, $fn=60);
        translate([0,0,-.05])
          cylinder(2+.1,d=28, $fn=60);
      }
     
    translate([0,0,13]) 
      difference()
      {       
        cylinder(3,d=31, $fn=60);
        translate([0,0,-.05])
        cylinder(3+.1,d=28, $fn=60);
      }
      
    translate([0,0,16])
      difference()
      {
        cylinder(1,d=31, $fn=60);
        translate([0,0,-.05])
        cylinder(1+.1,d=20, $fn=60);
      }
  }
}