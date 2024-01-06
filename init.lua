mtul = mtul or {
    loaded_modules = {}
}
--initialize namespace vars if not present.
mtul.binary = mtul.binary or {}
mtul.utils = mtul.utils or {}
mtul.loaded_modules.filesystem = true
--optionally allow user to overset local math with mtul while still keeping core funcs & consts.
mtul.math = {}
for i, v in pairs(math) do
    mtul.math[i] = v
end

--run files. These will directly modify the mtul sub tables.
mtul.path = minetest.get_modpath("mtul_filesystem")
dofile(mtul.path.."/modlib/binary.lua")
dofile(mtul.path.."/modlib/mod_utils.lua")
dofile(mtul.path.."/modlib/mod_utils_media.lua")
