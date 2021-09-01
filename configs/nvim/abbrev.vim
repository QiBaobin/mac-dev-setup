cabbrev farg -m 1 -e '^' -g 
cabbrev GR G reset --hard origin/develop
cabbrev GF G fetch
cabbrev GP G -p push 
cabbrev Fi exec 'edit ' . fnameescape('term://nvr $(fd\|sk --regex -m)')
cabbrev O filter // browse oldfiles<S-Left><S-Left><Left><Left>
cabbrev J Job 
cabbrev JS JobStop
cabbrev JV JobView
cabbrev JL JobList
cabbrev z execute 'cd ' . system('zoxide query ')<Left><Left>
cabbrev Ins Dispatch cd ~/work/flagship-android/ && ./gradlew :app:instalGNPD
cabbrev sB Dispatch cd ~/work/pr100660-ap011663_android_pi_mobile_sdks/ && abt build 
