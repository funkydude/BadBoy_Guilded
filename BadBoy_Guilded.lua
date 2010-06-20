
local savedID, result = 0, nil
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(_,_,msg,_,_,_,_,_,chanid,_,_,_,id)
	if id == savedID then return result else savedID = id end --Incase a message is sent more than once
	if chanid == 0 or chanid == 25 then result = nil return end --Don't scan custom channels or GuildRecruitment channel
	if not _G.CanComplainChat(id) then result = nil return end --Don't filter ourself/friends
	if msg:find("[Gg][Uu][Ii][Ll][Dd]") or msg:find("[Rr][Ee][Cc][Rr][Uu][Ii][Tt]") then
			result = true
			print("NO_GUILD", msg)
			return true --found a trigger, filter
	end
	result = nil
end)

