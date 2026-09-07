return {
    "Saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "brenoprata10/nvim-highlight-colors",
    },
    version = "*",

    opts = {
        keymap = {
            preset = "none",
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-y>"] = { "select_and_accept" },

            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        completion = {
            menu = {
                draw = {
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local item = ctx.item
                                if item.source_name == "LSP" and item.documentation then
                                    local color_item =
                                        require("nvim-highlight-colors").format(item.documentation, { kind = ctx.kind })
                                    if color_item and color_item.abbr ~= "" then
                                        return color_item.abbr
                                    end
                                end
                                return ctx.kind_icon
                            end,
                            highlight = function(ctx)
                                local item = ctx.item
                                if item.source_name == "LSP" and item.documentation then
                                    local color_item =
                                        require("nvim-highlight-colors").format(item.documentation, { kind = ctx.kind })
                                    if color_item and color_item.abbr_hl_group then
                                        return color_item.abbr_hl_group
                                    end
                                end
                                return ctx.kind_hl_group
                            end,
                        },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)

        if vim.lsp.config then
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
        end
    end,
}
