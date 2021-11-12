player_frame = new atchar_mainframe("Test Frame");
player_frame.set_rotate_sync(ATCHAR.SYNC_ROTATE_LERP, [0.1]);

player_part = [];

player_part[0] = new atchar_part("Test Part 00");
player_part[0].set_sprites(Sprite1 , 1);
player_part[0].set_mainframe(ptr(player_frame));


player_part[1] = new atchar_part("Test Part 01");
player_part[1].set_sprites(Sprite1 , 2);
player_part[1].set_point_motion(16, 16, 270, 16, 16, 270);
player_part[1].set_mainframe(ptr(player_frame));
player_part[1].set_inheritance(ptr(player_part[0]));

player_part[2] = new atchar_part("Test Part 02");
player_part[2].set_sprites(Sprite1 , 3);
player_part[2].set_point_motion(16, 16, 270, 16, 16, 270);
player_part[2].set_mainframe(ptr(player_frame));
player_part[2].set_inheritance(ptr(player_part[1]));

player_part[3] = new atchar_part("Test Part 03");
player_part[3].set_sprites(Sprite1 , 0);
player_part[3].set_point_motion(8, 8, 270, -16, -16, 270);
player_part[3].set_mainframe(ptr(player_frame));
player_part[3].set_inheritance(ptr(player_part[0]));

player_part[2] = new atchar_part("Test Part 04");
player_part[2].set_sprites(Sprite1 , 4);
player_part[2].set_point_motion(16, 16, 270, 16, 16, 270);
player_part[2].set_mainframe(ptr(player_frame));
player_part[2].set_inheritance(ptr(player_part[1]));

for(var i = 0; i < array_length(player_part); i++)
{
	player_frame.part_add(player_part[i]);
	player_part[i].set_rotate_sync(ATCHAR.SYNC_ROTATE_LERP, [0.05]);
}