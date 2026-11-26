return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "quadratic", -- Fast start, smooth deceleration like VSCode
    },
  },
}
