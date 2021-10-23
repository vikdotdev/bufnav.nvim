function! ReloadBufNav()
lua << EOF
  for k in pairs(package.loaded) do
    if k:match("^bufnav") then
      package.loaded[k] = nil
    end
  end
EOF
endfunction
