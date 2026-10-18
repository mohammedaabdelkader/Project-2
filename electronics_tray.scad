// AymanBuilds Modular Filming Station — desktop electronics parts tray
// Open-top tray for jumper wires, screws, modules, and small tools.
$fn = 48;

outer_x = 140;
outer_y = 100;
outer_z = 28;
wall = 3;
bottom = 3;
divider_t = 2.4;
divider_h = 16;

 difference() {
  cube([outer_x,outer_y,outer_z]);
  translate([wall,wall,bottom])
    cube([outer_x-2*wall, outer_y-2*wall, outer_z-bottom+0.2]);
 }
// Two dividers, creating three loose-parts compartments
translate([outer_x/3-divider_t/2, wall, bottom])
  cube([divider_t, outer_y-2*wall, divider_h]);
translate([2*outer_x/3-divider_t/2, wall, bottom])
  cube([divider_t, outer_y-2*wall, divider_h]);
