///dsc_init();
function dsc_init() {

	///@desciption dsc_init()
	///@function dsc_init()

	/* Explantion and Caution of this script;
	    You must use this at first you draw a character. I recommend use this script one time, so You will use at Create Event.
	*/

	//=== USER SETTINGS ===//
	mPLheadX = 16; mPLheadY = 16;
	mPLArmX[0] = 22; mPLArmX[1] = 24;
	mPLArmY[0] = 18; mPLArmY[1] = 18;
	mPLForeArmX[0] = 16; mPLForeArmX[1] = 16;
	mPLForeArmY[0] = 16; mPLForeArmY[1] = 16;
	mPLlapX = 16; mPLlapY = 16;
	mPLlegX = 16; mPLlegY = 16;

	//=== DEFAULT SETTINGS ===//
	imageX = 0; imageY = 0; //for lengthdirs
	imageRX = 0; imageRY = 0; //you can move drawing character to use this values.
	imageT = 0; //dummy?
	imageR = 0; imageA = 0; imageRA = 0; //part of rotation, drawing rotation, real rotation.
	imageD = DSC.DIRECTION_RIGHT; //which you point, Left or Right.
	direction = 0; image_angle = 0;

	for(var i = 0; i < 8; i++)
	{
	    imageR[i] = 0;
	}

	mR = 0; mH = 0; //Body Rot, Head Rot
	mL[0] = 0; mL[1] = 0; //Body, Head

	mRL[0] = 0; mRL[1] = 0; mRL[2] = 0; mRL[3] = 0; //Left Arm/ForeArm/Lap/Leg
	mRR[0] = 0; mRR[1] = 0; mRR[2] = 0; mRR[3] = 0; //Right Arm/ForeArm/Lap/Leg

	mBodT = 0; mHeaT = 0;
	mLefT[0] = 0; mLefT[1] = 0; mLefT[2] = 0; mLefT[3] = 0;
	mRigT[0] = 0; mRigT[1] = 0; mRigT[2] = 0; mRigT[3] = 0;

	mBodP = 0; mHeaP = 0;
	mLefP[0] = 0; mLefP[1] = 0; mLefP[2] = 0; mLefP[3] = 0;
	mRigP[0] = 0; mRigP[1] = 0; mRigP[2] = 0; mRigP[3] = 0;
	mBodPT = 0; mHeaPT = 0;
	mLefPT[0] = 0; mLefPT[1] = 0; mLefPT[2] = 0; mLefPT[3] = 0;
	mRigPT[0] = 0; mRigPT[1] = 0; mRigPT[2] = 0; mRigPT[3] = 0;

	mPrevD = DSC.DIRECTION_RIGHT;

	mDefBody = 0; mDefHead = 0;
	mDefLeft[0] = 0; mDefLeft[1] = 0; mDefLeft[2] = 0; mDefLeft[3] = 0;
	mDefRight[0] = 0; mDefRight[1] = 0; mDefRight[2] = 0; mDefRight[3] = 0;

	mPSbody = 0; mPShead = 0;
	mPSR[0] = 0; mPSR[1] = 0; mPSR[2] = 0; mPSR[3] = 0;
	mPSL[0] = 0; mPSL[1] = 0; mPSL[2] = 0; mPSL[3] = 0;
	mPSBbody = 1; mPSBhead = 0;
	mPSBR[0] = 2; mPSBR[1] = 3; mPSBR[2] = 6; mPSBR[3] = 7;
	mPSBL[0] = 4; mPSBL[1] = 5; mPSBL[2] = 8; mPSBL[3] = 9;
 
	mPSARhand[0] = -1; mPSARhand[1] = 0; mPSARhand[2] = 0; mPSARhand[3] = 0; mPSARhand[4] = 0; mPSARhand[5] = 0;
	mPSALhand[0] = -1; mPSALhand[1] = 0; mPSALhand[2] = 0; mPSALhand[3] = 0; mPSALhand[4] = 0; mPSALhand[5] = 0;




}
