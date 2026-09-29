return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>o", group = "Open in Browser" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>oh",
        '<cmd>silent !open %<cr>',
        desc = "Open HTML in Browser",
        ft = "html",
      },
    },
  },
}
