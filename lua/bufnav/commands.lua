local config = require('bufnav.config')
local buffers = require('bufnav.buffers')
local debugger = require('bufnav.debug')

local Commands = {}

function Commands.next_buffer()
  local current_buffer = vim.api.nvim_win_get_buf(0)
  local cached = buffers.get()
  local next_buffer = nil

  for i, value in pairs(cached) do
    if value == current_buffer then
      next_buffer = cached[i + 1]

      if i == #cached then
        if config.options.cycle_buffers.enabled then
          if next_buffer == nil then next_buffer = cached[1] end

          debugger.print('next buffer', next_buffer)

          vim.api.nvim_win_set_buf(0, next_buffer)
          buffers.print_pos()
        else
          config.options.cycle_buffers.top_reached_cb()
        end
      else
        debugger.print('next buffer', next_buffer)

        vim.api.nvim_win_set_buf(0, next_buffer)
        buffers.print_pos()
      end

      break
    end
  end
end

function Commands.prev_buffer()
  local current_buffer = vim.api.nvim_win_get_buf(0)
  local cached = buffers.get()

  for i, value in pairs(cached) do
    if value == current_buffer then
      if i == 1 then
        if config.options.cycle_buffers.enabled then
          vim.api.nvim_win_set_buf(0, cached[#cached])
          buffers.print_pos()
        else
          config.options.cycle_buffers.bottom_reached_cb()
        end
      else
        vim.api.nvim_win_set_buf(0, cached[i - 1])
        buffers.print_pos()
      end

      break
    end
  end
end

return Commands
