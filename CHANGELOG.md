# Changelog

## v2.0.7-rc

### English

- Preview button size immediately while dragging the size slider. The collected-button bar opens for the preview and stays visible while adjusting.
- Confirm the size with OK. Cancel or close the settings to restore the saved size.
- Keep collected buttons and the MBB launcher independent of minimap parent scaling so MBB controls their size.
- Restore the original parent-scale behavior when returning a collected button to the minimap.
- Defer preview cleanup until combat ends if settings close during combat.

MUI Reborn's matching change stops its own addon-button scaling while MBB is active. Install the corresponding MUI update for the complete integration.

Lua syntax, XML and package contents were checked. In-game confirmation across supported clients is pending.

### Deutsch

- Die Button-Größe wird beim Ziehen am Größenregler sofort angezeigt. Die Sammelleiste öffnet sich zur Vorschau und bleibt während der Anpassung sichtbar.
- OK übernimmt die Größe. Abbrechen oder Schließen der Einstellungen stellt die gespeicherte Größe wieder her.
- Eingesammelte Buttons und der MBB-Hauptbutton sind von der Skalierung ihres Minimap-Elternrahmens unabhängig. MBB bestimmt ihre Größe.
- Beim Zurückgeben eines Buttons an die Minimap wird dessen ursprüngliches Verhalten zur Elternskalierung wiederhergestellt.
- Wird die Vorschau im Kampf geschlossen, erfolgt das Zurücksetzen nach Kampfende.

Die passende Änderung in MUI Reborn setzt dessen eigene Addon-Button-Skalierung bei aktivem MBB aus. Für das vollständige Zusammenspiel wird das entsprechende MUI-Update benötigt.

Lua-Syntax, XML und Paketinhalt wurden geprüft. Die Bestätigung im Spiel auf den unterstützten Clients steht noch aus.


## v2.0.6

### English

- Documented the licensing policy. Previously published code remains under the Unlicense. Future original contributions explicitly marked as MIT-licensed use the MIT License.
- Included both license texts and clarified the original and Reborn credits.
- No gameplay or feature changes.

### Deutsch

- Die Lizenzregelung ist jetzt dokumentiert. Bereits veröffentlichter Code bleibt unter der Unlicense. Neue eigene Beiträge können künftig ausdrücklich unter MIT veröffentlicht werden.
- Beide Lizenztexte sind enthalten. Die Credits für das Original und Reborn sind ausgewiesen.
- Keine Änderungen an den Addon-Funktionen.

## v2.0.4 – 2026-11-09

### English

- Added two customizable key bindings to toggle the minimap button bar and open the MBB settings window.
- Both actions are unassigned by default and can be bound in WoW's Keybindings menu. They are available outside combat.

### Deutsch

- Zwei frei belegbare Tastaturaktionen ergänzt. Sie klappen die Minimap-Leiste ein und aus oder öffnen die MBB-Einstellungen.
- Beide Aktionen sind standardmäßig unbelegt und lassen sich in WoWs Tastaturbelegung zuweisen. Sie sind außerhalb des Kampfes verfügbar.


## v2.0.3 – 2026-10-22

### English

- Embedded the existing MBB controls directly in WoW's AddOns settings, while
  keeping the independent minimap settings window available.
- Added a dark, neutral menu design for standalone MBB installations.
- Added optional MUI Reborn styling for settings, profile and button-management windows.
- Menu accents follow MUI's class/theme color when available.
- Reused MUI button textures and dialog backgrounds when MUI is loaded.
- Preserved MBB's independent operation and existing minimap-button settings.
- Updated the source-version fallback to v2.0.3.

### Deutsch

- Bestehende MBB-Einstellungen direkt in die WoW-AddOn-Einstellungsseite eingebettet;
  das unabhängige Fenster über den Minimap-Button bleibt erhalten.
- Dunkles, neutrales Menüdesign für MBB ohne MUI hinzugefügt.
- Optionale MUI-Reborn-Gestaltung für Einstellungen, Profile und Buttonverwaltung ergänzt.
- Menüakzente übernehmen bei verfügbarem MUI dessen Klassen-/Themefarbe.
- MUI-Buttontexturen und Dialoghintergründe werden bei geladenem MUI verwendet.
- Eigenständige Nutzung und bestehende Minimap-Button-Einstellungen bleiben erhalten.
- Versionsfallback im Quellcode auf v2.0.3 aktualisiert.

Earlier history is preserved in `CHANGES.txt`.
