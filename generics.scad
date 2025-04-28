module rounded_cube(size, r_dim, center = false, sides_only = false){
	x_dim = size[0] - r_dim * 2;
	y_dim = size[1] - r_dim * 2;
	z_dim = size[2] + (sides_only ? 0 : - r_dim * 2);

	x = (center ? - size[0] / 2 : 0) + r_dim;
	y = (center ? - size[1] / 2 : 0) + r_dim;
	z = (center ? - size[2] / 2 : 0) + (sides_only ? 0 : r_dim);

	translate([x, y, z])
		minkowski(){
			cube([x_dim , y_dim, z_dim]);
			if (sides_only) cylinder(1, r=r_dim); else sphere(r_dim);
		}
}

module pill(size, r_dim, center = false) {
	x_dim = size[0] - r_dim * 2;
	y_dim = size[1] - r_dim * 2;
	z_dim = size[2] - r_dim * 2;

	r_top = x_dim / 2;
	y_cube = y_dim - r_top * 2;

	x = (center ? - size[0] / 2 : 0) + r_dim;
	y = (center ? - size[1] / 2 : 0) + r_dim;
	z = (center ? - size[2] / 2 : 0) + r_dim;
	
	translate([x, y, z]) {
		minkowski() {
			union() {
				for(y_pos = [r_top, y_dim - r_top]) {
					translate([r_top, y_pos, 0]) cylinder(z_dim, r=r_top);
				}
				translate([0, r_top, 0]) cube([x_dim, y_cube, z_dim]);
			}
			sphere(r_dim);
		}
	}
}

pill([50, 70, 10], 3);
