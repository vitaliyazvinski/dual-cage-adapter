$fn=330;
bottom_length = 87;
bolt_part_length = 25;
width = 19;
height = 3;
angle = 40;
holes_diameter = 6;
top_increase = 10;
second_middle_offset = 30;
hole1_offset = 3;
hole2_offset = 65;

topLength = (bottom_length-bolt_part_length+top_increase)/cos(angle);
topFixX = sin(angle)*height;
topFixY = height - sin(90-angle)*height;
middleLength = (bottom_length-bolt_part_length)*tan(angle);
secondmiddleLength = (bottom_length-bolt_part_length-second_middle_offset)*tan(angle);


echo(topFixY);

difference() {
    bottom();
    holes();
}
difference() {
    top();
    //top_holes();
    color("red") translate([bottom_length+top_increase,-0.1,0]) cube([2,20,100]);
}

middle();
second_middle();


module bottom() {
    cube([bottom_length, width, height]);
}

module top() {
    translate([bolt_part_length+topFixX,0,topFixY]) rotate([0,360-angle,0])  cube([topLength, width, height]);
}

module middle() {
    translate([bottom_length,0,0]) rotate([0,-90,0]) cube([middleLength, width, height]);
}

module second_middle() {
    translate([bottom_length-second_middle_offset,0,0]) rotate([0,-90,0]) cube([secondmiddleLength, width, height]);
}

module holes() {
    translate([holes_diameter/2+hole1_offset,width/2,-0.1]) cylinder(height+0.5, d=holes_diameter);
    translate([holes_diameter+hole1_offset+hole2_offset,width/2,-0.1]) cylinder(height+0.5, d=holes_diameter);
}

module top_holes() {
    translate([bolt_part_length+6,width/2,4]) rotate([0,360-angle,0]) cylinder(height+0.5, d=holes_diameter);
}   