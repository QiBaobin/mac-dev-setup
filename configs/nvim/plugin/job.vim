if exists('g:loaded_asyncjob')
  finish
endif
let g:loaded_asyncjob = 1

let g:asyncjob_dir = '/tmp/vim-jobs'
let s:jobs = {}

function! s:start(cmd, bang) abort
  call mkdir(g:asyncjob_dir, "p", 0700)

  let file = g:asyncjob_dir . '/' . substitute(a:cmd,' .*','','') . strftime("@%T")
  let job = jobstart(a:cmd . " 2>&1 > '" . file . "'")

  if job <= 0
    finish
  endif

  let s:jobs[job] = file
  if a:bang ==# ''
    let l:b = bufadd(file)
    call bufload(l:b)
    execute('buffer ' . l:b)
  endif
endfunction
function! s:jobs(ArgLead, CmdLine, CursorPos)
  let list = {}
  for [next_key, next_val] in items(s:jobs)
    let item = next_key . ': ' . next_val
    if item =~ a:ArgLead
      let list[next_key] =  item 
    endif
  endfor
  return join(values(list))
endfunction
function! s:list(...)
  echomsg "Jobs:"
  for [next_key, next_val] in items(s:jobs)
    echomsg next_key . ': ' . next_val
  endfor
endfunction
function! s:job_id(str)
  return str2nr(substitute(a:str, ':.*', '', ''))
endfunction
function! s:stop(job)
  call jobstop(s:job_id(a:job))
endfunction
function! s:view(job)
  execute('edit ' . s:jobs[s:job_id(a:job)])
endfunction

command! -nargs=+ -bang -complete=shellcmd Job call s:start(<q-args>, <q-bang>)
command! -nargs=0 JobList call s:list()
command! -nargs=1 -complete=custom,s:jobs JobStop call s:stop(<q-args>)
command! -nargs=1 -complete=custom,s:jobs JobView call s:view(<q-args>)
