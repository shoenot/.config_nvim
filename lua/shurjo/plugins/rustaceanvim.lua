return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        settings = {
          ['rust-analyzer'] = {
            diagnostics = { enable = true },
            check = { command = "check" },
          },
        },
      },
    }
  end
}

