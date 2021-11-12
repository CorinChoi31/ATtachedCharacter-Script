///dsc_set_control_part_relative(part, tick);
function dsc_set_control_part_relative() {

	///@desciption dsc_set_control_part_relative(part,tick)

	///@param part
	///@param tick

	/* Explantion and Caution of this script;
		Add Reset Tick of Part
	
	    part = "all", "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0]; //part
	var arg1 = argument[1]; //tick

	if(arg0 = "body" or arg0 = 1 or arg0 = "all" or arg0 = 0)
	    mBodT += arg1;
	if(arg0 = "head" or arg0 = 2 or arg0 = "all" or arg0 = 0)
	    mHeaT += arg1;
	if(arg0 = "leftarm" or arg0 = 3 or arg0 = "all" or arg0 = 0)
	    mLefT[0] += arg1; 
	if(arg0 = "leftforearm" or arg0 = 4 or arg0 = "all" or arg0 = 0)
	    mLefT[1] += arg1; 
	if(arg0 = "leftlap" or arg0 = 5 or arg0 = "all" or arg0 = 0)
	    mLefT[2] += arg1; 
	if(arg0 = "leftleg" or arg0 = 6 or arg0 = "all" or arg0 = 0)
	    mLefT[3] += arg1;
	if(arg0 = "rightarm" or arg0 = 7 or arg0 = "all" or arg0 = 0)
	    mRigT[0] += arg1; 
	if(arg0 = "rightforearm" or arg0 = 8 or arg0 = "all" or arg0 = 0)
	    mRigT[1] += arg1; 
	if(arg0 = "rightlap" or arg0 = 9 or arg0 = "all" or arg0 = 0)
	    mRigT[2] += arg1; 
	if(arg0 = "rightleg" or arg0 = 10 or arg0 = "all" or arg0 = 0)
	    mRigT[3] += arg1;




}
