local g = {
    mapleader = ' ',
    maplocalleader = ' ',
    have_nerd_font = false
}

local opt = {
    number = true,
    -- You can also add relative line numbers, to help with jumping.
    --  Experiment for yourself to see if you like it!
--    relativenumber = true,
    breakindent = true,
    clipboard = 'unnamedplus',
    cursorline = true,
    hlsearch = true,
    ignorecase = true,
    inccommand = 'split',
    list = true,
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    mouse = 'a',
    scrolloff = 10,
    showmode = false,
    signcolumn = 'yes',
    smartcase = true,
    splitbelow = true,
    splitright = true,
    timeoutlen = 300,
    undofile = true,
    updatetime = 250,
}

for k, v in pairs(g) do
    vim.g[k] = v
  end

  for k, v in pairs(opt) do
    vim.opt[k] = v
  end
