x = oPlayer.x - lengthdir_x(recoil, image_angle);
y = oPlayer.y + 10 - lengthdir_y(recoil, image_angle);

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay -= 1;
//recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) && (firingdelay < 0) {
	firingdelay = 0.001;
	//recoil = 4;
	with (instance_create_layer(x, y, "Bullets", oBullet1)) {
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}