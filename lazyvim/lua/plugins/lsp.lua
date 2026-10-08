return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable inlay hints
    opts.inlay_hints = opts.inlay_hints or {}
    opts.inlay_hints.enabled = false

    -- Setup taplo custom hover keymap on LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == "taplo" then
          vim.keymap.set("n", "K", function()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end, { buffer = ev.buf, desc = "Show Crate Documentation" })
        end
      end,
    })

    -- Configure vtsls using native vim.lsp.config (Neovim 0.11+)
    vim.lsp.config("vtsls", {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    })
    vim.lsp.enable("vtsls")

    -- Disable ts_ls (formerly tsserver) using native vim.lsp.config (Neovim 0.11+)
    vim.lsp.config("ts_ls", {
      enabled = false,
    })

    -- Disable rust_analyzer setup via lspconfig (as rustaceanvim handles it)
    opts.setup = opts.setup or {}
    opts.setup.rust_analyzer = function()
      return true
    end
  end,
}
