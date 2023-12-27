/************************************************************************

    base.scad
    
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

include <threaded_inserts.scad>

module base()
{
    difference() {
        move([0,0,-6]) cyl(h=26, d=80 - 4, chamfer=1);
        move([0,0,2]) cyl(h=38, d=80 - 8);

        // 3M 13mm bumpons
        move([0,0,-14 - 5.5]) {
            rotate([0,0,0]) move([26,0,0]) cyl(h=2,d=13);
            rotate([0,0,90]) move([26,0,0]) cyl(h=2,d=13);
            rotate([0,0,180]) move([26,0,0]) cyl(h=2,d=13);
            rotate([0,0,270]) move([26,0,0]) cyl(h=2,d=13);
        }

        // M3 Screw recess
        move([33.5,0,8]) cyl(h=6,d=6);
        move([-33.5,0,8]) cyl(h=6,d=6);
    } 

    // Add Washer holding hub
    move([0,0,-3 - 4]) difference() {
        cyl(h=20,d=21.5);
        cyl(h=22,d=21.5 - 4);
    }

    // Rim with screw mounts
    difference() {
        union() {
            // Add rim for spool base to attach to
            move([0,0, 10 - 5 - 4]) {
                difference() {
                    cyl(h=4, d=80-8);
                    cyl(h=8, d=80-8-4);
                    move([0,0,-1]) cyl(h=2.1, d1=80-8, d2=80-8-4);
                }
            }

            // Screw mounts
            move([34,0,-3 - 4]) cyl(h=20,d=8);
            move([-34,0,-3 - 4]) cyl(h=20,d=8);
        }

        // Clearance for washers
        move([0,0,2]) cyl(h=38, d=61);

        // Holes for threaded inserts
        move([33.5,0,-2]) cyl(h=12,d=5);
        move([-33.5,0,-2]) cyl(h=12,d=5);
    }

    // Inserts
    move([33.5,0,3]) insertM3x57_th();
    move([-33.5,0,3]) insertM3x57_th();

    // Guide arm
    difference() {
        union() {
            difference() {
                union() {
                    move([69,0,-16]) cuboid([74,34,6], chamfer=1);
                    move([100,0,-10]) cuboid([12,34,10], chamfer=1);
                }
                move([66,0,-16]) cuboid([74-30,34-14,10], chamfer=1);
                move([66,0,-9]) cuboid([74-30 + 2,34-14 + 2,10], chamfer=1);
                move([0,0,2]) cyl(h=38, d=80 - 8);
            }
        }

        // 3M 13mm bumpons
        move([0,0,-14 - 5.5]) {
            rotate([0,0,0]) move([28 + 68.5,0,0]) cyl(h=2,d=13);
        }

        // Guide attachment holes for threaded inserts
        move([100,12,-10]) cyl(h=11,d=5);
        move([100,-12,-10]) cyl(h=11,d=5);
    }

    // Guide attachment inserts
    move([100,12,-5]) insertM3x57_th();
    move([100,-12,-5]) insertM3x57_th();
}

module render_base(toPrint, open) {
    if (!toPrint) {
        move([0,0,19]) base();
    } else {
        move([0,0,19]) base();
    }
}