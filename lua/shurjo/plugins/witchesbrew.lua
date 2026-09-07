return {
    "shoenot/witchesbrew.nvim",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("witchesbrew").setup({ transparent = true })
      vim.cmd("colorscheme witchesbrew")
    end,
}
