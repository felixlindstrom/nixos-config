return {
  "mg979/vim-visual-multi",
  config = function()
    vim.g.VM_maps["Select Cursor Down"] = "<D-ALT> down"
    vim.g.VM_maps["Select Cursor Up"] = "<D-ALT> up>"
  end,
}
