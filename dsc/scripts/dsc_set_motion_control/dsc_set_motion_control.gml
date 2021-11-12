///dsc_set_motion_control(Body, Head, Left Arm, Left ForeArm, Left Lap, Left Leg, Right Arm, Right ForeArm, Right Lap, Right Leg);
function dsc_set_motion_control() {

	///@desciption dsc_set_motion_control(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)

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
	    Set Reset Angle (Default Angle) of Parts
	
		using noone to exclude part
	*/

	var arg0 = argument[0]; //Body default rotation when tick to zero.
	var arg1 = argument[1]; //Head default rotation when tick to zero.
	var arg2 = argument[2]; //Left Arm default rotation when tick to zero.
	var arg3 = argument[3]; //Left ForeArm default rotation when tick to zero.
	var arg4 = argument[4]; //Left Lap default rotation when tick to zero.
	var arg5 = argument[5]; //Left Leg default rotation when tick to zero.
	var arg6 = argument[6]; //Right Arm default rotation when tick to zero.
	var arg7 = argument[7]; //Right ForeArm default rotation when tick to zero.
	var arg8 = argument[8]; //Right Lap default rotation when tick to zero.
	var arg9 = argument[9]; //Right Leg default rotation when tick to zero.

	mDefBody = arg0;
	mDefHead = arg1;
	mDefLeft[0] = arg2; mDefLeft[1] = arg3; mDefLeft[2] = arg4; mDefLeft[3] = arg5;
	mDefRight[0] = arg6; mDefRight[1] = arg7; mDefRight[2] = arg8; mDefRight[3] = arg9;




}
