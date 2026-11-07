-- lualine theme for the `indigo-teal` colorscheme (LazyVim uses theme = "auto").
-- Palette: ~/.hermes/skins/indigo-teal.yaml · ~/.config/nvim/colors/indigo-teal.lua
local p = {
  bg = "#101322",
  bg_dark = "#0a0e1a",
  bg_soft = "#161a2b",
  fg = "#ccd7e6",
  fg_bright = "#e9f1f8",
  dim = "#7d8ca7",
  accent = "#2dd4bf",
  mint = "#7fe3d3",
  sky = "#38bdf8",
  violet = "#c4b5fd",
  amber = "#fbbf24",
  red = "#f87171",
  green = "#34d399",
}

local function mode(bg, fg)
  return {
    a = { fg = p.bg, bg = bg, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_soft },
    c = { fg = p.dim, bg = p.bg_dark },
    x = { fg = p.dim, bg = p.bg_dark },
    y = { fg = p.fg, bg = p.bg_soft },
    z = { fg = p.fg, bg = p.accent },
  }
end

return {
  normal = mode(p.accent),
  insert = mode(p.green),
  visual = mode(p.violet),
  replace = mode(p.red),
  command = mode(p.amber),
  terminal = mode(p.sky),
  inactive = {
    a = { fg = p.dim, bg = p.bg_dark },
    b = { fg = p.dim, bg = p.bg_dark },
    c = { fg = p.dim, bg = p.bg_dark },
  },
}
