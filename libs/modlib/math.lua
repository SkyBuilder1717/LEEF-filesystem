function mtul.math.fround(number)
	if number == 0 or number ~= number then
		return number
	end
	local sign = 1
	if number < 0 then
		sign = -1
		number = -number
	end
	local _, exp = math.frexp(number)
	exp = exp - 1 -- we want 2^exponent >= number > 2^(exponent-1)
	local powexp = 2 ^ math.max(-126, math.min(exp, 127))
	local leading = exp <= -127 and 0 or 1 -- subnormal number?
	local mantissa = math.floor((number / powexp - leading) * 0x800000 + 0.5)
	if
		mantissa > 0x800000 -- doesn't fit in mantissa
		or (exp >= 127 and mantissa == 0x800000) -- fits if the exponent can be increased
	then
		return sign * inf
	end
	return sign * powexp * (leading + mantissa / 0x800000)
end