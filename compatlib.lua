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

function termio.reset(bg, fg)
	if bg then
		term.current().setBackgroundColor(bg)
	end
	if fg then
		term.current().setTextColor(fg)
	end
	term.current().clear()
	term.current().setCursorPos(1, 1)
end
