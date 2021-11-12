///dsc_set_additional_handed(direction, sprite, sumbimg, x , y, rot, additional angle);
function dsc_set_additional_handed() {

	///@desciption dsc_set_additional_handed(direction,sprite,sumbimg,x,y,rot,additional_angle)
	///@function dsc_set_additional_handed(direction,sprite,sumbimg,x,y,rot,additional_angle)

	///@param direction
	///@param sprite
	///@param sumbimg
	///@param x
	///@param y
	///@param rot
	///@param additional_angle

	/* Explantion and Caution of this script;
		Set An Equipment on Hand
	
		additional_angle = correction gap when direction change
	*/

	if(argument[0] = DSC.NONE or argument[0] = noone)
	{
	    mPSARhand[0] = -1; mPSARhand[1] = -1; mPSARhand[2] = -1; mPSARhand[3] = -1; mPSARhand[4] = -1; mPSARhand[5] = -1;
	    mPSALhand[0] = -1; mPSALhand[1] = -1; mPSALhand[2] = -1; mPSALhand[3] = -1; mPSALhand[4] = -1; mPSALhand[5] = -1;
	}
	else
	{
	    var arg0 = argument[0];
	    var arg1 = argument[1];
	    var arg2 = argument[2];
	    var arg3 = argument[3];
	    var arg4 = argument[4];
	    var arg5 = argument[5];
	    var arg6 = argument[6];
    
	    if(arg0 = DSC.DIRECTION_RIGHT or arg0 = 1)
	    {
	        mPSARhand[0] = arg1;
	        mPSARhand[1] = arg2;
	        mPSARhand[2] = arg3;
	        mPSARhand[3] = arg4;
	        mPSARhand[4] = arg5;
	        mPSARhand[5] = arg6;
	    }
	    if(arg0 = DSC.DIRECTION_LEFT or arg0 = -1)
	    {
	        mPSALhand[0] = arg1;
	        mPSALhand[1] = arg2;
	        mPSALhand[2] = arg3;
	        mPSALhand[3] = arg4;
	        mPSALhand[4] = arg5;
	        mPSALhand[5] = arg6;
	    }
	}



}
