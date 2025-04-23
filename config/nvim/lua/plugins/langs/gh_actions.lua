vim.filetype.add({
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})

return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "gh-actions-language-server",
      },
    },
  },
}
