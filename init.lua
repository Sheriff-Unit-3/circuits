circuits = {}
circuits.info = {
	name = "circuits",
	version = "v1.0.0-dev"
}
circuits.hash_pos = core.hash_node_position
circuits.unhash_pos = core.get_position_from_hash

-- load files
local function modpath(file)
	local mod = core.get_current_modname()
	local modpath = core.get_modpath(mod)
	return dofile(modpath..file)
end
modpath("/util.lua")
modpath("/position.lua")
modpath("/connection.lua")
modpath("/persistance.lua")
modpath("/power.lua")
modpath("/wire.lua")
modpath("/wire_node.lua")
modpath("/lamp.lua")
modpath("/indicator.lua")
modpath("/inverter.lua")
modpath("/pressure_plate.lua")
modpath("/button.lua")
modpath("/wrench.lua")