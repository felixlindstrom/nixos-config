return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup()
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    opts = {
      priority = 1000,
    },
    config = function()
      require("github-theme").setup({})
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme carbonfox")
    end,
  },

  {
    "navarasu/onedark.nvim",
  },

  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      theme = "dragon",
    },
    config = function()
      require("kanagawa").setup()
    end,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "dasupradyumna/midnight.nvim",
    lazy = false,
    priority = 10,
  },
}
