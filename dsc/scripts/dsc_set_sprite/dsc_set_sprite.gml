///dsc_set_sprite(part, sprite);
function dsc_set_sprite() {

	///@desciption dsc_set_sprite(part,sprite)
	///@function dsc_set_sprite(part,sprite)

	///@param part
	///@param sprite

	/* Explantion and Caution of this script;
		Set Sprite of Part
	
	    part = "all", "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0]; //part
	var arg1 = argument[1]; //sprite

	if(arg0 = "body" or arg0 = 1 or arg0 = "all" or arg0 = 0)
	    mPSbody = arg1;
	if(arg0 = "head" or arg0 = 2 or arg0 = "all" or arg0 = 0)
	    mPShead = arg1;
	if(arg0 = "leftarm" or arg0 = 3 or arg0 = "all" or arg0 = 0)
	    mPSL[0] = arg1; 
	if(arg0 = "leftforearm" or arg0 = 4 or arg0 = "all" or arg0 = 0)
	    mPSL[1] = arg1; 
	if(arg0 = "leftlap" or arg0 = 5 or arg0 = "all" or arg0 = 0)
	    mPSL[2] = arg1; 
	if(arg0 = "leftleg" or arg0 = 6 or arg0 = "all" or arg0 = 0)
	    mPSL[3] = arg1;
	if(arg0 = "rightarm" or arg0 = 7 or arg0 = "all" or arg0 = 0)
	    mPSR[0] = arg1; 
	if(arg0 = "rightforearm" or arg0 = 8 or arg0 = "all" or arg0 = 0)
	    mPSR[1] = arg1; 
	if(arg0 = "rightlap" or arg0 = 9 or arg0 = "all" or arg0 = 0)
	    mPSR[2] = arg1; 
	if(arg0 = "rightleg" or arg0 = 10 or arg0 = "all" or arg0 = 0)
	    mPSR[3] = arg1;




}
