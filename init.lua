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
modpath("/src/util.lua")
modpath("/src/position.lua")
modpath("/src/connection.lua")
modpath("/src/persistance.lua")
modpath("/src/power.lua")
modpath("/src/wire.lua")
modpath("/src/wire_node.lua")
modpath("/src/lamp.lua")
modpath("/src/indicator.lua")
modpath("/src/inverter.lua")
modpath("/src/pressure_plate.lua")
modpath("/src/button.lua")
modpath("/src/wrench.lua")