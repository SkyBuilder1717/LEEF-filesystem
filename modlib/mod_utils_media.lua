--felt this was big enough that it practically deserved it's own file.
-- TODO support for server texture packs (and possibly client TPs in singleplayer?)
local media_foldernames = {"textures", "sounds", "media", "models", "locale"}
local media_extensions = {
	-- Textures
	"png", "jpg", "bmp", "tga", "pcx", "ppm", "psd", "wal", "rgb";
	-- Sounds
	"ogg";
	-- Models
	"x", "b3d", "md2", "obj";
	-- Translations
	"tr";
}
local function split_extension(filename)
	return filename:match"^(.*)%.(.*)$"
end
--mmmm yes, according to modlib we should make this loop it's own global function apart of modlib. Foolish me thinking we can just make case specific
for i, v in pairs(media_extensions) do
    media_extensions[v] = true
end
local function collect_media(modname)
	local media = {}
	local function traverse(folderpath)
		-- Traverse files (collect media)
		local filenames = minetest.get_dir_list(folderpath, false)
		for _, filename in pairs(filenames) do
			local _, ext = split_extension(filename)
			if media_extensions[ext] then
				media[filename] = table.concat({folderpath, filename}, "/")
			end
		end
		-- Traverse subfolders
		local foldernames = minetest.get_dir_list(folderpath, true)
		for _, foldername in pairs(foldernames) do
			if not foldername:match"^[_%.]" then -- ignore hidden subfolders / subfolders starting with `_`
				traverse(table.concat({folderpath, foldername}, "/"))
			end
		end
	end
	for _, foldername in ipairs(media_foldernames) do -- order matters!
		traverse(mtul.utils.get_resource(modname, foldername))
	end
	return media
end

-- TODO clean this up eventually
local paths = {}
local mods = {}
local overridden_paths = {}
local overridden_mods = {}
for _, mod in ipairs(mtul.utils.get_mod_load_order()) do
	local mod_media = collect_media(mod.name)
	for medianame, path in pairs(mod_media) do
		if paths[medianame] then
			overridden_paths[medianame] = overridden_paths[medianame] or {}
			table.insert(overridden_paths[medianame], paths[medianame])
			overridden_mods[medianame] = overridden_mods[medianame] or {}
			table.insert(overridden_mods[medianame], mods[medianame])
		end
		paths[medianame] = path
		mods[medianame] = mod.name
	end
end
mtul.media_paths = paths
mtul.overriden_media_paths = paths
mtul.modname_by_media = paths
mtul.overriden_modnames_by_media = paths