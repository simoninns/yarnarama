/************************************************************************

    spool_shaft_narrow.scad
    
    Yarnarama - A yarn holder for knitting
    Copyright (C) 2024 Simon Inns
    
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

module spool_cone_narrow()
{
    // Top cone
    move([0,0,135 + 12]) {
        difference() {
            union() {
                move([0,0,10]) cyl(h=2, d=14, chamfer=1);
                cyl(h=20, d1=20, d2=14);
            }

            move([0,0,-5]) cyl(h=20, d1=20, d2=10);

            // Save material
            zrot(45) {
                xrot(90) xcyl(h=40, d=10, $fn=6);
                zrot(90) xrot(90) xcyl(h=40, d=10, $fn=6);
            }
        }
    }
}

module spool_shaft_narrow()
{
    move([0,0,65 + 12]) {
        difference() {
            move([0,0,3.5+5]) cyl(h=103, d=20);
            cyl(h=144, d=20 - 6);

            // Save plastic
            hull() {
                move([0,0,50]) xrot(90) xcyl(h=40, d=10, $fn=6);
                move([0,0,-30]) xrot(90) xcyl(h=40, d=10, $fn=6);
            }

            zrot(90) hull() {
                move([0,0,50]) xrot(90) xcyl(h=40, d=10, $fn=6);
                move([0,0,-30]) xrot(90) xcyl(h=40, d=10, $fn=6);
            }
        }
    }

    move([0,0,17.25 + 16]) {
        // Bearing surround
        move([0,0,-5]) difference() {
            cyl(h=8.5,d=30);
            cyl(h=10,d=22);
        }

        // Build up material to make it printable without supports
        move([0,0,0]) difference() {
            cyl(h=8,d=30);
            cyl(h=12,d1=32, d2=0);
            cyl(h=13,d=14);
        }
    }
}

module spool_shaft_base_narrow()
{
    move([0,0,65 + 16]) {
        difference() {
            move([0,0,-55]) cyl(h=4, d=140 - 8, chamfer2=1);
            cyl(h=144, d=30 - 4);

            // Decoration
            zrot( 0) move([40,0,-55]) zrot(90) cyl(h=20, d=42, $fn=6);
            zrot(90) move([40,0,-55]) zrot(90) cyl(h=20, d=42, $fn=6);
            zrot(180) move([40,0,-55]) zrot(90) cyl(h=20, d=42, $fn=6);
            zrot(270) move([40,0,-55]) zrot(90) cyl(h=20, d=42, $fn=6);

            zrot(45) {
                zrot( 0) move([50,0,-55]) zrot(90) cyl(h=20, d=22, $fn=6);
                zrot(90) move([50,0,-55]) zrot(90) cyl(h=20, d=22, $fn=6);
                zrot(180) move([50,0,-55]) zrot(90) cyl(h=20, d=22, $fn=6);
                zrot(270) move([50,0,-55]) zrot(90) cyl(h=20, d=22, $fn=6);
            }
        }
    }
}

module render_spool_shaft_narrow(toPrint, open) {
    if (!toPrint) {
        move([0,0,6]) {
            spool_cone_narrow();
            spool_shaft_narrow();
            spool_shaft_base_narrow();
        }
    } else {
        move([0,0,-24]) {
            spool_cone_narrow();
            spool_shaft_narrow();
            spool_shaft_base_narrow();
        }
    }
}