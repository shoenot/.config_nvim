return {
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy", -- Loads the plugin as needed
    opts = function()
      local ai = require("mini.ai")
      return {
        custom_textobjects = {
          -- Define 'q' to handle any type of quote
          q = ai.gen_spec.pair('"', '"', { type = 'greedy' }),
        },
        n_lines = 50, -- Look within 50 lines for the quote
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
}
