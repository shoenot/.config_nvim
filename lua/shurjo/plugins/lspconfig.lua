return {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = { "basedpyright" },
        })

        -- This is the new 0.11 syntax
        vim.lsp.config.basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                                reportAttributeAccessIssue = "none";
                            }
              },
            },
          },
        }
      end,
    },

  -- Part B: The Formatter Setup (Black)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Run before saving
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        python = { "black" }, -- Tells conform to use black for python files
      },
      format_on_save = nil,
    },
  },
}
