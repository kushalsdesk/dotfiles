return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  lazy = false,
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    -- Define the servers to be installed and configured
    local servers = {
      "ts_ls", -- TypeScript server (as per your environment)
      "gopls",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "lua_ls",
      "graphql",
      "emmet_ls",
      "prismals",
      "pyright",
    }

    -- Import mason and related modules
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"
    local lspconfig = require "lspconfig"
    local nvlsp = require "nvchad.configs.lspconfig"

    -- Setup mason and configure UI
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    -- Ensure mason installs the specified LSP servers
    mason_lspconfig.setup {
      ensure_installed = servers,
    }

    -- Setup mason-tool-installer for formatters and linters
    mason_tool_installer.setup {
      ensure_installed = {
        "prettierd", -- Prettier formatter daemon
        "stylua", -- Lua formatter
        "isort", -- Python import sorter
        "black", -- Python formatter
        "pylint", -- Python linter
        "eslint_d", -- ESLint daemon for JavaScript/TypeScript
        "goimports",
        "golines",
        "gofumpt",
      },
    }

    -- Setup lspconfig for each LSP server
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end
  end,
}
