return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python", "javascript", "typescript", "tsx", "html", "css",
          "json", "yaml", "lua", "vim", "vimdoc", "bash",
          "markdown", "markdown_inline", "htmldjango",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
