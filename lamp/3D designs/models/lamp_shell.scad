lamp_shell(5);

module lamp_shell(height)
{
  // Represents the glass wall of the Ikea lamp.
  // This needs to be cut out of the lid object
  linear_extrude(height)  
    difference()
    {
      outer_r = 5;
      outer_size = 120;
      inner_r = 5;
      inner_size = 91.5;
      minkowski()
      {
        square(outer_size-outer_r*2, center=true);
        circle(r=outer_r,$fn=60);
      }
      minkowski()
      {
        square(inner_size-inner_r*2, center=true);
        circle(r=inner_r,$fn=60);
      }
    }
}