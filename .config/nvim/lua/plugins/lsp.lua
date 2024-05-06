return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "flake8",
        "stylua",
        "shellcheck",
        "selene",
        "luacheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "codelldb",
        "rust-analyzer",
      })
    end,
  },

  -- svelte lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        svelte = function(_, opts)
          LazyVim.lsp.on_attach(function(client, buffer)
            if client.name == "svelte" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end
          end)
        end,
      },
    },
  },
}
