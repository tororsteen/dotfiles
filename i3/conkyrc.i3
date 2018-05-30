# .conkyrc

update_interval 1.0

double_buffer yes

own_window yes
own_window_type override 
own_window_argb_visual yes
#Lager delvis gjennomsiktig vindu 0 = gjennomsiktig 255 fast bakgrunn
own_window_argb_value 25
#own_window_transparent yes
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager 


use_xft yes
xftfont Bitstream Vera Sans:size=10

maximum_width 270
default_color white
alignment bottom_right
pop3 pop.online.no ellenors smax234 [-i 60]


uppercase no

TEXT
${font Vera Sans:size=20}$alignc$nodename
${font Vera Sans:size=14}$alignc${time %A %x} 
$alignc Lokal tid: ${time %H:%M}$font
$alignc Ukenr.: ${time %V}   ${time %j}. dag i ${time %G}
#Pålogget: $uptime 

E-post: ${if_match ${pop3_unseen}>0}${color red}${pop3_unseen} nye meldinger på server.${endif} ${if_match ${pop3_unseen}<1}$color${pop3_unseen} nye meldinger på server.${endif}$color 
#${mails /home/tor/.thunderbird/owooa187.default/Mail/pop.online.no/Inbox} meldinger i innboksen.
#${execi 300 grep -c “X-Mozilla-Status: 0x 0000" "/home/tor/.thunderbird/owooa187.default/Mail/pop.online.no/Inbox"} uleste

Kjerne: $kernel 
CPU: ${freq_g} Ghz  Temp: ${exec sensors | grep -n 'Core 0' | grep -E -o  '[0-9]+.[0-9]+' | grep -E -o -m 1 '[0-9]+.[0-9]+' }°C 
Bruk: CPU1: ${cpu cpu1}%   CPU2: ${cpu cpu2}%
#$color${cpugraph}
#Vifte: $acpifan

#Batteri: ${battery}
#$battery_bar
Bruk av RAM: $mem av $memmax - $memperc% #Så kommer ei rekke nesta if-setninger som skifter farge på ram-bar alt etter som belastning. Grønn/gul/rød

${if_match ${memperc}<=50}${color #00ff00}${membar}${endif}${if_match ${memperc}>50}${if_match ${memperc}<=80}${color #ffff00}${membar}${endif}${endif}${if_match ${memperc}>80}${color red}${membar}${endif}$color

Root: Brukt ${fs_used /} av ${fs_size /} 
${fs_free /} ledig
${fs_bar 6 /}

Home: Brukt ${fs_used /home} av ${fs_size /home}
${fs_free /home} ledig
${fs_bar 6 /home}

${color #00ff00}Trådløst nett$color ${hr 1}
${color}Signalstyrke: ${wireless_link_qual wlo1}%  
IP-adr.: ${addr wlo1} 
#${color} ${execi 3600 nm-tool | sed -n '/  Address:/p' | sed -e 's/        //'} Brukt som workaround 
Ekstern IP: ${execi 3600 wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'}
Nedlastingshastighet: ${downspeedf wlp6s0} Kb/sec

#${downspeedgraph wlp6s0}
${color red}Downloaded: $color${totaldown wlp6s0} $alignr ${color green}Uploaded: $color${totalup wlp6s0}

#${color #ffcb48}Ethernet ${hr 1}
#${color lightgrey}IP address: $alignr$color${addr enp7s0}
