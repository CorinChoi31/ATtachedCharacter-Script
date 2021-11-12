///dsc_control();
function dsc_control() {

	///@desciption dsc_control()
	///@function dsc_control()

	/* Explantion and Caution of this script;
	    Checking and Calcurating motion trigger(or timmer).
	*/

	if(mBodT > 0)
	{
	    mBodT--;
	}
	if(mHeaT > 0)
	{
	    mHeaT--;
	}
	for(var i = 0; i < 4; i++)
	{
	    if(mLefT[i] > 0)
	    {
	        mLefT[i]--;
	    }
	    if(mRigT[i] > 0)
	    {
	        mRigT[i]--;
	    }
	}

	/*  PINNED  */
	if(mBodPT > 0)
	{
	    mBodPT--;
	}
	if(mHeaPT > 0)
	{
	    mHeaPT--;
	}
	for(var i = 0; i < 4; i++)
	{
	    if(mLefPT[i] > 0)
	    {
	        mLefPT[i]--;
	    }
	    if(mRigPT[i] > 0)
	    {
	        mRigPT[i]--;
	    }
	}

	if(mBodPT = 0)
	{
	    mBodP = 0;
	}
	if(mHeaPT = 0)
	{
	    mHeaP = 0;
	}
	for(var i = 0; i < 4; i++)
	{
	    if(mLefPT[i] = 0)
	    {
	        mLefP[i] = 0;
	    }
	    if(mRigPT[i] = 0)
	    {
	        mRigP[i] = 0;
	    }
	}

	if(mPrevD != imageD)
	{
	    mPrevD = imageD;
	    mBodP = 0;
	    mHeaP = 0;
	    for(var i = 0; i < 4; i++)
	    {
	        mLefP[i] = 0;
	        mRigP[i] = 0;
	    }
	}



}
