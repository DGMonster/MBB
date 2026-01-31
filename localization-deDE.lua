if( GetLocale() == "deDE" ) then
	MBB_TOOLTIP1 = "Strg + Rechtsklick auf einen Button, um ihn aus der Leiste zu lösen.";
	MBB_OPTIONS_HEADER = "Einstellungen";
	MBB_OPTIONS_OKBUTTON = "Ok";
	MBB_OPTIONS_CANCELBUTTON = "Abbrechen";
	MBB_OPTIONS_SLIDEROFF = "Aus";
	MBB_OPTIONS_SLIDERSEK = "Sek.";
	MBB_OPTIONS_SLIDERLABEL = "Autom. ausblenden:";
	MBB_OPTIONS_EXPANSIONLABEL = "Ausklappen nach:";
	MBB_OPTIONS_EXPANSIONLEFT = "Links";
	MBB_OPTIONS_EXPANSIONTOP = "Oben";
	MBB_OPTIONS_EXPANSIONRIGHT = "Rechts";
	MBB_OPTIONS_EXPANSIONBOTTOM = "Unten";
	MBB_OPTIONS_MAXBUTTONSLABEL = "Max. Knöpfe/Zeile:";
	MBB_OPTIONS_MAXBUTTONSINFO = "(0=unendlich)";
	MBB_OPTIONS_ALTEXPANSIONLABEL = "Alt. Ausklappen nach:";
	MBB_HELP1 = "Gib \"/mmbb <cmd>\" ein, wobei <cmd> folgendes sein kann:";
	MBB_HELP2 = "  |c00ffffffbuttons|r: Zeigt eine Liste aller Frames in der MBB Leiste";
	MBB_HELP3 = "  |c00ffffffreset position|r: Setzt den MBB Minimap Button an seine ursprüngliche Position";
	MBB_HELP4 = "  |c00ffffffreset all|r: Setzt alle Einstellungen auf ihre ursprünglichen Werte";
	MBB_NOERRORS = "Keine Fehler gefunden!";
	MBB_FIRST_RUN_TITLE = "MinimapButtonBag Reborn geladen."
    MBB_FIRST_RUN_COUNT = "%d Minimap-Buttons gesammelt."
    MBB_FIRST_RUN_HELP = "Gib /mbb ein, um alle Befehle zu sehen."
    MBB_FIRST_RUN_RESCAN = "Nutze /mbb rescan, falls Buttons fehlen."


	-- NEW: About / Credits
	MBB_ABOUT_TITLE = "MinimapButtonBag Reborn";
	MBB_ABOUT_VERSION = "Version:";
	MBB_ABOUT_BASED_ON = "(basierend auf 4.0.26)";
	MBB_ABOUT_CREDITS_TITLE = "Credits:";

	-- NEW: Patch status (/mbb patch)
	MBB_PATCH_STATUS_TITLE = "MinimapButtonBag Reborn – Patch-Status";
	MBB_PATCH_ADDON_INTERFACE = "Addon Interface-Version:";
	MBB_PATCH_WOW_INTERFACE = "Aktuelle WoW Interface-Version:";
	MBB_PATCH_OK = "Status: Addon ist für diesen WoW-Patch aktuell.";
	MBB_PATCH_OLD = "Status: Dieses Addon wurde für einen älteren WoW-Patch erstellt. Bitte prüfe auf Updates.";

	-- NEW: Help lines (optional, if you print them)
	MBB_HELP_ABOUT = "  |c00ffffffabout|r: Zeigt Addon-Infos (Version & Credits)";
	MBB_HELP_PATCH = "  |c00ffffffpatch|r: Zeigt Patch-Kompatibilitätsstatus";
	MBB_HELP_RESCAN = "  |c00ffffffrescan|r: Scannt die Minimap erneut nach fehlenden Buttons";
    MBB_RESCAN_DONE = "MBB: Rescan abgeschlossen. %d neue Minimap-Buttons gefunden.";
	
	-- Detach / Free move option
	MBB_OPTIONS_DETACH = "Von der Minimap lösen";
	MBB_OPTIONS_DETACH_DESC = "Erlaubt es, den MBB-Button frei auf dem Bildschirm zu platzieren.";
	MBB_OPTIONS_DETACH_COMBAT = "Kann im Kampf nicht geändert werden.";
end
