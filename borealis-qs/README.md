# Quickshell Base Setup

```
~/.config/quickshell/
├── shell.qml            Einstieg, hängt Bar (und später Launcher etc.) ein
├── colors.json          wird von matugen erzeugt (optional, es gibt Fallbacks)
├── theme/
│   ├── Colors.qml       Matugen-Farben (Singleton)  ->  Colors.primary
│   └── Style.qml        Größen, Abstände, Schrift   ->  Style.barHeight
├── bar/
│   └── Bar.qml          Die Bar (links / mitte / rechts)
├── modules/
│   ├── Workspaces.qml   Hyprland Workspaces
│   └── Clock.qml        Uhr
└── matugen/
    ├── quickshell.json         Template für matugen
    └── config.toml.example     Snippet für die matugen config
```

## Installation
```bash
mkdir -p ~/.config/quickshell
cp -r quickshell/* ~/.config/quickshell/
quickshell            # oder: qs
```
Autostart in `hyprland.conf`: `exec-once = quickshell`

## Matugen
1. Snippet aus `matugen/config.toml.example` in `~/.config/matugen/config.toml`.
2. `matugen image ~/Pictures/wall.jpg`
3. Die Bar färbt sich live um (FileView beobachtet `colors.json`).

## Neues Modul hinzufügen
1. `modules/Battery.qml` anlegen (Farben via `Colors.xyz`).
2. In `bar/Bar.qml` in die gewünschte Sektion: `Battery {}`

## Neues Fenster (z.B. Launcher)
1. Ordner `launcher/` + `Launcher.qml` (ein `PanelWindow` oder `FloatingWindow`).
2. In `shell.qml`: `import qs.launcher` und `Launcher {}`.

## Neue Farbe
Property in `Colors.qml`, Zeile in `apply()`, Zeile in `matugen/quickshell.json`.
