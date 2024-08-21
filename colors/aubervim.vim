" Colorscheme generated by https://github.com/arcticlimer/djanho
highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

let s:Color2 = '#F78C6C'
let s:Color4 = '#ffcb6b'
let s:Color6 = '#ff2c83'
let s:Color1 = '#C3E88D'
let s:Color12 = '#f6f6f4'
let s:Color13 = '#4C3949'
let s:Color14 = '#b9b9b9'
let s:Color5 = '#c792ea'
let s:Color9 = '#FFF'
let s:Color7 = '#ffffff'
let s:Color11 = '#3E313C'
let s:Color0 = '#697098'
let s:Color3 = '#82AAFF'
let s:Color8 = '#89DDFF'
let s:Color10 = '#3E9689'
let s:Color15 = '#4F384A'

call s:highlight('Comment', '', s:Color0, 'italic')
call s:highlight('String', '', s:Color1, '')
call s:highlight('Number', '', s:Color2, '')
call s:highlight('TSCharacter', '', s:Color3, '')
call s:highlight('Identifier', '', s:Color4, '')
call s:highlight('Keyword', '', s:Color5, '')
call s:highlight('Type', '', s:Color5, '')
call s:highlight('Function', '', s:Color3, '')
call s:highlight('Error', s:Color6, s:Color7, '')
call s:highlight('Operator', '', s:Color8, '')
call s:highlight('Function', '', s:Color3, '')
call s:highlight('StatusLine', s:Color9, s:Color10, '')
call s:highlight('WildMenu', s:Color11, s:Color12, '')
call s:highlight('Pmenu', s:Color11, s:Color12, '')
call s:highlight('PmenuSel', s:Color12, s:Color11, '')
call s:highlight('PmenuThumb', s:Color11, s:Color12, '')
call s:highlight('Normal', s:Color11, s:Color12, '')
call s:highlight('Visual', s:Color13, '', '')
call s:highlight('CursorLine', s:Color13, '', '')
call s:highlight('ColorColumn', s:Color13, '', '')
call s:highlight('SignColumn', s:Color11, '', '')
call s:highlight('LineNr', '', s:Color14, '')
call s:highlight('TabLine', s:Color15, s:Color14, '')
call s:highlight('TabLineSel', s:Color9, s:Color11, '')
call s:highlight('TabLineFill', s:Color15, s:Color14, '')
call s:highlight('TSPunctDelimiter', '', s:Color12, '')

highlight! link TSTagDelimiter Type
highlight! link TSFuncMacro Macro
highlight! link Conditional Operator
highlight! link TSFunction Function
highlight! link TSLabel Type
highlight! link Whitespace Comment
highlight! link TSField Constant
highlight! link TelescopeNormal Normal
highlight! link TSParameter Constant
highlight! link NonText Comment
highlight! link TSOperator Operator
highlight! link TSParameterReference TSParameter
highlight! link TSPunctBracket MyTag
highlight! link TSRepeat Repeat
highlight! link CursorLineNr Identifier
highlight! link TSFloat Number
highlight! link TSKeyword Keyword
highlight! link TSConditional Conditional
highlight! link TSString String
highlight! link TSNumber Number
highlight! link Operator Keyword
highlight! link TSType Type
highlight! link TSProperty TSField
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link TSTag MyTag
highlight! link Folded Comment
highlight! link TSComment Comment
highlight! link TSPunctSpecial TSPunctDelimiter
highlight! link TSNamespace TSType
highlight! link Macro Function
highlight! link Repeat Conditional
highlight! link TSConstant Constant