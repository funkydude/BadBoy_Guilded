
do
	BadBoyGuildedConfigTitle:SetText("BadBoy_Guilded")

	local guildedWhispers = CreateFrame("CheckButton", nil, BadBoyConfig, "OptionsBaseCheckButtonTemplate")
	guildedWhispers:SetPoint("TOPLEFT", BadBoyGuildedConfigTitle, "BOTTOMLEFT")
	guildedWhispers:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		BADBOY_GWHISPER = tick
		if tick then
			PlaySound(856) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
		else
			PlaySound(857) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
		end
	end)
	guildedWhispers:SetScript("OnShow", function(frame)
		frame:SetChecked(BADBOY_GWHISPER)
	end)

	local guildedWhispersText = guildedWhispers:CreateFontString(nil, nil, "GameFontHighlight")
	guildedWhispersText:SetPoint("LEFT", guildedWhispers, "RIGHT", 0, 1)

	guildedWhispersText:SetText("Remove guild invite whispers")
	local BLOCK_GUILD_INVITES = "Block Guild Invites"
	do
		local L = GetLocale()
		if L == "frFR" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "Bloquer les invitations de guilde"
		elseif L == "deDE" then
			guildedWhispersText:SetText("Entferne geflüsterte Gildeneinladungen")
			BLOCK_GUILD_INVITES = "Gildeneinladungen blockieren"
		elseif L == "zhTW" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "阻止公會邀請"
		elseif L == "zhCN" then
			guildedWhispersText:SetText("移除公会邀请密语")
			BLOCK_GUILD_INVITES = "阻止公会邀请"
		elseif L == "esES" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "Bloquear invitaciones de hermandad"
		elseif L == "esMX" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "Bloquear invitaciones de hermandad"
		elseif L == "ruRU" then
			guildedWhispersText:SetText("Блокировать личные сообщения, содержащие приглашения в гильдию")
			BLOCK_GUILD_INVITES = "Блокировать приглашения в гильдию"
		elseif L == "koKR" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "길드 초대 차단"
		elseif L == "ptBR" then
			guildedWhispersText:SetText("Remove sussurros de convites de guilda")
			BLOCK_GUILD_INVITES = "Bloquear convites da guilda"
		elseif L == "itIT" then
			--guildedWhispersText:SetText("Remove guild invite whispers")
			BLOCK_GUILD_INVITES = "Blocca inviti di gilda"
		end
	end

	local guildedInvites = CreateFrame("CheckButton", nil, BadBoyConfig, "OptionsBaseCheckButtonTemplate")
	guildedInvites:SetPoint("TOPLEFT", guildedWhispers, "BOTTOMLEFT")
	guildedInvites:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		SetAutoDeclineGuildInvites(tick)
		if tick then
			PlaySound(856) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
		else
			PlaySound(857) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
		end
	end)
	guildedInvites:SetScript("OnShow", function(frame)
		frame:SetChecked(GetAutoDeclineGuildInvites())
	end)

	local guildedInvitesText = guildedInvites:CreateFontString(nil, nil, "GameFontHighlight")
	guildedInvitesText:SetPoint("LEFT", guildedInvites, "RIGHT", 0, 1)
	guildedInvitesText:SetText(BLOCK_GUILD_INVITES)
end

