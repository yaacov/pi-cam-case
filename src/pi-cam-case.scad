$fn=50;

module rounded(x, y, z, r) {
    translate([r, r, 0])
        minkowski() {
          cube([x - 2 * r, y - 2 * r, z - 1]);
          cylinder(r=r, h = 1);
        };
}

module pi() {
    rounded(65, 30, 1.5, 2.5);

    translate([52, 7.3, 0])
    cube([16, 12, 3]);

    translate([65 - 19, 30 - 7, 0])
    cube([12, 17, 5]);

    translate([19.8, 30 - 6, 0])
    cube([8, 16, 4]);

    translate([7.15, 30 - 6, 0])
    cube([8, 16, 4]);
}

module cam() {
    cube([25, 25, 1]);
  
    translate([-1.7, 1.5, -3.4])
    cube([25, 22, 4.4]);
  
    translate([15.5, 12.5, -24])
    cylinder(25, 16 / 2, 16 / 2);
}

module picam() {
    pi();
    
    translate([-20, 2.5, -6])
    cam();
}


module holes() {
    translate([-10,-20, 10])
        cube([1, 30, 50]);
    
    translate([-6,-20, 20])
        cube([1, 20, 50]);
     
    translate([2,-20, 30])
        cube([1, 30, 50]);
    
    translate([7,-20, 20])
        cube([1, 30, 50]);
   
    translate([0,0,4])
        cylinder(60, 13.5, 13.5);
    
    translate([0,-15,75])
            rotate([0, 90, 0])
            picam();
}

module base() {
    difference() {
        cylinder(4, 23, 23);
        translate([0,0,-10])
            cylinder(18, 15.5, 15.5);
    }
}

module body() {
    difference() {      
        difference() {
            cylinder(100, 17, 17);
            translate([0,0,-10])
                cylinder(130, 15.5, 15.5);
        };

        holes();
    }
}

module top() {
    difference() {
        translate([0,0,0])
            cylinder(10, 15.2, 15.2);
        translate([0,0,0])
            cylinder(20, 13.5, 13.5);
    }
    
    translate([0,0,0])
        cylinder(4, 17, 17);
    translate([-17,0,0])
        cube([34, 34, 4]);
}

base();
body();

translate([0,43,0])
    top();
translate([40,43,0])
    top();
