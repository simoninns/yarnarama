/************************************************************************

    guide.scad
    
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

module guide_rail()
{
    move([99,0,90]) {
        difference() {
            union() {
                move([-12,0,0]) yrot(90) cyl(h=8,d=20, chamfer=1);
                //move([-6,0,0]) yrot(90) cyl(h=4,d=18);
            }
            move([-12,0,0]) yrot(90) cyl(h=20,d=12);

            // Slice
            xrot(-60) move([-12,0,8]) {
                cuboid([14,4,8]);
                move([0,1,-2]) xrot(30) cuboid([15,2,4]);
                move([0,-1,-2]) xrot(-30) cuboid([15,2,4]);
            }
            
            // Smooth the middle
            move([-17,0,0]) yrot(90) cyl(h=10,d=16, chamfer=4);  
        }

        // Centre part
        difference() {
            move([-6,0,0]) yrot(90) cyl(h=4,d=18);
            move([-6,0,10]) cuboid([20,20,20]);
            move([-12,0,0]) yrot(90) cyl(h=20,d=12);
        }

        // Centre joiner
        difference() {
            move([-4,0,0]) yrot(90) cyl(h=4,d=16);
            move([-4,0,9]) cuboid([20,20,20]);
            move([-10,0,0]) yrot(90) cyl(h=20,d=14);
        }
    }
}

module guide_top()
{
    move([99,0,90]) {
        
        difference() {
            union() {
                hull() {
                    move([0,0,-11]) cuboid([8,14,2], chamfer=1, edges=EDGES_Z_ALL);
                    yrot(90) cyl(h=8,d=20, chamfer=1);
                }
            }

            move([-3,0,0]) yrot(90) cyl(h=20,d=12);

            // Slice
            xrot(60) move([0,0,8]) {
                cuboid([14,4,8]);
                move([0,1,-2]) xrot(30) cuboid([15,2,4]);
                move([0,-1,-2]) xrot(-30) cuboid([15,2,4]);
            }

            // Smooth the middle
            move([5,0,0]) yrot(90) cyl(h=10,d=16, chamfer=4);

            // Centre joiner
            difference() {
                move([-4,0,0]) yrot(90) cyl(h=4,d=16);
                move([-4,0,9]) cuboid([20,20,20]);
                move([-10,0,0]) yrot(90) cyl(h=20,d=14);
            }
        }
    }
}

module guide()
{
    move([100,0,100-6]) {
        // Shaft
        move([-1,0,-45]) cuboid([8,14,58], chamfer=1, edges=EDGES_ALL-EDGES_TOP);

        // Flared base
        difference() {
            hull() {
                move([-1,0,-74]) cuboid([8,14,4], chamfer=1);
                move([-2,0,-78]) cuboid([10,32,4], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM);
            }

            // Screw holes
            move([-2,0,0]) {
                move([0,12,10-94]) cyl(h=40,d=3);
                move([0,-12,10-94]) cyl(h=40,d=3);

                move([0,12,26-94]) cyl(h=20,d=6);
                move([0,-12,26-94]) cyl(h=20,d=6);
            }
        }
    }
}

module render_guide(toPrint, open) {
    if (!toPrint) {
        move([2,0,0]) {
            guide();
            guide_top();
        }
    } else {
        move([-60,0,103]) yrot(90) {
            guide();
            guide_top();
        }
    }
}

module render_guide_rail(toPrint, open) {
    if (!toPrint) {
        move([2,0,0]) {
            guide_rail();
        }
    } else {
        move([90,0,-83]){
            yrot(-90) guide_rail();
        }
    }
}