local M = {}
local todo_win = nil
local todo_buf = nil

-- Define the storage path for your standalone todo file
--local todo_file = vim.fn.stdpath("data") .. "/todo.md"
local todo_file = "/home/tor/Dokumenter/Huskelister/huskeliste.md"

function M.toggle_todo()
  -- If window is already open and valid, close it
  if todo_win and vim.api.nvim_win_is_valid(todo_win) then
    vim.api.nvim_win_close(todo_win, true)
    todo_win = nil
    return
  end

  -- Ensure the todo file exists
  if vim.fn.filereadable(todo_file) == 0 then
    vim.fn.writefile({ "# 📝 Huskeliste", "", "- [ ] Nytt gjøremål" }, todo_file)
  end

  -- Create a new buffer if it doesn't exist or isn't valid
  if not todo_buf or not vim.api.nvim_buf_is_valid(todo_buf) then
    todo_buf = vim.api.nvim_create_buf(false, true) -- listed = false, scratch = true
    vim.api.nvim_buf_set_name(todo_buf, "Todo List")
    -- Load the file contents into the buffer
    local lines = vim.fn.readfile(todo_file)
    vim.api.nvim_buf_set_lines(todo_buf, 0, -1, false, lines)
    -- Set filetype to markdown for syntax highlighting
    vim.api.nvim_set_option_value("filetype", "markdown", { buf = todo_buf })
  end

  -- Calculate sizes for a centered floating window
  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Window configuration
  local opts = {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " 📝 Huskeliste ",
    title_pos = "center",
  }

  -- Open the floating window
  todo_win = vim.api.nvim_open_win(todo_buf, true, opts)

  -- Setup an autocommand to auto-save the todo file when closing or leaving the buffer
  vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    buffer = todo_buf,
    once = true,
    callback = function()
      if vim.api.nvim_buf_is_valid(todo_buf) then
        local lines = vim.api.nvim_buf_get_lines(todo_buf, 0, -1, false)
        vim.fn.writefile(lines, todo_file)
      end
    end,
  })

  -- Quick local keymap inside the float to close it with 'q'
  vim.keymap.set("n", "q", function()
    if todo_win and vim.api.nvim_win_is_valid(todo_win) then
      vim.api.nvim_win_close(todo_win, true)
      todo_win = nil
    end
  end, { buffer = todo_buf, silent = true })
end

-- Keymap to toggle the Todo List globally (Change <leader>tl to your liking)
vim.keymap.set("n", "<leader>h", M.toggle_todo, { desc = "Toggle Floating Todo List" })


--If you want a quick toggle to check off tasks, you can add this mapping inside the configuration to toggle - [ ] to - [x]


vim.keymap.set("n", "<CR>", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("%-%s%[%s%]") then
    line = line:gsub("%-%s%[%s%]", "- [x]")
  elseif line:match("%-%s%[%x%]") then
    line = line:gsub("%-%s%[%x%]", "- [ ]")
  end
  vim.api.nvim_set_current_line(line)
end, { buffer = todo_buf, desc = "Toggle checkbox" })


return M

