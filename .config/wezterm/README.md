## This the Config for the wezterm e## wezterm Configuration

This document describes the configuration for the wezterm terminal emulator. The configuration is written in Lua and uses tables to define keybindings and settings.

**Settings:**

| Key        | Value                                                                   |
|------------|--------------------------------------------------------------------------|
| `color_scheme` | "FirefoxDev" (sets the color scheme)                                    |
| `font`      | `{ family = "CaskaydiaCove Nerd Font", scale = 1.07 }` (sets the font)  |
| `window_background_opacity` | 0.97 (sets the window background opacity)                    |
| `window_decorations` | "RESIZE" (enables only resize window decorations)                |
| `window_close_confirmation` | "AlwaysPrompt" (always prompts before closing a window)     |
| `scrollback_lines` | 3000 (sets the number of lines in the scrollback buffer)           |
| `default_workspace` | "home" (sets the default workspace)                                |
| `inactive_pane_hsb` |  { saturation = 0.24, brightness = 0.5 } (dims inactive panes)     |

**Keys:**

| Key       | Mods       | Action                                     |
|-----------|------------|----------------------------------------------|
| `a`       | LEADER      | Send Ctrl+a                                     |
| `c`       | LEADER      | Activate copy mode                          |
| `-`       | LEADER      | Split pane vertically                        |
| `|`       | LEADER|SHIFT | Split pane horizontally (when Caps Lock is on) |
| `h`, `j`, | LEADER      | Move pane left, down, up, or right             |
| `k`, `l`  |            |                                               |
| `x`       | LEADER      | Close current pane (with confirmation)         |
| `z`       | LEADER      | Toggle pane zoom state                        |
| `s`       | LEADER      | Rotate panes clockwise                         |
| `r`       | LEADER      | Enter resize pane key table (one-shot)      |
| `n`       | LEADER      | Spawn a new tab                                |
| `PageUp`  | LEADER      | Activate previous tab                          |
| `PageDown` | LEADER      | Activate next tab                            |
| `t`       | LEADER      | Show tab navigator                              |

**Custom Keybindings:**

The `r` key (LEADER) activates the `resize_pane` key table, allowing you to resize panes using the arrow keys:

| Key | Action                                        |
|---|---|
| `h` | Decrease the size of the pane to the left     |
| `j` | Decrease the size of the pane below           |
| `k` | Increase the size of the pane above           |
| `l` | Increase the size of the pane to the right      |
| `Esc` or `Enter` | Exit the resize pane key table         |

**Explanation:**

- The `LEADER` key is defined as `Ctrl+;` with a 1-second timeout.
- Keys in the `keys` table are bound to specific actions using the `action` field.
- The `custom` action in the `keys` table is used to activate the `resize_pane` key table.
- The `key_tables` table defines the custom keybindings for resizing panes.

I hope this enhanced markdown document is more helpful and informative!
mulator... seems working fine
