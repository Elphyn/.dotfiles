local steamWorkspace = 5
local gamingWorkspace = 10

hl.window_rule({
	name = "steam-fixer",
	match = {
		class = "steam",
	},
	workspace = steamWorkspace,
	no_initial_focus = true,
})

hl.window_rule({
	name = "steam-launcher-fixer",
	match = {
		title = "Sign in to Steam",
	},
	workspace = steamWorkspace,
	no_initial_focus = true,
	no_focus = true,
	no_follow_mouse = true,
})

hl.window_rule({
	name = "Steam games on a special workspace",
	match = {
		title = "Deadlock",
	},
	workspace = gamingWorkspace,
})

hl.window_rule({
	name = "Making floating windows smaller",
	match = {
		float = true,
	},
	center = true,
})
