let s:exec = exists("*jobstart") ? function("jobstart") : function("system")

function! s:activate_fcitx()
  call s:exec("fcitx-remote -o")
endfunction

function! s:deactivate_fcitx()
  call s:exec("fcitx-remote -c")
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
    autocmd InsertEnter * call <SID>activate_fcitx()
    autocmd InsertLeave * call <SID>deactivate_fcitx()
  augroup end
endfunction

function! s:clear_autocmd()
  augroup im_toggle
    autocmd!
  augroup end
endfunction

command! IMEnable call <SID>enable_im()
command! IMDisable call <SID>disable_im()
