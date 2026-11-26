return {
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    keys = {
      {
        "<leader>;",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick symbol in top breadcrumbs bar",
      },
    },
    opts = {
      bar = {
        enable = function(buf, win, _)
          return not vim.api.nvim_win_get_config(win).zindex
            and vim.bo[buf].buftype == ""
            and vim.api.nvim_buf_get_name(buf) ~= ""
            and not vim.wo[win].diff
        end,
      },
    },
  },
}
