-- Force pure #000000 OLED black across all Neovim UI layers
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local pitch_black = { bg = "#000000" }
    local groups = {
      "Normal", "NormalNC", "NormalFloat", "FloatBorder",
      "SignColumn", "EndOfBuffer", "MsgArea",
      "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
      "TelescopeNormal", "TelescopeBorder",
      "StatusLine", "StatusLineNC", "TabLineFill",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, pitch_black)
    end
  end,
})

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      term_colors = true,
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
          -- Boost syntax palette for maximum vibrancy against OLED black
          rosewater = "#FF9EBB",
          flamingo = "#FF7A93",
          pink = "#FF6AD5",
          mauve = "#C77DFF",     -- Keywords (if, return, for, while)
          red = "#FF4D6D",       -- Built-ins / macros / errors
          maroon = "#FF758F",
          peach = "#FF9E00",      -- Numbers / constants / booleans
          yellow = "#FFD60A",    -- Types / structs / classes
          green = "#38B000",     -- Strings
          teal = "#00F5D4",      -- Special operators / namespaces
          sky = "#00BBF9",       -- Properties / fields
          sapphire = "#4CC9F0",  -- Parameters
          blue = "#4361EE",      -- Functions & methods
          lavender = "#B5179E",  -- Variables & identifiers
        },
      },
      custom_highlights = function(colors)
        return {
          ["@variable"] = { fg = "#E0AAFF" },           -- Bright lavender-white for variables
          ["@variable.parameter"] = { fg = "#4CC9F0", italic = true }, -- Electric cyan parameters
          ["@function"] = { fg = "#3A86FF", bold = true }, -- Vivid blue functions
          ["@keyword"] = { fg = "#C77DFF", bold = true },  -- Punchy violet keywords
          ["@type"] = { fg = "#FFD60A", bold = true },     -- Bright gold types (int, size_t)
          ["@string"] = { fg = "#52B788" },                -- Crisp emerald strings
          ["@number"] = { fg = "#FF9E00" },                -- Bright amber numbers
          ["@operator"] = { fg = "#00F5D4" },              -- Neon teal operators (+, *, ->)
        }
      end,
      integrations = {
        treesitter = true,
        rainbow_delimiters = true,
        native_lsp = { enabled = true },
        semantic_tokens = true,
        telescope = { enabled = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- 7-color VSCode-style rainbow brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = { [""] = rainbow.strategy["global"] },
        query = { [""] = "rainbow-delimiters" },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
