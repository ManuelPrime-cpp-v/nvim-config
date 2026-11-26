return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      local highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#FF4D6D" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FFD60A" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#4361EE" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FF9E00" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#38B000" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C77DFF" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#00F5D4" })
      end)

      require("ibl").setup({
        indent = {
          char = "│",
          highlight = highlight,
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}
