//Stallman 3D printer
// Y belt holder
// Used to attach endstops to 8mm rods
// GNU GPL v3

//Derived from:
// PRUSA iteration 3 Y belt holder GNU GPL v3 Josef Průša <iam@josefprusa.cz> and contributors http://www.reprap.org/wiki/Prusa_Mendel http://prusamendel.org


module belt_holder_base(){
 translate([-33-8.5,0,-1]) cube([33,15,16]); 
 translate([-33-8.5,11,-1]) cube([33,15,16]);
 translate([-51,22,-1]) cube([52,4,16]);	
}

module belt_holder_beltcut(){
 position_tweak=-0.2;
 // Belt slit
 translate([-66,-0.5+10,3]) cube([67,1,15]);
 // Smooth insert cutout
 translate([-66,-0.5+10,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
 for ( i = [0 : 23] ){
  translate([0-i*3+position_tweak,-0.5+8,3]) cube([1.7,3,15]);
 }
 // Middle opening
 translate([-2-25,-1,3]) cube([4,11,15]);	
}

module belt_holder_holes(){
 translate([-2.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
 translate([-47.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
}

// Final part
module belt_holder(){
 difference(){
  belt_holder_base();
  belt_holder_beltcut();
  belt_holder_holes();
 }
}

belt_holder();