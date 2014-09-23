--[[ INTERNAL ]]--

local sharedEnv = {}

--[[ TABLES ]]--

env = {}
termio = {}
setmetatable(termio, {__index = term})

--[[ SHARED ENV FUNCTIONS ]]--

function env.get()
	return sharedEnv
end

function env.reset()
	local wipeList = {}
	for k in pairs(sharedEnv) do
		wipeList[k] = true
	end
	for k in pairs(wipeList) do
		sharedEnv[k] = nil
	end
end

if graphics then
	termio.reset = graphics.reset or nil
end
