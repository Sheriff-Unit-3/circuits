These are functions contained within the namespace `circuits` to be used both
internally and externally. This documentation of them is a work in progress.  
# Util Functions
These functions are contained within the `util.lua` file.
## register_on_off
```lua
--- Used to register both the on and the off nodes.
-- @param name string The name of the two nodes without `_on` or `_off`.
-- @param def table Node def that should be shared for both nodes.
-- @param on_def table Node def with values that only the on node should have.
-- @param off_def table Node def with values that only the off node should have.
circuits.register_on_off(name,def,on_def,off_def)
```
## get_circuit_def
```lua
--- Used to get the circuit definition from the node definition table.
-- @param node_name string The full name of the node.
-- @return circuits table If included in that nodes definition table.  
-- @return false If the node name is not valid or that node has no circuits table.
circuits.get_circuit_def(node_name)
```
## get_powered
```lua
--- Get the powered version name of the node located at the pos given.
-- @param npos table The npos of the node.
-- @return false If node does not have a powered version.
-- @return string Name of the node's powered version.
circuits.get_powered(npos)
```
## get_off
```lua
--- Get the off version name of the node located at the pos given.
-- @param npos table The npos of the node.
-- @return false If node does not have a off version.
-- @return string Name of the node's off version.
circuits.get_off(npos)
```
## is_on
```lua
--- Check if the node is on or off at the given pos
-- @param npos table The npos of the node.
-- @return true If the node is on.
-- @return false If the node is off.
-- @return nil If the node is not on or off, or if pos was not supplied.
circuits.is_on(npos)
```
## npos
```lua
--- Mutate a pos into a npos.
-- @param pos table The position the node is at.
-- @param [node] table A table of the name, param1, and param2.
-- @return npos
circuits.npos(pos[, node])
```
## on_construct
```lua
--- Attempts to connect all nodes next to that pos
-- @param pos table The pos at which to attempt to connect nodes.
circuits.on_construct(pos)
```
## on_destruct
```lua
--- Disconnects all nodes attached to that pos
-- @param pos table
circuits.on_destruct(pos)
```
## register_node
```lua
--- Registers nodes, used internally
-- @param name string The name of the node
-- @param def table The node definition table
circuits.register_node(name, def)
```

# Power Functions
These functions are contained within the `power.lua` file.
## is_powering
```lua
--- Checks if the npos node is powering.
-- @param npos table The npos of the powering node.
-- @param node table The npos of the powered node.
-- @return The circuit power definition of the npos node.
-- @return false If the node does not have a circuit powering definition.
circuits.is_powering(npos, node)
```
## wait
```lua
--- Inserts a delayed update.
-- @param npos table The npos to be updated.
-- @param args Any arguments for the update.
-- @param no_ticks The delay for the update.
circuits.wait(npos, args, no_ticks)
```
## update
```lua
--- Creates an update with no delay.
-- @param npos table The npos to be updated.
-- @param args Any arguments for the update.
circuits.update(npos, args)
```
## power_update
```lua
--- Creates a power update with no delay.
-- @param npos table The npos to be updated.
-- @param args Any arguments for the update.
circuits.power_update(npos, args)
```

# Wire Functions
This function is contained within the `wire.lua` file.
## wire.update
```lua
--- Updates the wire.
-- @param npos table The npos of the node to be updated.
circuits.wire_update(npos)
```