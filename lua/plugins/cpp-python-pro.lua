return {
  -- 1. Python Virtual Environment Switcher (<Space>cv to pick venv/conda env)
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    cmd = "VenvSelect",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python VirtualEnv" },
    },
  },

  -- 2. Configure Python (basedpyright + ruff) and C/C++ (clangd Alt+o switch)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard", -- Catches real bugs without noisy strict-mode spam
                autoImportCompletions = true,
              },
            },
          },
        },
        ruff = {},
      },
    },
  },

  -- 3. Ensure Mason automatically installs all C, C++, and Python tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "basedpyright",
        "ruff",
        "debugpy",
      },
    },
  },
}
