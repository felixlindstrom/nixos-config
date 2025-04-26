local g = {
  mapleader = " ",
  maplocalleader = "\\",
  have_nerd_font = false,
}

local opt = {
  autowrite = true,
  clipboard = "unnamedplus",
  confirm = true,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  list = true,
  mouse = "a",
  number = true,
  ruler = true,
  smartcase = true,
  smartindent = true,
  spelllang = { "en" },
  tabstop = 2,
  shiftwidth = 2,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 500,
  undofile = true,
  undolevels = 10000,
  updatecount = 200,
  virtualedit = "block",
  wrap = false,
  colorcolumn = "120",
  spell = true,
}

for k, v in pairs(g) do
  vim.g[k] = v
end

for k, v in pairs(opt) do
  vim.opt[k] = v
end
