-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

--@type ChadrcConfig
local M = {
  base46 = {
    theme = "nightfox",
    transparency = true,
    theme_toggle = { "nightfox", "nightfox" },
  },
  ui = {
    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      theme = "minimal", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "block",
      -- order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "y", "cursor" },
      modules = {
        f = "%f",
        y = "%y",
      },
    },
    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = false,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },
  },
  term = {
    winopts = { number = false },
    sizes = { sp = 0.45, vsp = 0.35, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      row = 0.45,
      col = 0.40,
      width = 0.65,
      height = 0.75,
      border = "single",
    },
  },
}

return M
