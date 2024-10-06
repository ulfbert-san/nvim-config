local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ss', builtin.find_files, {})
vim.keymap.set('n', '<leader>sn', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
}

