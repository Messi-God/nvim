
local M = { }
-- Toggle window fullscreen
M.WindowZoom = function()
  vim.cmd [[
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
      let cur_winview = winsaveview()
      let cur_bufname = bufname('')
      tabclose

      " restore the view
      if cur_bufname == bufname('')
          call winrestview(cur_winview)
      endif
    else
      tab split
    endif
  ]]
end

return M
