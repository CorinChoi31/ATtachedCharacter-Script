///dsc_hallucination(color,alpha,step,scale,depth);
function dsc_hallucination() {

	///@desciption dsc_hallucination(color,alpha,step,scale,depth)
	///@function dsc_hallucination(color,alpha,step,scale,depth)

	///@param color
	///@param alpha
	///@param step
	///@param scale
	///@param depth

	/* Explantion and Caution of this script;
	    Please use 64*64 pixels sprite.
    
	    Creating Hallucination Object with "OC_Hallucination"
	*/

	var _ins = instance_create_depth(x,y,argument[4],OC_Hallucination);
	//var _ins = instance_create(x,y,OC_Hallucination);
	_ins._color = argument[0];
	_ins._alpha = argument[1];
	_ins._step = argument[2];
	_ins._scale = argument[3];
	//_ins.depth = argument[4];

	var _spr = 0;
	var _sprsub = 0;
	var _sprani = 0;

	for(var i = 0; i < 10; i++)
	{
		_spr[i] = dsc_get_sprite(i+1);
	}
	for(var i = 0; i < 10; i++)
	{
		_sprsub[i] = dsc_get_sprite_sub(i+1);
	}
	for(var i = 0; i < 10; i++)
	{
		_sprani[i] = dsc_get_motion_rot(i+1,1,0);
	}

	with(_ins)
	{
		dsc_init();
		for(var i = 1; i <= 10; i++)
		{
			dsc_set_sprite(i,_spr[i-1]);
		}
		for(var i = 1; i <= 10; i++)
		{
			dsc_set_sprite_sub_part(i,_sprsub[i-1]);
		}
		for(var i = 1; i <= 10; i++)
		{
			dsc_set_motion_part(i,_sprani[i-1]);
		}
	
		imageRX = other.imageRX;
		imageRY = other.imageRY;
		imageD = other.imageD;
		imageRA = other.imageRA;
	
		mPLheadX = other.mPLheadX; mPLheadY = other.mPLheadY;
		mPLArmX[0] = other.mPLArmX[0]; mPLArmX[1] = other.mPLArmX[1];
		mPLArmY[0] = other.mPLArmY[0]; mPLArmY[1] = other.mPLArmY[1];
		mPLForeArmX[0] = other.mPLForeArmX[0]; mPLForeArmX[1] = other.mPLForeArmX[1];
		mPLForeArmY[0] = other.mPLForeArmY[0]; mPLForeArmY[1] = other.mPLForeArmY[1];
		mPLlapX = other.mPLlapX; mPLlapY = other.mPLlapY;
		mPLlegX = other.mPLlegX; mPLlegY = other.mPLlegY;
	}


}
