///dsc_set_motion_part(part, angle);
function dsc_set_motion_part() {

	///@desciption dsc_set_motion_part(part,angle)
	///@function dsc_set_motion_part(part,angle)

	///@param part
	///@param angle

	/* Explantion and Caution of this script;
		Set Angle of Part
	
	    part = "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0]; //part
	var arg1 = argument[1]; //angle

	if(arg0 = "body" or arg0 = 1)
	    if(mBodP = 0)
	        mR = arg1;
	if(arg0 = "head" or arg0 = 2)
	    if(mHeaP = 0)
	        mH = arg1;
	if(arg0 = "leftarm" or arg0 = 3)
	    if(mLefP[0] = 0)
	        mRL[0] = arg1; 
	if(arg0 = "leftforearm" or arg0 = 4)
	    if(mLefP[1] = 0)
	        mRL[1] = arg1; 
	if(arg0 = "leftlap" or arg0 = 5)
	    if(mLefP[2] = 0)
	        mRL[2] = arg1; 
	if(arg0 = "leftleg" or arg0 = 6)
	    if(mLefP[3] = 0)
	        mRL[3] = arg1;
	if(arg0 = "rightarm" or arg0 = 7)
	    if(mRigP[0] = 0)
	        mRR[0] = arg1; 
	if(arg0 = "rightforearm" or arg0 = 8)
	    if(mRigP[1] = 0)
	        mRR[1] = arg1; 
	if(arg0 = "rightlap" or arg0 = 9)
	    if(mRigP[2] = 0)
	        mRR[2] = arg1; 
	if(arg0 = "rightleg" or arg0 = 10)
	    if(mRigP[3] = 0)
	        mRR[3] = arg1;




}
