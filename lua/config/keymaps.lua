-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Press <F5> in Normal mode to save, compile, and run C, C++, or Python interactively
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w") -- Auto-save current file
  local file = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local ext = vim.fn.expand("%:e")

  local cmd = ""
  if ext == "c" then
    cmd = string.format("gcc -std=c17 -O2 -Wall -Wextra '%s' -o '%s' && '%s'", file, out, out)
  elseif ext == "cpp" then
    cmd = string.format("g++ -std=c++20 -O2 -Wall -Wextra '%s' -o '%s' && '%s'", file, out, out)
  elseif ext == "py" then
    cmd = string.format("python3 '%s'", file)
  else
    print("No runner configured for ." .. ext)
    return
  end

  vim.cmd("botright 12split | terminal " .. cmd)
  vim.cmd("startinsert") -- Immediately focus terminal for scanf / input()
end, { desc = "Save, Compile & Run File" })

-- Backup shortcut (<Space> + r) for Termux / keyboards without an F5 key
vim.keymap.set("n", "<leader>r", "<F5>", { remap = true, desc = "Save, Compile & Run File" })
