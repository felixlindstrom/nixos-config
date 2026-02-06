return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable("copilot_ls")
      vim.keymap.set("n", "<tab>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = vim.b[bufnr].nes_state
        if state then
          local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
            or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
          return nil
        else
          return "<C-i>"
        end
      end, { desc = "Accept Copilot NES suggestion", expr = true })
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      keymap = {
        preset = "default",
        -- preset = "super-tab",
        -- ["<Tab>"] = {
        --   function(cmp)
        --     if vim.b[vim.api.nvim_get_current_buf()].nes_state then
        --       cmp.hide()
        --       return (
        --         require("copilot-lsp.nes").apply_pending_nes()
        --         and require("copilot-lsp.nes").walk_cursor_end_edit()
        --       )
        --     end
        --     if cmp.snippet_active() then
        --       return cmp.accept()
        --     else
        --       return cmp.select_and_accept()
        --     end
        --   end,
        --   "snippet_forward",
        --   "fallback",
        -- },
      },
    },
  },
}
