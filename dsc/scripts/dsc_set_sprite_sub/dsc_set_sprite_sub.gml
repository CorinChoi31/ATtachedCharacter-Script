///dsc_set_sprite_sub(Body, Head, Left Arm, Left ForeArm, Left Lap, Left Leg, Right Arm, Right ForeArm, Right Lap, Right Leg);
function dsc_set_sprite_sub() {

	///@desciption dsc_set_sprite_sub(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)
	///@function dsc_set_sprite_sub(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)

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
	    Set Sprite Sub-image of Parts
	*/

	var arg0 = argument[0]; 
	var arg1 = argument[1]; 
	var arg2 = argument[2]; 
	var arg3 = argument[3]; 
	var arg4 = argument[4];
	var arg5 = argument[5]; 
	var arg6 = argument[6]; 
	var arg7 = argument[7]; 
	var arg8 = argument[8]; 
	var arg9 = argument[9]; 

	if(arg0 != noone)
	    mPSBbody = arg0;
	if(arg1 != noone)
	    mPSBhead = arg1;
	if(arg2 != noone)
	    mPSBL[0] = arg2; 
	if(arg3 != noone)
	    mPSBL[1] = arg3; 
	if(arg4 != noone)
	    mPSBL[2] = arg4; 
	if(arg5 != noone)
	    mPSBL[3] = arg5;
	if(arg6 != noone)
	    mPSBR[0] = arg6; 
	if(arg7 != noone)
	    mPSBR[1] = arg7; 
	if(arg8 != noone)
	    mPSBR[2] = arg8; 
	if(arg9 != noone)
	    mPSBR[3] = arg9;




}
