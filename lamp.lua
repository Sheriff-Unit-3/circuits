local c = circuits

local lamp = {
	description = "Lamp",
	drawtype = "normal",
	tiles = {"circuits_lamp_on.png"},
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	light_source = 14,
	is_ground_content = false,
	walkable = true,
	groups = {choppy=1,circuit_consumer=1},
	connects_to = {"group:circuit_wire","group:circuit_power"},
	circuits = {
		connects = c.local_area,
		connects_to = {"circuit_wire", "circuit_power"},
		store_connect = "meta",
		on_update = function(npos)
			for _,node in ipairs(c.get_all_connected(npos)) do
				if c.is_powering(node, npos) then
					if not c.is_on(npos) then
						npos.node.name = c.get_powered(npos)
						core.swap_node(npos,npos.node)
						return true
					else
						return false
					end
				end
			end

			if c.is_on(npos) then
				npos.node.name = c.get_off(npos)
				core.swap_node(npos,npos.node)
				return true
			else
				return false
			end
		end
	}
}

c.register_on_off("circuits:lamp",lamp,
{
	groups = {choppy=1,circuit_consumer=1,not_in_creative_inventory=1}
},
{
	tiles = {"circuits_lamp_off.png"},
	light_source = 0,
})