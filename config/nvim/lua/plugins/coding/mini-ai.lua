return {
  "echasnovski/mini.ai",
  lazy = false,
  keys = {
    { "a", mode = { "x", "o" } },
    { "i", mode = { "x", "o" } },
    { "g", mode = { "x", "o" } },
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  opts = function()
    local ai = require("mini.ai")
    return {
      mappings = {
        -- Main textobject prefixes
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
        -- Move cursor to corresponding edge of `a` textobject
        goto_left = "g[",
        goto_right = "g]",
      },
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
      },
    }
  end,
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
