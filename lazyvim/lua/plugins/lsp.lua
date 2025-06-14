return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      angularls = {
        enabled = false,
      },
      marksman = nil,
      rust_analyzer = {},
      tsserver = {},
      --[[
      tsserver = {
        globalPlugins = {
          {
            name = "@angular/language-server",
            location = LazyVim.get_pkg_path("angular-language-server", "/node_modules/@angular-language-server"),
            enableForWorkspaceTypeScriptVersions = false,
          },
        },
      },
      ]]
      ts_ls = {
        enabled = false,
      },
      vtsls = {
        -- explicitly add default filetypes, so that we can extend
        -- them in related extras
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      taplo = {
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
    },
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
  },
}
