-- indigo-teal — Neovim port of the Hermes `indigo-teal` skin.
-- Palette source of truth: ~/.hermes/skins/indigo-teal.yaml
--   background #101322 · accent #2dd4bf · text #ccd7e6 · dim #7d8ca7
--   syntax string #7fe3d3 · number #c4b5fd · keyword #38bdf8 · comment #7d8ca7
--   diff add #0f2f2b/#b8f7cf · diff delete #301820/#ffc0c0
-- Load with: :colorscheme indigo-teal   (or set LazyVim colorscheme = "indigo-teal")

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- `hi clear` resets g:colors_name, so claim the name AFTER clearing: lualine's
-- theme = "auto" and `:set background?`-style detection key off it.
vim.g.colors_name = "indigo-teal"
vim.o.termguicolors = true
vim.o.background = "dark"

local p = {
  bg = "#101322",
  bg_dark = "#0a0e1a",
  bg_soft = "#161a2b",
  bg_sel = "#1e3350",
  bg_alt = "#0d1120",

  fg = "#ccd7e6",
  fg_bright = "#e9f1f8",
  dim = "#7d8ca7",
  gutter = "#46536b",
  border = "#24304a",
  label = "#9fb3cc",

  accent = "#2dd4bf",
  mint = "#7fe3d3",
  mint_lt = "#6ee7d7",
  sky = "#38bdf8",
  violet = "#c4b5fd",
  amber = "#fbbf24",
  red = "#f87171",
  green = "#34d399",

  diff_add = "#0f2f2b",
  diff_add_fg = "#b8f7cf",
  diff_del = "#301820",
  diff_del_fg = "#ffc0c0",
  diff_chg = "#16233a",
  diff_txt = "#24405c",
}

local function h(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- ── Editor chrome ──────────────────────────────────────────────────────
h("Normal", { fg = p.fg, bg = p.bg })
h("NormalNC", { fg = p.fg, bg = p.bg })
h("NormalFloat", { fg = p.fg, bg = p.bg_alt })
h("FloatBorder", { fg = p.border, bg = p.bg_alt })
h("FloatTitle", { fg = p.accent, bg = p.bg_alt, bold = true })
h("Cursor", { fg = p.bg, bg = p.accent })
h("lCursor", { link = "Cursor" })
h("TermCursor", { link = "Cursor" })
h("CursorLine", { bg = p.bg_soft })
h("CursorColumn", { bg = p.bg_soft })
h("CursorLineNr", { fg = p.accent, bold = true })
h("LineNr", { fg = p.gutter })
h("LineNrAbove", { fg = p.gutter })
h("LineNrBelow", { fg = p.gutter })
h("SignColumn", { bg = p.bg })
h("ColorColumn", { bg = p.bg_soft })
h("WinSeparator", { fg = p.border })
h("VertSplit", { link = "WinSeparator" })
h("FoldColumn", { fg = p.gutter, bg = p.bg })
h("Folded", { fg = p.dim, bg = p.bg_soft })
h("NonText", { fg = p.border })
h("SpecialKey", { fg = p.border })
h("Whitespace", { fg = p.border })
h("Directory", { fg = p.accent })
h("Title", { fg = p.fg_bright, bold = true })
h("MatchParen", { fg = p.fg_bright, bg = p.diff_txt, bold = true })
h("Conceal", { fg = p.dim })
h("EndOfBuffer", { fg = p.bg })

-- Status / tab lines
h("StatusLine", { fg = p.fg, bg = p.bg_dark })
h("StatusLineNC", { fg = p.dim, bg = p.bg_dark })
h("StatusLineTerm", { link = "StatusLine" })
h("WinBar", { fg = p.fg, bg = p.bg })
h("WinBarNC", { fg = p.dim, bg = p.bg })
h("TabLine", { fg = p.dim, bg = p.bg_dark })
h("TabLineFill", { bg = p.bg_dark })
h("TabLineSel", { fg = p.accent, bg = p.bg_soft, bold = true })

-- Popups / completion
h("Pmenu", { fg = p.fg, bg = p.bg_alt })
h("PmenuSel", { fg = p.fg_bright, bg = p.bg_sel, bold = true })
h("PmenuKind", { fg = p.mint, bg = p.bg_alt })
h("PmenuKindSel", { fg = p.mint, bg = p.bg_sel })
h("PmenuExtra", { fg = p.dim, bg = p.bg_alt })
h("PmenuExtraSel", { fg = p.label, bg = p.bg_sel })
h("PmenuSbar", { bg = p.bg_soft })
h("PmenuThumb", { bg = p.gutter })
h("WildMenu", { link = "PmenuSel" })
h("ComplMatchIns", { fg = p.bg, bg = p.accent })

-- Selection, search
h("Visual", { bg = p.bg_sel })
h("VisualNOS", { bg = p.bg_sel })
h("Search", { fg = p.bg, bg = p.accent })
h("IncSearch", { fg = p.bg, bg = p.amber })
h("CurSearch", { fg = p.bg, bg = p.amber, bold = true })
h("Substitute", { fg = p.bg, bg = p.red })

-- Messages
h("ErrorMsg", { fg = p.red, bold = true })
h("WarningMsg", { fg = p.amber })
h("ModeMsg", { fg = p.accent, bold = true })
h("MoreMsg", { fg = p.accent })
h("Question", { fg = p.mint })
h("QuickFixLine", { bg = p.bg_sel })
h("qfLineNr", { fg = p.dim })

-- Spell
h("SpellBad", { sp = p.red, undercurl = true })
h("SpellCap", { sp = p.amber, undercurl = true })
h("SpellLocal", { sp = p.sky, undercurl = true })
h("SpellRare", { sp = p.violet, undercurl = true })

-- ── Diffs (same values as the Hermes skin) ─────────────────────────────
h("DiffAdd", { fg = p.diff_add_fg, bg = p.diff_add })
h("DiffDelete", { fg = p.diff_del_fg, bg = p.diff_del })
h("DiffChange", { fg = p.fg, bg = p.diff_chg })
h("DiffText", { fg = p.fg_bright, bg = p.diff_txt, bold = true })
h("diffAdded", { fg = p.diff_add_fg, bg = p.diff_add })
h("diffRemoved", { fg = p.diff_del_fg, bg = p.diff_del })
h("diffChanged", { fg = p.fg, bg = p.diff_chg })
h("Added", { fg = p.diff_add_fg, bg = p.diff_add })
h("Removed", { fg = p.diff_del_fg, bg = p.diff_del })
h("Changed", { fg = p.fg, bg = p.diff_chg })

-- ── Classic syntax ────────────────────────────────────────────────────
h("Comment", { fg = p.dim, italic = true })
h("Constant", { fg = p.violet })
h("String", { fg = p.mint })
h("Character", { fg = p.mint })
h("Number", { fg = p.violet })
h("Boolean", { fg = p.violet, bold = true })
h("Float", { fg = p.violet })
h("Identifier", { fg = p.fg })
h("Function", { fg = p.accent })
h("Statement", { fg = p.sky })
h("Conditional", { fg = p.sky })
h("Repeat", { fg = p.sky })
h("Label", { fg = p.sky })
h("Operator", { fg = p.label })
h("Keyword", { fg = p.sky })
h("Exception", { fg = p.sky })
h("PreProc", { fg = p.mint_lt })
h("Include", { fg = p.sky })
h("Define", { fg = p.sky })
h("Macro", { fg = p.mint_lt })
h("PreCondit", { fg = p.sky })
h("Type", { fg = p.mint_lt })
h("StorageClass", { fg = p.sky })
h("Structure", { fg = p.mint_lt })
h("Typedef", { fg = p.mint_lt })
h("Special", { fg = p.mint })
h("SpecialChar", { fg = p.amber })
h("Tag", { fg = p.accent })
h("Delimiter", { fg = p.label })
h("SpecialComment", { fg = p.dim, italic = true })
h("Debug", { fg = p.amber })
h("Underlined", { fg = p.sky, underline = true })
h("Ignore", { fg = p.border })
h("Error", { fg = p.red, bold = true })
h("Todo", { fg = p.bg, bg = p.amber, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────
h("@variable", { fg = p.fg })
h("@variable.builtin", { fg = p.violet, italic = true })
h("@variable.parameter", { fg = p.fg })
h("@variable.member", { fg = p.fg })
h("@constant", { fg = p.violet })
h("@constant.builtin", { fg = p.violet, bold = true })
h("@constant.macro", { fg = p.violet })
h("@module", { fg = p.mint_lt })
h("@label", { fg = p.sky })
h("@string", { fg = p.mint })
h("@string.escape", { fg = p.amber })
h("@string.special", { fg = p.amber })
h("@string.regexp", { fg = p.amber })
h("@character", { fg = p.mint })
h("@character.special", { fg = p.amber })
h("@number", { fg = p.violet })
h("@boolean", { fg = p.violet, bold = true })
h("@float", { fg = p.violet })
h("@function", { fg = p.accent })
h("@function.builtin", { fg = p.accent, italic = true })
h("@function.call", { fg = p.accent })
h("@function.method", { fg = p.accent })
h("@function.method.call", { fg = p.accent })
h("@constructor", { fg = p.mint_lt })
h("@operator", { fg = p.label })
h("@keyword", { fg = p.sky })
h("@keyword.function", { fg = p.sky })
h("@keyword.operator", { fg = p.sky })
h("@keyword.return", { fg = p.sky, bold = true })
h("@keyword.conditional", { fg = p.sky })
h("@keyword.repeat", { fg = p.sky })
h("@keyword.exception", { fg = p.sky })
h("@keyword.import", { fg = p.sky })
h("@conditional", { fg = p.sky })
h("@repeat", { fg = p.sky })
h("@exception", { fg = p.sky })
h("@type", { fg = p.mint_lt })
h("@type.builtin", { fg = p.mint_lt, italic = true })
h("@type.qualifier", { fg = p.sky })
h("@type.definition", { fg = p.mint_lt })
h("@attribute", { fg = p.mint_lt })
h("@property", { fg = p.fg })
h("@namespace", { fg = p.mint_lt })
h("@comment", { fg = p.dim, italic = true })
h("@comment.documentation", { fg = p.dim, italic = true })
h("@punctuation.delimiter", { fg = p.label })
h("@punctuation.bracket", { fg = p.label })
h("@punctuation.special", { fg = p.amber })
h("@tag", { fg = p.accent })
h("@tag.attribute", { fg = p.mint_lt })
h("@tag.delimiter", { fg = p.label })
h("@markup.heading", { fg = p.fg_bright, bold = true })
h("@markup.heading.1", { fg = p.accent, bold = true })
h("@markup.heading.2", { fg = p.mint_lt, bold = true })
h("@markup.italic", { italic = true })
h("@markup.bold", { bold = true })
h("@markup.strikethrough", { strikethrough = true })
h("@markup.link", { fg = p.sky, underline = true })
h("@markup.link.label", { fg = p.mint })
h("@markup.link.url", { fg = p.sky, underline = true })
h("@markup.raw", { fg = p.mint })
h("@markup.raw.block", { fg = p.fg })
h("@markup.list", { fg = p.accent })
h("@markup.quote", { fg = p.dim, italic = true })
h("@diff.plus", { fg = p.diff_add_fg })
h("@diff.minus", { fg = p.diff_del_fg })
h("@diff.delta", { fg = p.sky })

-- LSP semantic tokens take precedence over treesitter when enabled
h("@lsp.type.class", { link = "@type" })
h("@lsp.type.enum", { link = "@type" })
h("@lsp.type.interface", { link = "@type" })
h("@lsp.type.struct", { link = "@type" })
h("@lsp.type.typeParameter", { link = "@type" })
h("@lsp.type.function", { link = "@function" })
h("@lsp.type.method", { link = "@function.method" })
h("@lsp.type.parameter", { fg = p.fg, italic = true })
h("@lsp.type.property", { link = "@property" })
h("@lsp.type.variable", { link = "@variable" })
h("@lsp.type.enumMember", { fg = p.violet })
h("@lsp.type.keyword", { link = "@keyword" })
h("@lsp.type.namespace", { link = "@namespace" })
h("@lsp.type.macro", { fg = p.mint_lt })
h("@lsp.type.decorator", { fg = p.mint_lt })
h("@lsp.mod.deprecated", { strikethrough = true })
h("@lsp.mod.readonly", { fg = p.violet })

-- ── Diagnostics ───────────────────────────────────────────────────────
h("DiagnosticError", { fg = p.red })
h("DiagnosticWarn", { fg = p.amber })
h("DiagnosticInfo", { fg = p.sky })
h("DiagnosticHint", { fg = p.mint_lt })
h("DiagnosticOk", { fg = p.green })
h("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
h("DiagnosticUnderlineWarn", { sp = p.amber, undercurl = true })
h("DiagnosticUnderlineInfo", { sp = p.sky, undercurl = true })
h("DiagnosticUnderlineHint", { sp = p.mint_lt, undercurl = true })
h("DiagnosticUnderlineOk", { sp = p.green, undercurl = true })
h("DiagnosticVirtualTextError", { fg = p.red, bg = p.diff_del })
h("DiagnosticVirtualTextWarn", { fg = p.amber, bg = p.bg_soft })
h("DiagnosticVirtualTextInfo", { fg = p.sky, bg = p.bg_soft })
h("DiagnosticVirtualTextHint", { fg = p.mint_lt, bg = p.bg_soft })
h("DiagnosticVirtualTextOk", { fg = p.green, bg = p.bg_soft })
h("DiagnosticFloatingError", { fg = p.red, bg = p.bg_alt })
h("DiagnosticFloatingWarn", { fg = p.amber, bg = p.bg_alt })
h("DiagnosticFloatingInfo", { fg = p.sky, bg = p.bg_alt })
h("DiagnosticFloatingHint", { fg = p.mint_lt, bg = p.bg_alt })
h("DiagnosticUnnecessary", { fg = p.gutter })
h("DiagnosticDeprecated", { sp = p.red, strikethrough = true })
h("LspReferenceText", { bg = p.bg_sel })
h("LspReferenceRead", { bg = p.bg_sel })
h("LspReferenceWrite", { bg = p.bg_sel, underline = true })
h("LspSignatureActiveParameter", { fg = p.accent, bold = true })
-- inlay hint（gopls 的 `err error` / `ctx:` / `item:` / `values...:` 等参数名与类型提示）
-- 原来是 gutter(#46536b) + bg_soft 背景，对比度只有 ~2.2:1，深底上几乎看不见；
-- 改成 label 前景、去掉背景块，仍用 italic 与正文区分。
h("LspInlayHint", { fg = p.label, italic = true })

-- ── Plugins commonly used in LazyVim ─────────────────────────────────
-- gitsigns / mini.diff
h("GitSignsAdd", { fg = p.green })
h("GitSignsChange", { fg = p.amber })
h("GitSignsDelete", { fg = p.red })
h("GitSignsAddNr", { fg = p.green })
h("GitSignsChangeNr", { fg = p.amber })
h("GitSignsDeleteNr", { fg = p.red })
h("MiniDiffSignAdd", { fg = p.green })
h("MiniDiffSignChange", { fg = p.amber })
h("MiniDiffSignDelete", { fg = p.red })

-- telescope
h("TelescopeNormal", { fg = p.fg, bg = p.bg_alt })
h("TelescopeBorder", { fg = p.border, bg = p.bg_alt })
h("TelescopeTitle", { fg = p.accent, bg = p.bg_alt })
h("TelescopePromptNormal", { fg = p.fg, bg = p.bg_soft })
h("TelescopePromptBorder", { fg = p.border, bg = p.bg_soft })
h("TelescopePromptTitle", { fg = p.bg, bg = p.accent, bold = true })
h("TelescopeResultsNormal", { fg = p.fg, bg = p.bg_alt })
h("TelescopePreviewNormal", { fg = p.fg, bg = p.bg_alt })
h("TelescopeSelection", { fg = p.fg_bright, bg = p.bg_sel })
h("TelescopeSelectionCaret", { fg = p.accent, bg = p.bg_sel })
h("TelescopeMatching", { fg = p.amber, bold = true })

-- neo-tree
h("NeoTreeNormal", { fg = p.fg, bg = p.bg_alt })
h("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
h("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_alt })
h("NeoTreeRootName", { fg = p.accent, bold = true })
h("NeoTreeDirectoryName", { fg = p.fg })
h("NeoTreeDirectoryIcon", { fg = p.accent })
h("NeoTreeFileName", { fg = p.fg })
h("NeoTreeFileIcon", { fg = p.dim })
h("NeoTreeIndentMarker", { fg = p.border })
h("NeoTreeGitAdded", { fg = p.green })
h("NeoTreeGitModified", { fg = p.amber })
h("NeoTreeGitDeleted", { fg = p.red })
h("NeoTreeGitUntracked", { fg = p.violet })

-- blink.cmp / nvim-cmp
h("BlinkCmpMenu", { fg = p.fg, bg = p.bg_alt })
h("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg_alt })
h("BlinkCmpMenuSelection", { fg = p.fg_bright, bg = p.bg_sel, bold = true })
h("BlinkCmpLabelMatch", { fg = p.accent, bold = true })
h("BlinkCmpLabelDeprecated", { fg = p.dim, strikethrough = true })
h("BlinkCmpDoc", { fg = p.fg, bg = p.bg_alt })
h("BlinkCmpDocBorder", { fg = p.border, bg = p.bg_alt })
h("BlinkCmpKind", { fg = p.mint })
h("BlinkCmpSignatureHelp", { fg = p.fg, bg = p.bg_alt })
h("BlinkCmpSignatureHelpBorder", { fg = p.border, bg = p.bg_alt })
h("CmpItemAbbrMatch", { fg = p.accent, bold = true })
h("CmpItemKind", { fg = p.mint })
h("CmpItemMenu", { fg = p.dim })
h("CmpDocumentation", { fg = p.fg, bg = p.bg_alt })
h("CmpDocumentationBorder", { fg = p.border, bg = p.bg_alt })

-- indent guides (ibl / indent-blankline v3)
h("IblIndent", { fg = p.border })
h("IblScope", { fg = p.accent })
h("IndentBlanklineChar", { fg = p.border })
h("IndentBlanklineContextChar", { fg = p.accent })

-- snacks / dashboard / notify
h("SnacksPickerNormal", { fg = p.fg, bg = p.bg_alt })
h("SnacksPickerBorder", { fg = p.border, bg = p.bg_alt })
h("SnacksPickerTitle", { fg = p.accent, bg = p.bg_alt, bold = true })
h("SnacksPickerMatch", { fg = p.amber, bold = true })
h("SnacksNotifierInfo", { fg = p.sky })
h("SnacksNotifierWarn", { fg = p.amber })
h("SnacksNotifierError", { fg = p.red })
h("SnacksDashboardHeader", { fg = p.accent })
h("SnacksDashboardTitle", { fg = p.fg_bright, bold = true })
h("SnacksDashboardDesc", { fg = p.fg })
h("SnacksDashboardKey", { fg = p.accent })
h("SnacksDashboardIcon", { fg = p.mint_lt })
h("SnacksDashboardFooter", { fg = p.dim })

-- snacks picker / explorer 的 git 状态着色。
-- formatters.file.git_status_hl = true 会把这些组**直接套到文件名上**，而 snacks 默认把
-- GitStatusUntracked / Ignored / PathIgnored / PathHidden / Dir 链接到 NonText；
-- 本主题 NonText = border(#24304a)，在 bg(#101322) 上对比度 ~1.4:1 → 未跟踪/未 add 的文件名看不见。
-- 这里给显式前景色（default 不覆盖已有定义，所以必须先于 snacks picker 初始化定义）。
h("SnacksPickerGitStatus", { fg = p.accent })
h("SnacksPickerGitStatusUntracked", { fg = p.violet }) -- 与 NeoTreeGitUntracked 同色
h("SnacksPickerGitStatusIgnored", { fg = p.dim })
h("SnacksPickerPathIgnored", { fg = p.dim })
h("SnacksPickerPathHidden", { fg = p.dim })
h("SnacksPickerDir", { fg = p.label }) -- 列表里的父路径前缀（原链接 NonText）

-- which-key
h("WhichKey", { fg = p.accent })
h("WhichKeyGroup", { fg = p.sky })
h("WhichKeyDesc", { fg = p.fg })
h("WhichKeySeparator", { fg = p.dim })
h("WhichKeyFloat", { bg = p.bg_alt })
h("WhichKeyBorder", { fg = p.border, bg = p.bg_alt })

-- ── Terminal ANSI palette (matches the Hermes skin's status colors) ───
local ansi = {
  "#0a0e1a",
  "#f87171",
  "#34d399",
  "#fbbf24",
  "#38bdf8",
  "#c4b5fd",
  "#2dd4bf",
  "#ccd7e6",
  "#46536b",
  "#ff8a8a",
  "#6ee7b7",
  "#fcd34d",
  "#7dd3fc",
  "#d8b4fe",
  "#7fe3d3",
  "#e9f1f8",
}
for i, color in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
