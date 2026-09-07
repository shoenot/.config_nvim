 return {
     "brenoprata10/nvim-highlight-colors",
     event = "VeryLazy",
     opts = {
         render = "background", -- or 'foreground' or 'virtualtext'
         enable_named_colors = true,
         enable_tailwind = true,
     },
     config = function(_, opts)
         require("nvim-highlight-colors").setup(opts)
     end,
 }
