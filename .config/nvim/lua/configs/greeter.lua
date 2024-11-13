return {
  "startup-nvim/startup.nvim",
  lazy = false,
  priority = 1000,
  requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("startup").setup { theme = "evil" }
  end,
}
