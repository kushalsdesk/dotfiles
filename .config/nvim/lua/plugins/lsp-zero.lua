return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      --Lsp Support
      {
        "williamboman/mason.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "folke/neodev.nvim",
      },
      {
        "neovim/nvim-lspconfig",
      },
    },

    config = function()
      local lsp_zero = require("lsp-zero")
      -- Fix lspconfig error
      lsp_zero.extend_lspconfig()

      lsp_zero.preset("recommended")
      --Seting up lspconfig for keymap
      local lspconfig = require("lspconfig")
      --Some KeyBindings for LSP's
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })

      --Setting LSP Functions
      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        lsp_zero.default_keymaps({ buffer = bufnr })
        lsp_zero.buffer_autoformat()
        lsp_zero.async_autoformat(client, bufnr)

        --Some Keymaps for Buffers
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>ws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>rr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end)

      -- create neodev setup
      require("neodev").setup({
        library = {
          enabled = true,
          runtime = true,
          types = true,
          plugins = true,
        },
        setup_jsonls = true,
        override = function(roo_dir, options) end,
        lspconfig = true,
        pathStrict = true,
      })

      --create the mason setups
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "rust_analyzer",
          "jdtls",
          "lua_ls",
          "html",
          "eslint",
          "gopls",
          "cssls",
          "tailwindcss",
        },
        handlers = {
          lsp_zero.default_setup,
          --Java Setup
          jdtls = function()
            require("lspconfig").jdtls.setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
              settings = {
                completions = {
                  completeFunctionCalls = true,
                },
              },
            })
          end,

          --Lua_ls setup
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
          --Typescript Setup
          tsserver = function()
            require("lspconfig").tsserver.setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
              settings = {
                completions = {
                  completeFunctionCalls = true,
                },
              },
            })
          end,
        },
      })

      --Including Servers to Use LSP-zero
      lsp_zero.setup_servers({ "tsserver", "rust_analyzer", "jdtls" , "lua_ls"})

      --Set sign icons
      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      lsp_zero.setup()

      vim.diagnostic.config({
        virtual_text = true,
      })
    end,
  },
}
