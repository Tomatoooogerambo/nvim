return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
      colors = {
        ["bg"] = "#262427",
        ["ui.bg"] = "#262427",
        ["ui.fg"] = "#fcfcfa",
        ["syntax.keyword"] = "#a392e8",
        ["syntax.string"] = "#b3e03a",
        ["syntax.func"] = "#9deaf6",
        ["syntax.type"] = "#00cde8",
        ["syntax.comment"] = "#545452",
        ["syntax.variable"] = "#fcfcfa",
      },
    },
    config = function()
      vim.o.background = "dark"
      -- indigo-teal: 与 Hermes 主题同源（~/.hermes/skins/indigo-teal.yaml），
      -- 配色定义见 ~/.config/nvim/colors/indigo-teal.lua。
      -- 想切回 vscode：把下面这行改回 vim.cmd("colorscheme vscode")。
      vim.cmd("colorscheme indigo-teal")
    end,
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
    },
  },
}
