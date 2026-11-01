// Matugen-Farben als Singleton: überall mit `Colors.primary` etc. nutzbar.
// Die Werte kommen aus colors.json (wird von matugen erzeugt) und
// aktualisieren sich live, sobald sich die Datei ändert.
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // Fallback-Farben, falls colors.json fehlt (Catppuccin-ish)
    property color background:           "#1e1e2e"
    property color surface:              "#1e1e2e"
    property color surfaceContainer:     "#313244"
    property color surfaceContainerHigh: "#45475a"
    property color foreground:            "#cdd6f4"
    property color foregroundDim:     "#a6adc8"
    property color primary:              "#89b4fa"
    property color primaryText:            "#1e1e2e"
    property color primaryContainer:     "#45475a"
    property color primaryContainerText:   "#cdd6f4"
    property color secondary:            "#cba6f7"
    property color tertiary:             "#f5c2e7"
    property color error:                "#f38ba8"
    property color outline:              "#6c7086"
    property color onSurfaceVariant:        "#cdd6f4"

    // Liest die JSON und überschreibt die Werte oben.
    // Neue Farbe? Property oben + Zeile hier + Zeile im matugen-Template.
    function apply(json) {
        const c = JSON.parse(json)
        background           = c.background           || background
        surface              = c.surface              || surface
        surfaceContainer     = c.surfaceContainer     || surfaceContainer
        surfaceContainerHigh = c.surfaceContainerHigh || surfaceContainerHigh
        foreground            = c.foreground            || foreground
        foregroundDim     = c.foregroundDim     || foregroundDim
        primary              = c.primary              || primary
        primaryText            = c.primaryText            || primaryText
        primaryContainer     = c.primaryContainer     || primaryContainer
        primaryContainerText   = c.primaryContainerText   || primaryContainerText
        secondary            = c.secondary            || secondary
        tertiary             = c.tertiary             || tertiary
        error                = c.error                || error
        outline              = c.outline              || outline
        onSurfaceVariant        = c.onSurfaceVariant        || onSurfaceVariant
    }

    FileView {
        path: Quickshell.shellPath("colors.json")
        watchChanges: true              // matugen schreibt neu -> Reload
        onFileChanged: reload()
        onLoaded: root.apply(text())
    }
}
