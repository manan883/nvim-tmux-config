return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint.with {
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        },
      },
    }

    vim.keymap.set("n", "<C-h>", vim.lsp.buf.format, {})
  end,
}
