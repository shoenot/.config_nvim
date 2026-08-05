require("shurjo.settings")
require("shurjo.lazy")

vim.lsp.config('cssls', {
    settings = {
        ['cssls'] = {},
    },
})
vim.lsp.config('tailwindcss', {
    settings = {
        ['tailwindcss'] = {},
    },
})
vim.lsp.config('html', {
    settings = {
        ['html'] = {},
    },
})
vim.lsp.config('jsonls', {
    settings = {
        ['jsonls'] = {},
    },
})
vim.lsp.config('eslint', {
    settings = {
        ['eslint'] = {},
    },
})
vim.lsp.config('basedpyright', {
    settings = {
        ['basedpyright'] = {},
    },
})
vim.lsp.config('clangd', {
    settings = {
        ['clangd'] = {},
    },
})
vim.lsp.config('gopls', {
settings = {
        ['gopls'] = vim.empty_dict(),
    },
})
vim.lsp.config('bashls', {
    settings = {
        ['bashls'] = {},
    },
})
vim.lsp.config('cmake', {
    settings = {
        ['cmake'] = {},
    },
})
vim.lsp.config('qmlls', {
    settings = {
        ['qmlls'] = {},
    },
})
vim.lsp.enable({
    "cssls",
    "tailwindcss",
    "html",
    "jsonls",
    "eslint",
    "basedpyright",
    "clangd",
    "gopls",
    "bashls",
    "cmake",
    "qmlls"
})

vim.diagnostic.config({ update_in_insert = false })

