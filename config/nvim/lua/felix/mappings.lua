local maps = {
  n = {
    { "<A-j>", ":m .+1<CR>==" }, -- move line up(n)
    { "<A-k>", ":m .-2<CR>==" }, -- move line down(n)
    { "<Esc>", "<cmd>nohlsearch<CR>" },
    { "sh", "<C-w>h" },
    { "sj", "<C-w>j" },
    { "sk", "<C-w>k" },
    { "sl", "<C-w>l" },
    { "ss", ":rightbelow split<CR>" },
    { "sv", ":rightbelow vsplit<CR>" },
    { "sq", ":close<CR>" },

    { "<A-j>", ":m .+1<CR>==" }, -- move line up(n)
    { "<A-k>", ":m .-2<CR>==" }, -- move line down(n)
  },
  v = {
    { "<leader>cb", ":CopilotChat Write a better version of the selected code.<CR>", { desc = "[C]opilot [B]etter" } },
    { "<leader>co", ":CopilotChat ", { desc = "[C]opilot [O]pen" } },
    { "<leader>cr", ":CopilotChatReview<CR>", { desc = "[C]opilot [R]eview" } },
    { "sr", ":sort" },
    { "<A-j>", ":m '>+1<CR>gv=gv" }, -- move line up(v)
    { "<A-k>", ":m '<-2<CR>gv=gv" }, -- move line down(v)
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
