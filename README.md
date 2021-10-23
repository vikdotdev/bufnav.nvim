# bufnav.nvim

bufnav.nvim is a plugin to extend buffer navigation. Provides
ability to plug custom functions in between buffer switching.

## Installation
With packer:
```lua
use({'vikdotdev/bufnav.nvim'})
```

In your config:
```lua
require('bufnav.config').setup({
  cycle_buffers = {
    enabled = false,
    top_reached_cb = function()
      print('Top of the buffer stack reached!')
    end,
    bottom_reached_cb = function()
      print('Bottom of the buffer stack reached!')
    end
  }
})
```

## More docs
```
:h bufnav.nvim
```

## TODO
include hidden buffers as an option to cycle through
add exception buffers

