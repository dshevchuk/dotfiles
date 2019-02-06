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

fun! javascript#RunProtractorTestFile()
  write
  let l:spec_name = expand("%:p")[:-1]
  let l:tmp_config = ProtractorConfig(l:spec_name)
  call  VimuxRunCommand("clear; protractor ". l:tmp_config )
  " call system("rm " . l:tmp_config)
endf


" Mocha Nearest Test
function! s:GetNearestTest()
  let callLine = line (".")           "cursor line
  let file = readfile(expand("%:p"))  "read current file
  let lineCount = 0                   "file line counter
  let lineDiff = 999                  "arbituary large number
  let descPattern = '\v<(it|describe|context)\s*\(?\s*[''"](.*)[''"]\s*,'
  for line in file
    let lineCount += 1
    let match = match(line,descPattern)
    if(match != -1)
      let currentDiff = callLine - lineCount
      " break if closest test is the next test
      if(currentDiff < 0 && lineDiff != 999)
        break
      endif
      " if closer test is found, cache new nearest test
      if(currentDiff <= lineDiff)
        let lineDiff = currentDiff
        let s:nearestTestLine = line(".") - currentDiff
        let str = escape(matchlist(line,descPattern)[2], '\/')
        let s:nearestTest = substitute(str, '\v([''"()])','(.{1})','g')
      endif
    endif
  endfor
endfunction


" Nearest Spec
function! javascript#RunNearestSpec()
  call s:GetNearestTest()
  " let l:spec = @% . " -g '--" . s:nearestTest . "--'"
  let l:spec = " -g '===>>>" . s:nearestTest . "'"
  let spec_line = s:nearestTestLine

  execute spec_line ." s/" . s:nearestTest . "/===>>>" . s:nearestTest
  write

  call  VimuxRunCommand("clear; DEBUG_MODE=true npm test -- ". l:spec)

  execute spec_line ." s/===>>>" . s:nearestTest . "/" . s:nearestTest . "/"
  " write

endfunction

command! Protractor :call javascript#RunProtractorTestFile()
command! SpecLine :w | call javascript#RunNearestSpec()
command! JSLint call VimuxRunCommand("clear; npm run jscs && npm run jshint")

map <Leader>s :SpecLine<CR>
map <Leader>a :JSLint<CR>

let @z='^f(zfa('
let @f='^f{zfa{'
