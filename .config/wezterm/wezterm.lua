local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use the config builder when possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- to choose from fav schemes
local schemes = {
	firefoxdev = "FirefoxDev",
	tomorrow = "Tomorrow Night Bright",
	liqcarbon = "LiquidCarbonTransparent",
	onehalfblack = "One Half Black (Gogh)",
	oxocarbon = "Oxocarbon Dark (Gogh)",
	tokyonight = "tokyonight_strom",
}
config.color_scheme = schemes.firefoxdev
config.font = wezterm.font_with_fallback({
	{ family = "Maple Mono ", weight = "Bold", style = "Normal", scale = 1.1 },
	{ family = "Cascadia Code NF", weight = "Bold", style = "Normal", scale = 1.15 },
	{ family = "Fira Code", scale = 1.30 },
	{ family = "RecMonoCasual Nerd Font Mono", scale = 1.30 },
})
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 1500
config.default_workspace = "home"
config.enable_wayland = true

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- session management commands
-- wezterm.on("save_session", function(window)
-- 	session_manager.save_state(window)
-- end)
-- wezterm.on("load_session", function(window)
-- 	session_manager.load_state(window)
-- end)
-- wezterm.on("restore_session", function(window)
-- 	session_manager.restore_state(window)
-- end)

-- Keys
config.leader = { key = "Enter", mods = "SHIFT", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

	-- Pane Keybindings
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Shift mode is for when the `Caps Lock` is on
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Session management
	{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	-- Pane Movement
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make modular keybindings but wezterm provide the `custom` bindings
	-- It can named, initiated by `config.key_tables`, accessed by `action.ActivateKeyTable`
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tab Keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "PageUp", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "PageDown", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- custom key_table for moving the tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tabs", one_shot = false }) },

	-- Switch to the default workspace
	{
		key = "y",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "default",
		}),
	},
	-- Switch to a monitoring workspace, which will have `top` launched into it
	{
		key = "u",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "monitoring",
			spawn = {
				args = { "btop" },
			},
		}),
	},
	-- Create a new workspace with a random name and switch to it
	{ key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "w",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	-- keybinding for all options
	{ key = "W", mods = "ALT|SHIFT", action = wezterm.action.ShowLauncher },
	-- switch between relative workspaces
	{ key = "n", mods = "CTRL|SHIFT", action = act.SwitchWorkspaceRelative(1) },
	{ key = "p", mods = "CTRL|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
	-- Prompt for a name to use for a new workspace and switch to it.
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

-- Having a quick access to the Tabs without the navigator

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	-- Custom Keybindings for Resizing Panes
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	-- Custom Keybindings for Moving Tabs
	move_tabs = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

--Tab UI
config.use_fancy_tab_bar = true
config.status_update_interval = 1000

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Newer wezterm with URL object
			-- Get the entire path from the file_path
			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		end

		-- Remove domain name from hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		-- Add hostname and CWD (last two directories) to cells
		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end
	-- I like my date/time in this style: "8:14 PM"
	local date = wezterm.strftime("%I:%M %p")
	table.insert(cells, date)

	--[[An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format('%.0f%%', b.state_of_charge * 100))
  end]]
	--

	-- The powerline < symbol
	-- local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#3c1361",
		"#52307c",
		"#663a82",
		"#7c5295",
		"#b491c8",
	}

	-- Foreground color for the text across the fade
	local text_fg = "#c0c0c0"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	--Workspace name
	local stat = window:active_workspace()
	-- also modifying it to have the `Leader` mode and current key table
	if window:active_key_table() then
		stat = window:active_key_table()
	end
	if window:leader_is_active() then
		stat = "Leader"
	end

	-- Translate a cell into elements
	table.insert(elements, { Text = stat })
	table.insert(elements, { Text = SOLID_LEFT_ARROW })
	local function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end
	window:set_right_status(wezterm.format(elements))
end)

return config
