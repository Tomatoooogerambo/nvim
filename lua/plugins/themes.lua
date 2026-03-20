return {
  {
    "idr4n/github-monochrome.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- require("jb").setup({transparent = true})
      vim.cmd("colorscheme jb")
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
