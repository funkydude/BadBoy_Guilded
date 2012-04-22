
do
	BadBoyGuildedConfigTitle:SetText("BadBoy_Guilded @project-version@") --wowace magic, replaced with tag version

	local guildedWhispers = CreateFrame("CheckButton", "BadBoyGuildedWhispersButton", BadBoyConfig, "OptionsBaseCheckButtonTemplate")
	guildedWhispers:SetPoint("TOPLEFT", BadBoyConfigPopupButton, "BOTTOMLEFT", 0, -67)
	guildedWhispers:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		if tick then
			PlaySound("igMainMenuOptionCheckBoxOn")
			BADBOY_GWHISPERS = true
		else
			PlaySound("igMainMenuOptionCheckBoxOff")
			BADBOY_GWHISPERS = nil
		end
	end)

	local guildedWhispersText = guildedWhispers:CreateFontString("BadBoyGuildedWhispersButtonTitle", "ARTWORK", "GameFontHighlight")
	guildedWhispersText:SetPoint("LEFT", guildedWhispers, "RIGHT", 0, 1)

	guildedWhispersText:SetText("Remove guild invite whispers")
	local L = GetLocale()
	if L == "frFR" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "deDE" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "zhTW" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "zhCN" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "esES" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "esMX" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "ruRU" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "koKR" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "ptBR" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	elseif L == "itIT" then
		guildedWhispersText:SetText("Remove guild invite whispers")
	end

	local guildedInvites = CreateFrame("CheckButton", "BadBoyguildedInvitesButton", BadBoyConfig, "OptionsBaseCheckButtonTemplate")
	guildedInvites:SetPoint("TOPLEFT", BadBoyConfigPopupButton, "BOTTOMLEFT", 0, -87)
	guildedInvites:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		InterfaceOptionsControlsPanelBlockGuildInvites:SetValue(tick)
	end)

	local guildedInvitesText = guildedInvites:CreateFontString("BadBoyGuildedWhispersButtonTitle", "ARTWORK", "GameFontHighlight")
	guildedInvitesText:SetPoint("LEFT", guildedInvites, "RIGHT", 0, 1)
	guildedInvitesText:SetText(BLOCK_GUILD_INVITES)

	BadBoyConfig:HookScript("OnShow", function()
		BadBoyGuildedWhispersButton:SetChecked(BADBOY_GWHISPERS)
		BadBoyguildedInvitesButton:SetChecked(InterfaceOptionsControlsPanelBlockGuildInvites:GetValue())
	end)
end
