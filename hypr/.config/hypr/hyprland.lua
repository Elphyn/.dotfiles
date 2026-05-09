hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/bin/emacs --daemon")
	hl.exec_cmd("qs -c noctalia-shell --no-duplicate")
	hl.exec_cmd("easyeffects --gapplication-service")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("steam")
end)

hl.config({
	input = {
		kb_layout = "us,cz",
		kb_options = "caps:backspace,grp:alt_shift_toggle,backspace:caps",
		force_no_accel = true,
		sensitivity = 0.0,
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
		},
	},
	general = {
		border_size = 2,
		gaps_in = 2,
		gaps_out = 6,
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 7,
		rounding_power = 2,

		shadow = {
			enabled = true,
			range = 2,
			render_power = 3,
			color = "#1A1A1AEE",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		focus_on_activate = true,
		anr_missed_pings = 3,
		on_focus_under_fullscreen = 1,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

require("binds")
require("rules")
require("animations")
