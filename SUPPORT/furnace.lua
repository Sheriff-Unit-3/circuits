local c = circuits

if c.is_mod_enabled("default") then
  local furnace_on = "default:furnace"
  local furnace_off = "default:furnace_active"
  local furnaces = {
    on = core.registered_nodes[furnace_on],
    off = core.registered_nodes[furnace_off]
  }

  local circuits_def = {
		connects = c.behind,
		connects_to = {"circuit_consumer", "circuit_wire"},
		store_connect = "meta",
		on_update = function(npos, args)
			for _,node in ipairs(c.get_all_connected(npos)) do
				c.update(node)
			end
			return true
		end,
		powering = function(npos, rpos)
			return c.is_on(npos)
		end
	}

  for state, furnace in pairs(furnaces) do
    local function furnace_destruct(pos)
      return furnace.on_destruct
    end
    local function furnace_timer(pos, elapsed, node, timeout)
      return furnace.on_timer
    end
    local function furnace_construct(pos)
      return furnace.on_construct
    end
    furnace.groups.circuit_power = 1

    local name = ""
    if state == "on" then
      name = furnace_on
    elseif state == "off" then
      name = furnace_off
    end
    core.override_item(name, {
      groups = furnace.groups,
      circuits = circuits_def,
      on_construct = function(pos)
        furnace_construct(pos)
        circuits.on_construct(pos)
      end,
      on_timer = function(pos, elapsed, node, timeout)
        furnace_timer(pos, elapsed, node, timeout)
        local npos = c.npos(pos)
		    if c.is_on(npos) then
  	    	c.power_update(npos,"on")
        elseif not c.is_on(npos) then
  	    	c.power_update(npos,"off")
	      end
      end,
      on_destruct = function(pos)
        furnace_destruct(pos)
        circuits.on_destruct(pos)
      end
    })
  end
end