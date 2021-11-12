///dsc_get_control_pinned(part);
function dsc_get_control_pinned() {

	///@desciption dsc_get_control_pinned(part)
	///@function dsc_get_control_pinned(part)

	///@param part

	/* Explantion and Caution of this script;
		Return Pinned State of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0];

	var _pin = 0;

	if(arg0 = "body" or arg0 = 1)
	    if(mBodP = 1)
	        _pin = mBodPT;
	if(arg0 = "head" or arg0 = 2)
	    if(mHeaP = 1)
	        _pin = mHeaPT;
	if(arg0 = "leftarm" or arg0 = 3)
	    if(mLefP[0] = 1)
	        _pin = mLefPT[0];
	if(arg0 = "leftforearm" or arg0 = 4)
	    if(mLefP[1] = 1)
	        _pin = mLefPT[1];
	if(arg0 = "leftlap" or arg0 = 5)
	    if(mLefP[2] = 1)
	        _pin = mLefPT[2];
	if(arg0 = "leftleg" or arg0 = 6)
	    if(mLefP[3] = 1)
	        _pin = mLefPT[3];
	if(arg0 = "rightarm" or arg0 = 7)
	    if(mRigP[0] = 1)
	        _pin = mRigPT[0];
	if(arg0 = "rightforearm" or arg0 = 8)
	    if(mRigP[1] = 1)
	        _pin = mRigPT[1];
	if(arg0 = "rightlap" or arg0 = 9)
	    if(mRigP[2] = 1)
	        _pin = mRigPT[2];
	if(arg0 = "rightleg" or arg0 = 10)
	    if(mRigP[3] = 1)
	        _pin = mRigPT[3];
        
	return _pin;




}
