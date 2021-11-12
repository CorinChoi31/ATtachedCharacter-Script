///dsc_get_motion_rot(part, value type, relative);
function dsc_get_motion_rot() {

	///@desciption dsc_get_motion_rot(part,value_type,relative)
	///@function dsc_get_motion_rot(part,value_type,relative)

	///@param part
	///@param value_type
	///@param relative

	/* Explantion and Caution of this script;
		Return Anlge of Part
	
	    part = "all", "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	    value type = 
	    {
	        0 = real value of rotation; (default; "body" will return mR);
	        1 = drawing value of rotation; ("body" will return mL[0]+imageA);
	    }
	    relative = 
	    {
	        0 = nothing to add
	        1 = will add relative value at return, _rot + imageRA; (not apply at "all" and "body") this is add real value of rotation;
	        2 = will add relative value at return, _rot + imageA; (not apply at "all" and "body") this is add drawing value of rotation;
	    }
	*/

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];

	var _rot = 0;

	if(arg0 = "all" or arg0 = 0)
	{
	    if(arg1 = 0)
	        _rot = imageRA;
	    if(arg1 = 1)
	        _rot = imageA;
	}
	else if(arg0 = "body" or arg0 = 1)
	{
	    if(arg1 = 0)
	        _rot = mR;
	    if(arg1 = 1)
	        _rot = mL[0]//+imageA;
	}
	else if(arg0 = "head" or arg0 = 2)
	{
	    if(arg1 = 0)
	        _rot = mH;
	    if(arg1 = 1)
	        _rot = mL[1]//+mL[0]+imageA;
	}
	else if(arg0 = "leftarm" or arg0 = 3)
	{
	    if(arg1 = 0)
	        _rot = mRL[0];
	    if(arg1 = 1)
	        _rot = imageR[0]//+imageA;
	}
	else if(arg0 = "leftforearm" or arg0 = 4)
	{
	    if(arg1 = 0)
	        _rot = mRL[1];
	    if(arg1 = 1)
	        _rot = imageR[1]//+imageR[0]+imageA;
	}
	else if(arg0 = "leftlap" or arg0 = 5)
	{
	    if(arg1 = 0)
	        _rot = mRL[2];
	    if(arg1 = 1)
	        _rot = imageR[2]//+imageA;
	}
	else if(arg0 = "leftleg" or arg0 = 6)
	{
	    if(arg1 = 0)
	        _rot = mRL[3];
	    if(arg1 = 1)
	        _rot = imageR[3]//+imageR[2]+imageA;
	}
	else if(arg0 = "rightarm" or arg0 = 7)
	{
	    if(arg1 = 0)
	        _rot = mRR[0];
	    if(arg1 = 1)
	        _rot = imageR[4]//+imageA;
	}
	else if(arg0 = "rightforearm" or arg0 = 8)
	{
	    if(arg1 = 0)
	        _rot = mRR[1];
	    if(arg1 = 1)
	        _rot = imageR[5]//+imageR[4]+imageA;
	}
	else if(arg0 = "rightlap" or arg0 = 9)
	{
	    if(arg1 = 0)
	        _rot = mRR[2];
	    if(arg1 = 1)
	        _rot = imageR[6]//+imageA;
	}
	else if(arg0 = "rightleg" or arg0 = 10)
	{
	    if(arg1 = 0)
	        _rot = mRR[3];
	    if(arg1 = 1)
	        _rot = imageR[7]//+imageR[6]+imageA;
	}
	if(arg2 = 0)
	{

	}
	else if(arg2 = 1)
	{
	    if(arg0 != "all" and arg0 != "body")
	    {
	        _rot += imageRA;
	    }
	}
	else if(arg2 = 2)
	{
	    if(arg0 != "all" and arg0 != "body")
	    {
	        _rot += imageA;
	    }
	}

	return _rot;




}
