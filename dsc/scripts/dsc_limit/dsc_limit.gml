///dsc_limit(direction);
function dsc_limit() {

	///@desciption dsc_limit(direction)
	///@function dsc_limit(direction)

	///@param direction

	/* Explantion and Caution of this script;
	    The limit rotation of parts. (Left or Right)
	*/

	imageA = dsc_angle_fresher(imageA);

	if(argument[0] = DSC.DIRECTION_RIGHT)
	{
	    //
	    if(mH > 45)
	        mH = 45;
	    if(mH < -60)
	        mH = -60;
	    //    
	    if(mR > 15)
	        mR = 15;
	    if(mR < -120)
	        mR = -120;
    
	    //
	    if(imageR[0] > 185)
	    {
	        imageR[0] = 185; mRL[0] = 185;
	    }
	    if(imageR[0] < -45)
	    {
	        imageR[0] = -45; mRL[0] = -45;
	    }
	    if(imageR[1] > 160)
	    {
	        imageR[1] = 160; mRL[1] = 160;
	    }
	    if(imageR[1] < -5)
	    {
	        imageR[1] = -5; mRL[1] = -5;
	    }
	    if(imageR[2] > 185)
	    {
	        imageR[2] = 185; mRL[2] = 185;
	    }
	    if(imageR[2] < -45)
	    {
	        imageR[2] = -45; mRL[2] = -45;
	    }
	    if(imageR[3] > 5)
	    {
	        imageR[3] = 5; mRL[3] = 5;
	    }
	    if(imageR[3] < -165)
	    {
	        imageR[3] = -165; mRL[3] = -165;
	    }
    
	    //
	    if(imageR[4] > 185)
	    {
	        imageR[4] = 185; mRR[0] = 185;
	    }
	    if(imageR[4] < -45)
	    {
	        imageR[4] = -45; mRR[0] = -45;
	    }
	    if(imageR[5] > 160)
	    {
	        imageR[5] = 160; mRR[1] = 160;
	    }
	    if(imageR[5] < -5)
	    {
	        imageR[5] = -5; mRR[1] = -5;
	    }
	    if(imageR[6] > 185)
	    {
	        imageR[6] = 185; mRR[2] = 185;
	    }
	    if(imageR[6] < -45)
	    {
	        imageR[6] = -45; mRR[2] = -45;
	    }
	    if(imageR[7] > 5)
	    {
	        imageR[7] = 5; mRR[3] = 5;
	    }
	    if(imageR[7] < -165)
	    {
	        imageR[7] = -165; mRR[3] = -165;
	    }
	}

	if(argument[0] = DSC.DIRECTION_LEFT)
	{
	    //
	    if(mH < -45)
	        mH = -45;
	    if(mH > 60)
	        mH = 60;
	    //    
	    if(mR < -15)
	        mR = 15;
	    if(mR > 120)
	        mR = 120;
    
	    //
	    if(imageR[0] < -185)
	    {
	        imageR[0] = -185; mRL[0] = -185;
	    }
	    if(imageR[0] > 45)
	    {
	        imageR[0] = 45; mRL[0] = 45;
	    }
	    if(imageR[1] < -160)
	    {
	        imageR[1] = -160; mRL[1] = -160;
	    }
	    if(imageR[1] > 5)
	    {
	        imageR[1] = 5; mRL[1] = 5;
	    }
	    if(imageR[2] < -185)
	    {
	        imageR[2] = -185; mRL[2] = -185;
	    }
	    if(imageR[2] > 45)
	    {
	        imageR[2] = 45; mRL[2] = 45;
	    }
	    if(imageR[3] < -5)
	    {
	        imageR[3] = -5; mRL[3] = -5;
	    }
	    if(imageR[3] > 165)
	    {
	        imageR[3] = 165; mRL[3] = 165;
	    }
    
	    //
	    if(imageR[4] < -185)
	    {
	        imageR[4] = -185; mRR[0] = -185;
	    }
	    if(imageR[4] > 45)
	    {
	        imageR[4] = 45; mRR[0] = 45;
	    }
	    if(imageR[5] < -160)
	    {
	        imageR[5] = -160; mRR[1] = -160;
	    }
	    if(imageR[5] > 5)
	    {
	        imageR[5] = 5; mRR[1] = 5;
	    }
	    if(imageR[6] < -185)
	    {
	        imageR[6] = -185; mRR[2] = -185;
	    }
	    if(imageR[6] > 45)
	    {
	        imageR[6] = 45; mRR[2] = 45;
	    }
	    if(imageR[7] < -5)
	    {
	        imageR[7] = -5; mRR[3] = -5;
	    }
	    if(imageR[7] > 165)
	    {
	        imageR[7] = 165; mRR[3] = 165;
	    }
	}





}
