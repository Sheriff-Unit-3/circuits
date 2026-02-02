local c = circuits

-- for use in crafting recipes
core.register_craftitem(c.mod()..":circuit_board",{
  description = "Circuit Board",
  inventory_image = "circuits_circuit_board.png",
  groups = {circuit_board = 1, craft_item = 1}
})
core.register_alias("circuit_board", c.mod()..":circuit_board")
if c.is_mod_enabled("default") then
  core.register_craft({
    output = c.mod()..":circuit_board",
    recipe = {
      {"dye:green", "default:copper_ingot", "dye:green"},
      {"default:tin_ingot", "group:circuit_wire", "default:tin_ingot"},
      {"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"}
    }
  })
elseif c.is_mod_enabled("blk") then
  core.register_craft({
    output = c.mod()..":circuit_board",
    recipe = {
      {"iron_bar", "copper_bar", "iron_bar"},
      {"gold_bar", "group:circuit_wire", "gold_bar"},
      {"iron_bar", "copper_bar", "iron_bar"}
    }
  })
end