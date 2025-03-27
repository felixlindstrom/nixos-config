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
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme carbonfox")
    end,
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
