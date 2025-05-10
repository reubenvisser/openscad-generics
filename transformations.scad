
module rotate_about(a, v) {
	translate(v) rotate(a) translate(-v) children();
}
