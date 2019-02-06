 command! RunSpringApp :w | VimuxRunCommand("clear; mvn spring-boot:run -Drun.profiles=development")
 command! ReRunSpringApp call ReRunSpringApp()

 fun! ReRunSpringApp()
   :w
   :VimuxInterruptRunner
   :RunSpringApp
 endf
 map <Leader>R :ReRunSpringApp <CR>
 map <Leader>r :RunSpringApp<CR>
 map <Leader>l :JavaSearchContext<CR>

let @z='^f(zfa('
let @f='^f{zfa{'
