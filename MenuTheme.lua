-- Menu appearance only. MBB remains independent of MayronUI.
local panels = {
    "MBB_OptionsFrame",
    "MBB_ButtonManagerFrame",
    "MBB_ProfileManagerFrame",
};
local white = "Interface\\Buttons\\WHITE8X8";
local backdrop = { bgFile = white, edgeFile = white, edgeSize = 1 };
local refreshing;
local hookedToolkit;
local Refresh;

local function GetTheme()
    local mui = _G.MayronUI;
    if mui and mui.GetCoreComponents and mui.db and mui.db.profile then
        local tk, _, _, gui = mui:GetCoreComponents();
        if tk and tk.GetThemeColor and tk.GetAssetFilePath and gui and gui.AddDialogTexture then
            local r, g, b = tk:GetThemeColor();
            return r, g, b, tk, gui;
        end
    end
    return 0.65, 0.65, 0.65;
end

local function AddBorder(frame)
    if not frame.MBBThemeBorder then
        local border = CreateFrame("Frame", nil, frame, "BackdropTemplate");
        border.MBBThemeDecoration = true;
        border:SetAllPoints();
        border:SetFrameLevel(frame:GetFrameLevel());
        border:EnableMouse(false);
        border:SetBackdrop(backdrop);
        border:SetBackdropColor(0, 0, 0, 0);
        frame.MBBThemeBorder = border;
    end
    return frame.MBBThemeBorder;
end

local function HideButtonEdges(button)
    local name = button:GetName();
    for _, part in ipairs({ "Left", "Middle", "Right" }) do
        local texture = button[part] or (name and _G[name .. part]);
        if texture and texture.Hide then texture:Hide(); end
    end
end

local function SetButtonTexture(button, setter, file, r, g, b, alpha)
    local texture = button:CreateTexture(nil, "ARTWORK");
    texture:SetPoint("TOPLEFT", 1, -1);
    texture:SetPoint("BOTTOMRIGHT", -1, 1);
    texture:SetTexture(file);
    texture:SetVertexColor(r, g, b, alpha);
    button[setter](button, texture);
    return texture;
end

local function StyleButton(button, r, g, b, tk)
    -- Leave icon-only controls (dropdown arrows, scroll arrows) intact.
    if not button.GetText or not button:GetText() or button:GetText() == "" then return; end
    HideButtonEdges(button);
    if not button.MBBThemeTextures then
        button.MBBThemeTextures = {
            SetButtonTexture(button, "SetNormalTexture", white, 1, 1, 1, 1),
            SetButtonTexture(button, "SetHighlightTexture", white, 1, 1, 1, 1),
            SetButtonTexture(button, "SetPushedTexture", white, 1, 1, 1, 1),
            SetButtonTexture(button, "SetDisabledTexture", white, 1, 1, 1, 1),
        };
        button:SetNormalFontObject("GameFontHighlight");
        button:SetDisabledFontObject("GameFontDisable");
    end
    local file = tk and tk:GetAssetFilePath("Textures\\Widgets\\Button") or white;
    local textures = button.MBBThemeTextures;
    for _, texture in ipairs(textures) do texture:SetTexture(file); end
    textures[1]:SetVertexColor(r * 0.35, g * 0.35, b * 0.35, 1);
    textures[2]:SetVertexColor(r, g, b, 0.25);
    textures[3]:SetVertexColor(r * 0.6, g * 0.6, b * 0.6, 1);
    textures[4]:SetVertexColor(0.25, 0.25, 0.25, 0.65);
    AddBorder(button):SetBackdropBorderColor(r, g, b, 0.75);
end

local function StyleControls(frame, r, g, b, tk)
    if frame.MBBThemeDecoration then return; end
    if frame:IsObjectType("CheckButton") then
        -- Keep the original radio/check shapes and disabled-state behaviour.
        local checked = frame:GetCheckedTexture();
        if checked then checked:SetVertexColor(r, g, b); end
        local highlight = frame:GetHighlightTexture();
        if highlight then highlight:SetVertexColor(r, g, b, 0.4); end
    elseif frame:IsObjectType("Button") then
        StyleButton(frame, r, g, b, tk);
    elseif frame:IsObjectType("Slider") then
        local thumb = frame:GetThumbTexture();
        if thumb then thumb:SetVertexColor(r, g, b); end
    end
    for _, child in ipairs({ frame:GetChildren() }) do
        StyleControls(child, r, g, b, tk);
    end
end

local function StylePanel(frame, r, g, b, tk, gui)
    if not frame.MBBThemeHooked then
        frame.MBBThemeHooked = true;
        frame:HookScript("OnShow", function() Refresh(); end);
    end
    frame:SetBackdrop(backdrop);
    frame:SetBackdropColor(0.055, 0.055, 0.055, 0.96);
    frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1);

    if gui and not frame.MBBThemeDialog then
        local background = CreateFrame("Frame", nil, frame);
        background.MBBThemeDecoration = true;
        background:SetAllPoints();
        background:SetFrameLevel(frame:GetFrameLevel());
        background:EnableMouse(false);
        gui:AddDialogTexture(background, "High", 0);
        background:SetFrameStrata(frame:GetFrameStrata());
        frame.MBBThemeDialog = background;
    end
    if frame.MBBThemeDialog then
        frame.MBBThemeDialog:SetFrameStrata(frame:GetFrameStrata());
    end

    if not frame.MBBThemeAccent then
        local accent = frame:CreateTexture(nil, "BORDER");
        accent:SetPoint("TOPLEFT", 1, -1);
        accent:SetPoint("TOPRIGHT", -1, -1);
        accent:SetHeight(2);
        accent:SetTexture(white);
        frame.MBBThemeAccent = accent;
    end
    frame.MBBThemeAccent:SetVertexColor(r, g, b);
    for _, region in ipairs({ frame:GetRegions() }) do
        if region:IsObjectType("FontString") then
            local text = region:GetText();
            if text and (text == (_G.MBB_MANAGER_TITLE or "Button Manager") or
                text == (_G.MBB_PROFILE_TITLE or "Profiles")) then
                region:SetTextColor(r, g, b);
            end
        end
    end
    if frame == _G.MBB_OptionsFrame then
        if _G.MBB_OptionsFrame_Header then _G.MBB_OptionsFrame_Header:Hide(); end
        if _G.MBB_OptionsFrame_HeaderText then
            _G.MBB_OptionsFrame_HeaderText:SetTextColor(r, g, b);
        end
    end
    StyleControls(frame, r, g, b, tk);
end

Refresh = function()
    if refreshing then return; end
    refreshing = true;
    local r, g, b, tk, gui = GetTheme();
    for _, name in ipairs(panels) do
        local frame = _G[name];
        if frame then StylePanel(frame, r, g, b, tk, gui); end
    end
    if tk and tk.UpdateThemeColor and hookedToolkit ~= tk then
        hookedToolkit = tk;
        hooksecurefunc(tk, "UpdateThemeColor", Refresh);
    end
    refreshing = nil;
end;

-- Refresh after lazy creation and row updates without replacing MBB handlers.
for _, name in ipairs({
    "MBB_ButtonManager_Create", "MBB_ButtonManager_Refresh",
    "MBB_ProfileManager_Create", "MBB_ProfileManager_Refresh",
}) do
    if type(_G[name]) == "function" then hooksecurefunc(name, Refresh); end
end

local events = CreateFrame("Frame");
events:RegisterEvent("PLAYER_LOGIN");
events:RegisterEvent("PLAYER_ENTERING_WORLD");
events:SetScript("OnEvent", Refresh);
