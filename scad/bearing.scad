/************************************************************************

    bearing.scad
    
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

module bearing6082z()
{
    // 608-2Z Bearing:
    // Bore diameter    8 mm
    // Outside diameter 22 mm
    // Width            7 mm

    difference() {
        cyl(h=7,d=22, chamfer=0.5);
        cyl(h=9,d=8);

        move([0,0,-4]) cyl(h=2,d=19);
        move([0,0,4]) cyl(h=2,d=19);
    }
}

module render_bearing(toPrint, open) {
    if (!toPrint) {
        move([0,0,11.5 + 22]) bearing6082z();
    }
}