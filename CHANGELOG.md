# Changelog

## v2.0.11-rc

### English

- Remove the global UI-frame scan introduced in 2.0.10-rc, which could access blocked nameplate frames and cause extra CPU load.
- Guard direct minimap child-list reads. If a read fails, use known or LibDBIcon-registered buttons and retry after 30 seconds.
- Defer new button discovery until combat ends.

### Deutsch

- Die mit 2.0.10-rc eingeführte globale UI-Frame-Suche entfernt, die auf gesperrte Namensleisten-Frames zugreifen und zusätzliche CPU-Last verursachen konnte.
- Direkte Minimap-Abfragen abgesichert. Bei einem Fehlschlag werden bekannte oder bei LibDBIcon registrierte Buttons verwendet; nach 30 Sekunden wird erneut versucht.
- Neue Buttons werden erst außerhalb des Kampfes eingesammelt.

## v2.0.10-rc

### English

- Guard against a possible stack overflow when scanning large numbers of minimap child frames. Tested with simulated frames; confirmation from the affected user is pending.
- Add optional custom tick/tock sounds when manually opening and closing the button bar. Disabled by default and controlled by WoW's Sound Effects volume.
- Automatic hiding and the size preview remain silent.

### Deutsch

- Möglichen Stack-Overflow beim Scannen vieler Minimap-Unterframes abgesichert. Mit simulierten Frames geprüft; Bestätigung durch den betroffenen Nutzer steht noch aus.
- Optionale eigene Tick/Tock-Sounds beim manuellen Öffnen und Schließen der Button-Leiste hinzugefügt. Standardmäßig deaktiviert; die Lautstärke folgt WoWs Soundeffekten.
- Automatisches Ausblenden und die Größenvorschau bleiben lautlos.

## v2.0.9-rc

### English

- Keep the launcher centered at its current screen position while adjusting button size.
- Save the matching position when confirming with OK. Cancel restores the original size and anchors, including cleanup deferred until combat ends.

### Deutsch

- Der Hauptbutton bleibt beim Ändern der Button-Größe an seiner Bildschirmposition zentriert.
- OK speichert die passende Position mit. Abbrechen stellt Größe und ursprüngliche Anker wieder her, auch bei verzögertem Zurücksetzen nach Kampfende.

## v2.0.8-rc

### English

- Fix a scaling regression introduced in 2.0.7-rc: the MBB launcher and collected buttons once again inherit normal parent/UI scaling. This addresses oversized buttons and minimap alignment changes with UI scale below 100%.
- Compensate for MUI minimap scaling while retaining global UI scaling, including buttons with different parent frames.
- Extend the button-size slider to 50–150%.
- Keep the live size preview and its OK/Cancel behavior.
- MUI Reborn 1.0.11-rc continues to skip its extra addon-button scaling when MBB is active.

Regression checks cover inherited scales, preview/cancel, combat-deferred cleanup and the new slider range. Live cross-client confirmation is pending.

### Deutsch

- Skalierungsfehler aus 2.0.7-rc korrigiert: MBB-Hauptbutton und eingesammelte Buttons erben wieder die normale Eltern- und UI-Skalierung. Das behebt die Ursache für zu große Buttons und veränderte Minimap-Ausrichtung bei UI-Skalierung unter 100%.
- MUI-Minimap-Skalierung wird unter Beibehaltung der globalen UI-Skalierung ausgeglichen, auch bei Buttons mit unterschiedlichen Elternrahmen.
- Größenregler auf 50–150% erweitert.
- Live-Größenvorschau und Übernehmen/Abbrechen bleiben verfügbar.
- MUI Reborn 1.0.11-rc setzt seine zusätzliche Addon-Button-Skalierung bei aktivem MBB weiterhin aus.

Regressionstests prüfen geerbte Skalierung, Vorschau/Abbrechen, Zurücksetzen nach Kampfende und den neuen Größenbereich. Die Bestätigung auf allen Clients im Spiel steht noch aus.


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
