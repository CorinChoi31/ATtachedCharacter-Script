screen_size_width = 1920;
screen_size_height = 1080;


animate_tick = 0;
animate_frame = 0;
animate_length = 0;

animate_layer_index = 0;

animate_mainframe = atchar_mainframe("mainframe");


animate_play = false;


#region

/// @function draw_rectangle_primitive(x1, y1, x2, y2, color, alpha, outline)
/// @description 
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2
/// @param {color} color
/// @param {real} alpha
/// @param {boolean} outline
draw_rectangle_primitive = function(_x1, _y1, _x2, _y2, _color, _alpha, _outline)
{
	var _pcolor = draw_get_color();
	var _palpha = draw_get_alpha();
	
	draw_set_color(_color);
	draw_set_alpha(_alpha);
	
	if(_outline)
	{
		draw_primitive_begin(pr_linestrip);
			draw_vertex(_x1, _y1);
			draw_vertex(_x1, _y2);
			draw_vertex(_x2, _y2);
			draw_vertex(_x2, _y1);
		draw_primitive_end();
	}
	else
	{
		draw_primitive_begin(pr_trianglelist);
			draw_vertex(_x1, _y1);
			draw_vertex(_x2, _y1);
			draw_vertex(_x1, _y2);
			
			draw_vertex(_x2, _y1);
			draw_vertex(_x1, _y2);
			draw_vertex(_x2, _y2);
		draw_primitive_end();
	}
	
	draw_set_color(_pcolor);
	draw_set_alpha(_palpha);
}

/// @function Button
Button = function(_x, _y, _context, _width, _height, _color, _alpha) constructor
{
	pos_x = _x;
	pos_y = _y;
	
	x1 = _x - _width/2;
	y1 = _y - _height/2;
	x2 = _x + _width/2;
	y2 = _y + _height/2;
	
	context = undefined;
	
	color = _color;
	alpha = _alpha;
	
	clicks = 0;
	clicked = false;
	clicking = 0;
	
	static step = function()
	{
		if(mouse_check_button(mb_left))
		{
			if(point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2))
			{
				clicking += 1;
			}
			else
			{
				clicking = 0;	
			}
		}
		else
		{
			clicking = 0;
		}
		
		if(mouse_check_button_released(mb_left))
		{
			if(point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2))
			{
				clicked = true;
				clicks += 1;
			}
		}
		
		run();
	}
	
	static draw = function()
	{
		if(clicking == 0)
		{
			draw_rectangle_primitive(x1, y1, x2, y2, color, alpha, true);
		}
		else
		{
			draw_rectangle_primitive(x1, y1, x2, y2, color, alpha, false);
		}
		
		if(is_undefined(context))
		{
			
		}
		else if(is_struct(context))
		{
			draw_text(pos_x, pos_y, string(context));
		}
		else
		{
			draw_text(pos_x, pos_y, context);	
		}
	}
	
	run = function()
	{
		
	}
}
		
#endregion