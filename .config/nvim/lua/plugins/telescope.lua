return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jonarrien/telescope-cmdline.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local tele = require("telescope")
      tele.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
        cmdline = {
          picker = {
            layout_config = {
              width = 120,
              height = 25,
            },
          },
          mappings = {
            complete = "<Tab>",
            run_selection = "<C-CR>",
            run_input = "<CR>",
          },
        },

        tele.load_extension("cmdline"),
      })
      vim.api.nvim_set_keymap("n", ":", ":silent Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
      -- Initializing the Telescope
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
}
