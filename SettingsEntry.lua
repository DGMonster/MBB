-- Embed the existing controls; both entry points share the same settings.
local settingsPanel;
local standaloneStrata;
local standaloneLevel;
local footerAnchors = {};

local function RestoreFooter()
    for button, anchor in pairs(footerAnchors) do
        button:SetParent(MBB_OptionsFrame);
        button:ClearAllPoints();
        button:SetPoint(unpack(anchor));
        button:Show();
    end
    wipe(footerAnchors);
end

local function RestoreStandalone()
    local frame = MBB_OptionsFrame;
    if not frame or not frame.MBBEmbedded then return; end
    frame:Hide();
    RestoreFooter();
    frame:SetParent(UIParent);
    frame.MBBEmbedded = nil;
    frame:SetFrameStrata(standaloneStrata);
    frame:SetFrameLevel(standaloneLevel);
    frame:SetMovable(true);
    frame:SetClampedToScreen(true);
    MBB_OptionsFrame_OKButton:SetText(MBB_OPTIONS_OKBUTTON);
    MBB_RestoreOptionsFramePosition();
end

function MBB_OpenOptions()
    -- The minimap entry still opens an independent window.
    if settingsPanel and settingsPanel:IsShown() then
        local host = SettingsPanel or InterfaceOptionsFrame;
        if host and host:IsShown() then
            if HideUIPanel then HideUIPanel(host); else host:Hide(); end
        end
    end
    RestoreStandalone();
    if MBB_OptionsFrame then MBB_OptionsFrame:Show(); end
end

local loader = CreateFrame("Frame");
loader:RegisterEvent("PLAYER_LOGIN");
loader:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN");
    local modern = Settings and type(Settings.RegisterCanvasLayoutCategory) == "function" and
        type(Settings.RegisterAddOnCategory) == "function";
    if not modern and type(InterfaceOptions_AddCategory) ~= "function" then return; end

    local panel = CreateFrame("Frame", "MBB_SettingsCategory", UIParent);
    settingsPanel = panel;
    panel.name = "MinimapButtonBag Reborn";
    panel:Hide();

    local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge");
    title:SetPoint("TOPLEFT", 16, -16);
    title:SetText(panel.name);

    local scroll = CreateFrame("ScrollFrame", "MBB_SettingsScroll", panel, "UIPanelScrollFrameTemplate");
    scroll:SetPoint("TOPLEFT", 0, -48);
    scroll:SetPoint("BOTTOMRIGHT", -30, 58);
    local content = CreateFrame("Frame", nil, scroll);
    content:SetSize(500, 478);
    scroll:SetScrollChild(content);

    local sectionBackdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    };
    -- Match the section headings and control positions in MBB.xml.
    local sectionBounds = {
        { 54, 131 },  -- Bar
        { 147, 295 }, -- Layout
        { 312, 414 }, -- Position
        { 435, 477 }, -- Profile
    };
    for _, bounds in ipairs(sectionBounds) do
        local section = CreateFrame("Frame", nil, content, "BackdropTemplate");
        section:SetFrameLevel(content:GetFrameLevel());
        section:SetPoint("TOPLEFT", content, "TOPLEFT", 24, -bounds[1]);
        section:SetPoint("TOPRIGHT", content, "TOPRIGHT", -18, -bounds[1]);
        section:SetHeight(bounds[2] - bounds[1]);
        section:SetBackdrop(sectionBackdrop);
        section:SetBackdropColor(0.08, 0.06, 0.04, 0.28);
        section:SetBackdropBorderColor(0.70, 0.61, 0.48, 0.72);
        section:EnableMouse(false);
    end

    panel:SetScript("OnShow", function()
        local frame = MBB_OptionsFrame;
        if not frame then return; end
        standaloneStrata = frame:GetFrameStrata();
        standaloneLevel = frame:GetFrameLevel();
        frame:Hide();
        frame.MBBEmbedded = true;
        frame:SetParent(content);
        frame:SetFrameStrata(panel:GetFrameStrata());
        frame:SetFrameLevel(content:GetFrameLevel() + 1);
        frame:SetMovable(false);
        frame:SetClampedToScreen(false);
        frame:ClearAllPoints();
        frame:SetPoint("TOPLEFT", content, "TOPLEFT", 8, 0);
        for index, button in ipairs({ MBB_OptionsFrame_OKButton, MBB_OptionsFrame_CancelButton }) do
            footerAnchors[button] = { button:GetPoint() };
            button:SetParent(panel);
            button:ClearAllPoints();
            button:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 84 + (index - 1) * 180, 16);
            button:Show();
        end
        MBB_OptionsFrame_OKButton:SetText(APPLY or MBB_OPTIONS_OKBUTTON);
        frame:Show();
    end);
    panel:SetScript("OnHide", RestoreStandalone);

    -- Existing OK/Cancel scripts keep their save/reset semantics; the embedded
    -- controls stay visible and reload their displayed values afterwards.
    local function RefreshEmbedded()
        if panel:IsShown() and MBB_OptionsFrame.MBBEmbedded then
            MBB_OptionsFrame:Show();
        end
    end
    MBB_OptionsFrame_OKButton:HookScript("OnClick", RefreshEmbedded);
    MBB_OptionsFrame_CancelButton:HookScript("OnClick", RefreshEmbedded);

    if modern then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name);
        Settings.RegisterAddOnCategory(category);
    else
        InterfaceOptions_AddCategory(panel);
    end
end);
