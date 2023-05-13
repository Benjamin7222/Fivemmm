---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
}

function KaizoUI.Separator(Label)
    local CurrentMenu = KaizoUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = KaizoUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200), CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + KaizoUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255, 1)
                end
                KaizoUI.ItemOffset = KaizoUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (KaizoUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = KaizoUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            KaizoUI.Options = KaizoUI.Options + 1
        end
    end
end

