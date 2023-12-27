/************************************************************************

    main.scad
    
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

// Local includes
include <spool_base.scad>
include <spool_shaft.scad>
include <base.scad>
include <guide.scad>
include <washers.scad>
include <bearing.scad>

// Rendering resolution
$fn=100;

// Select rendering parameters
for_printing = "Display"; // [Display, Printing]

// Choose what to display
display_spool_base = "Yes"; // [Yes, No]
display_spool_shaft = "Yes"; // [Yes, No]
display_base = "Yes"; // [Yes, No]
display_bearing_holder = "Yes"; // [Yes, No]
display_guide = "Yes"; // [Yes, No]
display_guide_rail = "Yes"; // [Yes, No]

display_washers = "Yes"; // [Yes, No]
display_bearing = "Yes"; // [Yes, No]

// Render the required items
module main()
{
    // Main options
    toPrint = (for_printing == "Printing") ? true:false;

    // Display selections
    d_spool_base = (display_spool_base == "Yes") ? true:false;
    d_spool_shaft = (display_spool_shaft == "Yes") ? true:false;
    d_base = (display_base == "Yes") ? true:false;
    d_bearing_holder = (display_bearing_holder == "Yes") ? true:false;
    d_guide = (display_guide == "Yes") ? true:false;
    d_guide_rail = (display_guide_rail == "Yes") ? true:false;

    d_washers = (display_washers == "Yes") ? true:false;
    d_bearing = (display_bearing == "Yes") ? true:false;

    if (d_spool_base) render_spool_base(toPrint);
    if (d_spool_shaft) render_spool_shaft(toPrint);
    if (d_base) render_base(toPrint);
    if (d_bearing_holder) render_bearing_holder(toPrint);
    if (d_guide) render_guide(toPrint);
    if (d_guide_rail) render_guide_rail(toPrint);

    if (d_washers) render_washers(toPrint);
    if (d_bearing) render_bearing(toPrint);
}

main();