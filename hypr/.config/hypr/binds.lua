local IPC = "qs -c noctalia-shell ipc call "
local mainMod = "SUPER "
local terminal = "alacritty"
local editor = "emacsclient -c -a 'emacs'"
local fileManager = "nautilus"
local browser = "zen-browser"

-- Shell / IPC binds
hl.bind(mainMod .. "+ R", hl.dsp.exec_cmd(IPC .. "launcher toggle"))
hl.bind(mainMod .. "+ L", hl.dsp.exec_cmd(IPC .. "lockScreen lock"))
hl.bind(mainMod .. "+ S", hl.dsp.exec_cmd(IPC .. "settings toggle"))
hl.bind(mainMod .. "+ W", hl.dsp.exec_cmd(IPC .. "notifications toggleHistory"))
hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd(IPC .. "settings toggleTab wallpaper"))
hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.exec_cmd(IPC .. "launcher clipboard"))
hl.bind(mainMod .. "+ SHIFT + N", hl.dsp.exec_cmd(IPC .. "network togglePanel"))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.exec_cmd(IPC .. "sessionMenu toggle"))
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.exec_cmd(IPC .. "calendar toggle"))
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd(IPC .. "powerProfile cycle"))

-- App launchers
hl.bind(mainMod .. "+ N", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. "+ Y", hl.dsp.exec_cmd("emacsclient --eval '(thanos/type)'"))
hl.bind(mainMod .. "+ RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+ E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+ Z", hl.dsp.exec_cmd(browser))

-- Workspaces
for i = 1, 9 do
	hl.bind(mainMod .. "+ " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. "+ G", hl.dsp.focus({ workspace = 10 }))

for i = 1, 9 do
	hl.bind(mainMod .. "+ SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end
hl.bind(mainMod .. "+ SHIFT + G", hl.dsp.window.move({ workspace = 10, follow = true }))

-- Windows
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. "+ Q", hl.dsp.window.close())
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. "+ V", hl.dsp.window.float())
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. "+ mouse:273", hl.dsp.window.resize())
