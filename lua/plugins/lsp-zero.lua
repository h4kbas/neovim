return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

    end
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
}
