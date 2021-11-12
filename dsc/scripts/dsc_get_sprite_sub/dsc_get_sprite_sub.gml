///dsc_get_sprite_sub(part);
function dsc_get_sprite_sub() {

	///@desciption dsc_get_sprite_sub(part)
	///@function dsc_get_sprite_sub(part)

	///@param part

	/* Explantion and Caution of this script;
		Return Sprite Sub-image Index of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0]; //animating part

	var _spr = 0;

	if(arg0 = "body" or arg0 = 1)
	{
	    _spr = mPSBbody;
	}
	if(arg0 = "head" or arg0 = 2)
	{
	    _spr = mPSBhead;
	}
	if(arg0 = "leftarm" or arg0 = 3)
	{
	    _spr = mPSBL[0];
	}
	if(arg0 = "leftforearm" or arg0 = 4)
	{
	    _spr = mPSBL[1];
	}
	if(arg0 = "leftlap" or arg0 = 5)
	{
	    _spr = mPSBL[2];
	}
	if(arg0 = "leftleg" or arg0 = 6)
	{
	    _spr = mPSBL[3];
	}
	if(arg0 = "rightarm" or arg0 = 7)
	{
	    _spr = mPSBR[0];
	}
	if(arg0 = "rightforearm" or arg0 = 8)
	{
	    _spr = mPSBR[1];
	}
	if(arg0 = "rightlap" or arg0 = 9)
	{
	    _spr = mPSBR[2];
	}
	if(arg0 = "rightleg" or arg0 = 10)
	{
	    _spr = mPSBR[3];
	}

	return _spr;




}
