return {
  "mrcjkb/rustaceanvim",
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        logfile = "/tmp/rust-analyzer.log",
        cmd = function()
          return { "rustup", "run", "nightly", "rust-analyzer" }
        end,
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
              debounceDelay = "300ms",
            },
            check = { command = "check", allTargets = true },
            procMacro = { enable = true },
            lru = { capacity = 128 },
          },
        },
      },
    }
  end,
}
