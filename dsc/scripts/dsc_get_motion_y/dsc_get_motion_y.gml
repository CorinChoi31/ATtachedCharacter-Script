///dsc_get_motion_y(part, value type, relative, direction);
function dsc_get_motion_y() {

	///@desciption dsc_get_motion_y(part,value_type,relative,direction)
	///@function dsc_get_motion_y(part,value_type,relative,direction)

	///@param part
	///@param value_type
	///@param relative
	///@param direction

	/* Explantion and Caution of this script;
		Return x-coordinate of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	    value type = 
	    {
	        0 = real value of rotation; (default; "head" will return lengthdir_y(16,90+mH);
	        1 = drawing value of rotation; ("head" will return lengthdir_y(16,90+mL[0]+imageA);
	    }
	    relative = 
	    {
	        0 = nothing to add
	        1 = will add relative value at return, imageRY;
	    }
		direction = Left or Right
	*/

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];

	var _y = 0;

	if(arg0 = "body" or arg0 = 1)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(0,0);
	    if(arg1 = 1)
	        _y = lengthdir_y(0,0);
	}
	else if(arg0 = "head" or arg0 = 2)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(mPLheadY,90+mH+imageRA);
	    if(arg1 = 1)
	        _y = lengthdir_y(mPLheadY,90+mL[0]+imageA);
	}
	else if(arg0 = "leftarm" or arg0 = 3)
	{
	    if(arg3 = DSC.DIRECTION_RIGHT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[0],135+mRL[0]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[0],135+mL[0]+imageA);
	    }
	    if(arg3 = DSC.DIRECTION_LEFT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[1],135+mRL[0]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[1],135+mL[0]+imageA);
	    }
	}
	else if(arg0 = "leftforearm" or arg0 = 4)
	{
	    if(arg3 = DSC.DIRECTION_RIGHT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[0],135+mRL[1]+imageRA)+lengthdir_y(mPLForeArmY[0],270+mRL[1]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[0],135+mL[0]+imageA)+lengthdir_y(mPLForeArmY[0],270+imageR[0]+imageA);
	    }
	    if(arg3 = DSC.DIRECTION_LEFT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[1],135+mRL[1]+imageRA)+lengthdir_y(mPLForeArmY[1],270+mRL[1]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[1],135+mL[0]+imageA)+lengthdir_y(mPLForeArmY[1],270+imageR[0]+imageA);
	    }
	}
	else if(arg0 = "leftlap" or arg0 = 5)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(mPLlapY,240+mRL[2]+imageRA);
	    if(arg1 = 1)
	        _y = lengthdir_y(mPLlapY,240+mL[0]+imageA);
	}
	else if(arg0 = "leftleg" or arg0 = 6)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(mPLlapY,240+mRL[3]+imageRA)+lengthdir_y(mPLlegY,270+mRL[3]+imageRA);
	    if(arg1 = 1)
	        _y = lengthdir_y(mPLlapY,240+mL[0]+imageA)+lengthdir_y(mPLlegY,270+imageR[2]+imageA);
	}
	else if(arg0 = "rightarm" or arg0 = 7)
	{
	    if(arg3 = DSC.DIRECTION_RIGHT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[1],45+mRR[0]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[1],45+mL[0]+imageA);
	    }
	    if(arg3 = DSC.DIRECTION_LEFT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[0],45+mRR[0]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[0],45+mL[0]+imageA);
	    }
	}
	else if(arg0 = "rightforearm" or arg0 = 8)
	{
	    if(arg3 = DSC.DIRECTION_RIGHT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[1],45+mRR[1]+imageRA)+lengthdir_y(mPLForeArmY[1],270+mRR[1]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[1],45+mL[0]+imageA)+lengthdir_y(mPLForeArmY[1],270+imageR[4]+imageA);
	    }
	    if(arg3 = DSC.DIRECTION_LEFT)
	    {
	        if(arg1 = 0)
	            _y = lengthdir_y(mPLArmY[0],45+mRR[1]+imageRA)+lengthdir_y(mPLForeArmY[0],270+mRR[1]+imageRA);
	        if(arg1 = 1)
	            _y = lengthdir_y(mPLArmY[0],45+mL[0]+imageA)+lengthdir_y(mPLForeArmY[0],270+imageR[4]+imageA);
	    }
	}
	else if(arg0 = "rightlap" or arg0 = 9)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(mPLlapY,300+mRR[2]+imageRA);
	    if(arg1 = 1)
	        _y = lengthdir_y(mPLlapY,300+mL[0]+imageA);
	}
	else if(arg0 = "rightleg" or arg0 = 10)
	{
	    if(arg1 = 0)
	        _y = lengthdir_y(mPLlapY,300+mRR[3]+imageRA)+lengthdir_y(mPLlegY,270+mRR[3]+imageRA);
	    if(arg1 = 1)
	        _y = lengthdir_y(mPLlapY,300+mL[0]+imageA)+lengthdir_y(mPLlegY,270+imageR[6]+imageA);
	}

	if(arg2 = 0)
	{

	}
	else if(arg2 = 1)
	{
	    _y += imageRY;
	}

	return _y;




}
