return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
      colors = {
        "nightly",
        ["bg"] = "#1E1E1E",
        ["ui.bg"] = "#1E1E1E",
        ["ui.fg"] = "#D4D4D4",
        ["syntax.keyword"] = "#569CD6",
        ["syntax.string"] = "#CE9178",
        ["syntax.func"] = "#DCDCAA",
        ["syntax.type"] = "#4EC9B0",
        ["syntax.comment"] = "#6A9955",
        ["syntax.variable"] = "#9CDCFE",
      },
    },
    config = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme vscode")
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
