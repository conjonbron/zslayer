key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_space = keyboard_check_pressed(vk_space);

//controller



key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var move = key_right - key_left;

hsp = move * walksp;

if ((key_space) && (place_meeting(x, y+1, oWall))) {
	vsp += jumpspd;
}

// Ladders and gravity
if (!place_meeting(x, y, oLadder)) {
	vsp += grv;
} else {
	var ladder_move = key_up - key_down;
	vsp = ladder_move * ladderspd;
}

// Horizontal collision
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);  // x = x + 1;
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1, oWall)) {
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > -1) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
