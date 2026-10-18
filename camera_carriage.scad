// AymanBuilds Modular Filming Station — camera carriage
// Print with the plate flat on the bed and the insert boss facing UP.
// Tune insert_hole_d to the exact 1/4-20 heat-set insert manufacturer's pilot-hole spec.
$fn = 72;

plate_x = 120;
plate_y = 50;
plate_t = 10;

rail_hole_d = 5.5;          // M5 clearance
rail_hole_spacing = 84;     // holes at +/-42 mm along the rail
button_head_cbore_d = 9.5;  // for M5 button-head screws
button_head_cbore_depth = 3.2;

boss_d = 24;
boss_h = 8;
insert_hole_d = 9.2;        // verify against chosen 1/4-20 heat-set insert
insert_hole_depth = 8.5;

module carriage() {
  difference() {
    union() {
      // Flat mounting plate
      cube([plate_x, plate_y, plate_t], center=true);
      // Boss is on the printed upper face; flip the part during assembly so it faces down.
      translate([0,0,plate_t/2])
        cylinder(d=boss_d, h=boss_h);
    }

    // M5 holes for T-slot nuts in the boom extrusion
    for (x = [-rail_hole_spacing/2, rail_hole_spacing/2]) {
      translate([x,0,-plate_t/2-0.1])
        cylinder(d=rail_hole_d, h=plate_t+0.2);
      // Recess M5 button-head screw heads flush with the phone-holder mounting face
      translate([x,0,plate_t/2-button_head_cbore_depth])
        cylinder(d=button_head_cbore_d, h=button_head_cbore_depth+0.2);
    }

    // 1/4-20 heat-set insert pocket. Opens from the boss top when printed.
    translate([0,0,plate_t/2+boss_h-insert_hole_depth])
      cylinder(d=insert_hole_d, h=insert_hole_depth+0.2);
    // Small lead-in chamfer for easier insert placement
    translate([0,0,plate_t/2+boss_h-1.0])
      cylinder(d1=insert_hole_d+0.8, d2=insert_hole_d, h=1.1);
  }
}

carriage();
