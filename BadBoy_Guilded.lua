
local triggers = {
	"recruit",
	"looking for.*join us",--<> is Looking for Dedicated and skilled DPS and Healer classes to join us in the current 10 man  raids and expand to 25 man raids. Raids on mon,wed,thurs,sunday 21.00-24.00 18+
	"www.*apply", --pls go to <> to apply or wisp me for extra info.
}
local savedID, result = 0, nil
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(_,_,msg,_,_,_,_,_,chanid,_,_,_,id)
	if id == savedID then return result else savedID = id end --Incase a message is sent more than once
	if chanid == 0 or chanid == 25 then result = nil return end --Don't scan custom channels or GuildRecruitment channel
	if not _G.CanComplainChat(id) then result = nil return end --Don't filter ourself/friends
	msg = (msg):lower() --Lower all text, remove capitals
	for i = 1, 3 do
		if (msg):find(triggers[i]) then --Found a match
			result = true
			if BADBOY_DEBUG then print("GUILDED Blocked: ", msg) end
			return true --found a trigger, filter
		end
	end
	result = nil
end)

