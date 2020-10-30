$fn=32;

rg350m_x = 146.0;
rg350m_y = 18.5;
rg350m_z = 74.6;

module catch(i) {
    l = (20+(rg350m_y+14)+20) - 1;
    rotate([0,-90,0]) difference() {
        union() {
            hull() {
                translate([-8/2 - i, -18/2 - i, 0]) cylinder(r=3, h=2);
                translate([-8/2 - i, 18/2 + i, 0]) cylinder(r=3, h=2);
                translate([8/2 + i, 18/2 + i, 0]) cylinder(r=3, h=2);
                translate([8/2 + i, -18/2 - i, 0]) cylinder(r=3, h=2);
            }
            translate([l/2,0,0]) hull() {
                translate([-l/2, -18/2 - i, 0]) cylinder(r=3, h=1);
                translate([-l/2, 18/2 + i, 0]) cylinder(r=3, h=1);
                translate([l/2, 18/2 + i, 0]) cylinder(r=3, h=1);
                translate([l/2, -18/2 - i, 0]) cylinder(r=3, h=1);
            }
            
            translate([l,0,0]) hull() {
                translate([-8/2, -18/2, 0]) cylinder(r=3, h=2);
                translate([-8/2, 18/2, 0]) cylinder(r=3, h=2);
                translate([8/2, 18/2, 0]) cylinder(r=3, h=2);
                translate([8/2, -18/2, 0]) cylinder(r=3, h=2);
            }
        }
        
        translate([0,20/2 - 4,0.5]) cylinder(r=4-i, h=5+1);
        translate([0,-20/2 + 4,0.5]) cylinder(r=4-i, h=5+1);
        
        
        translate([l,20/2 - 4,0.5]) cylinder(r=4-i, h=5+1);
        translate([l,-20/2 + 4,0.5]) cylinder(r=4-i, h=5+1);
    }
}

module case() translate([0,1.3,0]) difference() {
    // Outer shell
    translate([0,-1.3,0]) // fudge factor
    difference() {
        union() {
            r = 5;
            x = rg350m_x+14 - r*2;
            y = rg350m_y+14 - r*2;
            z = rg350m_z+3+3 - r*2;

            translate([-x/2, -y/2, r]) minkowski() {
                cube([x, y, z]);
                sphere(r=r, $fn=8);
            }
        }
        
        // catch
        translate([0,(rg350m_y+14)/2,(rg350m_z+3+3)-20]) rotate([0,0,90]) catch(0.5);
        translate([0,-(rg350m_y+14)/2,(rg350m_z+3+3)-20]) rotate([0,0,-90]) catch(0.5);
    }

    // Button clearance
    btn_clear_width = 24 + 2;
    translate([4.5 - 1, -rg350m_y/2 + 9 - 5, 0])
        translate([-rg350m_x/2 + btn_clear_width/2, 0, 3])
            translate([-btn_clear_width/2,-9,0]) cube([btn_clear_width, 9, 80]);
    translate([-4.5+1, -rg350m_y/2 + 9 - 5, 0])
        translate([rg350m_x/2 - btn_clear_width/2, 0, 3])
            translate([-btn_clear_width/2,-9,0]) cube([btn_clear_width, 9, 80]);

    // Grip clearance
    translate([rg350m_x/2 - 20/2 - (16-1),0,0])
        translate([0, rg350m_y/2 + 0.5/2 + 1.5, 3])
            translate([-20/2,-5,0]) cube([20, 5, 80]);
    translate([-rg350m_x/2 + 20/2 + (16-1),0,0])
        translate([0, rg350m_y/2 + 0.5/2 + 1.5, 3])
            translate([-20/2,-5,0]) cube([20, 5, 80]);
    
    // Felt clearance - 2.25mm each side
    union() {
        fx = rg350m_x+4.5;
        fy = rg350m_y+4.5;
        fz = rg350m_z+4.5;
        translate([-100/2,-fy/2, 3]) cube([100, fy, fz]);
        translate([-fx/2, -fy/2, 3]) cube([fx,fy, fz]);
    }
}

module felt_pattern() {
    // bottom
    translate([-rg350m_x/2, -rg350m_y/2]) square([rg350m_x, rg350m_y]);
    
    // back face
    translate([0,0.01])
    translate([-74/2, rg350m_y/2]) square([74, rg350m_z]);
    
    // front face
    translate([0,-0.01])
    translate([-84/2, -rg350m_z - rg350m_y/2]) square([84, rg350m_z]);

    translate([-rg350m_z/2 - rg350m_x/2 - rg350m_z/2 - 0.01, -rg350m_y/2]) square([rg350m_z, rg350m_y]);

    translate([-rg350m_z/2 + rg350m_x/2 + rg350m_z/2 + 0.01, -rg350m_y/2]) square([rg350m_z, rg350m_y]);
}

//translate([0,0,-50])
    case();

//translate([0,(rg350m_y+14)/2,(rg350m_z+3+3) - 20])
//rotate([0,0,90]) catch(0);

//rotate([0,0,60])
//    felt_pattern();    // rotated to fit A4 page

//translate([-rg350m_x/2, -rg350m_y/2, 3.01]) cube([rg350m_x, rg350m_y, rg350m_z]);

