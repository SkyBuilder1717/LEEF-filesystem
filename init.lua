leef = leef or {
    loaded_modules = {}
}
--initialize namespace vars if not present.
leef.binary = leef.binary or {}
leef.utils = leef.utils or {}
leef.paths = leef.paths or {}
leef.loaded_modules.filesystem = true
--run files. These will directly modify the leef sub tables.
local path = minetest.get_modpath("leef_filesystem")
dofile(path.."/modlib/binary.lua")
dofile(path.."/modlib/mod_utils.lua")
dofile(path.."/modlib/paths.lua")
