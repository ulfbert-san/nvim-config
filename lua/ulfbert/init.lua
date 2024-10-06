require("ulfbert.config.keymaps")
require("ulfbert.config.set")
require("ulfbert.config.lazy")

vim.cmd[[colorscheme habamax]]



-- Settings
vim.opt.encoding = "utf-8"
--vim.o.completeopt = "menuone,noinsert,noselect"
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.tabstop = 8
vim.opt.textwidth = 80
vim.opt.title = true
vim.opt.hidden = true
vim.opt.fixendofline = false
vim.opt.startofline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.number = false
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.updatetime = 1000

---- Colorscheme configuration
--vim.api.nvim_create_augroup("ColorschemePreferences", { clear = true })
--vim.api.nvim_create_autocmd("ColorScheme", {
--  group = "ColorschemePreferences",
--  callback = function()
--    vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", guibg = "NONE" })
--    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "NONE", guibg = "NONE" })
--    vim.api.nvim_set_hl(0, "Todo", { ctermbg = "NONE", guibg = "NONE" })
--    vim.api.nvim_set_hl(0, "ALEErrorSign", { link = "WarningMsg" })
--    vim.api.nvim_set_hl(0, "ALEWarningSign", { link = "ModeMsg" })
--    vim.api.nvim_set_hl(0, "ALEInfoSign", { link = "Identifier" })
--  end,
--})
--if vim.fn.has("termguicolors") == 1 then
--  vim.opt.termguicolors = true
--end
--vim.opt.background = "dark"
--vim.cmd("colorscheme gruvbox")

-- ALE configuration
vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_style_warning = '·'
vim.g.ale_linters = { cs = { 'OmniSharp' } }

-- Asyncomplete configuration
vim.g.asyncomplete_auto_popup = 1
vim.g.asyncomplete_auto_completeopt = 0

-- Sharpenup configuration
vim.g.sharpenup_map_prefix = '<Space>os'
vim.g.sharpenup_statusline_opts = { Text = '%s (%p/%P)', Highlight = 0 }
vim.api.nvim_create_augroup("OmniSharpIntegrations", { clear = true })
vim.api.nvim_create_autocmd({ "User" }, {
  group = "OmniSharpIntegrations",
  pattern = { "OmniSharpProjectUpdated", "OmniSharpReady" },
  callback = function()
    vim.fn['lightline#update']()
  end,
})

-- Lightline configuration
vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = {
    right = {
      { 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' },
      { 'lineinfo' }, { 'percent' },
      { 'fileformat', 'fileencoding', 'filetype', 'sharpenup' }
    }
  },
  inactive = {
    right = { { 'lineinfo' }, { 'percent' }, { 'sharpenup' } }
  },
  component = {
    sharpenup = vim.fn['sharpenup#statusline#Build'](),
  },
  component_expand = {
    linter_checking = 'lightline#ale#checking',
    linter_infos = 'lightline#ale#infos',
    linter_warnings = 'lightline#ale#warnings',
    linter_errors = 'lightline#ale#errors',
    linter_ok = 'lightline#ale#ok',
  },
  component_type = {
    linter_checking = 'right',
    linter_infos = 'right',
    linter_warnings = 'warning',
    linter_errors = 'error',
    linter_ok = 'right',
  },
}
vim.g.lightline_ale_indicator_checking = "\\uf110 "
vim.g.lightline_ale_indicator_infos = "\\uf129 "
vim.g.lightline_ale_indicator_warnings = "\\uf071 "
vim.g.lightline_ale_indicator_errors = "\\uf05e "
vim.g.lightline_ale_indicator_ok = "\\uf00c "

-- OmniSharp configuration
vim.g.OmniSharp_popup_position = 'peek'
if vim.fn.has('nvim') == 1 then
  vim.g.OmniSharp_popup_options = {
    winblend = 30,
    winhl = 'Normal:Normal,FloatBorder:ModeMsg',
    border = 'rounded'
  }
else
  vim.g.OmniSharp_popup_options = {
    highlight = 'Normal',
    padding = { 0 },
    border = { 1 },
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    borderhighlight = { 'ModeMsg' }
  }
end
vim.g.OmniSharp_popup_mappings = {
  sigNext = '<C-n>',
  sigPrev = '<C-p>',
  pageDown = { '<C-f>', '<PageDown>' },
  pageUp = { '<C-b>', '<PageUp>' }
}
if using_snippets == 1 then
  vim.g.OmniSharp_want_snippet = 1
end
vim.g.OmniSharp_highlight_groups = {
  ExcludedCode = 'NonText'
}





---- Replaces vim.lsp.buf.definition()
--vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>", { noremap = true, silent = true })
--
---- Replaces vim.lsp.buf.type_definition()
--vim.api.nvim_set_keymap('n', '<leader>D', "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", { noremap = true, silent = true })
--
---- Replaces vim.lsp.buf.references()
--vim.api.nvim_set_keymap('n', 'gr', "<cmd>lua require('omnisharp_extended').lsp_references()<cr>", { noremap = true, silent = true })
--
---- Replaces vim.lsp.buf.implementation()
--vim.api.nvim_set_keymap('n', 'gi', "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>", { noremap = true, silent = true })
--


--Keymappings for the LSP

--vim.api.nvim_create_autocmd("LspAttach", {
--
--	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
--
--	callback = function(event)
--
--		local opts = { buffer = event.buf }
-- 
--		vim.keymap.set("n", "gd", function()
--
--			vim.lsp.buf.definition()
--
--		end, opts)
--
--		vim.keymap.set("n", "K", function()
--
--			vim.lsp.buf.hover()
--
--		end, opts)
--
--	end,
--
--})
 
