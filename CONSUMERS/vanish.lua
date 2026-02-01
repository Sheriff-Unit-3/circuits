local c = circuits

local vanish = {
  description = "Vanishing Node",
  drawtype = "normal",
  tiles = {"blank.png"},
  use_texture_alpha = "clip",
  is_ground_content = false,
  walkable = false,
  pointable = false,
  groups = {vanish=1,circuit_wire=1,circuit_consumer=1,not_in_creative_inventory=1},
  connects_to = {"group:vanish","group:circuit_wire", "group:circuit_power"},
  circuits = {
    connects = c.local_area,
    connects_to = {"vanish", "circuit_wire", "circuit_power"},
    store_connect = "param2",
    on_update = function(npos)
      for k,node in ipairs(c.get_all_connected(npos)) do
        if c.is_powering(node, npos) then
          if not c.is_on(npos) then
            npos.node.name = c.get_powered(npos)
            core.swap_node(npos, npos.node)
            return true
          else
            return false
          end
        end
      end
      if c.is_on(npos) then
        npos.node.name = c.get_off(npos)
        core.swap_node(npos, npos.node)
        return true
      else
        return false
      end
    end
  }
}

c.register_on_off(c.mod()..":vanish",vanish,{},
  {
    tiles = {"circuits_vanish.png"},
    pointable = true,
    walkable = true,
    groups = {choppy=1,vanish=1,circuit_wire=1,circuit_consumer=1}
  }
)