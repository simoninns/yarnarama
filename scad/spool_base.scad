/************************************************************************

    spool_base.scad
    
    Yarnarama - A yarn holder for knitting
    Copyright (C) 2023 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module spool_base()
{
    move([0,0,6]) {
        union() {
            difference() {
                move([0,0,2]) cyl(h=4, d=80 - 8);

                // Holes for threaded inserts
                move([0,0,5]) cyl(h=12,d=5);

                // Save some material
                move([0,0,6]) cyl(h=8, d=62, chamfer=4);

                // M3 Screw holes
                move([33.5,0,2]) cyl(h=6,d=3);
                move([-33.5,0,2]) cyl(h=6,d=3);

                // M3 Screw recess
                move([33.5,0,5]) cyl(h=6,d=6);
                move([-33.5,0,5]) cyl(h=6,d=6);

                // Decoration (avoiding the screw recesses at 0 and 180 degrees)
                for(rota=[(360/32): 360/32: 360-(360/32)]) {
                    if (rota != 180) rotate([0,0,rota]) {
                        move([32.5,0,6]) cyl(h=6, d=5, chamfer=1, $fn=6);
                        move([32.5,0,4]) cyl(h=6, d=3, $fn=6);
                    }
                }
            }
        }

        difference() {
            // Lift for bearing
            union() {
                difference() {
                    move([0,0,4]) cyl(h=8, d1=26, d2=11);

                    // Decoration
                    for(rota=[0: 360/8: 360]) {
                        rotate([0,0,rota]) move([10,0,4]) cyl(h=8, d=5, $fn=6); // Top
                    }
                }
            }

            // Holes for threaded inserts
            move([0,0,7.5]) cyl(h=12,d=5);
        }

        // Inserts
        move([0,0,8]) insertM3x57_th();
    }
}

module render_spool_base(toPrint, open) {
    if (!toPrint) {
        move([0,0,16]) spool_base();
    } else {
        move([0,0,-6]) spool_base();
    }
}

module bearing_holder()
{
    difference() {
        union() {
            move([0,0,21]) cyl(h=14, d=8, chamfer=0.5);
            move([0,0,24]) cyl(h=6, d=13, chamfer1=1.5, chamfer2=0.5);
        }

        move([0,0,20]) cyl(h=16,d=3);
        move([0,0,21+2]) cyl(h=14,d=6, chamfer=2);
        move([0,0,29]) cyl(h=8,d=6+3, chamfer=2);
    }
}

module render_bearing_holder(toPrint, open) {
    if (!toPrint) {
        move([0,0,16]) bearing_holder();
    } else {
        move([0,0,27]) xrot(180) bearing_holder();
    }
}