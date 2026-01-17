local color_utils = require("colorly.utils.colors")
local colors_override = {
  -- UI Backgrounds
  Bg1        = "#3E313C",
  Bg2        = "#261C25",
  Bg3        = "#4F384A",
  Bg4        = "#523F4D",

  Text       = "#F6F6F4",
  TextDim1   = "#B9B9B9",
  TextDim2   = "TextDim1",

  -- Standard Syntax Palette
  Alpha      = "#82AAFF",
  Beta       = "#80CBC4",
  Delta      = "#F44C5E",
  Epsilon    = "#FFCB6B",
  Zeta       = "#F78C6C",
  Eta        = "#C3E88D",
  Iota       = "#C792EA",
  Accent1    = "#3E9689",

  -- Standard colors
  Black      = "Bg1",
  White      = "Text",
  Red        = "Delta",
  Green      = "Eta",
  Yellow     = "Epsilon",
  Blue       = "Alpha",
  Magenta    = "Iota",
  Pink       = "Iota",
  Cyan       = "Beta",
  LightBlue  = "Beta",
  Teal       = "Theta",
  Orange     = "Zeta",

  Error      = "Orange",
  Hint       = "TextDim2",

  -- Mode Colors
  ModeNormal = "White",
  ModeVisual = "Accent1",

  Rainbow1   = "Zeta",
  Rainbow2   = "Eta",
  Rainbow3   = "Theta",
  Rainbow4   = "Lambda",
  Rainbow5   = "Iota",
  Rainbow6   = "Mu",
  Rainbow7   = "Gamma",
  Rainbow8   = "Epsilon",
  Rainbow9   = "Epsilon",

}

local groups_override = function(C)
  return {
    -- 1. UI & MODES (Restored Overlays)
    StatusLine          = { bg = C.Accent1, fg = C.White },
    StatusLineNC        = { bg = C.Bg2, fg = C.TextDim1 },
    NormalFloat         = { bg = C.Bg3, fg = C.Text },
    FloatBorder         = { bg = C.Bg3, fg = C.Bg4 },
    FloatTitle          = { bg = C.Bg3, fg = C.Text, },
    Pmenu               = { bg = C.Bg3, fg = C.Text },
    PmenuSel            = { bg = C.Bg4, fg = C.White },

    -- Seach
    -- TODO:
    Visual              = { bg = C.Bg4 },
    Search              = { bg = C.SearchBg, fg = "NONE" },
    IncSearch           = { bg = C.NeonYellow, fg = C.Bg1 },
    Substitute          = { bg = C.NeonRed, fg = C.White },

    CursorLine          = { bg = C.Bg3 },
    LineNr              = { fg = C.TextDim1 },
    CursorLineNr        = { fg = C.Zeta, bold = true },

    -- Lualine
    LualineVisualA      = { bg = C.ModeVisual, fg = C.Text, bold = true },
    LualineInsertA      = { bg = C.ModeInsert, fg = C.Bg1, bold = true },
    LualineCommandA     = { bg = C.ModeCommand, fg = C.Bg1, bold = true },
    LualineReplaceA     = { bg = C.ModeReplace, fg = C.Bg1, bold = true },
    IndentBlanklineChar = { fg = "#FFFFFF", bg = "NONE" },
    BlanklineWhitespace = { fg = "#FFFFFF", bg = "NONE" },
    Folded              = { bg = C.FoldedBg, fg = C.Bg1 },
  }
end

local function modified_colors(C)
  return {
    SearchBg = color_utils.darken(C.Iota, 0.30, C.Bg1),
    FoldedBg = color_utils.darken(C.TextDim1, 0.90, "#FFFFFF"),
  }
end

require("colorly").colorscheme {
  colors_override = colors_override,
  groups_override = groups_override,
  modified_colors = modified_colors,
}
