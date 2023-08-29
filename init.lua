mtul = {
    binary = {}, --provided entirely by modlib.
    tbl = {} --modified by libs.modlib, source.
}

--optionally allow user to overset local math with mtul while still keeping core funcs & consts.
mtul.math = {}
for i, v in pairs(math) do
    mtul[i] = v
end

--run files. These will directly modify the mtul sub tables.
mtul.path = minetest.get_modpath("MTUL-core")
dofile(mtul.path.."/libs/modlib/binary.lua")
dofile(mtul.path.."/libs/modlib/table.lua")
dofile(mtul.path.."/libs/modlib/math.lua")
--utilities
--[[
    exports:
    mtul.
    media_paths
    overriden_media_paths
    modname_by_media
    overriden_modnames_by_media
]]
dofile(mtul.path.."/libs/modlib/mod_utils.lua")
dofile(mtul.path.."/libs/modlib/mod_utils_media.lua")
