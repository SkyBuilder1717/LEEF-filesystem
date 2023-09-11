mtul = {
    binary = {}, --provided entirely by modlib.
    utils = {}, --provided entirely by modlib.
    tbl = {}, --modified by libs.modlib, source.
    loaded_modules = {}
}

--optionally allow user to overset local math with mtul while still keeping core funcs & consts.
mtul.math = {}
for i, v in pairs(math) do
    mtul.math[i] = v
end

--run files. These will directly modify the mtul sub tables.
mtul.path = minetest.get_modpath("mtul_core")
dofile(mtul.path.."/modlib/binary.lua")
dofile(mtul.path.."/modlib/table.lua")
dofile(mtul.path.."/modlib/mod_utils.lua")
dofile(mtul.path.."/modlib/mod_utils_media.lua")
