return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = { timeout_ms = 2000, lsp_format = "fallback" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- eslint handled by the eslint LSP, ruff by the ruff LSP.
      -- nvim-lint wired and ready for future filetypes; minimal initial config.
      require("lint").linters_by_ft = {}
    end,
  },
}
