$fn=8;

rg350m_x = 146.0;
rg350m_y = 18.5;
rg350m_z = 74.6;

difference() {
    // Outer shell
    translate([0,-1.3,0]) // fudge factor
    union() {
        x = rg350m_x+10 - 2.5*2;
        y = rg350m_y+10 - 2.5*2;
        z = rg350m_z+3+1 - 2.5*2;

        translate([-x/2, -y/2, 2.5]) minkowski() {
            cube([x, y, z]);
            sphere(r=2.5);
        }
    }

    // Button clearance
    btn_clear_width = 24 + 2;
    translate([4.5 - 1, -rg350m_y/2 + 9 - 4.5, 1.26])    //apothem
    translate([-rg350m_x/2 + btn_clear_width/2, 0, btn_clear_width/2]) union() {
        hull() {
            rotate([90,0,0]) cylinder(r=btn_clear_width/2, h=9, $fn=6);
            translate([0,0,80]) rotate([90,0,0]) cylinder(r=btn_clear_width/2, h=9, $fn=6);
        }
    }
    translate([-4.5+1, -rg350m_y/2 + 9 - 4.5, 1.26])    //apothem
    translate([rg350m_x/2 - btn_clear_width/2, 0, btn_clear_width/2]) union() {
        hull() {
            rotate([90,0,0]) cylinder(r=btn_clear_width/2, h=9, $fn=6);
            translate([0,0,80]) rotate([90,0,0]) cylinder(r=btn_clear_width/2, h=9, $fn=6);
        }
    }

    // Grip clearance
    translate([rg350m_x/2 - 20/2 - (16-1),0,1.7])    // apothem
    translate([0, rg350m_y/2 + 0.5/2 + 1.5, 20/2]) union() {
        hull() {
            rotate([90,0,0]) cylinder(r=20/2, h=5, $fn=6);
            translate([0,0,80]) rotate([90,0,0]) cylinder(r=20/2, h=5, $fn=6);
        }
    }
    translate([-rg350m_x/2 + 20/2 + (16-1),0,1.7])    //apothem
    translate([0, rg350m_y/2 + 0.5/2 + 1.5, 20/2]) union() {
        hull() {
            rotate([90,0,0]) cylinder(r=20/2, h=5, $fn=6);
            translate([0,0,80]) rotate([90,0,0]) cylinder(r=20/2, h=5, $fn=6);
        }
    }
    
    // Felt clearance - 1mm each side
    union() {
        translate([-100/2,-(rg350m_y+2)/2, 3]) cube([100, rg350m_y+2, rg350m_z+2]);
        translate([-(rg350m_x+2)/2, -(rg350m_y+0.5)/2, 3]) cube([rg350m_x+2,(rg350m_y+0.5), rg350m_z+2]);
    }
}

//translate([-rg350m_x/2, -rg350m_y/2, 3.01]) cube([rg350m_x, rg350m_y, rg350m_z]);