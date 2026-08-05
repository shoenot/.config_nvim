return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require('nvim-autopairs.conds')

        autopairs.setup({
            check_ts = true, -- use treesitter to check for pairs
            map_cr = true,   -- map <CR> on insert mode
        })

        -- Clear default rules to allow for explicit definition
        autopairs.clear_rules()

        -- Define pairs explicitly here.
        -- To disable one, simply comment out or delete its line.
        local rules = {
            Rule("{", "}"):with_pair(cond.not_after_regex("[^%s]")),
            Rule("[", "]"):with_pair(cond.not_after_regex("[^%s]")),
        }

        for _, rule in ipairs(rules) do
            autopairs.add_rule(rule)
        end
    end,
}
