---@type table
local SettingsButton = {
	Rectangle = { Y = 0, Width = 431, Height = 38 },
	Text = { X = 8, Y = 3, Scale = 0.33 },
	LeftBadge = { Y = -2, Width = 40, Height = 40 },
	RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
	RightText = { X = 420, Y = 4, Scale = 0.35 },
	SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}

---@type table
local SettingsCheckbox = {
	Dictionary = "commonmenu",
	Textures = {
		"shop_box_blankb", -- 1
		"shop_box_tickb", -- 2
		"shop_box_blank", -- 3
		"shop_box_tick", -- 4
		"shop_box_crossb", -- 5
		"shop_box_cross", -- 6
	},
	X = 380, Y = -6, Width = 50, Height = 50
}

RageUI2.CheckboxStyle = {
	Tick = 1,
	Cross = 2
}

---StyleCheckBox
---@param Selected number
---@param Checked boolean
---@param Box number
---@param BoxSelect number
---@return nil
local function StyleCheckBox(Selected, Checked, Box, BoxSelect, OffSet)
	---@type table
	local CurrentMenu = RageUI2.CurrentMenu

	if OffSet == nil then
		OffSet = 0
	end

	if Selected then
		if Checked then
			RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[Box], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
		else
			RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[1], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset-OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
		end
	else
		if Checked then
			RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[BoxSelect], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
		else
			RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[3], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
		end
	end
end

---CheckBoxLockBadgeColor
---@param Selected boolean
---@return table
local function CheckBoxLockBadgeColor(Selected)
	if Selected then
		return 0, 0, 0, 255
	else
		return 163, 159, 148, 255
	end
end

---Checkbox
---@param Label string
---@param Description string
---@param Checked boolean
---@param Callback function
---@return nil
---@public
function RageUI2.Checkbox(Label, Description, Checked, Style, Callback)
	---@type table
	local CurrentMenu = RageUI2.CurrentMenu

	if CurrentMenu ~= nil then
		if CurrentMenu() then
			---@type number
			local Option = RageUI2.Options + 1

			if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
				---@type number
				local Selected = CurrentMenu.Index == Option
				local LeftBadgeOffset = ((Style.LeftBadge == RageUI2.BadgeStyle.None or tonumber(Style.LeftBadge) == nil) and 0 or 27)
				local RightBadgeOffset = ((Style.RightBadge == RageUI2.BadgeStyle.None or tonumber(Style.RightBadge) == nil) and 0 or 32)
				local BoxOffset = 0
				RageUI2.ItemsSafeZone(CurrentMenu)

				local Hovered = false

				---@type boolean
				if CurrentMenu.EnableMouse == true then
					Hovered = RageUI2.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton)
				end

				if Selected then
					RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
				end

				if type(Style) == "table" then
					if Style.Enabled == true or Style.Enabled == nil then
						if Selected then
							RenderText(Label, CurrentMenu.X + SettingsButton.Text.X+LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
						else
							RenderText(Label, CurrentMenu.X + SettingsButton.Text.X+LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
						end

						if type(Style) == 'table' then
							if Style.LeftBadge ~= nil then
								if Style.LeftBadge ~= RageUI2.BadgeStyle.None and tonumber(Style.LeftBadge) ~= nil then
									RenderSprite(RageUI2.GetBadgeDictionary(Style.LeftBadge, Selected), RageUI2.GetBadgeTexture(Style.LeftBadge, Selected), CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, RageUI2.GetBadgeColour(Style.LeftBadge, Selected))
								end
							end

							if Style.RightBadge ~= nil then
								if Style.RightBadge ~= RageUI2.BadgeStyle.None and tonumber(Style.RightBadge) ~= nil then
									RenderSprite(RageUI2.GetBadgeDictionary(Style.RightBadge, Selected), RageUI2.GetBadgeTexture(Style.RightBadge, Selected), CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, RageUI2.GetBadgeColour(Style.RightBadge, Selected))
								end
							end
						end
					else
						---@type table
						local LeftBadge = RageUI2.BadgeStyle.Lock
						---@type number
						local LeftBadgeOffset = ((LeftBadge == RageUI2.BadgeStyle.None or tonumber(LeftBadge) == nil) and 0 or 27)

						if Selected then
							RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
						else
							RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
						end

						if LeftBadge ~= RageUI2.BadgeStyle.None and tonumber(LeftBadge) ~= nil then
							RenderSprite(RageUI2.GetBadgeDictionary(LeftBadge, Selected), RageUI2.GetBadgeTexture(LeftBadge, Selected), CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, nil, CheckBoxLockBadgeColor(Selected))
						end
					end

					if Enabled == true or Enabled == nil then
						if Selected then
							if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
								RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
								BoxOffset = MeasureStringWidth(Style.RightLabel,0,0.35)
							end
						else
							if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
								RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI2.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
								BoxOffset = MeasureStringWidth(Style.RightLabel,0,0.35)
							end
						end
					end
	
					BoxOffset = RightBadgeOffset + BoxOffset

					if Style.Style ~= nil then
						if Style.Style == RageUI2.CheckboxStyle.Tick then
							StyleCheckBox(Selected, Checked, 2, 4,BoxOffset)
						elseif Style.Style == RageUI2.CheckboxStyle.Cross then
							StyleCheckBox(Selected, Checked, 5, 6,BoxOffset)
						else
							StyleCheckBox(Selected, Checked, 2, 4,BoxOffset)
						end
					else
						StyleCheckBox(Selected, Checked, 2, 4,BoxOffset)
					end

					if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and (Style.Enabled == true or Style.Enabled == nil) then
						local Audio = RageUI2.Settings.Audio
						RageUI2.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
						Checked = not Checked
					end

					if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and (Style.Enabled == false) then
						local Audio = RageUI2.Settings.Audio
						RageUI2.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
						Checked = false
					end
				else
					error("UICheckBox Style is not a `table`")
				end

				RageUI2.ItemOffset = RageUI2.ItemOffset + SettingsButton.Rectangle.Height
				RageUI2.ItemsDescription(CurrentMenu, Description, Selected)

				Callback(Hovered, Selected, ((CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and Selected), Checked)
			end

			RageUI2.Options = RageUI2.Options + 1
		end
	end
end