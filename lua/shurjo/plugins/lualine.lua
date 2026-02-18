return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
        "nvim-tree/nvim-web-devicons",
        "rktjmp/lush.nvim"
    },
    config = function()
        require("lualine").setup({ options = {
                theme = 'witchesbrew'
            }})
    end,
}
