--- @meta
--- @class CInstance
--- Class representing a game maker object instance.
--- You can use most if not all of the builtin game maker variables (For examp
--- @see # https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/Instance_Variables/Instance_Variables.htm
--- To know the specific instance variables of a given object defined by the game call dump_vars() on the instance
CInstance = {
	--- @type number
	id = ...,
	--- @type number
	object_index = ...,
	--- @type number
	sprite_index = ...,
	--- @type number
	image_index = ...,
	--- @type number
	image_speed = ...,
	--- @type number
	image_xscale = ...,
	--- @type number
	image_yscale = ...,
	--- @type number
	image_angle = ...,
	--- @type number
	image_alpha = ...,
	--- @type number
	image_blend = ...,
	--- @type number
	x = ...,
	--- @type number
	y = ...,
	--- @type number
	xstart = ...,
	--- @type number
	ystart = ...,
	--- @type number
	xprevious = ...,
	--- @type number
	yprevious = ...,
	--- @type number
	direction = ...,
	--- @type number
	speed = ...,
	--- @type number
	friction = ...,
	--- @type number
	gravity_direction = ...,
	--- @type number
	gravity = ...,
	--- @type number
	hspeed = ...,
	--- @type number
	vspeed = ...,
	--- @type number[] length 4
	bbox = ...,
	--- @type number[] length 12
	timer = ...,
	--- @type number
	layer = ...,
	--- @type number
	mask_index = ...,
	--- @type number
	m_nMouseOver = ...,
	--- @type number
	depth = ...,
	--- @type number
	i_currentdepth = ...,
	--- @type string
	object_name = ...,
}
