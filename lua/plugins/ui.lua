return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").load()
      vim.cmd.colorscheme("onedark")
    end,
  },
  { "morhetz/gruvbox" },
  { "ryanoasis/vim-devicons" },
  { "vim-airline/vim-airline-themes" },
  {
    "vim-airline/vim-airline",
    init = function()
      vim.g.airline_theme = "onedark"
      vim.g.airline_powerline_fonts = 1
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
    end,
  },
}
