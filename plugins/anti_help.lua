local function run(msg)
if msg.text == "/help" then
	return "\n\n English : Dear User You are not eligible to use these commands Please take care to not evicted \n------------------------------\n عربيه : عزيزي المستخدم أنت غير مؤهل لاستخدام هذه الاوامر نرجو أخذ الحذر لعدم طردك \n------------------------------\n Developers Telegram team "
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
