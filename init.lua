mtul = mtul or {
    loaded_modules = {}
}
--initialize namespace vars if not present.
mtul.binary = mtul.binary or {}
mtul.utils = mtul.utils or {}
mtul.paths = mtul.paths or {}
mtul.loaded_modules.filesystem = true
--run files. These will directly modify the mtul sub tables.
local path = minetest.get_modpath("mtul_filesystem")
dofile(path.."/modlib/binary.lua")
dofile(path.."/modlib/mod_utils.lua")
dofile(path.."/modlib/paths.lua")
