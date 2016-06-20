
local function run(msg)
if msg.text == "/help" then
	return "\n\n English : Dear , to see commands for only sudo , send : /help sudo\n And for see commands for admins , send : /help me \n------------------------------\n Developers Telegram Team "
end
end

return {
	description = "anti help by sajad", 
	usage = "anti help",
	patterns = {
    "^/help$",

}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
