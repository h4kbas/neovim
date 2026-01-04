return {
  {
    "onurcancamci/colorly.nvim",
    opts = {
      colors_override = {
        -- Git
        -- UNSTAGED NEON
        NeonGreen    = "#A6FF00",
        NeonYellow   = "#FFFF00",
        NeonRed      = "#FF2E63",

        -- STAGED SOLID
        StagedGreen  = "#4E7A3D",
        StagedYellow = "#BFA02C",
        StagedRed    = "#8A2E3D",
      }
      ,
      groups_override = function(C)
        return {
          --  SYNTAX
          String                     = { fg = C.Eta },
          Regexp                     = { fg = C.Beta },
          Comment                    = { fg = C.TextDim1, italic = true },

          Keyword                    = { fg = C.Iota },
          Parameter                  = { fg = C.Text },

          BuiltinFunction            = { fg = C.Iota },

          Type                       = { fg = C.Text },
          BuiltinType                = { fg = C.Epsilon },
          Modifier                   = { fg = C.Iota },
          Function                   = { fg = C.Alpha },
          Number                     = { fg = C.Zeta },
          -- BuiltinConstant            = { fg = C.Delta },
          Special                    = { fg = C.Delta },

          This                       = { fg = C.Epsilon },
          Boolean                    = { fg = C.Delta },

          Punctuation                = { fg = C.Text },
          Operator                   = { fg = C.Iota }, -- && and ||

          -- GIT SIGNS
          GitSignsAdd                = { fg = C.NeonGreen, bold = true },
          GitSignsChange             = { fg = C.NeonYellow, bold = true },
          GitSignsDelete             = { fg = C.NeonRed, bold = true },
          GitSignsTopdelete          = { fg = C.NeonRed, bold = true },
          GitSignsChangedelete       = { fg = C.NeonYellow, bold = true },

          GitSignsStagedAdd          = { fg = C.StagedGreen },
          GitSignsStagedChange       = { fg = C.StagedYellow },
          GitSignsStagedDelete       = { fg = C.StagedRed },
          GitSignsStagedTopdelete    = { fg = C.StagedRed },
          GitSignsStagedChangedelete = { fg = C.StagedYellow },
        }
      end,
    }
  }
}
