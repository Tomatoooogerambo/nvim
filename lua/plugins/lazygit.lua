-- Lazygit window geometry.
-- LazyVim maps <leader>gg / <leader>gG to Snacks.lazygit(), which by default opens
-- in a 90%x90% centered float with a dimmed backdrop (snacks.win "float" style).
-- Setting width/height to 0 means "full editor size" (see snacks/win.lua M:dim).
return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        win = {
          position = "float",
          width = 0, -- 0 = full width of the terminal window
          height = 0, -- 0 = full height of the terminal window
          backdrop = false, -- nothing left to dim behind a full-screen window
        },
      },
    },
  },
}
