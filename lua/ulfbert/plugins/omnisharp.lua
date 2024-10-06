return {

{ "OmniSharp/omnisharp-vim" },

-- Mappings, code-actions, and statusline integration
{ 'nickspoons/vim-sharpenup' },

-- Linting/error highlighting
{ 'dense-analysis/ale' },

-- FZF integration for OmniSharp selector
{ 'junegunn/fzf', dependencies = { 'junegunn/fzf.vim' } },

-- Autocompletion
{ 'prabirshrestha/asyncomplete.vim' },

-- Statusline
{ 'itchyny/lightline.vim', dependencies = {
    'shinchu/lightline-gruvbox.vim',
    'maximbaz/lightline-ale'
  }
}
}
