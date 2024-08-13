return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "sindrets/diffview.nvim",
    opts = {
      key_bindings = {
        view = {
          ["q"] = "<cmd>DiffviewClose<cr>",
        },
        file_panel = {
          ["q"] = "<cmd>DiffviewClose<cr>",
        },
        file_history_panel = {
          ["q"] = "<cmd>DiffviewClose<cr>",
        },
      },
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    branch = "master",
    opts = {
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  },
}
