-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
DISABLE_AUTO_FORMAT_PROJECT_NAMES = {}

-- Function to check if the current file belongs to projects with autoformat disabled
local function is_autoformat_disabled()
  local current_directory = vim.fn.expand("%:p:h")
  for _, project_name in ipairs(DISABLE_AUTO_FORMAT_PROJECT_NAMES) do
    if vim.fn.stridx(current_directory, project_name) ~= -1 then
      return true
    end
  end
  return false
end

-- Enable or disable autoformat on save based on the project name
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local autoformat_disabled = is_autoformat_disabled()
    vim.b.autoformat = not autoformat_disabled
  end,
})
