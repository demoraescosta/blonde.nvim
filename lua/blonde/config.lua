local M = {}

local ok, _ = pcall(require, 'blonde.error')
if not ok then
  return vim.api.nvim_err_writeln(require('blonde.const.error').import)
end

---@type Config
local defaults = {
  colors = 'blonde',
  highlights = 'blonde',

  color_overrides = {},
  highlights_overrides = {},
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
  M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
  M.options = vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
