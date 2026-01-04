return {
  -- Rainbow Highlighting
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {

        highlight = {
          -- 'RainbowDelimiterBlue',
          -- 'RainbowDelimiterYellow',
          -- 'RainbowDelimiterOrange',
          -- 'RainbowDelimiterGreen',
          -- 'RainbowDelimiterViolet',
          -- 'RainbowDelimiterCyan',
          'Rainbow1',
          'Rainbow2',
          'Rainbow3',
          'Rainbow4',
          'Rainbow5',
          'Rainbow6',
        }
      }
    end
  }
}
