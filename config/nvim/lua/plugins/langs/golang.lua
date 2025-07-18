return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "gopls" } },
  },
}
