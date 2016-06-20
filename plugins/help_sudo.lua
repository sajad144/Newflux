local function run(msg, matches)
  if is_chat_msg(msg) then
    local text = [[
    💭 - Commands for only sudo 🗣 :
🌟 - /update : تحديث لتجنب الايقاف
🌟 - /serverinfo : معلومات وتسريع السيرفر
🌟 - /tosuper : تحويل المجموعه الى سوبر
🌟 - /pro : رفع مطور
🌟 - /dem : أزاله مطور
🌟 - /aded : أضافه البوت
🌟 - /remo : حذف البوت
🌟 - /rmsg : حذف جميع الرسائل 
🌟 - /sban : حضر عام عبر الرد
🌟 - /unsban : فك حضر عام عبر رد

]]
    return text
  end
  if is_channel_msg(msg) then
    local text =[[
💭 - Commands for only sudo 🗣 :
🌟 - /update : تحديث لتجنب الايقاف
🌟 - /serverinfo : معلومات وتسريع السيرفر
🌟 - /tosuper : تحويل المجموعه الى سوبر
🌟 - /pro : رفع مطور
🌟 - /dem : أزاله مطور
🌟 - /aded : أضافه البوت
🌟 - /remo : حذف البوت
🌟 - /rmsg : حذف جميع الرسائل 
🌟 - /sban : حضر عام عبر الرد
🌟 - /unsban : فك حضر عام عبر رد

]]
    return text
  else
    local text = [[aaa]]
    --return text
  end
end

return {
  description = "Help plugin. Get info from other plugins.  ", 
  usage = {
    "!help: Show list of plugins.",
  },
  patterns = {
    "^/(help sudo)$",
  }, 
  run = run,
}
