/************************************************************************

    washers.scad
    
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

// Bauhaus Profi Depot DIN9021 (ISO 7093)
// M20 - id=22, od=60, h=3.5
module m20washer()
{
    difference() {
        cyl(h=3.5, d=60);
        cyl(h=4, d=22);
    }
}

// Washers are used to add weight to the design
module washers()
{
    move([0,0,4 * 0]) m20washer();
    move([0,0,4 * 1]) m20washer();
    move([0,0,4 * 2]) m20washer();
    move([0,0,4 * 3]) m20washer();
    move([0,0,4 * 4]) m20washer();
}

module render_washers(toPrint, open) {
    if (!toPrint) {
        move([0,0,3.75]) washers();
    }
} 