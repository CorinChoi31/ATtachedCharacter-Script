_alpha += -_alpha/(_step/2);
if(_alpha <= 0)
{
	instance_destroy();
}
if(_dscale != _scale)
{
	_dscale += (_scale-_dscale)/(_step/4);
}