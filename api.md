# Functions
These are functions contained within the namespace `circuits` to be used both
internally and externally. This documentation of them is a work in progress.  
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