return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = false, animate = { enabled = false } },
    input = { enabled = false },
    notifier = { enabled = false, timeout = 4000 },
    quickfile = { enabled = true },
    words = { enabled = true },
    scratch = {
      enabled = true,
    },
    -- dashboard = {  },
  },
}
