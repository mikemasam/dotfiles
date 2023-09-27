local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

-- code action sources
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- completion sources
local completion = null_ls.builtins.completion

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.deno_fmt, formatting.prettierd, formatting.lua_format.with {
      extra_args = {
        "--no-keep-simple-function-one-line", "--no-break-after-operator", "--column-limit=100",
        "--break-after-table-lb", "--indent-width=2"
      }
    }, formatting.black.with {extra_args = {"--fast"}}, formatting.shfmt,
    formatting.google_java_format, 
    --, formatting.isort, formatting.stylua
    -- formatting.rubocop,
    -- formatting.mix,
    -- formatting.codespell.with {filetypes = {"markdown"}}, -- diagnostics.flake8,
    diagnostics.shellcheck,
    diagnostics.write_good,
    -- diagnostics.eslint,
    code_actions.gitsigns,
    --diagnostics.tsc.with {
      --filetypes = { "typescript", "typescriptreact" }
    --}
  }
}

