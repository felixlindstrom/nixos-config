-- This, apparently, needs to be set before Lazy is initialised.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable setting the terminal title
vim.opt.title = true

-- %t = file name (tail), %f = relative path, %F = full path
vim.opt.titlestring = "nvim : %F"

local function bootstrap()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

local function plugins()
  require("lazy").setup("plugins")
end

local function lux()
  require("lux")
end

bootstrap()
plugins()
lux()
