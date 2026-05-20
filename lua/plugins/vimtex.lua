return {
  "lervag/vimtex",
  opts = {
    view = {
      method = "skim",
    },
    latexmk = {
      options = {
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    },
  },
}
