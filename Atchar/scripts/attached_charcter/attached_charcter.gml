enum ATCHAR
{
	#region PARAMETER
	
	//Common
	ALL = all,
	DEFAULT = 0,
	
	//Legacy
	X = 0,
	Y,
	ANGLE,
	
	//Aspect
	ASPECT_LEFT = -1,
	ASPECT_RIGHT = 1,
	
	//Postion
	POSITION_X = 0,
	POSITION_Y,
	POSITION_ANGLE,
	
	//Scale
	SCALE_X = 0,
	SCALE_Y,
	
	//Color
	COLOR_RGB = 0,
	COLOR_HSV,
	
	COLOR_R = 0,
	COLOR_G,
	COLOR_B,
	COLOR_H = 0,
	COLOR_S,
	COLOR_V,
	
	//Sync
	SYNC_REAL_DEFAULT = 0,
	SYNC_REAL_LINEAR,
	SYNC_REAL_LERP,
	
	SYNC_ROTATE_DEFAULT = 0,
	SYNC_ROTATE_LINEAR,
	SYNC_ROTATE_LERP,
	
	SYNC_COLOR_DEFAULT = 0,
	SYNC_COLOR_LINEAR_RGB,
	SYNC_COLOR_LINEAR_HSV,
	SYNC_COLOR_LERP_RGB,
	SYNC_COLOR_LERP_HSV,
	#endregion
	
	CONTAINER_DEFAULT = 0,
	CONTAINER_STRING,
	CONTAINER_REAL,
	CONTAINER_SPRITE,
}

/// @function atchar_mainframe(key)
/// @description 
/// @param {key} key
function atchar_mainframe(_key) constructor
{
	atch = "frame";
	key = _key;
	
	#region Private Methods
		/// @function angularRefresh(angle)
		/// @description 
		/// @param {real} angle
		static angularRefresh = function(_angle) { return _angle mod 360 };
		
		/// @function rotationalRefresh(rotate)
		/// @description 
		/// @param {real} rotate
		static rotationalRefresh = function(_rotate) { return _rotate % 360 };
		
		/// @function getColorRGB(color)
		/// @description 
		/// @param {color} color
		static getColorRGB = function(_color) { return [color_get_red(_color), color_get_green(_color), color_get_blue(_color)] };
		
		/// @function getColorHSV(color)
		/// @description 
		/// @param {color} color
		static getColorHSV = function(_color) { return [color_get_hue(_color), color_get_saturation(_color), color_get_value(_color)] };
	#endregion
	
	#region Defualt Variables
		part = ds_list_create();
		part_key = ds_list_create();
		part_depth = ds_list_create();
	
		aspect = ATCHAR.ASPECT_RIGHT;
		aspect_previous = aspect;
		
		position_x = 0;
		position_y = 0;
		position_angle = 0;
		position_x_to = position_x;
		position_y_to = position_y;
		position_angle_to = position_angle;
		position_x_sync_type = ATCHAR.DEFAULT;
		position_y_sync_type = ATCHAR.DEFAULT;
		position_angle_sync_type = ATCHAR.DEFAULT;
		position_x_sync_parameter = array_create(1, 1);
		position_y_sync_parameter = array_create(1, 1);
		position_angle_sync_parameter = array_create(1, 1);
	
		scale_x = 1;
		scale_y = 1;
		scale_x_to = scale_x;
		scale_y_to = scale_y;
		scale_x_sync_type = ATCHAR.DEFAULT;
		scale_y_sync_type = ATCHAR.DEFAULT;
		scale_x_sync_parameter = array_create(1, 1);
		scale_y_sync_parameter = array_create(1, 1);
	
		rotate = 0;
		rotate_to = rotate;
		rotate_sync_type = ATCHAR.DEFAULT;
		rotate_sync_parameter = array_create(1, 1);
	
		color = c_white;
		color_rgb_parameter = getColorRGB(color);
		color_hsv_parameter = getColorHSV(color);
		color_to = color;
		color_sync_type = ATCHAR.DEFAULT;
		color_sync_parameter = array_create(1, 1);
	
		alpha = 1;
		alpha_to = alpha;
		alpha_sync_type = ATCHAR.DEFAULT;
		alpha_sync_parameter = array_create(1, 1);
	#endregion
	
	#region Advanced Variables
		surface_enable = false;
		surface_id = noone;
	#endregion
		
	#region Default Methods
		#region part
			/// @function part_create(key)
			/// @description 
			/// @param {key} key
			static part_create = function(_key)
			{
				var _result = undefined;
			
				var _found = ds_list_find_index(part_key, _key);
				if(_found == -1)
				{
					_result = new atchar_part(_key);
				
					ds_list_add(part, _result);
					ds_list_add(part_key, _result.key);
					ds_list_add(part_depth, ds_list_size(part)-1);
				}
				else
				{
					throw "atchar:part_create -> already exists key";	
				}
				return _result;
			};
		
			/// @function add_part(part)
			/// @description 
			/// @param {ptr} part 
			static part_add = function(_part)
			{
				var _result = undefined;
			
				var _found = ds_list_find_index(part_key, _part.key);
				if(_found == -1)
				{
					_result = _part;
				
					ds_list_add(part, _part);
					ds_list_add(part_key, _part.key);
					ds_list_add(part_depth, ds_list_size(part)-1);
				}
				else
				{
					throw "atchar:part_add -> already exists key";
				}
				return _result;
			};
		
			/// @function part_replace(part)
			/// @description 
			/// @param {ptr} part
			static part_replace = function(_part)
			{
				var _result = undefined;
			
				var _found = ds_list_find_index(part_key, _part.key);
				if(_found == -1)
				{
					_result = part_add(new atchar_part(_key));
				}
				else
				{
					_result = ptr(part[|_found]);
					ds_list_replace(part, _found, _part);
				}
				return _result;
			};
		
			/// @function part_remove(part)
			/// @description 
			/// @param {ptr} part
			static part_remove = function(_part) 
			{
				var _result = undefined;
			
				var _found = ds_list_find_index(part_key, _part.key);
				if(_found != -1)
				{
					_result = ptr(part[|_found]);
				
					ds_list_delete(part, _found);
					ds_list_delete(part_key, _found);
					for(var _i = ds_list_size(part_depth)-1; _i >= 0; _i++)
					{
						if(part_depth[|_i] > _found)
						{
							part_depth[|_i] -= 1;
						}
						else if(part_depth[|_i] == _found)
						{
							ds_list_delete(part_depth, _i);
						}
					}
				}
				else
				{
					throw "atchar:part_remove -> invaild part";
				}
				return _result;
			};
		
			/// @function part_destroy(part)
			/// @description 
			/// @param {ptr} part
			static part_destroy = function(_part)
			{
				var _result = part_remove(_part);
			
				if(!is_undefined(_result))
				{
					_result.destroy();
				}
				else
				{
					throw "atchar:part_destroy -> invaild part";
				}
			};
			
			#region get
				/// @function get_part_by_index(index)
				/// @description 
				/// @param {int} index
				static get_part_by_index = function(_index)
				{
					var _psize = ds_list_size(part);
					return (_index >= 0 and _index < _psize) ? undefined : ptr(part[|_index]);
				};
		
				/// @function get_part_by_key(key)
				/// @description 
				/// @param {key} key
				static get_part_by_key = function(_key)
				{
					var _found = ds_list_find_index(part_name, _key);
					return (_found == -1) ? undefined : ptr(part[|_found]);
				};
		
				/// @function get_part(key)
				/// @description 
				/// @param {key} key
				static get_part = function(_key)
				{
					return get_part_by_key(_key);
				};
			#endregion
			#region set
				/// @function set_depth_by_ptr(depth)
				/// @description 
				/// @param {array<ptr>} depth
				static set_depth_by_ptr = function(_depth)
				{
					ds_list_clear(part_depth);
					
					var _psize = ds_list_size(part);
					var _dsize = array_length(_depth);
					
					var _index = 0;
					repeat(_dsize)
					{
						var _found = ds_list_find_index(part, _depth[_index]);
						if(_found == -1)
						{
							throw "atchar:set_depth_by_ptr -> invaild part";
						}
						else
						{
							ds_list_add(part_depth, _found);
						}
						_index += 1;
					}
				}
				
				/// @function set_depth_by_index(depth)
				/// @description 
				/// @param {array<int>} depth
				static set_depth_by_index = function(_depth)
				{
					ds_list_clear(part_depth);
					
					var _psize = ds_list_size(part);
					var _dsize = array_length(_depth);
					
					var _index = 0;
					repeat(_dsize)
					{
						if(_depth[_index] >= 0 and _depth[_index] < _psize)
						{
							ds_list_add(part_depth, _depth[_index]);
						}
						else
						{
							throw "atchar:set_depth_by_index -> invaild index range";
						}
						_index += 1;
					}
				};
		
				/// @function set_depth_by_key(depth)
				/// @description 
				/// @param {array<key>} depth
				static set_depth_by_key = function(_depth)
				{
					ds_list_clear(part_depth);
					
					var _psize = ds_list_size(part);
					var _dsize = array_length(_depth);
					
					var _index = 0;
					repeat(_dsize)
					{
						var _found = ds_list_find_index(part_key, _depth[_index]);
						if(_found == -1)
						{
							throw "atchar:set_depth_by_name -> invaild key";
						}
						else
						{
							ds_list_add(part_depth, _found);
						}
						_index += 1;
					}
				};
				
				/// @function set_depth(depth)
				/// @description 
				/// @param {array<ptr>} depth
				static set_depth = function(_depth)
				{
					set_depth_by_ptr(_depth);	
				}
			#endregion
		#endregion	
		
		#region aspect
			/// @function aspect_reverse(enable_event)
			/// @description 
			/// @param {boolean} enable_event
			static aspect_reverse = function(_enable)
			{
				aspect = (aspect == ATCHAR.ASPECT_RIGHT) ? ATCHAR.ASPECT_LEFT : ATCHAR.ASPECT_RIGHT;
				if(is_undefined(_enable) ? false : _enable)
					modified_aspect();
				
				return aspect;
			};
			
			/// @function get_aspect()
			/// @description 
			/// @param 
			static get_aspect = function() { return aspect; };
			
			/// @function set_aspect(aspect)
			/// @description 
			/// @param {aspect} aspect
			static set_aspect = function(_aspect) { aspect = sign(_aspect); };
		#endregion
		
		#region point
			#region get
				/// @function get_point()
				/// @description 
				/// @param 
				static get_point = function() { return [point_x, point_y, point_angle]; };
				
				/// @function get_point_x()
				/// @description 
				/// @param 
				static get_point_x = function() { return point_x; };
				
				/// @function get_point_y()
				/// @description 
				/// @param 
				static get_point_y = function() { return point_y; };
				
				/// @function get_point_angle()
				/// @description 
				/// @param 
				static get_point_angle = function() { return point_angle; };
				
				/// @function get_point_to()
				/// @description 
				/// @param 
				static get_point_to = function() { return [point_x_to, point_y_to, point_angle_to]; };
				
				/// @function get_point_x_to()
				/// @description 
				/// @param 
				static get_point_x_to = function() { return point_x_to; };
				
				/// @function get_point_y_to()
				/// @description 
				/// @param 
				static get_point_y_to = function() { return point_y_to; };
				
				/// @function get_point_angle_to()
				/// @description 
				/// @param 
				static get_point_angle_to = function() { return point_angle_to; };
				
				/// @function get_point_x_sync()
				/// @description 
				/// @param 
				static get_point_x_sync = function() { return [point_x_sync_type, point_x_sync_parameter]; };
				
				/// @function get_point_x_sync_type()
				/// @description 
				/// @param 
				static get_point_x_sync_type = function() { return point_x_sync_type; };
				
				/// @function get_point_x_sync_parameter()
				/// @description 
				/// @param 
				static get_point_x_sync_parameter = function() { return point_x_sync_parameter; };
				
				/// @function get_point_y_sync()
				/// @description 
				/// @param 
				static get_point_y_sync = function() { return [point_y_sync_type, point_y_sync_parameter]; };
				
				/// @function get_point_y_sync_type()
				/// @description 
				/// @param 
				static get_point_y_sync_type = function() { return point_y_sync_type; };
				
				/// @function get_point_y_sync_parameter()
				/// @description 
				/// @param 
				static get_point_y_sync_parameter = function() { return point_y_sync_parameter; };
				
				/// @function get_point_angle_sync()
				/// @description 
				/// @param 
				static get_point_angle_sync = function() { return [point_angle_sync_type, point_angle_sync_parameter]; };
				
				/// @function get_point_angle_sync_type()
				/// @description 
				/// @param 
				static get_point_angle_sync_type = function() { return point_angle_sync_type; };
				
				/// @function get_point_angle_sync_parameter()
				/// @description 
				/// @param 
				static get_point_angle_sync_parameter = function() { return point_angle_sync_parameter; };
				
				/// @function get_point_sync()
				/// @description 
				/// @param 
				static get_point_sync = function() { return [get_point_x_sync(), get_point_y_sync(), get_point_angle_sync()]; };
			#endregion
			#region set
				/// @function set_point(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_point = function(_x, _y, _angle) { point_x = _x; point_y = _y; point_angle = _angle; };
				
				/// @function set_point_x(x)
				/// @description 
				/// @param {real} x
				static set_point_x = function(_x) { point_x = _x; };
				
				/// @function set_point_x(y)
				/// @description 
				/// @param {real} y
				static set_point_y = function(_y) { point_y = _y; };
				
				/// @function set_point_angle(angle)
				/// @description 
				/// @param {real} angle
				static set_point_angle = function(_angle) { point_angle = _angle; };
				
				/// @function set_point_to(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_point_to = function(_x, _y, _angle) { point_x_to = _x; point_y_to = _y; point_angle_to = _angle; };
				
				/// @function set_point_x_to(x)
				/// @description 
				/// @param {real} x
				static set_point_x_to = function(_x) { point_x_to = _x; };
				
				/// @function set_point_x_to(y)
				/// @description 
				/// @param {real} y
				static set_point_y_to = function(_y) { point_y_to = _y; };
				
				/// @function set_point_angle_to(angle)
				/// @description 
				/// @param {real} angle
				static set_point_angle_to = function(_angle) { point_angle_to = _angle; };
				
				/// @function set_point_motion(x, y, angle, x_to, y_to, angle_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				/// @param {real} x_to
				/// @param {real} y_to
				/// @param {real} angle_to
				static set_point_motion = function(_x, _y, _angle, _x_to, _y_to, _angle_to)
				{
					set_point(_x, _y, _angle);
					set_point_to(_x_to, _y_to, _angle_to);
				};
				
				/// @function set_point_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_x_sync = function(_type, _parameter)
				{
					point_x_sync_type = _type;
					point_x_sync_parameter = _parameter;
				};
				
				/// @function set_point_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_x_sync_type = function(_type) { point_x_sync_type = _type; };
				
				/// @function set_point_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_x_sync_parameter = function(_parameter) { point_x_sync_parameter = _parameter; };
				
				/// @function set_point_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_y_sync = function(_type, _parameter)
				{
					point_y_sync_type = _type;
					point_y_sync_parameter = _parameter;
				};
				
				/// @function set_point_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_y_sync_type = function(_type) { point_y_sync_type = _type; };
				
				/// @function set_point_y_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_y_sync_parameter = function(_parameter) { point_y_sync_parameter = _parameter; };
				
				/// @function set_point_angle_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_angle_sync = function(_type, _parameter)
				{
					point_angle_sync_type = _type;
					point_angle_sync_parameter = _parameter;
				};
				
				/// @function set_point_angle_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_angle_sync_type = function(_type) { point_angle_sync_type = _type; };
				
				/// @function set_point_angle_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_angle_sync_parameter = function(_parameter) { point_angle_sync_parameter = _parameter; };
				
				/// @function set_point_sync(x_type, x_parameter, y_type, y_parameter, angle_type, angle_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				/// @param {type} angle_type
				/// @param {array<any>} angle_parameter
				static set_point_sync = function(_x_type, _x_parameter, _y_type, _y_parameter, _angle_type, _angle_parameter)
				{
					set_point_x_sync(_x_type, _x_parameter);
					set_point_y_sync(_y_type, _y_parameter);
					set_point_angle_sync(_angle_type, _angle_parameter);
				};
				
				/// @function set_point_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_sync_union = function(_type, _parameter)
				{
					set_point_x_sync(_type, _parameter);
					set_point_y_sync(_type, _parameter);
					set_point_angle_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region position
			#region get
				/// @function get_position()
				/// @description 
				/// @param 
				static get_position = function() { return [position_x, position_y, position_angle]; };
				
				/// @function get_position_x()
				/// @description 
				/// @param 
				static get_position_x = function() { return position_x; };
				
				/// @function get_position_y()
				/// @description 
				/// @param 
				static get_position_y = function() { return position_y; };
				
				/// @function get_position_angle()
				/// @description 
				/// @param 
				static get_position_angle = function() { return position_angle; };
				
				/// @function get_position_to()
				/// @description 
				/// @param 
				static get_position_to = function() { return [position_x_to, position_y_to, position_angle_to]; };
				
				/// @function get_position_x_to()
				/// @description 
				/// @param 
				static get_position_x_to = function() { return position_x_to; };
				
				/// @function get_position_y_to()
				/// @description 
				/// @param 
				static get_position_y_to = function() { return position_y_to; };
				
				/// @function get_position_angle_to()
				/// @description 
				/// @param 
				static get_position_angle_to = function() { return position_angle_to; };
				
				/// @function get_position_x_sync()
				/// @description 
				/// @param 
				static get_position_x_sync = function() { return [position_x_sync_type, position_x_sync_parameter]; };
				
				/// @function get_position_x_sync_type()
				/// @description 
				/// @param 
				static get_position_x_sync_type = function() { return position_x_sync_type; };
				
				/// @function get_position_x_sync_parameter()
				/// @description 
				/// @param 
				static get_position_x_sync_parameter = function() { return position_x_sync_parameter; };
				
				/// @function get_position_y_sync()
				/// @description 
				/// @param 
				static get_position_y_sync = function() { return [position_y_sync_type, position_y_sync_parameter]; };
				
				/// @function get_position_y_sync_type()
				/// @description 
				/// @param 
				static get_position_y_sync_type = function() { return position_y_sync_type; };
				
				/// @function get_position_y_sync_parameter()
				/// @description 
				/// @param 
				static get_position_y_sync_parameter = function() { return position_y_sync_parameter; };
				
				/// @function get_position_angle_sync()
				/// @description 
				/// @param 
				static get_position_angle_sync = function() { return [position_angle_sync_type, position_angle_sync_parameter]; };
				
				/// @function get_position_angle_sync_type()
				/// @description 
				/// @param 
				static get_position_angle_sync_type = function() { return position_angle_sync_type; };
				
				/// @function get_position_angle_sync_parameter()
				/// @description 
				/// @param 
				static get_position_angle_sync_parameter = function() { return position_angle_sync_parameter; };
				
				/// @function get_position_sync()
				/// @description 
				/// @param 
				static get_position_sync = function() { return [get_position_x_sync(), get_position_y_sync(), get_position_angle_sync()]; };
			#endregion
			#region set
				/// @function set_position(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_position = function(_x, _y, _angle) { position_x = _x; position_y = _y; position_angle = _angle; };
				
				/// @function set_position_x(x)
				/// @description 
				/// @param {real} x
				static set_position_x = function(_x) { position_x = _x; };
				
				/// @function set_position_x(y)
				/// @description 
				/// @param {real} y
				static set_position_y = function(_y) { position_y = _y; };
				
				/// @function set_position_angle(angle)
				/// @description 
				/// @param {real} angle
				static set_position_angle = function(_angle) { position_angle = _angle; };
				
				/// @function set_position_to(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_position_to = function(_x, _y, _angle) { position_x_to = _x; position_y_to = _y; position_angle_to = _angle; };
				
				/// @function set_position_x_to(x)
				/// @description 
				/// @param {real} x
				static set_position_x_to = function(_x) { position_x_to = _x; };
				
				/// @function set_position_x_to(y)
				/// @description 
				/// @param {real} y
				static set_position_y_to = function(_y) { position_y_to = _y; };
				
				/// @function set_position_angle_to(angle)
				/// @description 
				/// @param {real} angle
				static set_position_angle_to = function(_angle) { position_angle_to = _angle; };
				
				/// @function set_position_motion(x, y, angle, x_to, y_to, angle_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				/// @param {real} x_to
				/// @param {real} y_to
				/// @param {real} angle_to
				static set_position_motion = function(_x, _y, _angle, _x_to, _y_to, _angle_to)
				{
					set_position(_x, _y, _angle);
					set_position_to(_x_to, _y_to, _angle_to);
				};
				
				/// @function set_position_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_x_sync = function(_type, _parameter)
				{
					position_x_sync_type = _type;
					position_x_sync_parameter = _parameter;
				};
				
				/// @function set_position_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_x_sync_type = function(_type) { position_x_sync_type = _type; };
				
				/// @function set_position_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_x_sync_parameter = function(_parameter) { position_x_sync_parameter = _parameter; };
				
				/// @function set_position_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_y_sync = function(_type, _parameter)
				{
					position_y_sync_type = _type;
					position_y_sync_parameter = _parameter;
				};
				
				/// @function set_position_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_y_sync_type = function(_type) { position_y_sync_type = _type; };
				
				/// @function set_position_y_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_y_sync_parameter = function(_parameter) { position_y_sync_parameter = _parameter; };
				
				/// @function set_position_angle_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_angle_sync = function(_type, _parameter)
				{
					position_angle_sync_type = _type;
					position_angle_sync_parameter = _parameter;
				};
				
				/// @function set_position_angle_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_angle_sync_type = function(_type) { position_angle_sync_type = _type; };
				
				/// @function set_position_angle_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_angle_sync_parameter = function(_parameter) { position_angle_sync_parameter = _parameter; };
				
				/// @function set_position_sync(x_type, x_parameter, y_type, y_parameter, angle_type, angle_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				/// @param {type} angle_type
				/// @param {array<any>} angle_parameter
				static set_position_sync = function(_x_type, _x_parameter, _y_type, _y_parameter, _angle_type, _angle_parameter)
				{
					set_position_x_sync(_x_type, _x_parameter);
					set_position_y_sync(_y_type, _y_parameter);
					set_position_angle_sync(_angle_type, _angle_parameter);
				};
				
				/// @function set_position_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_sync_union = function(_type, _parameter)
				{
					set_position_x_sync(_type, _parameter);
					set_position_y_sync(_type, _parameter);
					set_position_angle_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region scale
			#region get
				/// @function get_scale()
				/// @description 
				/// @param 
				static get_scale = function() { return [scale_x, scale_y]; };
				
				/// @function get_scale_x()
				/// @description 
				/// @param 
				static get_scale_x = function() { return scale_x; };
				
				/// @function get_scale_y()
				/// @description 
				/// @param 
				static get_scale_y = function() { return scale_y; };
				
				/// @function get_scale_to()
				/// @description 
				/// @param 
				static get_scale_to = function() { return [scale_x_to, scale_y_to]; };
				
				/// @function get_scale_x_to()
				/// @description 
				/// @param 
				static get_scale_x_to = function() { return scale_x_to; };
				
				/// @function get_scale_y_to()
				/// @description 
				/// @param 
				static get_scale_y_to = function() { return scale_y_to; };
				
				/// @function get_scale_x_sync()
				/// @description 
				/// @param 
				static get_scale_x_sync = function() { return [scale_x_sync_type, scale_x_sync_parameter]; };
				
				/// @function get_scale_x_sync_type()
				/// @description 
				/// @param 
				static get_scale_x_sync_type = function() { return scale_x_sync_type; };
				
				/// @function get_scale_x_sync_parameter()
				/// @description 
				/// @param 
				static get_scale_x_sync_parameter = function() { return scale_x_sync_parameter; };
				
				/// @function get_position_y_sync()
				/// @description 
				/// @param 
				static get_scale_y_sync = function() { return [scale_y_sync_type, scale_y_sync_parameter]; };
				
				/// @function get_scale_y_sync_type()
				/// @description 
				/// @param 
				static get_scale_y_sync_type = function() { return scale_y_sync_type; };
				
				/// @function get_scale_y_sync_parameter()
				/// @description 
				/// @param 
				static get_scale_y_sync_parameter = function() { return scale_y_sync_parameter; };
				
				/// @function get_scale_sync()
				/// @description 
				/// @param 
				static get_scale_sync = function() { return [get_position_x_sync(), get_position_y_sync()]; };
			#endregion
			#region set
				/// @function set_scale(x, y)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				static set_scale = function(_x, _y) { scale_x = _x; scale_y = _y; };
				
				/// @function set_scale_x(x)
				/// @description 
				/// @param {real} x
				static set_scale_x = function(_x) { scale_x = _x; };
				
				/// @function set_scale_x(y)
				/// @description 
				/// @param {real} y
				static set_scale_y = function(_y) { scale_y = _y; };
				
				/// @function set_scale_to(x, y)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				static set_scale_to = function(_x, _y) { scale_x_to = _x; scale_y_to = _y; };
				
				/// @function set_scale_x_to(x)
				/// @description 
				/// @param {real} x
				static set_scale_x_to = function(_x) { scale_x_to = _x; };
				
				/// @function set_scale_x_to(y)
				/// @description 
				/// @param {real} y
				static set_scale_y_to = function(_y) { scale_y_to = _y; };
				
				/// @function set_scale_motion(x, y, x_to, y_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} x_to
				/// @param {real} y_to
				static set_scale_motion = function(_x, _y, _x_to, _y_to)
				{
					set_scale(_x, _y);
					set_scale_to(_x_to, _y_to);
				};
				
				/// @function set_scale_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_x_sync = function(_type, _parameter)
				{
					scale_x_sync_type = _type;
					scale_x_sync_parameter = _parameter;
				};
				
				/// @function set_scale_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_scale_x_sync_type = function(_type) { scale_x_sync_type = _type; };
				
				/// @function set_scale_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_scale_x_sync_parameter = function(_parameter) { scale_x_sync_parameter = _parameter; };
				
				/// @function set_scale_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_y_sync = function(_type, _parameter)
				{
					scale_y_sync_type = _type;
					scale_y_sync_parameter = _parameter;
				};
				
				/// @function set_scale_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_scale_y_sync_type = function(_type) { scale_y_sync_type = _type; };
				
				/// @function set_scale_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_scale_y_sync_parameter = function(_parameter) { scale_y_sync_parameter = _parameter; };
				
				/// @function set_scale_sync(x_type, x_parameter, y_type, y_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				static set_scale_sync = function(_x_type, _x_parameter, _y_type, _y_parameter)
				{
					set_scale_x_sync(_x_type, _x_parameter);
					set_scale_y_sync(_y_type, _y_parameter);
				};
				
				/// @function set_scale_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_sync_union = function(_type, _parameter)
				{
					set_scale_x_sync(_type, _parameter);
					set_scale_y_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region rotate
			#region get
				/// @function get_rotate()
				/// @description 
				/// @param 
				static get_rotate = function() { return rotate; };
				
				/// @function get_rotate_to()
				/// @description 
				/// @param 
				static get_rotate_to = function() { return rotate_to; };
				
				/// @function get_rotate_sync()
				/// @description 
				/// @param 
				static get_rotate_sync = function() { return [rotate_sync_type, rotate_sync_parameter]; };
				
				/// @function get_color_sync_type()
				/// @description 
				/// @param 
				static get_rotate_sync_type = function() { return rotate_sync_type; };
				
				/// @function get_color_sync_parameter()
				/// @description 
				/// @param 
				static get_rotate_sync_parameter = function() { return rotate_sync_parameter; };
			#endregion
			#region set
				/// @function set_rotate(rotate)
				/// @description 
				/// @param {real} rotate
				static set_rotate = function(_rotate) { rotate = _rotate; };
				
				/// @function set_rotate_to(rotate)
				/// @description 
				/// @param {real} rotate
				static set_rotate_to = function(_rotate) { rotate_to = _rotate; };
				
				/// @function set_rotate_motion(rotate, rotate_to)
				/// @description 
				/// @param {real} rotate
				/// @param {real} rotate_to
				static set_rotate_motion = function(_rotate, _rotate_to)
				{
					set_rotate(_rotate);
					set_rotate_to(_rotate_to);
				};
				
				/// @function set_rotate_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_rotate_sync = function(_type, _parameter)
				{
					rotate_sync_type = _type;
					rotate_sync_parameter = _parameter;
				};
				
				/// @function set_rotate_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_rotate_sync_type = function(_type) { rotate_sync_type = _type; };
				
				/// @function set_rotate_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_rotate_sync_parameter = function(_parameter) { rotate_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region color
			#region get
				/// @function get_color()
				/// @description 
				/// @param 
				static get_color = function() { return color; };
				
				/// @function get_color_to()
				/// @description 
				/// @param 
				static get_color_to = function() { return color_to; };
				
				/// @function get_color_sync()
				/// @description 
				/// @param 
				static get_color_sync = function() { return [color_sync_type, color_sync_parameter]; };
				
				/// @function get_color_sync_type()
				/// @description 
				/// @param 
				static get_color_sync_type = function() { return color_sync_type; };
				
				/// @function get_color_sync_parameter()
				/// @description 
				/// @param 
				static get_color_sync_parameter = function() { return color_sync_parameter; };
			#endregion
			#region set
				/// @function set_color(color)
				/// @description 
				/// @param {color} color
				static set_color = function(_color) { color = _color; };
				
				/// @function set_color_to(color)
				/// @description 
				/// @param {color} color
				static set_color_to = function(_color) { color_to = _color; };
				
				/// @function set_color_motion(color, color_to)
				/// @description 
				/// @param {color} color
				/// @param {color} color_to
				static set_color_motion = function(_color, _color_to)
				{
					set_color(_color);
					set_color_to(_color_to);
				};
				
				/// @function set_color_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_color_sync = function(_type, _parameter)
				{
					color_sync_type = _type;
					color_sync_parameter = _parameter;
				};
				
				/// @function set_color_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_color_sync_type = function(_type) { color_sync_type = _type; };
				
				/// @function set_color_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_color_sync_parameter = function(_parameter) { color_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region alpha
			#region get
				/// @function get_alpha()
				/// @description 
				/// @param 
				static get_alpha = function() { return alpha; };
				
				/// @function get_alpha_to()
				/// @description 
				/// @param 
				static get_alpha_to = function() { return alpha_to; };
				
				/// @function get_alpha_sync()
				/// @description 
				/// @param 
				static get_alpha_sync = function() { return [alpha_sync_type, alpha_sync_parameter]; };
				
				/// @function get_alpha_sync_type()
				/// @description 
				/// @param 
				static get_alpha_sync_type = function() { return alpha_sync_type; };
				
				/// @function get_alpha_sync_parameter()
				/// @description 
				/// @param 
				static get_alpha_sync_parameter = function() { return alpha_sync_parameter; };
			#endregion
			#region set
				/// @function set_alpha(alpha)
				/// @description 
				/// @param {real} alpha
				static set_alpha = function(_alpha) { alpha = _alpha; };
				
				/// @function set_alpha_to(alpha)
				/// @description 
				/// @param {real} alpha
				static set_alpha_to = function(_alpha) { alpha_to = _alpha; };
				
				/// @function set_alpha_motion(alpha, alpha_to)
				/// @description 
				/// @param {real} alpha
				/// @param {real} alpha_to
				static set_alpha_motion = function(_alpha, _alpha_to)
				{
					set_alpha(_alpha);
					set_alpha_to(_alpha_to);
				};
				
				/// @function set_alpha_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_alpha_sync = function(_type, _parameter)
				{
					alpha_sync_type = _type;
					alpha_sync_parameter = _parameter;
				};
				
				/// @function set_alpha_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_alpha_sync_type = function(_type) { alpha_sync_type = _type; };
				
				/// @function set_alpha_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_alpha_sync_parameter = function(_parameter) { alpha_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region surface
		
		#endregion
	#endregion
	
	#region Public Methods
		// Default Functions
		toString = function() { return string(key) };
		
		// Default Events
		create = function() { };
		step = function() 
		{
			var _psize = ds_list_size(part);
			
			if(aspect_previous != aspect)
			{
				modified_aspect();
			}
			
			synchronize();
			
			var _index = 0;
			repeat(_psize)
			{
				var _p = ptr(part[|_index]);
				
				_p.step();
				
				_index += 1;
			}
		};
		draw = function(_x, _y)
		{ 
			var _psize = ds_list_size(part);
			var _pdsize = ds_list_size(part_depth);
			
			var _index = (aspect == ATCHAR.ASPECT_RIGHT) ? 0 : _pdsize - 1;
			repeat(_pdsize)
			{
				var _pi = part_depth[|_index];
				var _p = ptr(part[|_pi]);
				
				_p.draw(_x, _y);
				
				_index += (aspect == ATCHAR.ASPECT_RIGHT) ? 1 : -1;
			}
		};
		destroy = function()
		{
			var _psize = ds_list_size(part);
			
			var _index = 0;
			repeat(_psize)
			{
				var _p = ptr(part[|_index]);
				
				_p.destroy();
				
				_index += 1;
			}
			
			ds_list_destroy(part);
			ds_list_destroy(part_name);
			ds_list_destroy(part_depth);
		};
		
		// Custom Functions
		synchronizer_real = function(_subjective, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_REAL_DEFAULT:
					case ATCHAR.SYNC_REAL_LINEAR:
						_value_1 = _subjective;
						_value_2 = _objective - _subjective;
						
						_value_1 += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_result = _value_1;
						break;
					case ATCHAR.SYNC_REAL_LERP:
						_result = lerp(_subjective, _objective, _parameter[0]);
						break;
				}
			}
			return _result;
		};
		
		synchronizer_rotate = function(_subjective, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_ROTATE_DEFAULT:
					case ATCHAR.SYNC_ROTATE_LINEAR:
						_value_1 = _subjective;
						_value_2 = angle_difference(_objective, _subjective);
					
						_value_1 += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
					
						_result = _value_1;
						break;
					case ATCHAR.SYNC_ROTATE_LERP:
						_value_1 = angle_difference(_objective, _subjective);
						
						_result = lerp(_subjective, _subjective + _value_1, _parameter[0]);
						break;
				}
			}
			return _result;
		};
		
		synchronizer_color = function(_subjective, _subjective_rgb, _subjective_hsv, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
			
				var _color_1 = pointer_null;
				var _color_2 = pointer_null;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_COLOR_DEFAULT:
					case ATCHAR.SYNC_COLOR_LINEAR_RGB:
						_color_2 = getColorRGB(_objective);
						
						_value_2 = _color_2[ATCHAR.COLOR_R] - _subjective_rgb[ATCHAR.COLOR_R];
						_subjective_rgb[ATCHAR.COLOR_R] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_2 = _color_2[ATCHAR.COLOR_G] - _subjective_rgb[ATCHAR.COLOR_G];
						_subjective_rgb[ATCHAR.COLOR_G] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_2 = _color_2[ATCHAR.COLOR_B] - _subjective_rgb[ATCHAR.COLOR_B];
						_subjective_rgb[ATCHAR.COLOR_B] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_1 = make_color_rgb(_subjective_rgb[@ ATCHAR.COLOR_R], _subjective_rgb[@ ATCHAR.COLOR_G], _subjective_rgb[@ ATCHAR.COLOR_B]);
						
						_color_1 = getColorHSV(_value_1);
						
						_subjective_hsv[@ ATCHAR.COLOR_H] = _color_1[ATCHAR.COLOR_H];
						_subjective_hsv[@ ATCHAR.COLOR_S] = _color_1[ATCHAR.COLOR_S];
						_subjective_hsv[@ ATCHAR.COLOR_V] = _color_1[ATCHAR.COLOR_V];
						
						_result = _value_1;
						break;
					case ATCHAR.SYNC_COLOR_LERP_RGB:
						_color_2 = getColorRGB(_objective);
						
						_subjective_rgb[@ ATCHAR.COLOR_R] = lerp(_subjective_rgb[ATCHAR.COLOR_R], _color_2[ATCHAR.COLOR_R], _parameter[0]);
						_subjective_rgb[@ ATCHAR.COLOR_G] = lerp(_subjective_rgb[ATCHAR.COLOR_G], _color_2[ATCHAR.COLOR_G], _parameter[0]);
						_subjective_rgb[@ ATCHAR.COLOR_B] = lerp(_subjective_rgb[ATCHAR.COLOR_B], _color_2[ATCHAR.COLOR_B], _parameter[0]);
						
						_value_1 = make_color_rgb(_subjective_rgb[ATCHAR.COLOR_R], _subjective_rgb[ATCHAR.COLOR_G], _subjective_rgb[ATCHAR.COLOR_B]);
						
						_color_1 = getColorHSV(_value_1);
						
						_subjective_hsv[@ ATCHAR.COLOR_H] = _color_1[ATCHAR.COLOR_H];
						_subjective_hsv[@ ATCHAR.COLOR_S] = _color_1[ATCHAR.COLOR_S];
						_subjective_hsv[@ ATCHAR.COLOR_V] = _color_1[ATCHAR.COLOR_V];
						
						_result = _value_1;
						break;
				}
			}
			return _result;
		};
		
		// Custom Events
		modified_aspect = function()
		{
			var _psize = ds_list_size(part);
			
			aspect_previous = aspect;
			
			var _index = 0;
			repeat(_psize)
			{
				var _p = ptr(part[|_index]);
				
				_p.modified_aspect();
				
				_index += 1;
			}
		};
		
		synchronize = function()
		{
			position_x = synchronizer_real(position_x, position_x_to, position_x_sync_type, position_x_sync_parameter);
			position_y = synchronizer_real(position_y, position_y_to, position_y_sync_type, position_y_sync_parameter);
			position_angle = synchronizer_real(position_angle, position_angle_to, position_angle_sync_type, position_angle_sync_parameter);
			
			scale_x = synchronizer_real(scale_x, scale_x_to, scale_x_sync_type, scale_x_sync_parameter);
			scale_y = synchronizer_real(scale_y, scale_y_to, scale_y_sync_type, scale_y_sync_parameter);
			
			rotate = synchronizer_rotate(rotate, rotate_to, rotate_sync_type, rotate_sync_parameter);
			
			color = synchronizer_color(color, color_rgb_parameter, color_hsv_parameter, color_to, color_sync_type, color_sync_parameter);
			alpha = synchronizer_real(alpha, alpha_to, alpha_sync_type, alpha_sync_parameter);
		}
	#endregion
}

/// @function atchar_part(key)
/// @description 
/// @param {key} key
function atchar_part(_key) constructor
{
	atch = "part";
	key = _key;
	
	#region Private Methods
		/// @function angularRefresh(angle)
		/// @description 
		/// @param {real} angle
		static angularRefresh = function(_angle) { return _angle mod 360 };
		
		/// @function rotationalRefresh(rotate)
		/// @description 
		/// @param {real} rotate
		static rotationalRefresh = function(_rotate) { return _rotate % 360 };
		
		/// @function getColorRGB(color)
		/// @description 
		/// @param {color} color
		static getColorRGB = function(_color) { return is_undefined(_color) ? undefined : [color_get_red(_color), color_get_green(_color), color_get_blue(_color)]; };
		
		/// @function getColorHSV(color)
		/// @description 
		/// @param {color} color
		static getColorHSV = function(_color) { return is_undefined(_color) ? undefined : [color_get_hue(_color), color_get_saturation(_color), color_get_value(_color)]; };
		
		/// @function getColorDifference(color_first, color_second)
		/// @description 
		/// @param {color} color_first
		/// @param {color} color_second
		static getColorDifference = function(_color_1, _color_2)
		{
			return make_color_rgb(
				abs(_color_1.color_rgb_parameter[ATCHAR.COLOR_R] - (255-_color_2.color_rgb_parameter[ATCHAR.COLOR_R])),
				abs(_color_1.color_rgb_parameter[ATCHAR.COLOR_G] - (255-_color_2.color_rgb_parameter[ATCHAR.COLOR_G])),
				abs(_color_1.color_rgb_parameter[ATCHAR.COLOR_B] - (255-_color_2.color_rgb_parameter[ATCHAR.COLOR_B]))
			);
		};
	#endregion
	
	#region Defualt Variables
		mainframe = undefined;
		inheritance = undefined;
		
		aspect = ATCHAR.ASPECT_RIGHT;
		aspect_previous = aspect;
		
		sprite = undefined;
		subimg = -1;
		
		point_x = 0;
		point_y = 0;
		point_angle = 0;
		point_x_to = point_x;
		point_y_to = point_y;
		point_angle_to = point_angle;
		point_x_sync_type = ATCHAR.DEFAULT;
		point_y_sync_type = ATCHAR.DEFAULT;
		point_angle_sync_type = ATCHAR.DEFAULT;
		point_x_sync_parameter = array_create(1, 1);
		point_y_sync_parameter = array_create(1, 1);
		point_angle_sync_parameter = array_create(1, 1);
		
		position_x = 0;
		position_y = 0;
		position_angle = 0;
		position_x_to = position_x;
		position_y_to = position_y;
		position_angle_to = position_angle;
		position_x_sync_type = ATCHAR.DEFAULT;
		position_y_sync_type = ATCHAR.DEFAULT;
		position_angle_sync_type = ATCHAR.DEFAULT;
		position_x_sync_parameter = array_create(1, 1);
		position_y_sync_parameter = array_create(1, 1);
		position_angle_sync_parameter = array_create(1, 1);
	
		scale_x = 1;
		scale_y = 1;
		scale_x_to = scale_x;
		scale_y_to = scale_y;
		scale_x_sync_type = ATCHAR.DEFAULT;
		scale_y_sync_type = ATCHAR.DEFAULT;
		scale_x_sync_parameter = array_create(1, 1);
		scale_y_sync_parameter = array_create(1, 1);
	
		rotate = 0;
		rotate_to = rotate;
		rotate_sync_type = ATCHAR.DEFAULT;
		rotate_sync_parameter = array_create(1, 1);
	
		color = undefined;
		color_rgb_parameter = getColorRGB(color);
		color_hsv_parameter = getColorHSV(color);
		color_to = color;
		color_sync_type = ATCHAR.DEFAULT;
		color_sync_parameter = array_create(1, 1);
	
		alpha = undefined;
		alpha_to = alpha;
		alpha_sync_type = ATCHAR.DEFAULT;
		alpha_sync_parameter = array_create(1, 1);
		
		calculated = false;
		calculated_x = 0;
		calculated_y = 0;
		calculated_angle = 0;
	#endregion
	
	#region Advanced Variables
		objective = false;
		instance_collision = noone;
	#endregion
	
	#region Default Methods
		/// @function calculate()
		/// @description 
		/// @param 
		static calculate = function()
		{
			var _result = undefined;
			
			if(calculated)
			{
				_result = [calculated_x, calculated_y, calculated_angle];
			}
			else
			{
				_result = calculator(aspect);
				
				calculated_x = _result[ATCHAR.X];
				calculated_y = _result[ATCHAR.Y];
				calculated_angle = _result[ATCHAR.ANGLE];
			
				calculated = true;
			}
			
			return _result;
		};
		
		#region inherit
			#region get
				/// @function get_mainframe()
				/// @description 
				/// @param 
				static get_mainframe = function() { return mainframe };
				
				/// @function get_inheritance()
				/// @description 
				/// @param 
				static get_inheritance = function() { return inheritance };
			#endregion
			#region set
				/// @function set_mainframe(mainframe)
				/// @description 
				/// @param {ptr} mainframe
				static set_mainframe = function(_mainframe) { mainframe = _mainframe };
				
				/// @function set_inheritance(part)
				/// @description 
				/// @param {ptr} part
				static set_inheritance = function(_part) { inheritance = _part };
			#endregion
		#endregion
		
		#region sprite
			#region get
				/// @function get_sprites()
				/// @description 
				/// @param 
				static get_sprites = function() { return [sprite, subimg] };
			
				/// @function get_sprite()
				/// @description 
				/// @param 
				static get_sprite = function() { return sprite };
			
				/// @function get_subimg()
				/// @description 
				/// @param 
				static get_subimg = function() { return subimg };
			#endregion
			#region set
				/// @function set_sprites(sprite, subimg)
				/// @description 
				/// @param {sprite} sprite
				/// @param {int} subimg
				static set_sprites = function(_sprite, _subimg) { sprite = _sprite; subimg = _subimg; };
			
				/// @function set_sprite(sprite)
				/// @description 
				/// @param {sprite} sprite
				static set_sprite = function(_sprite) { sprite = _sprite; };
			
				/// @function set_subimg(subimg)
				/// @description 
				/// @param {int} subimg
				static set_subimg = function(_subimg) { subimg = _subimg; };
			#endregion
		#endregion
		
		#region aspect
			/// @function aspect_reverse(enable_event)
			/// @description 
			/// @param {boolean} enable_event
			static aspect_reverse = function(_enable)
			{
				aspect = (aspect == ATCHAR.ASPECT_RIGHT) ? ATCHAR.ASPECT_LEFT : ATCHAR.ASPECT_RIGHT;
				if(is_undefined(_enable) ? false : _enable)
					modified_aspect();
				
				return aspect;
			};
			
			/// @function get_aspect()
			/// @description 
			/// @param 
			static get_aspect = function() { return aspect; };
			
			/// @function set_aspect(aspect)
			/// @description 
			/// @param {aspect} aspect
			static set_aspect = function(_aspect) { aspect = sign(_aspect); };
		#endregion
		
		#region point
			#region get
				/// @function get_point()
				/// @description 
				/// @param 
				static get_point = function() { return [point_x, point_y, point_angle]; };
				
				/// @function get_point_x()
				/// @description 
				/// @param 
				static get_point_x = function() { return point_x; };
				
				/// @function get_point_y()
				/// @description 
				/// @param 
				static get_point_y = function() { return point_y; };
				
				/// @function get_point_angle()
				/// @description 
				/// @param 
				static get_point_angle = function() { return point_angle; };
				
				/// @function get_point_to()
				/// @description 
				/// @param 
				static get_point_to = function() { return [point_x_to, point_y_to, point_angle_to]; };
				
				/// @function get_point_x_to()
				/// @description 
				/// @param 
				static get_point_x_to = function() { return point_x_to; };
				
				/// @function get_point_y_to()
				/// @description 
				/// @param 
				static get_point_y_to = function() { return point_y_to; };
				
				/// @function get_point_angle_to()
				/// @description 
				/// @param 
				static get_point_angle_to = function() { return point_angle_to; };
				
				/// @function get_point_x_sync()
				/// @description 
				/// @param 
				static get_point_x_sync = function() { return [point_x_sync_type, point_x_sync_parameter]; };
				
				/// @function get_point_x_sync_type()
				/// @description 
				/// @param 
				static get_point_x_sync_type = function() { return point_x_sync_type; };
				
				/// @function get_point_x_sync_parameter()
				/// @description 
				/// @param 
				static get_point_x_sync_parameter = function() { return point_x_sync_parameter; };
				
				/// @function get_point_y_sync()
				/// @description 
				/// @param 
				static get_point_y_sync = function() { return [point_y_sync_type, point_y_sync_parameter]; };
				
				/// @function get_point_y_sync_type()
				/// @description 
				/// @param 
				static get_point_y_sync_type = function() { return point_y_sync_type; };
				
				/// @function get_point_y_sync_parameter()
				/// @description 
				/// @param 
				static get_point_y_sync_parameter = function() { return point_y_sync_parameter; };
				
				/// @function get_point_angle_sync()
				/// @description 
				/// @param 
				static get_point_angle_sync = function() { return [point_angle_sync_type, point_angle_sync_parameter]; };
				
				/// @function get_point_angle_sync_type()
				/// @description 
				/// @param 
				static get_point_angle_sync_type = function() { return point_angle_sync_type; };
				
				/// @function get_point_angle_sync_parameter()
				/// @description 
				/// @param 
				static get_point_angle_sync_parameter = function() { return point_angle_sync_parameter; };
				
				/// @function get_point_sync()
				/// @description 
				/// @param 
				static get_point_sync = function() { return [get_point_x_sync(), get_point_y_sync(), get_point_angle_sync()]; };
			#endregion
			#region set
				/// @function set_point(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_point = function(_x, _y, _angle) { point_x = _x; point_y = _y; point_angle = _angle; };
				
				/// @function set_point_x(x)
				/// @description 
				/// @param {real} x
				static set_point_x = function(_x) { point_x = _x; };
				
				/// @function set_point_x(y)
				/// @description 
				/// @param {real} y
				static set_point_y = function(_y) { point_y = _y; };
				
				/// @function set_point_angle(angle)
				/// @description 
				/// @param {real} angle
				static set_point_angle = function(_angle) { point_angle = _angle; };
				
				/// @function set_point_to(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_point_to = function(_x, _y, _angle) { point_x_to = _x; point_y_to = _y; point_angle_to = _angle; };
				
				/// @function set_point_x_to(x)
				/// @description 
				/// @param {real} x
				static set_point_x_to = function(_x) { point_x_to = _x; };
				
				/// @function set_point_x_to(y)
				/// @description 
				/// @param {real} y
				static set_point_y_to = function(_y) { point_y_to = _y; };
				
				/// @function set_point_angle_to(angle)
				/// @description 
				/// @param {real} angle
				static set_point_angle_to = function(_angle) { point_angle_to = _angle; };
				
				/// @function set_point_motion(x, y, angle, x_to, y_to, angle_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				/// @param {real} x_to
				/// @param {real} y_to
				/// @param {real} angle_to
				static set_point_motion = function(_x, _y, _angle, _x_to, _y_to, _angle_to)
				{
					set_point(_x, _y, _angle);
					set_point_to(_x_to, _y_to, _angle_to);
				};
				
				/// @function set_point_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_x_sync = function(_type, _parameter)
				{
					point_x_sync_type = _type;
					point_x_sync_parameter = _parameter;
				};
				
				/// @function set_point_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_x_sync_type = function(_type) { point_x_sync_type = _type; };
				
				/// @function set_point_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_x_sync_parameter = function(_parameter) { point_x_sync_parameter = _parameter; };
				
				/// @function set_point_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_y_sync = function(_type, _parameter)
				{
					point_y_sync_type = _type;
					point_y_sync_parameter = _parameter;
				};
				
				/// @function set_point_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_y_sync_type = function(_type) { point_y_sync_type = _type; };
				
				/// @function set_point_y_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_y_sync_parameter = function(_parameter) { point_y_sync_parameter = _parameter; };
				
				/// @function set_point_angle_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_angle_sync = function(_type, _parameter)
				{
					point_angle_sync_type = _type;
					point_angle_sync_parameter = _parameter;
				};
				
				/// @function set_point_angle_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_point_angle_sync_type = function(_type) { point_angle_sync_type = _type; };
				
				/// @function set_point_angle_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_point_angle_sync_parameter = function(_parameter) { point_angle_sync_parameter = _parameter; };
				
				/// @function set_point_sync(x_type, x_parameter, y_type, y_parameter, angle_type, angle_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				/// @param {type} angle_type
				/// @param {array<any>} angle_parameter
				static set_point_sync = function(_x_type, _x_parameter, _y_type, _y_parameter, _angle_type, _angle_parameter)
				{
					set_point_x_sync(_x_type, _x_parameter);
					set_point_y_sync(_y_type, _y_parameter);
					set_point_angle_sync(_angle_type, _angle_parameter);
				};
				
				/// @function set_point_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_point_sync_union = function(_type, _parameter)
				{
					set_point_x_sync(_type, _parameter);
					set_point_y_sync(_type, _parameter);
					set_point_angle_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region position
			#region get
				/// @function get_position()
				/// @description 
				/// @param 
				static get_position = function() { return [position_x, position_y, position_angle]; };
				
				/// @function get_position_x()
				/// @description 
				/// @param 
				static get_position_x = function() { return position_x; };
				
				/// @function get_position_y()
				/// @description 
				/// @param 
				static get_position_y = function() { return position_y; };
				
				/// @function get_position_angle()
				/// @description 
				/// @param 
				static get_position_angle = function() { return position_angle; };
				
				/// @function get_position_to()
				/// @description 
				/// @param 
				static get_position_to = function() { return [position_x_to, position_y_to, position_angle_to]; };
				
				/// @function get_position_x_to()
				/// @description 
				/// @param 
				static get_position_x_to = function() { return position_x_to; };
				
				/// @function get_position_y_to()
				/// @description 
				/// @param 
				static get_position_y_to = function() { return position_y_to; };
				
				/// @function get_position_angle_to()
				/// @description 
				/// @param 
				static get_position_angle_to = function() { return position_angle_to; };
				
				/// @function get_position_x_sync()
				/// @description 
				/// @param 
				static get_position_x_sync = function() { return [position_x_sync_type, position_x_sync_parameter]; };
				
				/// @function get_position_x_sync_type()
				/// @description 
				/// @param 
				static get_position_x_sync_type = function() { return position_x_sync_type; };
				
				/// @function get_position_x_sync_parameter()
				/// @description 
				/// @param 
				static get_position_x_sync_parameter = function() { return position_x_sync_parameter; };
				
				/// @function get_position_y_sync()
				/// @description 
				/// @param 
				static get_position_y_sync = function() { return [position_y_sync_type, position_y_sync_parameter]; };
				
				/// @function get_position_y_sync_type()
				/// @description 
				/// @param 
				static get_position_y_sync_type = function() { return position_y_sync_type; };
				
				/// @function get_position_y_sync_parameter()
				/// @description 
				/// @param 
				static get_position_y_sync_parameter = function() { return position_y_sync_parameter; };
				
				/// @function get_position_angle_sync()
				/// @description 
				/// @param 
				static get_position_angle_sync = function() { return [position_angle_sync_type, position_angle_sync_parameter]; };
				
				/// @function get_position_angle_sync_type()
				/// @description 
				/// @param 
				static get_position_angle_sync_type = function() { return position_angle_sync_type; };
				
				/// @function get_position_angle_sync_parameter()
				/// @description 
				/// @param 
				static get_position_angle_sync_parameter = function() { return position_angle_sync_parameter; };
				
				/// @function get_position_sync()
				/// @description 
				/// @param 
				static get_position_sync = function() { return [get_position_x_sync(), get_position_y_sync(), get_position_angle_sync()]; };
			#endregion
			#region set
				/// @function set_position(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_position = function(_x, _y, _angle) { position_x = _x; position_y = _y; position_angle = _angle; };
				
				/// @function set_position_x(x)
				/// @description 
				/// @param {real} x
				static set_position_x = function(_x) { position_x = _x; };
				
				/// @function set_position_x(y)
				/// @description 
				/// @param {real} y
				static set_position_y = function(_y) { position_y = _y; };
				
				/// @function set_position_angle(angle)
				/// @description 
				/// @param {real} angle
				static set_position_angle = function(_angle) { position_angle = _angle; };
				
				/// @function set_position_to(x, y, angle)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				static set_position_to = function(_x, _y, _angle) { position_x_to = _x; position_y_to = _y; position_angle_to = _angle; };
				
				/// @function set_position_x_to(x)
				/// @description 
				/// @param {real} x
				static set_position_x_to = function(_x) { position_x_to = _x; };
				
				/// @function set_position_x_to(y)
				/// @description 
				/// @param {real} y
				static set_position_y_to = function(_y) { position_y_to = _y; };
				
				/// @function set_position_angle_to(angle)
				/// @description 
				/// @param {real} angle
				static set_position_angle_to = function(_angle) { position_angle_to = _angle; };
				
				/// @function set_position_motion(x, y, angle, x_to, y_to, angle_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} angle
				/// @param {real} x_to
				/// @param {real} y_to
				/// @param {real} angle_to
				static set_position_motion = function(_x, _y, _angle, _x_to, _y_to, _angle_to)
				{
					set_position(_x, _y, _angle);
					set_position_to(_x_to, _y_to, _angle_to);
				};
				
				/// @function set_position_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_x_sync = function(_type, _parameter)
				{
					position_x_sync_type = _type;
					position_x_sync_parameter = _parameter;
				};
				
				/// @function set_position_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_x_sync_type = function(_type) { position_x_sync_type = _type; };
				
				/// @function set_position_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_x_sync_parameter = function(_parameter) { position_x_sync_parameter = _parameter; };
				
				/// @function set_position_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_y_sync = function(_type, _parameter)
				{
					position_y_sync_type = _type;
					position_y_sync_parameter = _parameter;
				};
				
				/// @function set_position_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_y_sync_type = function(_type) { position_y_sync_type = _type; };
				
				/// @function set_position_y_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_y_sync_parameter = function(_parameter) { position_y_sync_parameter = _parameter; };
				
				/// @function set_position_angle_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_angle_sync = function(_type, _parameter)
				{
					position_angle_sync_type = _type;
					position_angle_sync_parameter = _parameter;
				};
				
				/// @function set_position_angle_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_position_angle_sync_type = function(_type) { position_angle_sync_type = _type; };
				
				/// @function set_position_angle_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_position_angle_sync_parameter = function(_parameter) { position_angle_sync_parameter = _parameter; };
				
				/// @function set_position_sync(x_type, x_parameter, y_type, y_parameter, angle_type, angle_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				/// @param {type} angle_type
				/// @param {array<any>} angle_parameter
				static set_position_sync = function(_x_type, _x_parameter, _y_type, _y_parameter, _angle_type, _angle_parameter)
				{
					set_position_x_sync(_x_type, _x_parameter);
					set_position_y_sync(_y_type, _y_parameter);
					set_position_angle_sync(_angle_type, _angle_parameter);
				};
				
				/// @function set_position_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_position_sync_union = function(_type, _parameter)
				{
					set_position_x_sync(_type, _parameter);
					set_position_y_sync(_type, _parameter);
					set_position_angle_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region scale
			#region get
				/// @function get_scale()
				/// @description 
				/// @param 
				static get_scale = function() { return [scale_x, scale_y]; };
				
				/// @function get_scale_x()
				/// @description 
				/// @param 
				static get_scale_x = function() { return scale_x; };
				
				/// @function get_scale_y()
				/// @description 
				/// @param 
				static get_scale_y = function() { return scale_y; };
				
				/// @function get_scale_to()
				/// @description 
				/// @param 
				static get_scale_to = function() { return [scale_x_to, scale_y_to]; };
				
				/// @function get_scale_x_to()
				/// @description 
				/// @param 
				static get_scale_x_to = function() { return scale_x_to; };
				
				/// @function get_scale_y_to()
				/// @description 
				/// @param 
				static get_scale_y_to = function() { return scale_y_to; };
				
				/// @function get_scale_x_sync()
				/// @description 
				/// @param 
				static get_scale_x_sync = function() { return [scale_x_sync_type, scale_x_sync_parameter]; };
				
				/// @function get_scale_x_sync_type()
				/// @description 
				/// @param 
				static get_scale_x_sync_type = function() { return scale_x_sync_type; };
				
				/// @function get_scale_x_sync_parameter()
				/// @description 
				/// @param 
				static get_scale_x_sync_parameter = function() { return scale_x_sync_parameter; };
				
				/// @function get_position_y_sync()
				/// @description 
				/// @param 
				static get_scale_y_sync = function() { return [scale_y_sync_type, scale_y_sync_parameter]; };
				
				/// @function get_scale_y_sync_type()
				/// @description 
				/// @param 
				static get_scale_y_sync_type = function() { return scale_y_sync_type; };
				
				/// @function get_scale_y_sync_parameter()
				/// @description 
				/// @param 
				static get_scale_y_sync_parameter = function() { return scale_y_sync_parameter; };
				
				/// @function get_scale_sync()
				/// @description 
				/// @param 
				static get_scale_sync = function() { return [get_position_x_sync(), get_position_y_sync()]; };
			#endregion
			#region set
				/// @function set_scale(x, y)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				static set_scale = function(_x, _y) { scale_x = _x; scale_y = _y; };
				
				/// @function set_scale_x(x)
				/// @description 
				/// @param {real} x
				static set_scale_x = function(_x) { scale_x = _x; };
				
				/// @function set_scale_x(y)
				/// @description 
				/// @param {real} y
				static set_scale_y = function(_y) { scale_y = _y; };
				
				/// @function set_scale_to(x, y)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				static set_scale_to = function(_x, _y) { scale_x_to = _x; scale_y_to = _y; };
				
				/// @function set_scale_x_to(x)
				/// @description 
				/// @param {real} x
				static set_scale_x_to = function(_x) { scale_x_to = _x; };
				
				/// @function set_scale_x_to(y)
				/// @description 
				/// @param {real} y
				static set_scale_y_to = function(_y) { scale_y_to = _y; };
				
				/// @function set_scale_motion(x, y, x_to, y_to)
				/// @description 
				/// @param {real} x
				/// @param {real} y
				/// @param {real} x_to
				/// @param {real} y_to
				static set_scale_motion = function(_x, _y, _x_to, _y_to)
				{
					set_scale(_x, _y);
					set_scale_to(_x_to, _y_to);
				};
				
				/// @function set_scale_x_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_x_sync = function(_type, _parameter)
				{
					scale_x_sync_type = _type;
					scale_x_sync_parameter = _parameter;
				};
				
				/// @function set_scale_x_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_scale_x_sync_type = function(_type) { scale_x_sync_type = _type; };
				
				/// @function set_scale_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_scale_x_sync_parameter = function(_parameter) { scale_x_sync_parameter = _parameter; };
				
				/// @function set_scale_y_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_y_sync = function(_type, _parameter)
				{
					scale_y_sync_type = _type;
					scale_y_sync_parameter = _parameter;
				};
				
				/// @function set_scale_y_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_scale_y_sync_type = function(_type) { scale_y_sync_type = _type; };
				
				/// @function set_scale_x_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_scale_y_sync_parameter = function(_parameter) { scale_y_sync_parameter = _parameter; };
				
				/// @function set_scale_sync(x_type, x_parameter, y_type, y_parameter)
				/// @description 
				/// @param {type} x_type
				/// @param {array<any>} x_parameter
				/// @param {type} y_type
				/// @param {array<any>} y_parameter
				static set_scale_sync = function(_x_type, _x_parameter, _y_type, _y_parameter)
				{
					set_scale_x_sync(_x_type, _x_parameter);
					set_scale_y_sync(_y_type, _y_parameter);
				};
				
				/// @function set_scale_sync_union(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_scale_sync_union = function(_type, _parameter)
				{
					set_scale_x_sync(_type, _parameter);
					set_scale_y_sync(_type, _parameter);
				};
			#endregion
		#endregion
		
		#region rotate
			#region get
				/// @function get_rotate()
				/// @description 
				/// @param 
				static get_rotate = function() { return rotate; };
				
				/// @function get_rotate_to()
				/// @description 
				/// @param 
				static get_rotate_to = function() { return rotate_to; };
				
				/// @function get_rotate_sync()
				/// @description 
				/// @param 
				static get_rotate_sync = function() { return [rotate_sync_type, rotate_sync_parameter]; };
				
				/// @function get_color_sync_type()
				/// @description 
				/// @param 
				static get_rotate_sync_type = function() { return rotate_sync_type; };
				
				/// @function get_color_sync_parameter()
				/// @description 
				/// @param 
				static get_rotate_sync_parameter = function() { return rotate_sync_parameter; };
			#endregion
			#region set
				/// @function set_rotate(rotate)
				/// @description 
				/// @param {real} rotate
				static set_rotate = function(_rotate) { rotate = _rotate; };
				
				/// @function set_rotate_to(rotate)
				/// @description 
				/// @param {real} rotate
				static set_rotate_to = function(_rotate) { rotate_to = _rotate; };
				
				/// @function set_rotate_motion(rotate, rotate_to)
				/// @description 
				/// @param {real} rotate
				/// @param {real} rotate_to
				static set_rotate_motion = function(_rotate, _rotate_to)
				{
					set_rotate(_rotate);
					set_rotate_to(_rotate_to);
				};
				
				/// @function set_rotate_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_rotate_sync = function(_type, _parameter)
				{
					rotate_sync_type = _type;
					rotate_sync_parameter = _parameter;
				};
				
				/// @function set_rotate_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_rotate_sync_type = function(_type) { rotate_sync_type = _type; };
				
				/// @function set_rotate_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_rotate_sync_parameter = function(_parameter) { rotate_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region color
			#region get
				/// @function get_color()
				/// @description 
				/// @param 
				static get_color = function() { return color; };
				
				/// @function get_color_to()
				/// @description 
				/// @param 
				static get_color_to = function() { return color_to; };
				
				/// @function get_color_sync()
				/// @description 
				/// @param 
				static get_color_sync = function() { return [color_sync_type, color_sync_parameter]; };
				
				/// @function get_color_sync_type()
				/// @description 
				/// @param 
				static get_color_sync_type = function() { return color_sync_type; };
				
				/// @function get_color_sync_parameter()
				/// @description 
				/// @param 
				static get_color_sync_parameter = function() { return color_sync_parameter; };
			#endregion
			#region set
				/// @function set_color(color)
				/// @description 
				/// @param {color} color
				static set_color = function(_color) { color = _color; };
				
				/// @function set_color_to(color)
				/// @description 
				/// @param {color} color
				static set_color_to = function(_color) { color_to = _color; };
				
				/// @function set_color_motion(color, color_to)
				/// @description 
				/// @param {color} color
				/// @param {color} color_to
				static set_color_motion = function(_color, _color_to)
				{
					set_color(_color);
					set_color_to(_color_to);
				};
				
				/// @function set_color_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_color_sync = function(_type, _parameter)
				{
					color_sync_type = _type;
					color_sync_parameter = _parameter;
				};
				
				/// @function set_color_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_color_sync_type = function(_type) { color_sync_type = _type; };
				
				/// @function set_color_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_color_sync_parameter = function(_parameter) { color_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region alpha
			#region get
				/// @function get_alpha()
				/// @description 
				/// @param 
				static get_alpha = function() { return alpha; };
				
				/// @function get_alpha_to()
				/// @description 
				/// @param 
				static get_alpha_to = function() { return alpha_to; };
				
				/// @function get_alpha_sync()
				/// @description 
				/// @param 
				static get_alpha_sync = function() { return [alpha_sync_type, alpha_sync_parameter]; };
				
				/// @function get_alpha_sync_type()
				/// @description 
				/// @param 
				static get_alpha_sync_type = function() { return alpha_sync_type; };
				
				/// @function get_alpha_sync_parameter()
				/// @description 
				/// @param 
				static get_alpha_sync_parameter = function() { return alpha_sync_parameter; };
			#endregion
			#region set
				/// @function set_alpha(alpha)
				/// @description 
				/// @param {real} alpha
				static set_alpha = function(_alpha) { alpha = _alpha; };
				
				/// @function set_alpha_to(alpha)
				/// @description 
				/// @param {real} alpha
				static set_alpha_to = function(_alpha) { alpha_to = _alpha; };
				
				/// @function set_alpha_motion(alpha, alpha_to)
				/// @description 
				/// @param {real} alpha
				/// @param {real} alpha_to
				static set_alpha_motion = function(_alpha, _alpha_to)
				{
					set_alpha(_alpha);
					set_alpha_to(_alpha_to);
				};
				
				/// @function set_alpha_sync(type, parameter)
				/// @description 
				/// @param {type} type
				/// @param {array<any>} parameter
				static set_alpha_sync = function(_type, _parameter)
				{
					alpha_sync_type = _type;
					alpha_sync_parameter = _parameter;
				};
				
				/// @function set_alpha_sync_type(type)
				/// @description 
				/// @param {type} type
				static set_alpha_sync_type = function(_type) { alpha_sync_type = _type; };
				
				/// @function set_alpha_sync_parameter(parameter)
				/// @description 
				/// @param {array<any>} parameter
				static set_alpha_sync_parameter = function(_parameter) { alpha_sync_parameter = _parameter; };
			#endregion
		#endregion
		
		#region objective
			
		#endregion
	#endregion
	
	#region Public Methods
		// Default Functions
		toString = function() { return string(key) };
		
		// Default Events
		create = function() { };
		step = function()
		{
			if(!is_undefined(mainframe))
			{
				aspect = mainframe.get_aspect();
			}
			else
			{
				if(aspect_previous != aspect)
				{
					modified_aspect();
				}
			}
			
			synchronize();
			
			calculated = false;
		};
		draw = function(_x, _y)
		{
			if(!is_undefined(sprite))
			{
				var _aspector = (aspect == ATCHAR.ASPECT_RIGHT) ? 1 : -1;
				
				var _calculated = calculate();
				
				_calculated[ATCHAR.X] += _x;
				_calculated[ATCHAR.Y] += _y;
				
				var _scale_x = scale_x * _aspector;
				var _scale_y = scale_y;
				
				var _rotate = 0;
				var _color = color;
				var _alpha = alpha;
				
				var _main = mainframe;
				if(!is_undefined(_main))
				{
					_scale_x *= _main.scale_x;
					_scale_y *= _main.scale_y;
				
					var _main_position_angle = _main.rotate + _main.position_angle;
					_calculated[ATCHAR.X] += lengthdir_x(_main.position_x, _main_position_angle) * _main.scale_x;
					_calculated[ATCHAR.Y] += lengthdir_y(_main.position_y, _main_position_angle) * _main.scale_y;
				
					_rotate += _main.rotate;
				}
				
				if(is_undefined(_color))
				{
					if(is_undefined(_main))
					{
						_color = draw_get_color();
					}
					else
					{
						_color = _main.color;
					}
				}
				else
				{
					_color = getColorDifference(_main.color, _color);
				}
				
				if(is_undefined(_alpha))
				{
					if(is_undefined(_main))
					{
						_alpha = draw_get_alpha();
					}
					else
					{
						_alpha = _main.alpha;
					}
				}
				else
				{
					_alpha *= _main.alpha;
				}
				
				draw_sprite_ext(sprite, subimg, 
					_calculated[ATCHAR.X], _calculated[ATCHAR.Y], 
					_scale_x, _scale_y, 
					(_calculated[ATCHAR.ANGLE] + _rotate) * _aspector, 
					_color, _alpha
				);
			}
		};
		destroy = function() { };
		clean = function() { };
		
		// Custom Functions
		calculator = function(_aspect)
		{
			var _result = undefined;
			var _aspector = (aspect == ATCHAR.ASPECT_RIGHT) ? 1 : -1;
			
			var _result_x, _result_y, _result_angle;
			
			var _point_angle = point_angle;
			var _position_angle = position_angle;
			
			var _rotate = rotate;
			
			var _inherit = inheritance;
			var _inherit_x = 0;
			var _inherit_y = 0;
			var _inherit_angle = 0;
			
			var _main = mainframe;
			if(!is_undefined(_main))
			{
				_point_angle += _main.rotate;
				_position_angle += _main.rotate;
				
				//_rotate += _main.rotate;
			}
			
			if(!is_undefined(_inherit))
			{
				var _calculated = _inherit.calculate();
				
				_inherit_x = _calculated[ATCHAR.X];
				_inherit_y = _calculated[ATCHAR.Y];
				_inherit_angle = _calculated[ATCHAR.ANGLE];
			}
			
			var _pi_angle = (_point_angle + _inherit_angle);
			var _po_angle = (_position_angle + _inherit_angle);
			
			_result_x = (lengthdir_x(point_x, _pi_angle) * scale_x) * _aspector + (lengthdir_x(position_x, _po_angle) * scale_x) + _inherit_x;
			_result_y = (lengthdir_y(point_y, _pi_angle) * scale_y) + (lengthdir_y(position_y, _po_angle) * scale_y) + _inherit_y;
			_result_angle = _rotate + _inherit_angle;
			
			_result = [_result_x, _result_y, _result_angle];
			return _result;
		};
		
		synchronizer_real = function(_subjective, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_REAL_DEFAULT:
					case ATCHAR.SYNC_REAL_LINEAR:
						_value_1 = _subjective;
						_value_2 = _objective - _subjective;
						
						_value_1 += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_result = _value_1;
						break;
					case ATCHAR.SYNC_REAL_LERP:
						_result = lerp(_subjective, _objective, _parameter[0]);
						break;
				}
			}
			return _result;
		};
		
		synchronizer_rotate = function(_subjective, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_ROTATE_DEFAULT:
					case ATCHAR.SYNC_ROTATE_LINEAR:
						_value_1 = _subjective;
						_value_2 = angle_difference(_objective, _subjective);
					
						_value_1 += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
					
						_result = _value_1;
						break;
					case ATCHAR.SYNC_ROTATE_LERP:
						_value_1 = angle_difference(_objective, _subjective);
						
						_result = lerp(_subjective, _subjective + _value_1, _parameter[0]);
						break;
				}
			}
			return _result;
		};
		
		synchronizer_color = function(_subjective, _subjective_rgb, _subjective_hsv, _objective, _type, _parameter)
		{
			var _result = _subjective;
			
			if(_subjective != _objective)
			{
				var _value_1 = 0;
				var _value_2 = 0;
			
				var _color_1 = pointer_null;
				var _color_2 = pointer_null;
				
				switch(_type)
				{
					default:
					case ATCHAR.SYNC_COLOR_DEFAULT:
					case ATCHAR.SYNC_COLOR_LINEAR_RGB:
						_color_2 = getColorRGB(_objective);
						
						_value_2 = _color_2[ATCHAR.COLOR_R] - _subjective_rgb[ATCHAR.COLOR_R];
						_subjective_rgb[ATCHAR.COLOR_R] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_2 = _color_2[ATCHAR.COLOR_G] - _subjective_rgb[ATCHAR.COLOR_G];
						_subjective_rgb[ATCHAR.COLOR_G] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_2 = _color_2[ATCHAR.COLOR_B] - _subjective_rgb[ATCHAR.COLOR_B];
						_subjective_rgb[ATCHAR.COLOR_B] += (abs(_value_2) >= _parameter[0]) ? sign(_value_2) * _parameter[0] : _value_2;
						
						_value_1 = make_color_rgb(_subjective_rgb[@ ATCHAR.COLOR_R], _subjective_rgb[@ ATCHAR.COLOR_G], _subjective_rgb[@ ATCHAR.COLOR_B]);
						
						_color_1 = getColorHSV(_value_1);
						
						_subjective_hsv[@ ATCHAR.COLOR_H] = _color_1[ATCHAR.COLOR_H];
						_subjective_hsv[@ ATCHAR.COLOR_S] = _color_1[ATCHAR.COLOR_S];
						_subjective_hsv[@ ATCHAR.COLOR_V] = _color_1[ATCHAR.COLOR_V];
						
						_result = _value_1;
						break;
					case ATCHAR.SYNC_COLOR_LERP_RGB:
						_color_2 = getColorRGB(_objective);
						
						_subjective_rgb[@ ATCHAR.COLOR_R] = lerp(_subjective_rgb[ATCHAR.COLOR_R], _color_2[ATCHAR.COLOR_R], _parameter[0]);
						_subjective_rgb[@ ATCHAR.COLOR_G] = lerp(_subjective_rgb[ATCHAR.COLOR_G], _color_2[ATCHAR.COLOR_G], _parameter[0]);
						_subjective_rgb[@ ATCHAR.COLOR_B] = lerp(_subjective_rgb[ATCHAR.COLOR_B], _color_2[ATCHAR.COLOR_B], _parameter[0]);
						
						_value_1 = make_color_rgb(_subjective_rgb[ATCHAR.COLOR_R], _subjective_rgb[ATCHAR.COLOR_G], _subjective_rgb[ATCHAR.COLOR_B]);
						
						_color_1 = getColorHSV(_value_1);
						
						_subjective_hsv[@ ATCHAR.COLOR_H] = _color_1[ATCHAR.COLOR_H];
						_subjective_hsv[@ ATCHAR.COLOR_S] = _color_1[ATCHAR.COLOR_S];
						_subjective_hsv[@ ATCHAR.COLOR_V] = _color_1[ATCHAR.COLOR_V];
						
						_result = _value_1;
						break;
				}
			}
			return _result;
		};
		
		// Custom Events
		modified_aspect = function()
		{
			aspect_previous = aspect;
		};
		
		synchronize = function()
		{
			point_x = synchronizer_real(point_x, point_x_to, point_x_sync_type, point_x_sync_parameter);
			point_y = synchronizer_real(point_y, point_y_to, point_y_sync_type, point_y_sync_parameter);
			point_angle = synchronizer_real(point_angle, point_angle_to, point_angle_sync_type, point_angle_sync_parameter);
			
			position_x = synchronizer_real(position_x, position_x_to, position_x_sync_type, position_x_sync_parameter);
			position_y = synchronizer_real(position_y, position_y_to, position_y_sync_type, position_y_sync_parameter);
			position_angle = synchronizer_real(position_angle, position_angle_to, position_angle_sync_type, position_angle_sync_parameter);
			
			scale_x = synchronizer_real(scale_x, scale_x_to, scale_x_sync_type, scale_x_sync_parameter);
			scale_y = synchronizer_real(scale_y, scale_y_to, scale_y_sync_type, scale_y_sync_parameter);
			
			rotate = synchronizer_rotate(rotate, rotate_to, rotate_sync_type, rotate_sync_parameter);
			
			color = synchronizer_color(color, color_rgb_parameter, color_hsv_parameter, color_to, color_sync_type, color_sync_parameter);
			alpha = synchronizer_real(alpha, alpha_to, alpha_sync_type, alpha_sync_parameter);
		}
	#endregion
}

function atchar_animator() constructor
{
	atchar = atchar_mainframe("mainframe");
	
	frame = 15;
	time = 0;
	length = 0;
	
	tick = 0;
	
	camera_x = 0;
	camera_y = 0;
	
	menu = 0;
	menu_type = 0;
	
	buttons = ds_list_create();
	
	create = function()
	{
		
	}
	
	step = function()
	{
		
	}
	
	draw = function()
	{
		switch(menu)
		{
			default:
				break;
		}
	}
	
	button = function(_x, _y, _w, _h) constructor
	{
		x = _x;
		y = _y;
		
		width = _w;
		height = _h;
		
		color_outline = c_white;
		color_background = undefined;
		color_foreground = c_white;
		
		color_outline_pressed = undefined;
		color_background_pressed = c_white; 
		color_foreground_pressed = c_black;
		
		alpha_outline = 1;
		alpha_background = 1;
		alpha_foreground = 1;
		
		alpha_outline_pressed = 1;
		alpha_background_pressed = 1;
		alpha_foreground_pressed = 1;
		
		contains = [];
		container_type = ATCHAR.CONTAINER_DEFAULT;
		
		pressed = false;
		pressing = 0;
		
		run = function()
		{
			return undefined;
		}
		
		mouse_event = function()
		{
			var _result = undefined;
			
			if(mouse_check_button(mb_left) or mouse_check_button_pressed(mb_left))
			{
				if(point_in_rectangle(mouse_x, mouse_y, x-width, y-height, x+width, y+height))
				{
					pressed = true;
					
					_result = run();
					
					pressing += 1;
				}
			}
			
			if(mouse_check_button_released(mb_left))
			{
				pressed = false;
				pressing = 0;
			}
			
			return _result;
		};
		
		container = function(_color, _alpha)
		{
			var _pcolor = draw_get_color();
			var _palpha = draw_get_alpha();
			
			draw_set_color(_color);
			draw_set_alpha(_alpha);
			
			switch(container_type)
			{
				default:
				case ATCHAR.CONTAINER_DEFAULT:
				case ATCHAR.CONTAINER_STRING:
				case ATCHAR.CONTAINER_REAL:
					if(is_array(contains))
					{
						var _font = draw_get_font();
						
						draw_set_font(contains[1]);
						draw_text(x, y, string(contains[0]));
						
						draw_set_font(_font);
					}
					else
					{
						draw_text(x, y, string(contains));
					}
					break;
				case ATCHAR.CONTAINER_SPRITE:
					if(is_array(contains))
					{
						draw_sprite_ext(contains[0], contains[1], x, y, contains[2], contains[3], contains[4], _color, _alpha);
					}
					else
					{
						draw_sprite(contains, -1, x, y);
					}
					break;
			}
			
			draw_set_color(_pcolor);
			draw_set_alpha(_palpha);
		}
		
		/// @function draw_rectangle_primitive(x1, y1, x2, y2, color, alpha, outline)
		/// @description 
		/// @param {real} x1
		/// @param {real} y1
		/// @param {real} x2
		/// @param {real} y2
		/// @param {color} color
		/// @param {real} alpha
		/// @param {boolean} outline
		static draw_rectangle_primitive = function(_x1, _y1, _x2, _y2, _color, _alpha, _outline)
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
		
		step = function()
		{
			return mouse_event();
		};
		
		draw = function()
		{
			var _x1 = x-width;
			var _y1 = y-height;
			var _x2 = x+width;
			var _y2 = y+height;
			
			var _pressed = pressed;
			
			if(!pressed)
			{
				if(!is_undefined(color_outline))
				{
					draw_rectangle_primitive(_x1, _y1, _x2, _y2, color_outline, alpha_outline, true);
				}
				if(!is_undefined(color_background))
				{
					draw_rectangle_primitive(_x1, _y1, _x2, _y2, color_background, alpha_background, false);
				}
				
				if(!is_undefined(color_foreground))
				{
					container(color_foreground, alpha_foreground);
				}
			}
			else
			{
				if(!is_undefined(color_outline_pressed))
				{
					draw_rectangle_primitive(_x1, _y1, _x2, _y2, color_outline_pressed, alpha_outline_pressed, true);
				}
				if(!is_undefined(color_background_pressed))
				{
					draw_rectangle_primitive(_x1, _y1, _x2, _y2, color_background_pressed, alpha_background_pressed, true);
				}
				
				if(!is_undefined(color_foreground_pressed))
				{
					container(color_foreground_pressed, alpha_foreground_pressed);
				}
			}
		};
	};
	
	slider = function(_x, _y, _length, _height)
	{
		
	};
}

/// @function is_atchar(atch)
/// @description
/// @param atch
function is_atchar(_atch)
{
	return (is_struct(_atch) and variable_struct_exists(_atch, "atch"));
}