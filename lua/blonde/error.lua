local M = {}

local types_ok, _ = pcall(require, 'blonde.types.error')
if not types_ok then
  return vim.api.nvim_err_writeln(require('blonde.const.error').err_types)
end

---Throws the given error, closing the current execution of blonde.nvim
---@param error blondeError|table|string The error to throw
function M.throw(error)
  if type(error) == 'table' then
    for _, value in ipairs(error) do
      M.throw(value)
    end
  end
  vim.api.nvim_err_writeln('There was an error during execution of blonde.nvim:')
  if type(error) ~= 'string' then
    return M.throw(M.unhandled('blonde.error.throw'))
  end
  vim.api.nvim_err_writeln(error)
end

---@param location string Where the error happens
---@return blondeError Error
function M.unhandled(location)
  return {
    message = 'Unhandled error at `' .. location .. '`',
  }
end

return M
