
--adds a list to the end of another list without ovewriting data.
function mtul.tbl.append(table, other_table)
	local length = #table
	for index, value in ipairs(other_table) do
		table[length + index] = value
	end
	return table
end

--this... I guess lists keys by their order??? I have no idea, depended on by b3d standalone.
function mtul.tbl.keys(table)
	local keys = {}
	for key, _ in pairs(table) do
		keys[#keys + 1] = key
	end
	return keys
end