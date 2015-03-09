function! s:activate_im()
  !fcitx-remote -o
endfunction

function! s:deactivate_im()
  !fcitx-remote -c
endfunction

function! s:enable_im()
  call s:clear_autocmd()
  call s:register_autocmd()
endfunction

function! s:disable_im()
  call s:clear_autocmd()
endfunction

function! s:register_autocmd()
  augroup im_toggle
    autocmd InsertEnter * call <SID>activate_im()
    autocmd InsertLeave * call <SID>deactivate_im()
  augroup end
endfunction

function! s:clear_autocmd()
  augroup im_toggle
    autocmd!
  augroup end
endfunction

command! IMEnable call <SID>enable_im()
command! IMDisable call <SID>disable_im()
