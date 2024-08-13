return {
  {
    {
      "nvim-treesitter/nvim-treesitter",
      optional = true,
      opts = { ensure_installed = { "sql" } },
    },
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "sqlfluff" } },
    },
  },
}
