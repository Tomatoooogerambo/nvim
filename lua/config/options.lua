-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"

-- Ensure vimtex is configured correctly
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_zathura_use_synctex = 0
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-xelatex", -- 或者使用 '-lualatex'
}
