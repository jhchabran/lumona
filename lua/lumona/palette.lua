local lush = require('lush')
local hsluv = lush.hsluv

local base = {
  bg0    = hsluv "#002b36",
  bg1    = hsluv "#073642",
  fg0    = hsluv "#eee8d5",
  fg1    = hsluv "#C2C2C2",
  fade0  = hsluv "#586e75",
  fade1  = hsluv "#93a1a1",
  accent0= hsluv "#b58900",
  accent1= hsluv '#cb4b16',
  hl0    = hsluv "#d33682",
  hl1    = hsluv "#859900",
}

local colors = {
    white   = hsluv "#ffffff",
    yellow  = hsluv "#b58900",
    orange  = hsluv '#cb4b16',
    red     = hsluv '#dc322f',
    magenta = hsluv '#d33682',
    violet  = hsluv '#6c71c4',
    blue    = hsluv '#268bd2',
    cyan    = hsluv '#2aa198',
    green   = hsluv '#859900',
}

return {
  base = base,
  colors = colors,
}
