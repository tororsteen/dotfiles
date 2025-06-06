# Tint2 sample config file
# For information on manually configuring tint2 see http://code.google.com/p/tint2/wiki/Configure

# Background definitions
# Background 1: panel
rounded = 7
border_width = 1
background_color = #969696 75
#background_color = #3F3F3F 60
#border_color = #FFFFFF 16
border_color = #000000 16

# Background 2: normal/iconified tasks
rounded = 5
border_width = 0
background_color = #777777 20
border_color = #777777 30

# Background 3: active tasks
rounded = 5
border_width = 1
background_color = #777777 20
border_color = #ffffff 40

# Background 4: urgent tasks
rounded = 5
border_width = 1
background_color = #aa4400 100
border_color = #aa7733 100

# Background 5: tooltips
rounded = 2
border_width = 1
background_color = #ffffaa 100
border_color = #999999 100

# Panel
panel_items = LTSC
panel_monitor = all
panel_position = top center horizontal
panel_size = 100% 40
panel_margin = 0 0
panel_padding = 7 0 7
panel_dock = 0
wm_menu = 1
panel_layer = top
panel_background_id = 1
font_shadow = 0

# Panel Autohide
autohide = 0
autohide_show_timeout = 0
autohide_hide_timeout = 0.5
autohide_height = 2
strut_policy = follow_size

# Launcher
launcher_padding = 2 4 2
launcher_background_id = 0
launcher_icon_size = 18
launcher_icon_asb = 100 0 0
launcher_tooltip = 1
startup_notifications = 1
#launcher_item_app = /usr/share/applications/tint2conf.desktop
#launcher_item_app = /usr/local/share/applications/tint2conf.desktop
#launcher_item_app = /usr/share/applications/firefox.desktop
#launcher_item_app = /usr/share/applications/iceweasel.desktop
#launcher_item_app = /usr/share/applications/chromium-browser.desktop
#launcher_item_app = /usr/share/applications/google-chrome.desktop
launcher_item_app = /home/tor/Scripts/vivaldi.desktop
launcher_item_app= /home/tor/Dokumenter/Data/Konfigurasjoner/xfce4-appfinder.desktop
# Taskbar
taskbar_mode = multi_desktop
taskbar_padding = 2 3 2
taskbar_background_id = 0
taskbar_active_background_id = 0
#taskbar_name = 1

# Tasks
task_icon = 1
task_text = 1
task_centered = 1
task_maximum_size = 140 35
task_padding = 6 2
task_background_id = 2
task_active_background_id = 3
task_urgent_background_id = 4
task_iconified_background_id = 2
task_tooltip = 1
urgent_nb_of_blink = 100000

# Task Icons
task_icon_asb = 100 0 0
task_active_icon_asb = 100 0 0
task_urgent_icon_asb = 100 0 0
task_iconified_icon_asb = 100 0 0

# Fonts
task_font = sans 8
task_font_color = #FFFFFF 90
task_active_font_color = #FFFFFF 90
task_urgent_font_color = #FFFFFF 90
task_iconified_font_color = #FFFFFF 90

# Mouse
mouse_left = toggle_iconify
mouse_middle = none
mouse_right = close
mouse_scroll_up = toggle
mouse_scroll_down = iconify

# System Tray
systray_padding = 0 4 5
systray_sort = ascending
systray_background_id = 0
systray_icon_size = 22
systray_icon_asb = 70 0 0

# Clock
time1_format = %H:%M
time1_font = sans 8
time2_format = %A %d %B
time2_font = sans 7
clock_font_color = #FFFFFF 100
clock_padding = 1 0
clock_background_id = 0
clock_rclick_command = orage

# Tooltips
tooltip_padding = 2 2
tooltip_show_timeout = 0.5
tooltip_hide_timeout = 0.1
tooltip_background_id = 5
tooltip_font = sans 9
tooltip_font_color = #222222 100

# Battery
battery_low_status = 10
battery_low_cmd = notify-send "battery low"
battery_hide = 101
bat1_font = sans 8
bat2_font = sans 6
battery_font_color = #FFFFFF 100
battery_padding = 1 0
battery_background_id = 0

# End of config
