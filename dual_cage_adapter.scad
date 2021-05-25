$fn=330;
bottom_length = 74;
bolt_part_length = 12;
width = 19;
height = 3;
angle = 40;
holes_diameter = 6;

topLength = (bottom_length-bolt_part_length)/cos(angle);
topFixX = sin(angle)*height;
topFixY = height - sin(90-angle)*height;
middleLength = (bottom_length-2*bolt_part_length)*tan(angle);

echo(topFixY);

difference() {
    bottom();
    holes();
}
difference() {
    top();
    color("red") translate([bottom_length,-0.1,0]) cube([2,20,100]);
}
middle();


module bottom() {
    cube([bottom_length, width, height]);
}

module top() {
    translate([bolt_part_length+topFixX,0,topFixY]) rotate([0,360-angle,0])  cube([topLength, width, height]);
}

module middle() {
    translate([bottom_length-bolt_part_length,0,0]) rotate([0,-90,0]) cube([middleLength, width, height]);
}

module holes() {
    translate([bolt_part_length/2,width/2,-0.1]) cylinder(height+0.5, d=holes_diameter);
    translate([bottom_length-bolt_part_length/2,width/2,-0.1]) cylinder(height+0.5, d=holes_diameter);
}