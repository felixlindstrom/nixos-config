local utils = require("lux.utils")

vim.o.updatetime = 250

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          -- virtual_text = {
          --   spacing = 4,
          --   source = "if_many",
          --   prefix = "●",
          -- },
          virtual_text = false,
          severity_sort = true,
          signs = {
            text = {
              -- [vim.diagnostic.severity.ERROR] = require("felix.config").icons.diagnostics.Error,
              -- [vim.diagnostic.severity.WARN] = require("felix.config").icons.diagnostics.Warn,
              -- [vim.diagnostic.severity.HINT] = require("felix.config").icons.diagnostics.Hint,
              -- [vim.diagnostic.severity.INFO] = require("felix.config").icons.diagnostics.Info,
            },
          },
        },
        inlay_hints = {
          enabled = true,
        },
        codelens = {
          enabled = true,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        servers = {},
      }
      return ret
    end,
    config = function(_, opts)
      utils.lsp.on_attach(function(client, buffer)
        require("lux.utils.keymaps").on_attach(client, buffer)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = buffer,
          callback = function()
            vim.diagnostic.open_float(nil, {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              source = "always",
              prefix = " ",
              scope = "cursor",
            })
          end,
        })
      end)
      for server, server_opts in pairs(opts.servers) do
        local final_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_opts)

        -- Add blink capabilities
        final_opts.capabilities = require("blink.cmp").get_lsp_capabilities(final_opts.capabilities)

        -- Define the config
        vim.lsp.config(server, final_opts)

        -- Enable it (autostarts when matching buffer is opened)
        vim.lsp.enable(server)
      end
    end,
  },

  "jay-babu/mason-nvim-dap.nvim",

  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
