return {

{ "williamboman/mason.nvim", opts = {} },

{
    "williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "omnisharp" },
		})

		local lspconfig = require("lspconfig")
		--lspconfig.omnisharp.setup({})
		lspconfig.lua_ls.setup({})

	end
}
}
