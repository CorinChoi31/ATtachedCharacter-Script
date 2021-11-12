///@description DSC Moving Animation

dsc_set_motion_control(0,0,0,0,0,0,0,0,0,0);

if(!place_free(x,y+16) and imageRA = 0)
{
    if(keyboard_check(vk_left))
    {
        if(dsc_get_control(5) <= 0 and dsc_get_control(6) <= 0 and dsc_get_control(9) <= 0 and dsc_get_control(10) <= 0)
        {
            imageD = DSC.DIRECTION_RIGHT;
			dsc_set_control_part("all",14);
            if(mC = 0)
            {
                mC = 1;
                dsc_set_motion(-15,10,-45,65,45,0,10,80,-45,-75);
            }
            else if(mC = 1)
            {
                mC = 0;
                dsc_set_motion(-10,15,10,80,-45,-75,-45,65,45,0);
            }
        }
	}
        
    if(keyboard_check(temp.ko_move[1]))
    {
        if(dsc_get_control(5) <= 0 and dsc_get_control(6) <= 0 and dsc_get_control(9) <= 0 and dsc_get_control(10) <= 0)
        {
            imageD = DSC.DIRECTION_LEFT;
			dsc_set_control_part("all",14);
            if(mC = 0)
            {
                mC = 1;
                dsc_set_motion(15,-10,45,-65,-45,0,-10,-80,45,75);
            }
            else if(mC = 1)
            {
                mC = 0;
                dsc_set_motion(10,-15,-10,-80,45,75,45,-65,-45,0);
            }
        }
    }
}

for(var i = 1; i <= 10; i++)
{
    if(dsc_get_control(i) <= 0)
    {
        dsc_motion_control_ext(i,1);
    }
}
if(dsc_get_control(0) = 0)
{
    imageRA += -imageRA/2;
}