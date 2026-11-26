return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- Disable standard color names like "blue" or "red" in C/Python code
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        mode = "background", -- Display color swatch as background highlight
        virtualtext = "■",
      },
    },
  },
}
