///dsc_set_control_pinned(part, pin, tick);
function dsc_set_control_pinned() {

	///@desciption dsc_set_control_pinned(part,pin,tick)
	///@function dsc_set_control_pinned(part,pin,tick)

	///@param part
	///@param pin
	///@param tick

	/* Explantion and Caution of this script;
		Set Pin of Part
	
	    part = "all", "body", "head", "leftarm", "leftforearm", "leftlap", "leftleg", "rightarm", "rightforearm", "rightlap", "rightleg" or ENUM on dsc_script()
	*/

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];

	if(arg0 = "body" or arg0 = 1 or arg0 = "all" or arg0 = 0)
	{
	    mBodP = arg1;
	    if(arg1 = false)
	    {
	        mBodPT = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mBodPT < arg2)
	            mBodPT = arg2;
	    }
	}
	if(arg0 = "head" or arg0 = 2 or arg0 = "all" or arg0 = 0)
	{
	    mHeaP = arg1;
	    if(arg1 = false)
	    {
	        mHeaPT = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mHeaPT < arg2)
	            mHeaPT = arg2;
	    }
	}
	if(arg0 = "leftarm" or arg0 = 3 or arg0 = "all" or arg0 = 0)
	{
	    mLefP[0] = arg1;
	    if(arg1 = false)
	    {
	        mLefPT[0] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mLefPT[0] < arg2)
	            mLefPT[0] = arg2;
	    }
	}
	if(arg0 = "leftforearm" or arg0 = 4 or arg0 = "all" or arg0 = 0)
	{
	    mLefP[1] = arg1;
	    if(arg1 = false)
	    {
	        mLefPT[1] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mLefPT[1] < arg2)
	            mLefPT[1] = arg2;
	    }
	}
	if(arg0 = "leftlap" or arg0 = 5 or arg0 = "all" or arg0 = 0)
	{
	    mLefP[2] = arg1;
	    if(arg1 = false)
	    {
	        mLefPT[2] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mLefPT[2] < arg2)
	            mLefPT[2] = arg2;
	    }
	}
	if(arg0 = "leftleg" or arg0 = 6 or arg0 = "all" or arg0 = 0)
	{
	    mLefP[3] = arg1;
	    if(arg1 = false)
	    {
	        mLefPT[3] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mLefPT[3] < arg2)
	            mLefPT[3] = arg2;
	    }
	}
	if(arg0 = "rightarm" or arg0 = 7 or arg0 = "all" or arg0 = 0)
	{
	    mRigP[0] = arg1;
	    if(arg1 = false)
	    {
	        mRigPT[0] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mRigPT[0] < arg2)
	            mRigPT[0] = arg2;
	    }
	}
	if(arg0 = "rightforearm" or arg0 = 8 or arg0 = "all" or arg0 = 0)
	{
	    mRigP[1] = arg1;
	    if(arg1 = false)
	    {
	        mRigPT[1] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mRigPT[1] < arg2)
	            mRigPT[1] = arg2;
	    }
	}
	if(arg0 = "rightlap" or arg0 = 9 or arg0 = "all" or arg0 = 0)
	{
	    mRigP[2] = arg1;
	    if(arg1 = false)
	    {
	        mRigPT[2] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mRigPT[2] < arg2)
	            mRigPT[2] = arg2;
	    }
	}
	if(arg0 = "rightleg" or arg0 = 10 or arg0 = "all" or arg0 = 0)
	{
	    mRigP[3] = arg1;
	    if(arg1 = false)
	    {
	        mRigPT[3] = 0;
	    }
	    if(arg1 = true)
	    {
	        if(mRigPT[3] < arg2)
	            mRigPT[3] = arg2;
	    }
	}




}
