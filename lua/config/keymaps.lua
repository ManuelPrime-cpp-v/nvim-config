-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com
-- Add any additional keymaps here

-- 1. Press <F5> in Normal mode to save, compile (with -g debug symbols), and run C, C++, or Python interactively
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w")
  local file = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local ext = vim.fn.expand("%:e")

  local cmd = ""
  if ext == "c" then
    cmd = string.format("gcc -std=c17 -O2 -g -Wall -Wextra '%s' -o '%s' && '%s'", file, out, out)
  elseif ext == "cpp" then
    cmd = string.format("g++ -std=c++20 -O2 -g -Wall -Wextra '%s' -o '%s' && '%s'", file, out, out)
  elseif ext == "py" then
    cmd = string.format("python3 '%s'", file)
  else
    print("No runner configured for ." .. ext)
    return
  end

  vim.cmd("botright 12split | terminal " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Save, Compile & Run File" })

-- Backup shortcut (<Space> + r) for Termux / keyboards without an F5 key
vim.keymap.set("n", "<leader>r", "<F5>", { remap = true, desc = "Save, Compile & Run File" })

-- 2. Press <Space> + a in Normal mode to inspect -O2 Intel Assembly side-by-side (C/C++)
vim.keymap.set("n", "<leader>a", function()
  vim.cmd("w")
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local asm_out = "/tmp/nvim_inspect.s"

  local compiler = ""
  if ext == "c" then
    compiler = "gcc -std=c17"
  elseif ext == "cpp" then
    compiler = "g++ -std=c++20"
  else
    print("Assembly inspection is only available for .c and .cpp files")
    return
  end

  -- Compile to clean Intel-syntax assembly without noisy CFI directives
  local cmd = string.format("%s -O2 -S -masm=intel -fno-asynchronous-unwind-tables '%s' -o '%s'", compiler, file, asm_out)
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("Assembly compilation failed:\n" .. result)
    return
  end

  vim.cmd("vsplit " .. asm_out)
  vim.bo.filetype = "asm"
  vim.bo.readonly = true
end, { desc = "Inspect -O2 Assembly Side-by-Side" })
