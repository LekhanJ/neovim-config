return {
  { "williamboman/mason.nvim", config = true },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "prettier", "eslint_d", "stylua" } },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local servers = {
        "pyright", "ruff", "ts_ls", "eslint",
        "html", "cssls", "emmet_ls", "lua_ls", "jsonls", "yamlls",
      }

      -- Diagnostic styling (reproduces CoC look)
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })
      local function hl(group, fg)
        vim.api.nvim_set_hl(0, group, { fg = fg })
      end
      hl("DiagnosticVirtualTextError", "#f44747")
      hl("DiagnosticVirtualTextWarn", "#ff8800")
      hl("DiagnosticVirtualTextInfo", "#4fc1ff")
      hl("DiagnosticVirtualTextHint", "#15aabf")

      -- Capabilities (blink if present)
      local caps = vim.lsp.protocol.make_client_capabilities()
      local ok_blink, blink = pcall(require, "blink.cmp")
      if ok_blink then
        caps = blink.get_lsp_capabilities(caps)
      end

      -- Per-server config
      vim.lsp.config("*", { capabilities = caps })
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = true,
      })

      -- LSP keymaps on attach (keys preserved from CoC)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function nmap(k, fn, d)
            vim.keymap.set("n", k, fn, { buffer = ev.buf, desc = d })
          end
          nmap("gd", vim.lsp.buf.definition, "Definition")
          nmap("gy", vim.lsp.buf.type_definition, "Type definition")
          nmap("gi", vim.lsp.buf.implementation, "Implementation")
          nmap("gr", function() require("telescope.builtin").lsp_references() end, "References")
          nmap("K", vim.lsp.buf.hover, "Hover")
          nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
          nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
          nmap("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
          nmap("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          nmap("<leader>cd", function() require("telescope.builtin").diagnostics() end, "Diagnostics")
        end,
      })

      -- eslint fix-on-save (replaces coc-eslint autoFixOnSave)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        callback = function()
          if vim.fn.exists(":EslintFixAll") > 0 then
            vim.cmd("EslintFixAll")
          end
        end,
      })
    end,
  },
}
