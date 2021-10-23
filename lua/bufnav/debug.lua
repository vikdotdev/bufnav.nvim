local Debug = {}

function Debug.toggle()
  if vim.g.bufnav_debug == true then
    print('BufNav debug disabled.')
    vim.g.bufnav_debug = false
  else
    print('BufNav debug enabled.')
    vim.g.bufnav_debug = true
  end
end

function Debug.print(description, value)
  if vim.g.bufnav_debug == true then
    local info = debug.getinfo(2)

    print(
      info.short_src .. ':' ..
      info.linedefined .. ' in ' ..
      info.name .. ' - ' ..
      description .. ' -> ' .. vim.inspect(value)
    )
  end
end

return Debug
