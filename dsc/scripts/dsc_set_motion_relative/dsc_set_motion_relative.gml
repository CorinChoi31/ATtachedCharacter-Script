///dsc_set_motion_relative(Body, Head, Left Arm, Left ForeArm, Left Lap, Left Leg, Right Arm, Right ForeArm, Right Lap, Right Leg);
function dsc_set_motion_relative() {

	///@desciption dsc_set_motion_relative(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)
	///@function dsc_set_motion_relative(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)

	///@param Body
	///@param Head
	///@param Left_Arm
	///@param Left_ForeArm
	///@param Left_Lap
	///@param Left_Leg
	///@param Right_Arm
	///@param Right_ForeArm
	///@param Right_Lap
	///@param Right_Leg

	/* Explantion and Caution of this script;
	    Add Angle of Parts
	
		using noone to exclude part 
	*/

	var arg0 = argument[0]; //Body Angle 'The Main Rotation of Character, Relative at imageRA' \ Real Rotation = imageRA + this
	var arg1 = argument[1]; //Head Angle \ Real Rotation = imageRA + Body Angle + this
	var arg2 = argument[2]; //Left Arm Angle \ Real Rotation = imageRA + Body Angle + this
	var arg3 = argument[3]; //Left ForeArm Angle \ Real Rotation = imageRA + Body Angle + Left Arm Angle + this
	var arg4 = argument[4]; //Left Lap Angle \ Real Rotation = imageRA + Body Angle + this
	var arg5 = argument[5]; //Left Leg Angle \ Real Rotation = imageRA + Body Angle + Left Lap Angle + this
	var arg6 = argument[6]; //Right Arm Angle \ Real Rotation = imageRA + Body Angle + this
	var arg7 = argument[7]; //Right ForeArm Angle \ Real Rotation = imageRA + Body Angle + Right Arm Angle + this
	var arg8 = argument[8]; //Right Lap Angle \ Real Rotation = imageRA + Body Angle + this
	var arg9 = argument[9]; //Right Leg Angle \ Real Rotation = imageRA + Body Angle + Right Lap Angle + this

	if(arg0 != noone and mBodP = 0)
	    mR += arg0;
	if(arg1 != noone and mHeaP = 0)
	    mH += arg1;
	if(arg2 != noone and mLefP[0] = 0)
	    mRL[0] += arg2; 
	if(arg3 != noone and mLefP[1] = 0)
	    mRL[1] += arg3; 
	if(arg4 != noone and mLefP[2] = 0)
	    mRL[2] += arg4; 
	if(arg5 != noone and mLefP[3] = 0)
	    mRL[3] += arg5;
	if(arg6 != noone and mRigP[0] = 0)
	    mRR[0] += arg6; 
	if(arg7 != noone and mRigP[1] = 0)
	    mRR[1] += arg7; 
	if(arg8 != noone and mRigP[2] = 0)
	    mRR[2] += arg8; 
	if(arg9 != noone and mRigP[3] = 0)
	    mRR[3] += arg9;




}
