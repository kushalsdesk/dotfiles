return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowFRST",
      "RainbowSCND",
      "RainbowTHRD",
      "RainbowFRTH",
      "RainbowFFTH",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowFRST", { fg = "#263238" })
      vim.api.nvim_set_hl(0, "RainbowSCND", { fg = "#37474f" })
      vim.api.nvim_set_hl(0, "RainbowTHRD", { fg = "#455a64" })
      vim.api.nvim_set_hl(0, "RainbowFRTH", { fg = "#546e7a" })
      vim.api.nvim_set_hl(0, "RainbowFFTH", { fg = "#78909c" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
  end,
}
