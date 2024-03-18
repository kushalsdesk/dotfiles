return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
      return
    end
    local function get_shell(options)
      -- Set default options
      local defaults = {
        windows_shell = "pwsh",
        unix_shell = "zsh",
        fallback_shell = "bash",
      }

      -- Merge user options with defaults
      options = options or {}
      for key, value in pairs(defaults) do
        options[key] = options[key] or value
      end

      local os = vim.loop.os_uname().sysname
      if os == "Windows_NT" then
        return options.windows_shell
      else
        -- Check for preferred Unix shell
        if options.unix_shell and io.popen("which " .. options.unix_shell) then
          return options.unix_shell
        end
        -- Fallback to bash if preferred Unix shell not found
        return options.fallback_shell
      end
    end
    toggleterm.setup({
      size = 18,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = get_shell(),
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })


    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local node = Terminal:new({ cmd = "node", hidden = true })

    function _NODE_TOGGLE()
      node:toggle()
    end
  end
}
