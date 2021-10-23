local defaults = {
  cycle_buffers = {
    enabled = false,
    top_reached_cb = function()
      print('[BufNav] Top of the buffer stack reached!')
    end,
    bottom_reached_cb = function()
      print('[BufNav] Bottom of the buffer stack reached!')
    end
  },
  alternate_buffer = {
    scope = 'global'
  }
}

local Config = {}

function Config.setup(options)
  Config.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

Config.setup()

return Config
