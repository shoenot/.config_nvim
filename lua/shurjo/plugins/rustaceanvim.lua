return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        cmd = function()
          return { "rustup", "run", "nightly", "rust-analyzer" }
        end,
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
