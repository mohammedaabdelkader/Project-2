// AymanBuilds Modular Filming Station — screw-on cable clip for 2020 extrusion
// The cable runs parallel to the extrusion. Print in PETG for a little flex.
$fn = 80;

clip_thickness = 6;    // along cable/extrusion direction
outer_r = 10;
inner_r = 7.2;         // suitable for approx. 8 mm cable; adjust if needed
entry_gap = 5.5;
base_x = 30;
base_z = 32;
base_t = 4;
screw_d = 5.5;         // M5 clearance

module clip_ring() {
  difference() {
    translate([0,-outer_r,0])
      rotate([0,90,0]) cylinder(r=outer_r, h=clip_thickness, center=true);
    translate([0,-outer_r,0])
      rotate([0,90,0]) cylinder(r=inner_r, h=clip_thickness+1, center=true);
    // Open the C-ring on the outward-facing side (negative Y)
    translate([-clip_thickness/2-1, -2*outer_r-1, -entry_gap/2])
      cube([clip_thickness+2, outer_r+1, entry_gap]);
  }
}

difference() {
  union() {
    // Flat backplate rests against the side face of the extrusion (Y=0)
    translate([-base_x/2,-base_t, -10]) cube([base_x,base_t,base_z]);
    clip_ring();
  }
  // M5 screw enters from the outside through the backplate into a side-slot T-nut
  translate([0,-base_t/2,12]) rotate([90,0,0])
    cylinder(d=screw_d, h=base_t+1, center=true);
}
