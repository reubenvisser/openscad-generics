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

rounded_cube([20, 20, 20], 5, true, false);
