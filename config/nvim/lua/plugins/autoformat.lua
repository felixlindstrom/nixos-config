local javascript = { { "prettierd", "prettier" } }
return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      css = javascript,
      javascript = { { "ts-standard", "prettierd", "prettier" } },
      javascriptreact = javascript,
      typescript = javascript,
      typescriptreact = javascript,
      vue = javascript,
    },
  },
}
