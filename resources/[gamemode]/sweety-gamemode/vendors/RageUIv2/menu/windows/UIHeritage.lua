---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUIv2 Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUIv2
---


---@type table
local Heritage = {
    Background = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "mumdadbg", Width = 431, Height = 228 },
    Mum = { Dictionary = "char_creator_portraits", X = 25, Width = 228, Height = 228 },
    Dad = { Dictionary = "char_creator_portraits", X = 195, Width = 228, Height = 228 },
}

---@type Window
function RageUIv2.Window.Heritage(Mum, Dad)
    ---@type table
    local CurrentMenu = RageUIv2.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if Mum < 0 or Mum > 21 then
                Mum = 0
            end
            if Dad < 0 or Dad > 23 then
                Dad = 0
            end
            if Mum == 21 then
                Mum = "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1)
            else
                Mum = "female_" .. Mum
            end
            if Dad >= 21 then
                Dad = "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1)
            else
                Dad = "male_" .. Dad
            end
            RenderSprite(Heritage.Background.Dictionary, Heritage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUIv2.ItemOffset, Heritage.Background.Width + (CurrentMenu.WidthOffset / 1), Heritage.Background.Height)
            RenderSprite(Heritage.Dad.Dictionary, Dad, CurrentMenu.X + Heritage.Dad.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUIv2.ItemOffset, Heritage.Dad.Width, Heritage.Dad.Height)
            RenderSprite(Heritage.Mum.Dictionary, Mum, CurrentMenu.X + Heritage.Mum.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUIv2.ItemOffset, Heritage.Mum.Width, Heritage.Mum.Height)
            RageUIv2.ItemOffset = RageUIv2.ItemOffset + Heritage.Background.Height
        end
    end
end

