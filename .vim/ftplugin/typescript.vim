fun! SpecName()
  let l:fname = expand("%:p")[:-3]
  return l:fname . "js"
endf

fun! ProtractorConfig(spec_file)
  let l:config = 'exports.config = {
        \ seleniumAddress: "http://localhost:4444/wd/hub",
        \ framework: "jasmine",
        \ specs: ["'. a:spec_file.'"], }; '

  let l:tmp_config = system("mktemp")
  execute "new ".l:tmp_config
  setlocal bufhidden=hide
  setlocal noswapfile

  call append(0, l:config)
  write
  bdelete

  return l:tmp_config
endf

fun! typescript#RunTestFile()
  write
  silent make
  redraw!
  let l:spec_name = '/tmp/protractor_current_spec.js'
  let l:tmp_config = ProtractorConfig(l:spec_name)
  call  VimuxRunCommand("clear; protractor ". l:tmp_config )
  " call system("rm " . l:tmp_config)
endf

" command! Protractor :call typescript#RunTestFile()

map <Leader>S :call typescript#RunTestFile()<CR>
