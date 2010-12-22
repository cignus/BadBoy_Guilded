
local savedID, result, triggers = 0, nil, {
	-- <> is currently expanding the raid team. We are looking for experienced raiders that are able to join our Cata raidforce. You need to be able to raid 2-3 times a week and willing to use ventrilo. We are on the lookout for melee dps and a tank.
	"looking for.*join [ou][us]r?",--<> is Looking for Dedicated and skilled DPS and Healer classes to join us in the current 10 man  raids and expand to 25 man raids. Raids on mon,wed,thurs,sunday 21.00-24.00 18+
	"www.*apply", --pls go to www.<>.com to apply or wisp me for extra info.
	"guild.*looking", --<> <Level 2> Are A New, Friendly Socail Guild Looking For New Active Members Of Any Class To Level Up And Hit 85 So We Can Build Up And Raid Cataclysm Endgame Content. /w Me For Info or A Invite
	"recruit",
}
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(_,_,msg,player,_,_,_,_,chanid,_,_,_,id)
	if id == savedID then return result else savedID = id end --Incase a message is sent more than once
	if chanid == 0 or chanid == 25 then result = nil return end --Don't scan custom channels or GuildRecruitment channel
	if not _G.CanComplainChat(id) or UnitIsInMyGuild(player) then result = nil return end --Don't filter ourself/friends
	msg = (msg):lower() --Lower all text, remove capitals
	for i = 1, 4 do
		if (msg):find(triggers[i]) then --Found a match
			result = true
			if BADBOY_DEBUG then print("|cFF33FF99BadBoy_GUILDED_BLOCK|r: ", msg) end
			return true --found a trigger, filter
		end
	end
	result = nil
end)

