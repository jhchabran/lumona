--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsluv = lush.hsluv

local base = {
  bg0    = hsluv "#002b36",
  bg1    = hsluv "#073642",
  fg0    = hsluv "#eee8d5",
  fg1    = hsluv "#C2C2C2",
  fade0  = hsluv "#586e75",
  fade1  = hsluv "#93a1a1",
  accent0= hsluv "#c1e3e0",
  accent1= hsluv "#b0d1e8",
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

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn  { }, -- Columns set with 'colorcolumn'
    -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = base.hl0, fg = base.bg0 }, -- Character under the cursor
    lCursor      { bg = base.bg0, fg = base.fg0 }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = base.bg0 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = base.bg1 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory    { }, -- Directory names (and other special names in listings)
    DiffAdd      { bg = base.bg1, fg = colors.green}, -- Diff mode: Added line |diff.txt|
    DiffChange   { bg = base.bg1, fg = colors.yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { bg = base.bg1, fg = colors.red}, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg = base.bg1, fg = colors.red }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { bg = base.bg0 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor   { bg = colors.green }, -- Cursor in a focused terminal
    TermCursorNC { TermCursor }, -- Cursor in an unfocused terminal
    ErrorMsg     { bg = colors.red, fg = base.fg0 }, -- Error messages on the command line
    VertSplit    { bg = base.bg0, fg = base.bg1 }, -- Column separating vertically split windows
    Folded       { bg = base.bg0, fg = base.fade0, gui = "bold" }, -- Line used for closed folds
    FoldColumn   { bg = base.bg0, fg = base.fade0 }, -- 'foldcolumn'
    SignColumn   { FoldColumn }, -- Column where |signs| are displayed
    IncSearch    { bg = base.hl0, fg = base.bg0 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { IncSearch, fg = base.fg0 }, -- |:substitute| replacement text highlighting
    LineNr       { fg = base.fade0 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = LineNr.fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Normal       { bg = base.bg0, fg = base.fg1 }, -- Normal text
    NormalFloat  { bg = base.bg1, fg = base.fade1 }, -- Normal text in floating windows.
    NormalNC     { fg = base.fade1 }, -- normal text in non-current windows
    MatchParen   { fg = base.hl0 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { fg = base.fg0 }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = M_cyan.bg }, -- |more-prompt|
    NonText      { fg = base.fade0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu        { bg = base.bg1, fg = base.fg0 }, -- Popup menu: Normal item.
    PmenuSel     { bg = base.hl1, fg = base.bg1, gui = "bold"}, -- Popup menu: Selected item.
    PmenuSbar    { bg = base.bg1, fg = base.fg0 }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = base.fade0, fg = M_accent1.bg }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = base.fg0 }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = base.hl1, fg = base.bg0 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { fg = base.fade0 }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { gui = "undercurl", sp = colors.red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = base.bg1, fg = base.fg1 }, -- Status line of current window
    StatusLineNC { StatusLine, fg = base.fg0 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg = base.bg0, fg = base.fade1 }, -- Tab pages line, not active tab page label
    TabLineFill  { TabLine }, -- Tab pages line, where there are no labels
    TabLineSel   { bg = base.bg1, fg = M_accent0.bg}, -- Tab pages line, active tab page label
    Title        { fg = base.fg0, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = base.hl1, fg = base.bg0 }, -- Visual mode selection
    VisualNOS    { fg = base.hl0, gui = "underline" }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { bg = base.bg0, fg = colors.yellow }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { bg = base.bg1, fg = M_accent0.bg}, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = base.fade0 }, -- Any comment

    Constant       { fg = base.accent1 }, -- (*) Any constant
    String         { fg = base.accent0 }, --   A string constant: "this is a string"
    Character      { String }, --   A character constant: 'c', '\n'
    Number         { fg = base.accent1 }, --   A number constant: 234, 0xff
    Boolean        { Number }, --   A boolean constant: TRUE, false
    Float          { Number }, --   A floating point constant: 2.3e10

    Identifier     { fg = base.fg1.mix(base.accent0, 50) }, -- (*) Any variable name
    Function       { fg = base.fg0 }, --   Function name (also: methods for classes)

    Statement      { fg = base.fg1, gui = "italic" }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = base.fg0, gui = "bold" }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = base.fg0, gui = "bold" }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = base.hl1 }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline", sp = colors.blue }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = colors.red }, -- Any erroneous construct
    Todo           { bg = colors.yellow, fg = colors.white, gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups. Most link to corresponding
    -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
    --
    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    TSBoolean            { Boolean } , -- Boolean literals: `True` and `False` in Python.
    TSCharacter          { String } , -- Character literals: `'a'` in C.
    TSCharacterSpecial   { Special } , -- Special characters.
    TSComment            { Comment } , -- Line comments and block comments.
    TSConditional        { Statement } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    TSConstant           { Constant } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSConstBuiltin       { Number } , -- Built-in constant values: `nil` in Lua.
    TSConstMacro         { Number } , -- Constants defined by macros: `NULL` in C.
    TSConstructor        { Normal } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSDebug              { Normal, gui = "underdash" } , -- Debugging statements.
    TSDefine             { PreProc} , -- Preprocessor #define statements.
    TSError              { gui = "underdot" } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    TSException          { Statement } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    TSField              { Identifier } , -- Object and struct fields.
    TSFloat              { Number } , -- Floating-point number literals.
    TSFunction           { Function } , -- Function calls and definitions.
    TSFuncBuiltin        { Function } , -- Built-in functions: `print` in Lua.
    TSFuncMacro          { Function } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { PreProc } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword            { Statement } , -- Keywords that don't fit into other categories.
    TSKeywordFunction    { Statement } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    TSKeywordOperator    { Normal } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn      { Statement } , -- Keywords like `return` and `yield`.
    TSLabel              { Statement } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    TSMethod             { Function } , -- Method calls and definitions.
    TSNamespace          { Identifier } , -- Identifiers referring to modules and namespaces.
    TSNone               { Normal } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    TSNumber             { Number } , -- Numeric literals that don't fit into other categories.
    TSOperator           { Normal } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    TSParameter          { Identifier, gui = "bold" } , -- Parameters of a function.
    TSParameterReference { TSParameter } , -- References to parameters of a function.
    TSPreProc            { PreProc } , -- Preprocessor #if, #else, #endif, etc.
    TSProperty           { Identifier } , -- Same as `TSField`.
    TSPunctDelimiter     { Normal } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket       { Normal } , -- Brackets, braces, parentheses, etc.
    TSPunctSpecial       { Normal } , -- Special punctuation that doesn't fit into the previous categories.
    TSRepeat             { Statement } , -- Keywords related to loops: `for`, `while`, etc.
    TSStorageClass       { Type } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
    TSString             { String } , -- String literals.
    TSStringRegex        { String } , -- Regular expression literals.
    TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringSpecial      { Special } , -- Strings with special meaning that don't fit into the previous categories.
    TSSymbol             { Identifier } , -- Identifiers referring to symbols or atoms.
    TSTag                { fg = base.accent1} , -- Tags like HTML tag names.
    TSTagAttribute       { TSTag } , -- HTML tag attributes.
    TSTagDelimiter       { TSTag } , -- Tag delimiters like `<` `>` `/`.
    TSText               { Normal } , -- Non-structured text. Like text in a markup language.
    TSStrong             { TSText, gui = "bold" } , -- Text to be represented in bold.
    TSEmphasis           { TSText, gui = "italic" } , -- Text to be represented with emphasis.
    TSUnderline          { TSText, gui = "underline" } , -- Text to be represented with an underline.
    TSStrike             { TSText, gui = "strikethrough" } , -- Strikethrough text.
    TSTitle              { TSText, gui = "reverse" } , -- Text that is part of a title.
    TSLiteral            { Normal } , -- Literal or verbatim text.
    TSURI                { Underlined } , -- URIs like hyperlinks or email addresses.
    TSMath               { Special } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    TSType               { Type } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    TSVariable           { Identifier } , -- Variable names that don't fit into other categories.
    TSVariableBuiltin    { Identifier, gui = "italic" } , -- Variable names defined by the language: `this` or `self` in Javascript.

    -- Fugitive syntax groups
    gitcommitDiscardedFile { fg = colors.red },
    gitcommitUntrackedFile { fg = colors.yellow },
    gitcommitSelectedFile  { fg = colors.green },

    -- GitSigns
    GitSignsAdd { fg = colors.green },
    GitSignsChange { fg = colors.yellow },
    GitSignsDelete { fg = colors.red },

    -- Telescope
    TelescopeBorder { fg = base.fade0 },
    TelescopeNormal { fg = base.fg1 },
    TelescopePromptPrefix { fg = base.accent1 },
    TelescopeSelection { bg = base.hl1, fg = base.bg1, gui = "bold" },
    TelescopeMatching { bg = base.hl0, fg = base.bg1 },

    NvimTreeSymlink { Normal },
    NvimTreeFolderName { Normal, gui = "bold" },
    NvimTreeRootFolder { Comment },
    -- NvimTreeFolderIcon
    -- NvimTreeFileIcon
    -- NvimTreeEmptyFolderName     (Directory)
    NvimTreeOpenedFolderName { Normal, gui = "bold" },
    -- NvimTreeExecFile
    NvimTreeOpenedFile { fg = base.accent1 },
    -- NvimTreeSpecialFile
    -- NvimTreeImageFile

    -- NvimTreeLspDiagnosticsError         (DiagnosticError)
    -- NvimTreeLspDiagnosticsWarning       (DiagnosticWarn)
    -- NvimTreeLspDiagnosticsInformation   (DiagnosticInfo)
    -- NvimTreeLspDiagnosticsHint          (DiagnosticHint)

    NvimTreeGitDirty { fg = colors.orange },
    NvimTreeGitStaged { fg = colors.green }
    -- NvimTreeGitMerge
    -- NvimTreeGitRenamed
    -- NvimTreeGitNew
    -- NvimTreeGitDeleted
    -- NvimTreeGitIgnored      (Comment)

    -- NvimTreeWindowPicker

    -- NvimTreeNormal
    -- NvimTreeEndOfBuffer     (NonText)
    -- NvimTreeCursorLine      (CursorLine)
    -- NvimTreeVertSplit       (VertSplit)     [deprecated, use NvimTreeWinSeparator]
    -- NvimTreeWinSeparator    (VertSplit)
    -- NvimTreeCursorColumn    (CursorColumn)

    -- NvimTreeFileDirty       (NvimTreeGitDirty)
    -- NvimTreeFileStaged      (NvimTreeGitStaged)
    -- NvimTreeFileMerge       (NvimTreeGitMerge)
    -- NvimTreeFileRenamed     (NvimTreeGitRenamed)
    -- NvimTreeFileNew         (NvimTreeGitNew)
    -- NvimTreeFileDeleted     (NvimTreeGitDeleted)
    -- NvimTreeFileIgnored     (NvimTreeGitIgnored)
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
