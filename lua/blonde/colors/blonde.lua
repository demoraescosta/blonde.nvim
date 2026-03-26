local M = {}

local base = {
  black = '#000000',
  white = '#cdc5b5',
  red = '#bd5800',
  green = '#79d16d',
  yellow = '#d1a26d',
  blue = '#5252d1',
  magenta = '#d16dce',
  light_gray = '#8f897e',
  gray = '#666666',
  dark_gray = '#3a3a3a',
  darker_gray = '#333333',
}

M.colors = base

function M.extend(overrides)
  for k, v in pairs(overrides) do
    overrides[k:lower()] = v
  end
  M.colors = vim.tbl_deep_extend('force', {}, base, overrides or {})
end

return M
