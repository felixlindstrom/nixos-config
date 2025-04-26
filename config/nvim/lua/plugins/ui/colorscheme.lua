return {
  -- {
  --   "Mofiqul/vscode.nvim",
  --   config = function()
  --     require("vscode").setup()
  --   end,
  -- },
  --
  -- {
  --   "projekt0n/github-nvim-theme",
  --   lazy = false,
  --   opts = {
  --     priority = 1000,
  --   },
  --   config = function()
  --     require("github-theme").setup({})
  --   end,
  -- },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme moonfly")
    end,
  },

  {
    "EdenEast/nightfox.nvim",
  },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   opts = {
  --     theme = "dragon",
  --   },
  --   config = function()
  --     require("kanagawa").setup()
  --   end,
  -- },

  -- {
  --   "dasupradyumna/midnight.nvim",
  --   lazy = false,
  --   priority = 10,
  -- },
}
