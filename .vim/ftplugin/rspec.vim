 command! RSpecLine :w | VimuxRunCommand("clear; rspec ".bufname("%").":".line('.'))
 command! RSpec :w | VimuxRunCommand("clear; rspec ".bufname("%"))
 command! RSpecClose :VimuxCloseRunner

 map <Leader>S :RSpec<CR>
 map <Leader>s :RSpecLine<CR>
