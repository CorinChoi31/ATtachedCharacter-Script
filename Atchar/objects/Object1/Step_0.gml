player_frame.step();

player_frame.rotate += 0;

//player_part[1].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
//player_part[3].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));

if(mouse_check_button_pressed(mb_left))
{
	player_frame.aspect_reverse();
}

if(mouse_check_button_pressed(mb_right))
{
	player_frame.set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
}

if(keyboard_check(ord("0")))
{
	player_part[0].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
}

if(keyboard_check(ord("1")))
{
	player_part[1].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
}

if(keyboard_check(ord("2")))
{
	player_part[2].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
}

if(keyboard_check(ord("3")))
{
	player_part[3].set_rotate_to(point_direction(x, y, mouse_x, mouse_y));
}