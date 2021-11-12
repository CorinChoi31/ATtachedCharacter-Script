///dsc_set_control_relative(Body, Head, Left Arm, Left ForeArm, Left Lap, Left Leg, Right Arm, Right ForeArm, Right Lap, Right Leg);
function dsc_set_control_relative() {

	///@desciption dsc_set_control_relative(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)
	///@function dsc_set_control_relative(Body,Head,Left_Arm,Left_ForeArm,Left_Lap,Left_Leg,Right_Arm,Right_ForeArm,Right_Lap,Right_Leg)

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
	    Add Reset Tick of Parts
	
		using noone to exclude part
	*/

	var arg0 = argument[0]; //Body animation tick
	var arg1 = argument[1]; //Head animation tick
	var arg2 = argument[2]; //Left Arm animation tick
	var arg3 = argument[3]; //Left ForeArm animation tick
	var arg4 = argument[4]; //Left Lap animation tick
	var arg5 = argument[5]; //Left Leg animation tick
	var arg6 = argument[6]; //Right Arm animation tick
	var arg7 = argument[7]; //Right ForeArm animation tick
	var arg8 = argument[8]; //Right Lap animation tick
	var arg9 = argument[9]; //Right Leg animation tick

	if(arg0 != noone)
	    mBodT += arg0;
	if(arg1 != noone)
	    mHeaT += arg1;
	if(arg2 != noone)
	    mLefT[0] += arg2; 
	if(arg3 != noone)
	    mLefT[1] += arg3; 
	if(arg4 != noone)
	    mLefT[2] += arg4; 
	if(arg5 != noone)
	    mLefT[3] += arg5;
	if(arg6 != noone)
	    mRigT[0] += arg6; 
	if(arg7 != noone)
	    mRigT[1] += arg7; 
	if(arg8 != noone)
	    mRigT[2] += arg8; 
	if(arg9 != noone)
	    mRigT[3] += arg9;




}
