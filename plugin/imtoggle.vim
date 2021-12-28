let s:exec = exists("*jobstart") ? function("jobstart") : function("system")

if !exists('g:imtoggle_commands')
  let g:imtoggle_commands = {
    \ 'activate': 'fcitx5-remote -o',
    \ 'deactivate': 'fcitx5-remote -c',
    \ }
endif

function! s:activate_fcitx5()
  call s:exec(g:imtoggle_commands.activate)
endfunction

function! s:deactivate_fcitx5()
  call s:exec(g:imtoggle_commands.deactivate)
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
    autocmd InsertEnter * call <SID>activate_fcitx5()
    autocmd InsertLeave * call <SID>deactivate_fcitx5()
  augroup end
endfunction

function! s:clear_autocmd()
  augroup im_toggle
    autocmd!
  augroup end
endfunction

command! IMEnable call <SID>enable_im()
command! IMDisable call <SID>disable_im()
