return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        detection_methods = { 'lsp', 'pattern' },
        patterns = { 'package.json' },
        silent_chdir = true,
      }
      require('telescope').load_extension('projects')
    end
  }
}
