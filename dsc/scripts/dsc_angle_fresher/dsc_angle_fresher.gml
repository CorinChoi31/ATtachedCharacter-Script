///dsc_rotate_fresher(angle)
function dsc_angle_fresher(argument0) {

	///@desciption dsc_rotate_fresher(angle)
	///@function dsc_rotate_fresher(angle)

	///@param angle

	/* Explantion and Caution of this script;
	    Set Value 0 to 360
	*/

	var arg0 = argument0;

	var _re = 0;

	if(arg0 >= 0)
	{
	    _re = arg0%360;
	}
	else
	{
	    _re = arg0%360+360;
	}

	return _re;



}
