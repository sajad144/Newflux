do

local function pre_process(msg)
    
    --Checking mute
    local hash = 'mate:'..msg.to.id
    if redis:get(hash) and msg.fwd_from then
            delete_msg(msg.id, ok_cb, true)
            return "done"
        end
    
        return msg
    end


local function run(msg, matches)
    chat_id =  msg.to.id
    
    if is_admin(msg) and matches[1] == 'forward' then
      
            
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return "It Has Been Closed Forward Messages"
  elseif is_momod(msg) and matches[1] == 'unforward' then
      local hash = 'mate:'..msg.to.id
      redis:del(hash)
      return "It Has Been Opened Forward Messages"
end

end

return {
    patterns = {
        '^/(forward)$',
        '^/(unforward)$'
    },
    run = run,
    pre_process = pre_process
}
end
