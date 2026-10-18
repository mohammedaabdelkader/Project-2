// AymanBuilds Modular Filming Station — 2020 extrusion accessory/light mount
// Print flat with the insert boss facing UP. Use a metal 1/4-20 stud or compact arm.
$fn = 72;

plate_x = 80;
plate_y = 32;
plate_t = 8;
rail_hole_d = 5.5;
rail_hole_spacing = 50;
button_head_cbore_d = 9.5;
button_head_cbore_depth = 3.0;
boss_d = 20;
boss_h = 8;
insert_hole_d = 9.2;        // verify against chosen 1/4-20 heat-set insert
insert_hole_depth = 8.5;

difference() {
  union() {
    cube([plate_x, plate_y, plate_t], center=true);
    translate([0,0,plate_t/2]) cylinder(d=boss_d, h=boss_h);
  }
  for (x = [-rail_hole_spacing/2, rail_hole_spacing/2]) {
    translate([x,0,-plate_t/2-0.1]) cylinder(d=rail_hole_d, h=plate_t+0.2);
    translate([x,0,plate_t/2-button_head_cbore_depth])
      cylinder(d=button_head_cbore_d, h=button_head_cbore_depth+0.2);
  }
  translate([0,0,plate_t/2+boss_h-insert_hole_depth])
    cylinder(d=insert_hole_d, h=insert_hole_depth+0.2);
  translate([0,0,plate_t/2+boss_h-1.0])
    cylinder(d1=insert_hole_d+0.8, d2=insert_hole_d, h=1.1);
}
