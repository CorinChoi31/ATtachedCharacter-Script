///dsc_get_control(part);
function dsc_get_control() {

	///@desciption dsc_get_control(part)
	///@function dsc_get_control(part)

	///@param part

	/* Explantion and Caution of this script;
		Return Reset Tick of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg", "min", "max" or ENUM on dsc_script() 
	*/
	var arg0 = argument[0]; //animating part

	var _cot = 0;

	if(arg0 = "body" or arg0 = 1)
	{
	    _cot = mBodT;
	}
	if(arg0 = "head" or arg0 = 2)
	{
	    _cot = mHeaT;
	}
	if(arg0 = "leftarm" or arg0 = 3)
	{
	    _cot = mLefT[0];
	}
	if(arg0 = "leftforearm" or arg0 = 4)
	{
	    _cot = mLefT[1];
	}
	if(arg0 = "leftlap" or arg0 = 5)
	{
	    _cot = mLefT[2];
	}
	if(arg0 = "leftleg" or arg0 = 6)
	{
	    _cot = mLefT[3];
	}
	if(arg0 = "rightarm" or arg0 = 7)
	{
	    _cot = mRigT[0];
	}
	if(arg0 = "rightforearm" or arg0 = 8)
	{
	    _cot = mRigT[1];
	}
	if(arg0 = "rightlap" or arg0 = 9)
	{
	    _cot = mRigT[2];
	}
	if(arg0 = "rightleg" or arg0 = 10)
	{
	    _cot = mRigT[3];
	}
	if(arg0 = "max" or arg0 = -1)
	{
	    _cot = max(mBodT,mHeaT,mLefT[0],mLefT[1],mLefT[2],mLefT[3],mRigT[0],mRigT[1],mRigT[2],mRigT[3]);
	}
	if(arg0 = "min" or arg0 = -2)
	{
	    _cot = min(mBodT,mHeaT,mLefT[0],mLefT[1],mLefT[2],mLefT[3],mRigT[0],mRigT[1],mRigT[2],mRigT[3]);
	}

	return _cot;




}
