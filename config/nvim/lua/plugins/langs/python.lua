local get_pkg_path = function(pkg, path, opts)
  pcall(require, "mason") -- make sure Mason is loaded. Will fail when generating docs
  local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  opts = opts or {}
  opts.warn = opts.warn == nil and true or opts.warn
  path = path or ""
  local ret = root .. "/packages/" .. pkg .. "/" .. path
  if opts.warn and not vim.loop.fs_stat(ret) and not require("lazy.core.config").headless() then
    print(
      ("Mason package path not found for **%s**:\n- `%s`\nYou may need to force update the package."):format(pkg, path)
    )
  end
  return ret
end

local lsp = "pyright"
local ruff = "ruff"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          -- "ruff", -- Installed through nix
          "pyright",
        },
      },
    },
    opts = {
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
        },
      },
      setup = {
        [ruff] = function()
          require("lux.utils.lsp").on_attach(function(client, _)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end, ruff)
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "pyright", "basedpyright", ruff, lsp }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == lsp or server == ruff
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = { ensure_installed = { "debugpy" } },
  --     },
  --     {
  --       "mfussenegger/nvim-dap-python",
  --     -- stylua: ignore
  --     keys = {
  --       { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
  --       { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  --     },
  --       config = function()
  --         require("dap-python").setup(get_pkg_path("debugpy", "/venv/bin/python"))
  --       end,
  --     },
  --   },
  -- },
}
