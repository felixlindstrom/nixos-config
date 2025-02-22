local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

local maps = {
  n = {
    -- Move to window with <ctrl> + h/j/k/l
    { "<C-h>", "<C-w>h", { desc = "Go to Left window", remap = true } },
    { "<C-j>", "<C-w>j", { desc = "Go to Lower window", remap = true } },
    { "<C-k>", "<C-w>k", { desc = "Go to Upper window", remap = true } },
    { "<C-l>", "<C-w>l", { desc = "Go to Right window", remap = true } },

    -- Save and Quit
    { "<C-s>", "<cmd>silent! wall<CR>", { desc = "Save", remap = true } },
    { "<C-q>", "<cmd>q<CR>", { desc = "Close", remap = true } },

    -- Resize window using <ctrl> + arrow keys
    { "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" } },
    { "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" } },
    { "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" } },
    { "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" } },

    -- Move Lines
    { "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" } },
    { "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" } },

    -- Switch buffers
    { "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" } },
    { "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" } },

    -- Search
    { "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" } },

    -- Tabs
    { "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" } },
    { "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" } },
    { "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" } },
    { "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" } },
    { "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" } },
    { "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" } },
    { "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" } },

    -- Diagnostic
    { "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" } },
    { "]d", diagnostic_goto(true), { desc = "Next Diagnostic" } },
    { "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" } },
    { "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" } },
    { "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" } },
    { "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" } },
    { "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" } },

    -- Split lines
    { "<leader>js", "<cmd>TSJSplit<cr>", { desc = "Split node" } },
    { "<leader>jj", "<cmd>TSJSplit<cr>", { desc = "Join node" } },

    -- Oil
    { "-", "<cmd>Oil<cr>", { desc = "Open parent directory " } },

    -- Quit
    { "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all", remap = true } },

    -- Formatting
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      { desc = "Format", remap = true },
    },

    -- Folding
    {
      "zR",
      function()
        require("conform").openAllFolds()
      end,
      { desc = "Open all folds", remap = true },
    },
    {
      "zM",
      function()
        require("conform").closeAllFolds()
      end,
      { desc = "Close all folds", remap = true },
    },

    -- Function calls
    { "<leader>cF", "<cmd>AerialToggle<cr>", { desc = "Open function/methods calls" } },

    -- Random
    {
      "<leader>St",
      function()
        Snacks.scratch()
      end,
      { desc = "Open scratch" },
    },
    {
      "<leader>Ss",
      function()
        Snacks.scratch.select()
      end,
      { desc = "Select scratch" },
    },

    -- Git
    { "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" } },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" } },

    { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", { desc = "File History" } },
    { "<leader>gdw", "<cmd>DiffviewOpen<cr>", { desc = "Working diff" } },

    { "<leader>gsp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" } },
    { "<leader>gsh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" } },
    { "<leader>gsb", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" } },
    { "<leader>gsu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Unstage hunk" } },
    { "<leader>gsr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" } },
    { "<leader>gsR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" } },

    { "ih", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select hunk" } },
  },

  v = {
    -- Move Lines
    { "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" } },
    { "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" } },
  },

  i = {
    -- Move Lines
    { "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" } },
    { "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" } },

    -- Save
    { "<C-s>", "<cmd>silent! wall<CR>", { desc = "Save", remap = true } },

    -- Search
    { "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" } },
  },
}

for mode, mappings in pairs(maps) do
  for _, m in ipairs(mappings) do
    local options = { noremap = true, silent = true }
    if m[3] then
      options = vim.tbl_extend("force", options, m[3])
    end
    vim.keymap.set(mode, m[1], m[2], options)
  end
end
