{ config, pkgs, ... }:
let 
  secrets = import ./secrets.nix;
  colours = {
  	fg = "#ffffff";
  	bg = "#000000";
  	lightbg = "#bdbdbd";
  	darkbg = "#2b2b2b";
  	red = "#ff0037"; # All with HSL (LIGHTNESS 50, SAT 100)
  	blue = "#0073ff";
  	green = "#00ff37";
  	yellow = "#ffe100";
  	purple = "#a600ff";
  	pink = "#ff00d0";
  	orange = "#ff8400";
  	lightblue = "#00eaff";
  	white = "#ffffff";
  	black = "#000000";
  	unknownElement = "#00ff00";
  };
  i3 = {
  	mod = "Mod4";
  	refreshi3Status = "killall -SIGUSR1 i3status";
  	ws1 = "1";
  	ws2 = "2";
  	ws3 = "3";
  	ws4 = "4";
  	ws5 = "5";
  	ws6 = "6";
  	ws7 = "7";
  	ws8 = "8";
  	ws9 = "9";
  	ws10 = "10";
  };
in
{
  users.users.loved = {
    isNormalUser = true;
    home = "/home/loved";
    description = "Love Dittlau";
    shell = pkgs.zsh;
    extraGroups =
      [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
    hashedPassword =
      "$6$QuW9itZihkuLUj$x2AEi79V56v1Aj/rievYFeqcJwumHDE4yw8sROyOKaAGvRWGhPERyI.34UG8EFOi7gRAXYc1lRHMKXJ5m/PFk.";
  };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.loved = { pkgs, ... }: {
    home.packages = [
      pkgs.cmatrix
      pkgs.firefox
      pkgs.authy
      pkgs.discord
      pkgs.lutris
      pkgs.nixfmt
    ];

    home.keyboard.layout = "sv";

	xsession.enable = true;
    xsession.windowManager.i3 = {
    	enable = true;
    	package = pkgs.i3-gaps;
    	config = {
    		bars = [];
    		modifier = "Mod4";
    		fonts = {
    			names = [ "JetBrainsMono Nerd Font" ];
    			style = "Regular";
    			size = 12.0;
    		};
    		gaps.inner = 20;
    		startup = [
    			{ command = "nitrogen --restore"; notification = false; always = true; }
    		];
    		floating.border = 0;
    		window.border = 0;
    		window.titlebar = false;
    		defaultWorkspace = "workspace number ${i3.ws1}";
    		keybindings = {
    			# Audio Control
    			"XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && ${i3.refreshi3Status}";
    			"XF86AudioLowerVolume" =  "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && ${i3.refreshi3Status}";
				"XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${i3.refreshi3Status}";
    			"XF86AudioMicMute" =  "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${i3.refreshi3Status}";

    			"${i3.mod}+Return" = "exec kitty"; # terminal
    			
    			"${i3.mod}+Shift+q" = "kill"; # kill focused window
    			
    			"${i3.mod}+d" = "exec \"rofi -modi drun,run -show drun\""; # rofi

    			# change focus
    			"${i3.mod}+Left" = "focus left";
    			"${i3.mod}+Down" = "focus down";
    			"${i3.mod}+Up" = "focus up";
    			"${i3.mod}+Right" = "focus right";

    			# move focused window
    			"${i3.mod}+Shift+Left" = "move left";
    			"${i3.mod}+Shift+Down" = "move down";
    			"${i3.mod}+Shift+Up" = "move up";
    			"${i3.mod}+Shift.Right" = "move right";

    			"${i3.mod}+h" = "split h"; # split horizontal
    			"${i3.mod}+v" = "split v"; # split vertical

    			"${i3.mod}+f" = "fullscreen toggle"; # toggle fullscreen

    			# change container layout (stacked, tabbed, toggle split)
    			"${i3.mod}+s" = "layout stacking";
    			"${i3.mod}.w" = "layout tabbed";
    			"${i3.mod}+e" = "layout toggle split";

    			"${i3.mod}+space" = "focus mode_toggle"; # switch between tiling / floating

    			# switch to workspace
    			"${i3.mod}+1" = "workspace number ${i3.ws1}";
    			"${i3.mod}+2" = "workspace number ${i3.ws2}";
    			"${i3.mod}+3" = "workspace number ${i3.ws3}";
    			"${i3.mod}+4" = "workspace number ${i3.ws4}";
    			"${i3.mod}+5" = "workspace number ${i3.ws5}";
    			"${i3.mod}+6" = "workspace number ${i3.ws6}";
    			"${i3.mod}+7" = "workspace number ${i3.ws7}";
    			"${i3.mod}+8" = "workspace number ${i3.ws8}";
    			"${i3.mod}+9" = "workspace number ${i3.ws9}";
    			"${i3.mod}+0" = "workspace number ${i3.ws10}";

    			# move to workspace
    			"${i3.mod}+Shift+1" = "move container to workspace number ${i3.ws1}";
    			"${i3.mod}+Shift+2" = "move container to workspace number ${i3.ws2}";
    			"${i3.mod}+Shift+3" = "move container to workspace number ${i3.ws3}";
    			"${i3.mod}+Shift+4" = "move container to workspace number ${i3.ws4}";
    			"${i3.mod}+Shift+5" = "move container to workspace number ${i3.ws5}";
    			"${i3.mod}+Shift+6" = "move container to workspace number ${i3.ws6}";
    			"${i3.mod}+Shift+7" = "move container to workspace number ${i3.ws7}";
    			"${i3.mod}+Shift+8" = "move container to workspace number ${i3.ws8}";
    			"${i3.mod}+Shift+9" = "move container to workspace number ${i3.ws9}";
    			"${i3.mod}+Shift+0" = "move container to workspace number ${i3.ws10}";

				# Exit i3 (dangerous)
    			"${i3.mod}+Shift+e" = "exec i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";

    			"Print" = "exec flameshot gui"; # flameshot

    			# backlight
    			"XF86MonBrightnessUp" = "exec light -A 5";
    			"XF86MonBrightnessDown" = "exec light -U 5";
    		};
    	};
    	extraConfig = ''
			# resize window (you can also use the mouse for that)
			mode "resize" {
			        # These bindings trigger as soon as you enter the resize mode
			
			        # Pressing left will shrink the window’s width.
			        # Pressing right will grow the window’s width.
			        # Pressing up will shrink the window’s height.
			        # Pressing down will grow the window’s height.
			        bindsym j resize shrink width 10 px or 10 ppt
			        bindsym k resize grow height 10 px or 10 ppt
			        bindsym l resize shrink height 10 px or 10 ppt
			        bindsym semicolon resize grow width 10 px or 10 ppt
			
			        # same bindings, but for the arrow keys
			        bindsym Left resize shrink width 10 px or 10 ppt
			        bindsym Down resize grow height 10 px or 10 ppt
			        bindsym Up resize shrink height 10 px or 10 ppt
			        bindsym Right resize grow width 10 px or 10 ppt
			
			        # back to normal: Enter or Escape or $mod+r
			        bindsym Return mode "default"
			        bindsym Escape mode "default"
			        bindsym $mod+r mode "default"
			}
			
			bindsym ${i3.mod}+r mode "resize"

			# power menu
			set $Locker i3lock && sleep 1
			
			set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown
			mode "$mode_system" {
				bindsym l exec --no-startup-id $Locker, mode "default"
				bindsym e exec --no-startup-id i3-msg exit, mode "default"
				bindsym s exec --no-startup-id $Locker && systemctl suspend, mode "default"
				bindsym h exec --no-startup-id $Locker && systemctl hibernate, mode "default"
				bindsym r exec --no-startup-id systemctl reboot, mode "default"
				bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"
			
				# back to normal: Enter or Escape
				bindsym Return mode "default"
				bindsym Escape mode "default"
			}
			
			bindsym ${i3.mod}+Pause mode "$mode_system"
    	'';
    };
    
    programs.home-manager.enable = true;
    programs.rofi.enable = true;
    programs.git = {
    	enable = true;
    	package = pkgs.gitAndTools.gitFull;
    	userEmail = secrets.email;
    	userName = "Aresiel";
    };

    services.polybar = {
    	enable = true;
    	package = pkgs.polybarFull;
    	script = "polybar bottombar &\npolybar topbar &";
    	settings = {
    		"bar/bottombar" = {
    			font."0" = "JetBrainsMono Nerd Font:style=Regular:size=13;4";
    			font."1" = "JetBrainsMono Nerd Font Mono:style=Regular:size=13;4";
    			module.margin = 1;
    			modules.left = "i3";
    			modules.right = "wireless volume battery date";
    			bottom = true;
    		};
    		
    		"bar/topbar" = {
    			font."0" = "JetBrainsMono Nerd Font:style=Regular:size=13;4";
    			font."1" = "JetBrainsMono Nerd Font Mono:style=Regular:size=13;4";
    			module.margin = 1;
    			tray.position = "right";
    			modules.center = "time";
    			bottom = false;
    		};

    		"module/nixos" = {
    			type = "custom/text";
    			content = " ";
    		};

    		"module/time" = {
    			type = "internal/date";
    			date = "%H:%M:%S";
    		};

    		"module/date" = {
    			type = "internal/date";
    			date = "%A %d/%m";
    		};

    		"module/wireless" = {
    			type = "internal/network";
    			interface = "wlp0s20f3";

    			format.connected = "<label-connected>";
    			format.disconnected = "<label-disconnected>";
    			format.packetloss = "Packetloss! <label-connected>";

    			label.connected = "%upspeed% %downspeed% %local_ip% @ %essid%";
    			label.disconnected = "Disconnected";
    		};

    		"module/volume" = {
    			type = "internal/pulseaudio";
    			use.ui.max = false;
    			interval = 5;

    			format.volume = "<ramp-volume> <label-volume>";

    			label.volume = "%percentage%";
    			label.muted = "ﱝ %percentage%";

    			ramp.volume = [
    				"奄"
    				"奔"
    				"墳"
    				""
    			];
    		};

    		"module/battery" = {
    			type = "internal/battery";
    			battery = "BAT1";
    			adapter = "ACAD";
    			poll.interval = 5;
    			full.at = 99;

    			format.charging = "<ramp-capacity> <label-charging>";
    			format.discharging = "<ramp-capacity> <label-discharging>";
    			format.full = "<ramp-capacity> <label-full>";

    			label.charging = "%percentage%%";
    			label.discharging = "%percentage%%";
    			label.full = "%percentage%%";

    			ramp.capacity = [
    				"" "" "" "" "" "" "" "" "" "" ""
    			];
    		};

    		"module/i3" = {
    			type = "internal/i3";
    			pin.workspaces = true;
    			strip.wsnumbers = true;
    			index.sort = true;

    			label.dimmed.underline = colours.unknownElement; # idk what this is
    			format = "<label-state> <label-mode>";

    			"label-mode" = "%mode%";
    			label.mode.padding = 0;
    			label.mode.background = colours.bg;

    			"label-focused" = "%index%";
    			label.focused.foreground = colours.fg;
    			label.focused.background = colours.darkbg;
    			label.focused.underline = colours.unknownElement; # idk what this is
    			label.focused.padding = 1;

    			"label-unfocused" = "%index%";
    			label.unfocused.padding = 1;

    			"label-visible" = "%index%";
    			label.visible.underline = colours.unknownElement; # idk what this is
    			label.visible.padding = 1;

    			"label-urgent" = "%index%";
    			label.urgent.foreground = colours.fg;
    			label.urgent.background = colours.red;
    			label.urgent.padding = 1;
    		};
    	};
    };

    services.flameshot.enable = true;
  };
}
