///dsc_set_sprite_sub_part(part, subimg index);
function dsc_set_sprite_sub_part() {

	///@desciption dsc_set_sprite_sub_part(part,subimg_index)
	///@function dsc_set_sprite_sub_part(part,subimg_index)

	///@param part
	///@param sprite_subimg

	/* Explantion and Caution of this script;
		Set Sprite Sub-image of Parts

	    part = "all", "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0]; //part
	var arg1 = argument[1]; //sprite subimg num

	if(arg0 = "body" or arg0 = 1 or arg0 = "all" or arg0 = 0)
	    mPSBbody = arg1;
	if(arg0 = "head" or arg0 = 2 or arg0 = "all" or arg0 = 0)
	    mPSBhead = arg1;
	if(arg0 = "leftarm" or arg0 = 3 or arg0 = "all" or arg0 = 0)
	    mPSBL[0] = arg1; 
	if(arg0 = "leftforearm" or arg0 = 4 or arg0 = "all" or arg0 = 0)
	    mPSBL[1] = arg1; 
	if(arg0 = "leftlap" or arg0 = 5 or arg0 = "all" or arg0 = 0)
	    mPSBL[2] = arg1; 
	if(arg0 = "leftleg" or arg0 = 6 or arg0 = "all" or arg0 = 0)
	    mPSBL[3] = arg1;
	if(arg0 = "rightarm" or arg0 = 7 or arg0 = "all" or arg0 = 0)
	    mPSBR[0] = arg1; 
	if(arg0 = "rightforearm" or arg0 = 8 or arg0 = "all" or arg0 = 0)
	    mPSBR[1] = arg1; 
	if(arg0 = "rightlap" or arg0 = 9 or arg0 = "all" or arg0 = 0)
	    mPSBR[2] = arg1; 
	if(arg0 = "rightleg" or arg0 = 10 or arg0 = "all" or arg0 = 0)
	    mPSBR[3] = arg1;




}
