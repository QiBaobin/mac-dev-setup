cabbrev FA grep -m 1 -e '^' -g 
cabbrev GR G reset --hard origin/develop<Left><Left><Left><Left><Left><Left><Left>
cabbrev GF G fetch
cabbrev GP G -p push 
cabbrev O filter // browse oldfiles<S-Left><S-Left><Left><Left>
cabbrev z execute 'cd ' . system('zoxide query ')<Left><Left>

cabbrev CF call setqflist(filter(getqflist(), {idx, val -> val.text =~ ''})) \| copen<S-Left><S-Left><S-Left><Right>
cabbrev LF call setloclist(filter(getloclist(), {idx, val -> val.text =~ ''})) \| lopen<S-Left><S-Left><S-Left><Right>

