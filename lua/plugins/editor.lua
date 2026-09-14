return {
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "alvan/vim-closetag" },
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gblame" } },
  { "lepture/vim-jinja" },
  {
    "vim-python/python-syntax",
    init = function()
      vim.g.python_highlight_all = 1
    end,
  },
  {
    "preservim/nerdtree",
    init = function()
      vim.g.NERDTreeDirArrowExpandable = "+"
      vim.g.NERDTreeDirArrowCollapsible = "~"
    end,
    keys = {
      { "<leader>e", ":NERDTreeToggle<CR>", desc = "NERDTree toggle" },
      { "<leader>E", ":NERDTreeFocus<CR>", desc = "NERDTree focus" },
    },
    cmd = { "NERDTreeToggle", "NERDTreeFocus" },
  },
  {
    "mbbill/undotree",
    keys = { { "<leader>u", ":UndotreeToggle<CR>", desc = "Undotree" } },
    cmd = "UndotreeToggle",
  },
  {
    "preservim/tagbar",
    keys = { { "<F6>", ":TagbarToggle<CR>", desc = "Tagbar" } },
    cmd = "TagbarToggle",
  },
  {
    "voldikss/vim-floaterm",
    init = function()
      vim.g.floaterm_keymap_new = "<F7>"
      vim.g.floaterm_keymap_prev = "<F8>"
      vim.g.floaterm_keymap_next = "<F9>"
      vim.g.floaterm_keymap_toggle = "<F12>"
    end,
    keys = {
      { "<leader>t", ":FloatermToggle<CR>", desc = "Floaterm" },
      { "<F5>", ":w<CR>:FloatermNew --autoclose=0 python3 %<CR>", desc = "Run python" },
    },
    cmd = { "FloatermNew", "FloatermToggle" },
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("spectre").setup()
    end,
    keys = {
      { "<leader>sr", function() require("spectre").toggle() end, desc = "Spectre" },
    },
  },
}
