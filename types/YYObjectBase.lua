--- @meta
--- @class YYObjectBase
--- Class representing an object coming from the game maker engine.
YYObjectBase = {
	--- @type YYObjectBaseType
	type = ...,
	--- @type  CInstance|nil
	cinstance = ...,
	--- @type  string|nil
	--- `nil` if not a `SCRIPTREF`
	script_name = ...,
}
