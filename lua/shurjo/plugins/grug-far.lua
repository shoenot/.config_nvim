return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- Leave empty to use sensible defaults
    })

    local keymap = vim.keymap

    -- Search and Replace (global project-wide)
    keymap.set({ 'n', 'v' }, '<leader>sr', function()
      require('grug-far').open()
    end, { desc = 'Search and Replace (global)' })

    -- Search and Replace the word under cursor
    keymap.set('n', '<leader>sw', function()
      require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })
    end, { desc = 'Search and Replace word under cursor' })

    -- Search and Replace within the current file only
    keymap.set('n', '<leader>sf', function()
      require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })
    end, { desc = 'Search and Replace in current file' })
  end
}
