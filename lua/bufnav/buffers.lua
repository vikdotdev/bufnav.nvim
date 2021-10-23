local debugger = require('bufnav.debug')

local Buffers = {}

function Buffers.get()
  local buffers = {}

  for _, value in pairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(value) and
       vim.api.nvim_buf_get_option(value, 'bufhidden') == '' then
      table.insert(buffers, value)
    end
  end

  debugger.print('loaded and non-hidden buffers', buffers)

  return buffers
end

function Buffers.print_pos()
  local current_buffer = vim.api.nvim_win_get_buf(0)
  local buffers = Buffers.get()

  for i, value in pairs(buffers) do
    if value == current_buffer then
      print('On position ' .. i .. ' of ' .. #buffers)
      break
    end
  end
end

return Buffers

