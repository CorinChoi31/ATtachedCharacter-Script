///dsc_get_motion_control(part);
function dsc_get_motion_control(argument0) {

	///@desciption dsc_get_motion_control(part)
	///@function dsc_get_motion_control(part)

	///@param part

	/* Explantion and Caution of this script;
		Retrun Default Rotation (Reset Angle) of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument0;

	var _def = 0;

	if(arg0 = "body" or arg0 = 1)
	{
	    _def = mDefBody;
	}
	if(arg0 = "head" or arg0 = 2)
	{
	    _def = mDefHead;
	}
	if(arg0 = "leftarm" or arg0 = 3)
	{
	    _def = mDefLeft[0];
	}
	if(arg0 = "leftforearm" or arg0 = 4)
	{
	    _def = mDefLeft[1];
	}
	if(arg0 = "leftlap" or arg0 = 5)
	{
	    _def = mDefLeft[2];
	}
	if(arg0 = "leftleg" or arg0 = 6)
	{
	    _def = mDefLeft[3];
	}
	if(arg0 = "rightarm" or arg0 = 7)
	{
	    _def = mDefRight[0];
	}
	if(arg0 = "rightforearm" or arg0 = 8)
	{
	    _def = mDefRight[1];
	}
	if(arg0 = "rightlap" or arg0 = 9)
	{
	    _def = mDefRight[2];
	}
	if(arg0 = "rightleg" or arg0 = 10)
	{
	    _def = mDefRight[3];
	}

	return _def = 0;




}
