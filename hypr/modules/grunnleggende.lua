-------------------
---- AUTOSTART ----
-------------------

 hl.on("hyprland.start", function () 
     hl.dsp.exec_cmd("hyprpm reload -n") 
-- The -n flag provides desktop notifications for successful loads
	 hl.exec_cmd("hyprpm enable hyprbars")
     hl.exec_cmd("xfce4-notifyd")
     hl.exec_cmd("nm-applet")
     hl.exec_cmd("/usr/bin/udiskie --tray")
	 --hl.exec_cmd [[conky --config=/home/tor/.config/hypr/conky.lua]]    
     hl.exec_cmd [[eww --force-wayland open sysmonitor]]    
	 hl.exec_cmd [[wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"]]
     hl. exec_cmd("waybar & hyprpaper") 
 end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Standard GTK and Wayland variables for Thunar
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- GTK Theme & Toolkit configurations (Ensures dark mode and icons load)
hl.env("GDK_BACKEND", "wayland,x11")
-- hl.env("GTK_THEME", "Adwaita-dark") -- Replace with your preferred GTK theme name

-- D-Bus fix (Prevents Thunar from taking 30 seconds to launch)
hl.env("DBUS_SESSION_BUS_ADDRESS", os.getenv("DBUS_SESSION_BUS_ADDRESS"))


