///dsc_draw(motion control, color, alpha, direction, animating speed, image_angle, scale);
function dsc_draw() {

	///@desciption dsc_draw(motion_control,color,alpha,direction,animating_speed,image_angle,scale)
	///@function dsc_draw(motion_control,color,alpha,direction,animating_speed,image_angle,scale)

	///@param motion_control
	///@param color
	///@param alpha
	///@param direction
	///@param animating
	///@param image_angle
	///@param scale

	/* Explantion and Caution of this script;
	    Please use 64*64 pixels sprite.
    
	    imageRX and imageRY can handle drawing x, y.
	*/

	dsc_draw()
	var arg00 = argument[0]; //motion control
	var arg01 = argument[1]; //color
	var arg02 = argument[2]; //alpha
	var arg03 = argument[3]; //direction of character
	var arg04 = argument[4]; //animating speed
	var arg05 = argument[5]; //all-handled rotator
	var arg06 = argument[6]; //scale

	var arg16 = 0;
	var arg17 = 0;

	if(mL[0] != mR)
	    mL[0] += (mR-mL[0])/arg04;
	if(mL[1] != mH)
	    mL[1] += (mH-mL[1])/arg04;

	for(var i = 0; i < 4; i++)
	{
	    arg16[i] = mRL[i];
	    arg17[i] = mRR[i];
	}
	for(var i = 0; i < 2; i++)
	{
	    if(imageR[i] != arg16[i])
	    {
	        imageR[i] += (arg16[i]-imageR[i])/arg04;
	    }
	    if(imageR[i+2] != arg16[i+2])
	    {
	        imageR[i+2] += (arg16[i+2]-imageR[i+2])/arg04;
	    }
	    if(imageR[i+4] != arg17[i])
	    {
	        imageR[i+4] += (arg17[i]-imageR[i+4])/arg04;
	    }
	    if(imageR[i+6] != arg17[i+2])
	    {
	        imageR[i+6] += (arg17[i+2]-imageR[i+6])/arg04;
	    }
	}

	if(imageA != arg05)
	    imageA += angle_difference(arg05,imageA)/arg04;

	//texture_set_interpolation(true); //GM:S1
	//gpu_set_texfilter(true); //GMS 2

	if(arg03 = DSC.DIRECTION_RIGHT)
	{
	    dsc_limit(DSC.DIRECTION_RIGHT);
	    //right ForeArm
		if(mPSR[1] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[1]*arg06,45+mL[0]+imageA)+lengthdir_x(mPLForeArmX[1]*arg06,270+imageR[4]+imageA); imageY = lengthdir_y(mPLArmY[1]*arg06,45+mL[0]+imageA)+lengthdir_y(mPLForeArmY[1]*arg06,270+imageR[4]+imageA);
		    draw_sprite_ext(mPSR[1],mPSBR[1],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[5]+imageR[4]+imageA,arg01,arg02);
		}
	    //right Arm
		if(mPSR[0] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[1]*arg06,45+mL[0]+imageA); imageY = lengthdir_y(mPLArmY[1]*arg06,45+mL[0]+imageA);
		    draw_sprite_ext(mPSR[0],mPSBR[0],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[4]+imageA,arg01,arg02);
		}
    
	    if(mPSARhand[0] != -1)
	    {
	        draw_sprite_ext(mPSARhand[0],mPSARhand[1],x+mPSARhand[2],y+mPSARhand[3],1*arg06,1*arg06,mPSARhand[4]-mPSARhand[5],arg01,arg02);
	    }
    
	    //right Leg
		if(mPSR[3] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,300+mL[0]+imageA)+lengthdir_x(mPLlegX*arg06,270+imageR[6]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA)+lengthdir_y(mPLlegY*arg06,270+imageR[6]+imageA);
		    draw_sprite_ext(mPSR[3],mPSBR[3],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[7]+imageR[6]+imageA,arg01,arg02);
		}
	    //right Lap
		if(mPSR[2] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,300+mL[0]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA);
		    draw_sprite_ext(mPSR[2],mPSBR[2],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[6]+imageA,arg01,arg02);
		}
    
	    //Body
		if(mPSbody != -1)
		{
		    imageX = lengthdir_x(0,0); imageY = lengthdir_y(0,0);
		    draw_sprite_ext(mPSbody,mPSBbody,x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,mL[0]+imageA,arg01,arg02);
		}
	    //Head
		if(mPShead != -1)
		{
		    imageX = lengthdir_x(mPLheadX*arg06,90+mL[0]+imageA); imageY = lengthdir_y(mPLheadY*arg06,90+mL[0]+imageA);
		    draw_sprite_ext(mPShead,mPSBhead,x+imageX+2+imageRX,y+imageY+imageRY,1*arg06,1*arg06,mL[1]+mL[0]+imageA,arg01,arg02);
		}
    
	    //left Leg
		if(mPSL[3] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,240+mL[0]+imageA)+lengthdir_x(mPLlegX*arg06,270+imageR[2]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA)+lengthdir_y(mPLlegY*arg06,270+imageR[2]+imageA);
		    draw_sprite_ext(mPSL[3],mPSBL[3],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[3]+imageR[2]+imageA,arg01,arg02);
		}
	    //left Lap
		if(mPSL[2] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,240+mL[0]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA);
		    draw_sprite_ext(mPSL[2],mPSBL[2],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[2]+imageA,arg01,arg02);
		}
    
	    if(mPSALhand[0] != -1)
	    {
	        draw_sprite_ext(mPSALhand[0],mPSALhand[1],x+mPSALhand[2],y+mPSALhand[3],1*arg06,1*arg06,mPSALhand[4],arg01,arg02);
	    }
    
	    //left ForeArm
		if(mPSL[1] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[0]*arg06,135+mL[0]+imageA)+lengthdir_x(mPLForeArmX[0]*arg06,270+imageR[0]+imageA); imageY = lengthdir_y(mPLArmY[0]*arg06,135+mL[0]+imageA)+lengthdir_y(mPLForeArmY[1]*arg06,270+imageR[0]+imageA);
		    draw_sprite_ext(mPSL[1],mPSBL[1],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[1]+imageR[0]+imageA,arg01,arg02);
		}
	    //left Arm
		if(mPSL[0] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[0]*arg06,135+mL[0]+imageA); imageY = lengthdir_y(mPLArmY[0]*arg06,135+mL[0]+imageA);
		    draw_sprite_ext(mPSL[0],mPSBL[0],x+imageX+imageRX,y+imageY+imageRY,1*arg06,1*arg06,imageR[0]+imageA,arg01,arg02);
		}
	}

	if(arg03 = DSC.DIRECTION_LEFT)
	{
	    dsc_limit(DSC.DIRECTION_LEFT);
	    //left ForeArm
		if(mPSL[1] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[1]*arg06,135+mL[0]+imageA)+lengthdir_x(mPLForeArmX[1]*arg06,270+imageR[0]+imageA); imageY = lengthdir_y(mPLArmY[1]*arg06,135+mL[0]+imageA)+lengthdir_y(mPLForeArmY[1]*arg06,270+imageR[0]+imageA);
		    draw_sprite_ext(mPSL[1],mPSBL[1],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[1]+imageR[0]+imageA,arg01,arg02);
		}
	    //left Arm
		if(mPSL[0] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[1]*arg06,135+mL[0]+imageA); imageY = lengthdir_y(mPLArmY[1]*arg06,135+mL[0]+imageA);
		    draw_sprite_ext(mPSL[0],mPSBL[0],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[0]+imageA,arg01,arg02);
		}
    
	    if(mPSALhand[0] != -1)
	    {
	        draw_sprite_ext(mPSALhand[0],mPSALhand[1],x+mPSALhand[2],y+mPSALhand[3],-1*arg06,1*arg06,mPSALhand[4],arg01,arg02);
	    }
    
	    //left Leg
		if(mPSL[3] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,240+mL[0]+imageA)+lengthdir_x(mPLlegX*arg06,270+imageR[2]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA)+lengthdir_y(mPLlegY*arg06,270+imageR[2]+imageA);
		    draw_sprite_ext(mPSL[3],mPSBL[3],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[3]+imageR[2]+imageA,arg01,arg02);
		}
	    //left Lap
		if(mPSL[2] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,240+mL[0]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA);
		    draw_sprite_ext(mPSL[2],mPSBL[2],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[2]+imageA,arg01,arg02);
		}
    
	    //Body
		if(mPSbody != -1)
		{
		    imageX = lengthdir_x(0,0); imageY = lengthdir_y(0,0);
		    draw_sprite_ext(mPSbody,mPSBbody,x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,mL[0]+imageA,arg01,arg02);
		}
	    //Head
		if(mPSbody != -1)
		{
		    imageX = lengthdir_x(mPLheadX*arg06,90+mL[0]+imageA); imageY = lengthdir_y(mPLheadY*arg06,90+mL[0]+imageA);
		    draw_sprite_ext(mPShead,mPSBhead,x+imageX-2+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,mL[1]+mL[0]+imageA,arg01,arg02);
		}
    
	    //right Leg
		if(mPSR[3] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,300+mL[0]+imageA)+lengthdir_x(mPLlegX*arg06,270+imageR[6]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA)+lengthdir_y(mPLlegY*arg06,270+imageR[6]+imageA);
		    draw_sprite_ext(mPSR[3],mPSBR[3],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[7]+imageR[6]+imageA,arg01,arg02);
		}
	    //right Lap
		if(mPSR[2] != -1)
		{
		    imageX = lengthdir_x(mPLlapX*arg06,300+mL[0]+imageA); imageY = lengthdir_y(mPLlapY*arg06,270+mL[0]+imageA);
		    draw_sprite_ext(mPSR[2],mPSBR[2],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[6]+imageA,arg01,arg02);
		}
    
	    if(mPSARhand[0] != -1)
	    {
	        draw_sprite_ext(mPSARhand[0],mPSARhand[1],x+mPSARhand[2],y+mPSARhand[3],-1*arg06,1*arg06,mPSARhand[4]+mPSARhand[5],arg01,arg02);
	    }
    
	    //right ForeArm
		if(mPSR[1] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[0]*arg06,45+mL[0]+imageA)+lengthdir_x(mPLForeArmX[0]*arg06,270+imageR[4]+imageA); imageY = lengthdir_y(mPLArmY[0]*arg06,45+mL[0]+imageA)+lengthdir_y(mPLForeArmY[0]*arg06,270+imageR[4]+imageA);
		    draw_sprite_ext(mPSR[1],mPSBR[1],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[5]+imageR[4]+imageA,arg01,arg02);
		}
	    //right Arm
		if(mPSR[0] != -1)
		{
		    imageX = lengthdir_x(mPLArmX[0]*arg06,45+mL[0]+imageA); imageY = lengthdir_y(mPLArmY[0]*arg06,45+mL[0]+imageA);
		    draw_sprite_ext(mPSR[0],mPSBR[0],x+imageX+imageRX,y+imageY+imageRY,-1*arg06,1*arg06,imageR[4]+imageA,arg01,arg02);
		}
	}

	if(arg00 = true)
	{
	    dsc_control();
	}

	//texture_set_interpolation(false); //GM:S1
	//gpu_set_texfilter(false); //GMS 2


}
