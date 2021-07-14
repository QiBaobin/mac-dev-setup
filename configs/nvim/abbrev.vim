cabbrev farg -m 1 -e '^' -g 
cabbrev GR G reset --hard origin/develop
cabbrev GF G fetch
cabbrev GP G -p push 
cabbrev Fi exec 'edit ' . fnameescape('term://nvr $(fd\|sk -m)')
cabbrev O filter // browse oldfiles<S-Left><S-Left><Left><Left>
