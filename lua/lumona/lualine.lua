local palette = {
  bg0    = "#002b36",
  bg1    = "#073642",
  fg0    = "#eee8d5",
  fg1    = "#C2C2C2",
  fade0  = "#586e75",
  fade1  = "#93a1a1",
  accent0= "#b58900",
  accent1= '#cb4b16',
  hl0    = "#d33682",
  hl1    = "#859900",
}

local M = {
  normal = {
    a = {bg = palette.accent0, fg = palette.bg0, gui = 'bold'},
    b = {bg = palette.bg1, fg = palette.fg0},
    c = {bg = palette.bg1, fg = palette.fg1}
  },
  insert = {
    a = {bg = palette.accent1, fg = palette.bg0, gui = 'bold'},
    b = {bg = palette.bg1, fg = palette.fg0},
    c = {bg = palette.bg1, fg = palette.fg1}
  },
  replace = {
    a = {bg = palette.hl0, fg = palette.bg0, gui = 'bold'},
    b = {bg = palette.bg1, fg = palette.fg0},
    c = {bg = palette.bg1, fg = palette.fg1}
  },
  visual = {
    a = {bg = palette.hl1, fg = palette.bg0, gui = 'bold'},
    b = {bg = palette.bg1, fg = palette.fg0},
    c = {bg = palette.bg1, fg = palette.fg1}
  },
  command = {
    a = {bg = palette.hl1, fg = palette.bg0, gui = 'bold'},
    b = {bg = palette.bg1, fg = palette.fg0},
    c = {bg = palette.bg1, fg = palette.fg1}
  }
}

M.terminal = M.command
M.inactive = M.normal

return M
