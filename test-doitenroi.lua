-- NEJI UI 3.1 | REAL Place2.rbxl CAR | Based on the user-provided NEJI HUB source.
-- One native LocalScript. The example and public API are at the bottom.
--!nonstrict
-- NEJI UI CORE | Native, single-LocalScript UI framework
-- Place this LocalScript in StarterPlayer > StarterPlayerScripts.
-- The runnable demonstration is at the bottom. No uploaded model assets, HTTP requests, or modules required.
-- AI LAM NHE
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService") -- GUIDs and local JSON serialization only; no network calls.
local player = Players.LocalPlayer
assert(player, "Neji UI must run from a LocalScript")

local Library, Window, Tab, Component, Island = {}, {}, {}, {}, {}
Library.__index, Window.__index, Tab.__index = Library, Window, Tab
Component.__index, Island.__index = Component, Island
local Scope = {}
Scope.__index = Scope
function Scope.new()
	return setmetatable({Alive = true, Connections = {}, Tasks = {}}, Scope)
end
function Scope:Connect(signal, fn)
	if not self.Alive then return end
	local c = signal:Connect(function(...) if self.Alive then fn(...) end end)
	table.insert(self.Connections, c)
	return c
end
function Scope:Delay(seconds, fn)
	if not self.Alive then return end
	local thread
	thread = task.delay(math.max(0, seconds), function()
		if self.Alive then
			local ok,err = xpcall(fn,debug.traceback)
			if not ok then warn("[Neji task] " .. tostring(err)) end
		end
		self.Tasks[thread] = nil
	end)
	self.Tasks[thread] = true
	return thread
end
function Scope:Clean()
	if not self.Alive then return end
	self.Alive = false
	for _, c in ipairs(self.Connections) do c:Disconnect() end
	for thread in pairs(self.Tasks) do if thread ~= coroutine.running() then pcall(task.cancel, thread) end end
	table.clear(self.Tasks)
	table.clear(self.Connections)
end
local function create(class, props, parent)
	local item = Instance.new(class)
	for key, value in pairs(props or {}) do item[key] = value end
	item.Parent = parent
	return item
end
local function corner(parent, radius)
	return create("UICorner", {CornerRadius = UDim.new(0, radius or 10)}, parent)
end
local function padding(parent, amount)
	return create("UIPadding", {PaddingTop = UDim.new(0, amount), PaddingBottom = UDim.new(0, amount), PaddingLeft = UDim.new(0, amount), PaddingRight = UDim.new(0, amount)}, parent)
end
local function text(parent, value, size, props)
	local p = {BackgroundTransparency = 1, Text = value or "", Font = Enum.Font.Gotham, TextSize = size or 14, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0}
	for k, v in pairs(props or {}) do p[k] = v end
	return create("TextLabel", p, parent)
end
local function button(parent, value, props)
	local p = {Text = value or "", Font = Enum.Font.GothamMedium, TextSize = 13, AutoButtonColor = false, BorderSizePixel = 0, TextColor3 = Color3.new(1, 1, 1)}
	for k, v in pairs(props or {}) do p[k] = v end
	return create("TextButton", p, parent)
end
local activeTweens = setmetatable({}, {__mode = "k"})
local function animate(instance, props, duration, style)
	if not instance.Parent then return end
	-- Only overlapping properties cancel: resizing no longer interrupts window fades.
	local record = activeTweens[instance]
	if not record then
		record = {Properties = {}}
		function record:Cancel()
			local unique = {}; for _,t in pairs(self.Properties) do unique[t] = true end
			table.clear(self.Properties)
			for t in pairs(unique) do t:Cancel() end
		end
		activeTweens[instance] = record
	end
	local conflicts = {}
	for property in pairs(props) do local old = record.Properties[property]; if old then conflicts[old] = true end end
	for old in pairs(conflicts) do
		for property,t in pairs(record.Properties) do if t == old then record.Properties[property] = nil end end
		old:Cancel()
	end
	local tween = TweenService:Create(instance,TweenInfo.new(duration or 0.2,style or Enum.EasingStyle.Quart,Enum.EasingDirection.Out),props)
	for property in pairs(props) do record.Properties[property] = tween end
	local completed
	completed = tween.Completed:Connect(function()
		completed:Disconnect()
		for property,t in pairs(record.Properties) do if t == tween then record.Properties[property] = nil end end
	end)
	tween:Play()
	return tween
end
local function finite(value, fallback)
	local n = tonumber(value)
	return (n and n == n and math.abs(n) < math.huge) and n or fallback
end
local function invoke(callback, ...)
	if type(callback) ~= "function" then return end
	local args = table.pack(...)
	task.spawn(function()
		local ok, err = xpcall(function() callback(table.unpack(args, 1, args.n)) end, debug.traceback)
		if not ok then warn("[Neji callback] " .. tostring(err)) end
	end)
end
local function copy(value)
	return type(value) == "table" and table.clone(value) or value
end
local Icons = {home = "⌂", settings = "≡", search = "⌕", bell = "●", success = "✓", warning = "!", error = "×", information = "i", close = "×", star = "✦", code = "</>", palette = "◈"}
local function icon(value) return Icons[string.lower(tostring(value or "star"))] or tostring(value) end
local Themes = {
	Dark = {Background = Color3.fromRGB(17, 20, 29), Surface = Color3.fromRGB(25, 30, 42), Secondary = Color3.fromRGB(34, 41, 55), Accent = Color3.fromRGB(114, 137, 255), Text = Color3.fromRGB(238, 242, 255), Muted = Color3.fromRGB(151, 163, 188), Border = Color3.fromRGB(57, 66, 88), Transparency = 0.06},
	Light = {Background = Color3.fromRGB(239, 243, 250), Surface = Color3.fromRGB(255, 255, 255), Secondary = Color3.fromRGB(224, 231, 243), Accent = Color3.fromRGB(77, 91, 220), Text = Color3.fromRGB(26, 34, 55), Muted = Color3.fromRGB(91, 104, 131), Border = Color3.fromRGB(201, 211, 229), Transparency = 0.03},
	Midnight = {Background = Color3.fromRGB(8, 12, 24), Surface = Color3.fromRGB(15, 22, 39), Secondary = Color3.fromRGB(25, 36, 59), Accent = Color3.fromRGB(102, 165, 255)},
	Purple = {Background = Color3.fromRGB(22, 15, 34), Surface = Color3.fromRGB(33, 23, 48), Secondary = Color3.fromRGB(49, 34, 69), Accent = Color3.fromRGB(192, 137, 255)},
	Ocean = {Background = Color3.fromRGB(9, 24, 32), Surface = Color3.fromRGB(15, 36, 47), Secondary = Color3.fromRGB(23, 53, 67), Accent = Color3.fromRGB(63, 211, 217)},
}
local function resolveTheme(value)
	local result = table.clone(Themes.Dark)
	local selected = type(value) == "table" and value or Themes[value or "Dark"]
	assert(selected, "Unknown theme: " .. tostring(value))
	for key, v in pairs(selected) do
		if key == "Transparency" then result[key] = math.clamp(finite(v, 0.06), 0, 1)
		elseif result[key] ~= nil and typeof(v) == "Color3" then result[key] = v end
	end
	return result
end
function Library:_Bind(instance, property, token)
	local bindings = self.Bindings[instance]
	if not bindings then bindings = {}; self.Bindings[instance] = bindings end
	bindings[property] = token
	instance[property] = self.Theme[token]
end
function Library:_Surface(instance, token, transparent)
	self:_Bind(instance, "BackgroundColor3", token or "Surface")
	if transparent then self:_Bind(instance, "BackgroundTransparency", "Transparency") end
	corner(instance, 10)
	local stroke = create("UIStroke", {Thickness = 1, Transparency = 0.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, instance)
	self:_Bind(stroke, "Color", "Border")
	return stroke
end
function Library:_Text(instance, token) self:_Bind(instance, "TextColor3", token or "Text") end
function Library:SetTheme(theme)
	if not self.Scope.Alive then return end
	self.Theme = resolveTheme(theme)
	for instance, bindings in pairs(self.Bindings) do
		if instance.Parent then
			for property, token in pairs(bindings) do instance[property] = self.Theme[token] end
		end
	end
	for component in pairs(self.Components) do if component.Scope.Alive then component:_Refresh() end end
	for _, window in ipairs(self.Windows) do window:_RefreshTabs() end
end
function Library:_Hover(target, scope, enabled)
	scope:Connect(target.MouseEnter, function()
		if not enabled or enabled() then animate(target, {BackgroundTransparency = 0.18}, 0.12) end
	end)
	scope:Connect(target.MouseLeave, function() animate(target, {BackgroundTransparency = 0}, 0.18) end)
end
-- Shared pointer capture: one mouse/touch movement listener for the entire library.
function Library:_ReleasePointer(owner)
	local p = self.Pointer
	if p and (owner == nil or p.Owner == owner) then
		self.Pointer = nil
		if p.Finish then p.Finish(true) end
	end
end
function Library:_Capture(input, update, finish, owner)
	self:_ReleasePointer()
	self.Pointer = {Input = input, Update = update, Finish = finish, Owner = owner}
	update(input.Position)
end
function Library:_Drag(handle, scope, start, move, finish)
	scope:Connect(handle.InputBegan, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		if self.Pointer then return end
		local origin = input.Position
		local data = start()
		local moved = false
		self:_Capture(input, function(position)
			if not scope.Alive then return end
			local delta = position - origin
			if delta.Magnitude > 6 then moved = true end
			move(Vector2.new(delta.X, delta.Y), data)
		end, function(cancelled) if scope.Alive and finish then finish(moved, cancelled) end end, scope)
	end)
end
local function actuallyVisible(gui)
	local current = gui
	while current do
		if current:IsA("GuiObject") and not current.Visible then return false end
		if current:IsA("ScreenGui") and not current.Enabled then return false end
		current = current.Parent
	end
	return gui.Parent ~= nil
end
function Library.new(config)
	config = config or {}
	local self = setmetatable({Scope = Scope.new(), Windows = {}, Components = {}, Bindings = setmetatable({}, {__mode = "k"}), Keybinds = {}, Config = config, CapturingKey = nil}, Library)
	self.Theme = resolveTheme(config.Theme)
	self.Gui = create("ScreenGui", {Name = "NejiUI_" .. HttpService:GenerateGUID(false), ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = config.DisplayOrder or 50, IgnoreGuiInset = false, ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets, ClipToDeviceSafeArea = true}, player:WaitForChild("PlayerGui"))
	self.Root = create("Frame", {Name = "SafeArea", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0}, self.Gui)
	self.NotificationHost = create("Frame", {Name = "Notifications", AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -14, 1, -14), Size = UDim2.new(0, 330, 1, -28), BackgroundTransparency = 1, ZIndex = 50}, self.Root)
	create("UIListLayout", {Padding = UDim.new(0, 9), VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder}, self.NotificationHost)
	self.Scope:Connect(self.Root:GetPropertyChangedSignal("AbsoluteSize"), function()
		self.NotificationHost.Size = UDim2.new(0, math.max(160, math.min(330, self.Root.AbsoluteSize.X - 28)), 1, -28)
	end)
	self.Scope:Connect(UserInputService.InputChanged, function(input)
		local p = self.Pointer
		if p and (input == p.Input or (p.Input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)) then p.Update(input.Position) end
	end)
	self.Scope:Connect(UserInputService.InputEnded, function(input)
		local p = self.Pointer
		if p and input == p.Input then
			self.Pointer = nil
			if p.Finish then p.Finish(false) end
		end
	end)
	self.Scope:Connect(UserInputService.WindowFocusReleased, function()
		local p = self.Pointer; self.Pointer = nil
		if p and p.Finish then p.Finish(true) end
	end)
	self.Scope:Connect(UserInputService.InputBegan, function(input, processed)
		if self.CapturingKey then
			local c = self.CapturingKey
			if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
			self.CapturingKey = nil
			if input.KeyCode == Enum.KeyCode.Escape then c:_Refresh(); return end
			c:Set(input.KeyCode == Enum.KeyCode.Backspace and Enum.KeyCode.Unknown or input.KeyCode)
			return
		end
		if processed or UserInputService:GetFocusedTextBox() then return end
		for c in pairs(self.Keybinds) do
			if c.Enabled and actuallyVisible(c.Frame) and c.Value ~= Enum.KeyCode.Unknown and input.KeyCode == c.Value then invoke(c.Config.Callback, c.Value) end
		end
	end)
	self.Scope:Connect(self.Gui.Destroying, function() self:Destroy() end)
	if config.DynamicIsland ~= false then self.Island = self:CreateDynamicIsland(type(config.DynamicIsland) == "table" and config.DynamicIsland or {}) end
	return self
end
function Library:Destroy()
	if not self.Scope.Alive then return end
	self:_ReleasePointer()
	self.Scope:Clean()
	self.Pointer = nil
	self.CapturingKey = nil
	for i = #self.Windows, 1, -1 do self.Windows[i]:Destroy() end
	local components = {}; for c in pairs(self.Components) do table.insert(components, c) end
	for _, c in ipairs(components) do c:Destroy() end
	if self.Island then self.Island:Destroy() end
	if self.Notifications then local pending = {}; for n in pairs(self.Notifications) do table.insert(pending,n) end; for _,n in ipairs(pending) do n:Destroy() end end
	self.Gui:Destroy()
	table.clear(self.Bindings)
end

-- DYNAMIC ISLAND --------------------------------------------------------------
function Library:CreateDynamicIsland(config)
	if self.Island then self.Island:Destroy() end
	config = config or {}
	local selfIsland = setmetatable({Library = self, Scope = Scope.new(), Expanded = false, Config = config, Current = config.Text or "Neji · Ready", Serial = 0}, Island)
	self.Island = selfIsland
	local i = selfIsland
	i.Frame = create("Frame", {Name = "DynamicIsland", AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 12), Size = UDim2.fromOffset(244, 46), ClipsDescendants = true, ZIndex = 80}, self.Root)
	self:_Surface(i.Frame, "Background", true)
	corner(i.Frame, 23)
	i.Hit = button(i.Frame, "", {Size = UDim2.new(1, 0, 0, 46), BackgroundTransparency = 1, ZIndex = 2})
	i.Icon = text(i.Hit, icon(config.Icon or "star"), 20, {Position = UDim2.fromOffset(17, 0), Size = UDim2.fromOffset(26, 46)})
	self:_Text(i.Icon, "Accent")
	i.Title = text(i.Hit, i.Current, 13, {Position = UDim2.fromOffset(50, 0), Size = UDim2.new(1, -86, 0, 46), TextTruncate = Enum.TextTruncate.AtEnd, Font = Enum.Font.GothamMedium})
	self:_Text(i.Title)
	i.Dot = text(i.Hit, "•", 22, {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -13, 0, 0), Size = UDim2.fromOffset(15, 46)})
	self:_Text(i.Dot, "Accent")
	i.Description = text(i.Frame, config.Description or "Your workspace, beautifully connected.", 13, {Position = UDim2.fromOffset(18, 51), Size = UDim2.new(1, -36, 0, 45), TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top})
	self:_Text(i.Description, "Muted")
	i.Track = create("Frame", {Position = UDim2.new(0, 18, 1, -17), Size = UDim2.new(1, -36, 0, 4), BorderSizePixel = 0}, i.Frame)
	self:_Bind(i.Track, "BackgroundColor3", "Secondary"); corner(i.Track, 3)
	i.Fill = create("Frame", {Size = UDim2.fromScale(0, 1), BorderSizePixel = 0}, i.Track)
	self:_Bind(i.Fill, "BackgroundColor3", "Accent"); corner(i.Fill, 3)
	local dragged = false
	self:_Drag(i.Hit, i.Scope, function() dragged = false; return i.Frame.Position end, function(delta, initial)
		if delta.Magnitude > 6 then dragged = true end
		local size = self.Root.AbsoluteSize
		local half = i.Frame.AbsoluteSize.X / 2
		local x = math.clamp(initial.X.Scale * size.X + initial.X.Offset + delta.X, math.min(half, size.X / 2), math.max(size.X - half, size.X / 2))
		local y = math.clamp(initial.Y.Offset + delta.Y, 0, math.max(0, size.Y - i.Frame.AbsoluteSize.Y))
		i.Frame.Position = UDim2.fromOffset(x, y)
	end)
	i.Scope:Connect(i.Hit.Activated, function() if not dragged then i:Toggle() end end)
	i.Scope:Connect(self.Root:GetPropertyChangedSignal("AbsoluteSize"), function() i:_Resize(false) end)
	i:_Resize(false)
	return i
end
function Island:_Resize(tween)
	if not self.Scope.Alive then return end
	local size = self.Library.Root.AbsoluteSize
	if size.X < 1 or size.Y < 1 then return end
	local width = math.max(120, math.min(self.Expanded and 350 or 244, size.X - 20))
	local height = self.Expanded and 124 or 46
	local target = UDim2.fromOffset(width, height)
	if tween then animate(self.Frame, {Size = target}, 0.42, Enum.EasingStyle.Back) else self.Frame.Size = target end
	local x = self.Frame.Position.X.Scale * size.X + self.Frame.Position.X.Offset
	self.Frame.Position = UDim2.fromOffset(math.clamp(x, math.min(width/2, size.X/2), math.max(size.X-width/2, size.X/2)), math.clamp(self.Frame.Position.Y.Offset, 0, math.max(0, size.Y-height)))
end
function Island:Expand(duration)
	if not self.Scope.Alive then return end
	self.Expanded = true; self:_Resize(true)
	self.Serial += 1
	local serial = self.Serial
	local timeout = duration == nil and (self.Config.AutoCollapse or 6) or duration
	if timeout > 0 then self.Scope:Delay(timeout, function() if self.Serial == serial then self:Collapse() end end) end
end
function Island:Collapse()
	if not self.Scope.Alive then return end
	self.Serial += 1; self.Expanded = false; self:_Resize(true)
end
function Island:Toggle() if self.Expanded then self:Collapse() else self:Expand() end end
function Island:SetText(title, description, customIcon)
	if not self.Scope.Alive then return end
	self.Current = tostring(title or self.Current)
	self.Title.Text = self.Current
	if description then self.Description.Text = tostring(description) end
	if customIcon then self.Icon.Text = icon(customIcon) end
end
function Island:SetActive(title, customIcon)
	self.ActiveTitle = title
	if not self.Temporary then self:SetText(title, nil, customIcon) end
end
function Island:Notify(config)
	if not self.Scope.Alive then return end
	config = config or {}
	self.Temporary = (self.Temporary or 0) + 1
	local token = self.Temporary
	self:SetText(config.Title or "Notification", config.Description or "", config.Icon or "bell")
	local duration = math.max(0.2, finite(config.Duration, 4))
	self:Expand(duration)
	self.Scope:Delay(duration, function()
		if self.Temporary ~= token then return end
		self.Temporary = nil
		self:SetText(self.ActiveTitle or self.Config.Text or "Neji · Ready", self.Config.Description or "Your workspace, beautifully connected.", self.Config.Icon or "star")
	end)
end
function Island:SetProgress(value)
	if not self.Scope.Alive then return end
	self:SetLoading(false)
	animate(self.Fill, {Size = UDim2.fromScale(math.clamp(finite(value, 0), 0, 1), 1), Position = UDim2.fromScale(0, 0)}, 0.2)
end
function Island:SetLoading(enabled)
	if self.LoadTween then self.LoadTween:Cancel(); self.LoadTween = nil end
	local previous = activeTweens[self.Fill]; if previous then previous:Cancel(); activeTweens[self.Fill] = nil end
	if not self.Scope.Alive then return end
	self.Fill.Position = UDim2.fromScale(0, 0)
	self.Fill.Size = UDim2.fromScale(0, 1)
	if enabled then
		self.Fill.Size = UDim2.fromScale(0.28, 1)
		self.LoadTween = TweenService:Create(self.Fill, TweenInfo.new(0.85, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.fromScale(0.72, 0)})
		self.LoadTween:Play()
	end
end
function Island:Destroy()
	if not self.Scope.Alive then return end
	self.Scope:Clean()
	if self.LoadTween then self.LoadTween:Cancel() end
	self.Frame:Destroy()
	if self.Library.Island == self then self.Library.Island = nil end
end

-- WINDOW AND TAB SYSTEM -------------------------------------------------------
function Library:CreateWindow(config)
	config = config or {}
	local w = setmetatable({Library = self, Scope = Scope.new(), Tabs = {}, Config = config, Visible = true, Minimized = false, Maximized = false, BaseSize = Vector2.new(math.max(520, finite(config.Width, 860)), math.max(360, finite(config.Height, 570)))}, Window)
	table.insert(self.Windows, w)
	w.Frame = create("CanvasGroup", {Name = "Window", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.53), Size = UDim2.fromOffset(w.BaseSize.X, w.BaseSize.Y), BorderSizePixel = 0, GroupTransparency = 1}, self.Root)
	self:_Surface(w.Frame, "Background", true)
	w.Scale = create("UIScale", {Scale = 1}, w.Frame)
	local gradient = create("UIGradient", {Rotation = 75, Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(210, 218, 240))}, w.Frame)
	local shadow = create("Frame", {Name = "SoftEdge", Position = UDim2.fromOffset(-3, -3), Size = UDim2.new(1, 6, 1, 6), BackgroundTransparency = 1, ZIndex = 0}, w.Frame)
	corner(shadow, 14)
	create("UIStroke", {Color = Color3.new(0, 0, 0), Thickness = 5, Transparency = 0.85}, shadow)
	w.Header = create("Frame", {Size = UDim2.new(1, 0, 0, 70), BackgroundTransparency = 1, Active = true}, w.Frame)
	w.Logo = text(w.Header, icon(config.Logo or self.Config.Logo or "star"), 27, {Position = UDim2.fromOffset(22, 14), Size = UDim2.fromOffset(35, 40)})
	self:_Text(w.Logo, "Accent")
	if tostring(config.Logo or self.Config.Logo or ""):match("^rbxasset") then
		w.Logo.Visible = false
		create("ImageLabel", {Image = config.Logo or self.Config.Logo, BackgroundTransparency = 1, Position = w.Logo.Position, Size = w.Logo.Size, ScaleType = Enum.ScaleType.Fit}, w.Header)
	end
	w.Title = text(w.Header, config.Title or self.Config.Title or "Neji Workspace", 17, {Font = Enum.Font.GothamBold, Position = UDim2.fromOffset(68, 14), Size = UDim2.new(1, -205, 0, 23), TextTruncate = Enum.TextTruncate.AtEnd})
	self:_Text(w.Title)
	w.Subtitle = text(w.Header, config.Subtitle or self.Config.Subtitle or "NATIVE INTERFACE / 01", 11, {Position = UDim2.fromOffset(69, 39), Size = UDim2.new(1, -205, 0, 17), TextTruncate = Enum.TextTruncate.AtEnd})
	self:_Text(w.Subtitle, "Muted")
	local controls = create("Frame", {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -15, 0, 19), Size = UDim2.fromOffset(108, 31), BackgroundTransparency = 1}, w.Header)
	create("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 6)}, controls)
	for index, label in ipairs({"−", "□", "×"}) do
		local b = button(controls, label, {Size = UDim2.fromOffset(30, 30), TextSize = 19})
		self:_Surface(b, "Secondary"); self:_Text(b); self:_Hover(b, w.Scope)
		w.Scope:Connect(b.Activated, function()
			if index == 1 then w:Minimize() elseif index == 2 then w:Maximize() else w:Close() end
		end)
	end
	w.Body = create("Frame", {Position = UDim2.fromOffset(0, 70), Size = UDim2.new(1, 0, 1, -70), BackgroundTransparency = 1}, w.Frame)
	w.Sidebar = create("ScrollingFrame", {Position = UDim2.fromOffset(12, 4), Size = UDim2.new(0, 170, 1, -18), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y}, w.Body)
	padding(w.Sidebar, 5)
	create("UIListLayout", {Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder}, w.Sidebar)
	w.Content = create("Frame", {Position = UDim2.fromOffset(196, 4), Size = UDim2.new(1, -210, 1, -18), BackgroundTransparency = 1, ClipsDescendants = true}, w.Body)
	self:_Drag(w.Header, w.Scope, function() return w.Frame.Position end, function(delta, initial)
		if w.Maximized then return end
		local s = self.Root.AbsoluteSize
		local hw, hh = w.Frame.AbsoluteSize.X/2, w.Frame.AbsoluteSize.Y/2
		w.Frame.Position = UDim2.fromOffset(math.clamp(initial.X.Scale*s.X+initial.X.Offset+delta.X, hw, math.max(hw, s.X-hw)), math.clamp(initial.Y.Scale*s.Y+initial.Y.Offset+delta.Y, hh, math.max(hh, s.Y-hh)))
	end)
	w.Scope:Connect(self.Root:GetPropertyChangedSignal("AbsoluteSize"), function() w:_Layout() end)
	local toggleKey = config.ToggleKey
	if toggleKey == nil then toggleKey = Enum.KeyCode.RightShift end
	if typeof(toggleKey) == "EnumItem" then
		w.Action = "NejiToggle_" .. HttpService:GenerateGUID(false)
		ContextActionService:BindActionAtPriority(w.Action, function(_, state)
			if state == Enum.UserInputState.Begin and not UserInputService:GetFocusedTextBox() and not self.CapturingKey then w:Toggle() end
			return Enum.ContextActionResult.Pass
		end, false, 1000, toggleKey)
	end
	-- Always available touch/mouse restore affordance; closing never strands mobile users.
	w.Restore = button(self.Root, "✦  " .. (config.Title or self.Config.Title or "Open Neji"), {AnchorPoint = Vector2.new(0, 1), Position = UDim2.new(0, 14, 1, -14 - (#self.Windows-1)*42), Size = UDim2.fromOffset(170, 34), Visible = false, ZIndex = 30, TextTruncate = Enum.TextTruncate.AtEnd})
	self:_Surface(w.Restore, "Surface", true); self:_Text(w.Restore, "Accent")
	w.Scope:Connect(w.Restore.Activated, function() w:Open(); if w.Minimized then w:Minimize(false) end end)
	w:_Layout()
	animate(w.Frame, {GroupTransparency = 0}, 0.35)
	return w
end
function Window:_Layout()
	if not self.Scope.Alive then return end
	local area = self.Library.Root.AbsoluteSize
	if area.X < 1 or area.Y < 1 then return end
	-- Reflow rather than shrinking text to unreadable phone sizes.
	local scale = 1
	self.Scale.Scale = scale
	local narrow = area.X < 620
	local layout = self.Sidebar:FindFirstChildOfClass("UIListLayout")
	if narrow then
		self.Sidebar.Position = UDim2.fromOffset(8,0)
		self.Sidebar.Size = UDim2.new(1,-16,0,50)
		self.Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.X
		self.Sidebar.ScrollingDirection = Enum.ScrollingDirection.X
		layout.FillDirection = Enum.FillDirection.Horizontal
		self.Content.Position = UDim2.fromOffset(10,54)
		self.Content.Size = UDim2.new(1,-20,1,-64)
	else
		self.Sidebar.Position = UDim2.fromOffset(12,4)
		self.Sidebar.Size = UDim2.new(0,164,1,-18)
		self.Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
		self.Sidebar.ScrollingDirection = Enum.ScrollingDirection.Y
		layout.FillDirection = Enum.FillDirection.Vertical
		self.Content.Position = UDim2.fromOffset(190,4)
		self.Content.Size = UDim2.new(1,-204,1,-18)
	end
	for _,tab in ipairs(self.Tabs) do tab.Nav.Size = narrow and UDim2.fromOffset(124,40) or UDim2.new(1,-2,0,42) end
	local width = self.Maximized and area.X-20 or math.min(self.BaseSize.X,area.X-20)
	local height = self.Maximized and area.Y-24 or math.min(self.BaseSize.Y,area.Y-24)
	self.Frame.Size = UDim2.fromOffset(math.max(160,width),self.Minimized and 70 or math.max(150,height))
	local hw,hh = self.Frame.Size.X.Offset/2,self.Frame.Size.Y.Offset/2
	local x = self.Frame.Position.X.Scale*area.X+self.Frame.Position.X.Offset
	local y = self.Frame.Position.Y.Scale*area.Y+self.Frame.Position.Y.Offset
	if self.Maximized then x = area.X/2; y = area.Y/2 end
	self.Frame.Position = UDim2.fromOffset(math.clamp(x,hw,math.max(hw,area.X-hw)),math.clamp(y,hh,math.max(hh,area.Y-hh)))
end
function Window:Open()
	if not self.Scope.Alive then return end
	self.Transition = (self.Transition or 0)+1
	self.Visible = true; self.Frame.Visible = true; self.Restore.Visible = false
	animate(self.Frame, {GroupTransparency = 0}, 0.25)
end
function Window:Close()
	if not self.Scope.Alive then return end
	self.Library:_ReleasePointer()
	self.Transition = (self.Transition or 0)+1
	local token = self.Transition
	self.Visible = false; self.Restore.Visible = true
	animate(self.Frame, {GroupTransparency = 1}, 0.2)
	self.Scope:Delay(0.21, function() if self.Transition == token then self.Frame.Visible = false end end)
end
function Window:Toggle() if self.Visible then self:Close() else self:Open() end end
function Window:Minimize(state)
	if not self.Scope.Alive then return end
	self.Minimized = state == nil and not self.Minimized or state == true
	self.Body.Visible = not self.Minimized
	self.Restore.Visible = self.Minimized or not self.Visible
	local before = self.Frame.Size
	self:_Layout()
	local target = self.Frame.Size
	self.Frame.Size = before
	animate(self.Frame, {Size = target}, 0.28)
end
function Window:Maximize(state)
	if not self.Scope.Alive then return end
	local nextState = state == nil and not self.Maximized or state == true
	if nextState and not self.Maximized then self.RestorePosition = self.Frame.Position end
	self.Maximized = nextState
	if not nextState and self.RestorePosition then self.Frame.Position = self.RestorePosition end
	self.Minimized = false; self.Body.Visible = true; self.Restore.Visible = false
	local before = self.Frame.Size
	self:_Layout(); local target = self.Frame.Size; self.Frame.Size = before
	animate(self.Frame, {Size = target}, 0.3)
end
function Window:_RefreshTabs()
	for _, tab in ipairs(self.Tabs) do
		local active = self.ActiveTab == tab
		tab.Nav.BackgroundColor3 = self.Library.Theme[active and "Secondary" or "Background"]
		tab.Nav.TextColor3 = self.Library.Theme[active and "Accent" or "Muted"]
	end
end
function Window:CreateTab(config)
	config = config or {}
	local tab = setmetatable({Window = self, Library = self.Library, Scope = Scope.new(), Components = {}, Config = config, Name = config.Name or config.Title or "Tab", Order = 0}, Tab)
	table.insert(self.Tabs, tab)
	tab.Nav = button(self.Sidebar, icon(config.Icon or "home") .. "  " .. tab.Name, {Size = UDim2.new(1, -2, 0, 42), LayoutOrder = #self.Tabs, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd})
	padding(tab.Nav, 10); corner(tab.Nav, 9)
	tab.Page = create("CanvasGroup", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false}, self.Content)
	tab.Scroll = create("ScrollingFrame", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y}, tab.Page)
	self.Library:_Bind(tab.Scroll, "ScrollBarImageColor3", "Accent")
	padding(tab.Scroll, 5)
	create("UIListLayout", {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder}, tab.Scroll)
	tab.Scope:Connect(tab.Nav.Activated, function() tab:Select() end)
	if not self.ActiveTab then tab:Select() else self:_RefreshTabs() end
	self:_Layout()
	return tab
end
function Tab:Select()
	if not self.Scope.Alive then return end
	self.Library:_ReleasePointer()
	for _, t in ipairs(self.Window.Tabs) do t.Page.Visible = t == self end
	self.Window.ActiveTab = self
	self.Page.GroupTransparency = 0.65
	animate(self.Page, {GroupTransparency = 0}, 0.23)
	self.Window:_RefreshTabs()
	if self.Library.Island then self.Library.Island:SetActive(self.Name, self.Config.Icon or "home") end
	invoke(self.Config.Callback, self)
	invoke(self.Library.Config.TabChanged, self.Name, self.Config.Icon)
end
function Tab:Destroy()
	if not self.Scope.Alive then return end
	self.Scope:Clean()
	for i = #self.Components, 1, -1 do self.Components[i]:Destroy() end
	self.Nav:Destroy(); self.Page:Destroy()
	local index = table.find(self.Window.Tabs, self); if index then table.remove(self.Window.Tabs, index) end
	if self.Window.ActiveTab == self then self.Window.ActiveTab = nil; if self.Window.Tabs[1] then self.Window.Tabs[1]:Select() end end
end
function Window:Destroy()
	if not self.Scope.Alive then return end
	self.Scope:Clean()
	if self.Action then ContextActionService:UnbindAction(self.Action) end
	for i = #self.Tabs, 1, -1 do self.Tabs[i]:Destroy() end
	self.Frame:Destroy(); self.Restore:Destroy()
	local index = table.find(self.Library.Windows, self); if index then table.remove(self.Library.Windows, index) end
end

-- SHARED COMPONENT MODEL ------------------------------------------------------
function Tab:_Row(kind, config)
	assert(self.Scope.Alive, "Cannot add components to a destroyed tab")
	config = config or {}
	local id = config.Id or config.Flag
	if id then assert(type(id) == "string" and id ~= "","Id/Flag must be a nonempty string"); assert(not self.Library:GetComponent(id),"Duplicate component Id/Flag: " .. id) end
	self.Order += 1
	local c = setmetatable({Tab = self, Library = self.Library, Config = config, Kind = kind, Scope = Scope.new(), Enabled = config.Enabled ~= false, Value = config.Default, Options = {}, Expanded = false}, Component)
	table.insert(self.Components, c); self.Library.Components[c] = true
	c.Frame = create("CanvasGroup", {Name = kind, Size = UDim2.new(1, -5, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = self.Order, BorderSizePixel = 0}, self.Scroll)
	self.Library:_Surface(c.Frame, "Surface", true)
	padding(c.Frame, 14)
	create("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}, c.Frame)
	c.Heading = create("Frame", {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = 1}, c.Frame)
	create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, c.Heading)
	c.Title = text(c.Heading, config.Title or config.Name or kind, 14, {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, TextWrapped = true, Font = Enum.Font.GothamMedium, LayoutOrder = 1})
	self.Library:_Text(c.Title)
	c.Description = text(c.Heading, config.Description or "", 12, {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, TextWrapped = true, Visible = config.Description ~= nil and config.Description ~= "", LayoutOrder = 2})
	self.Library:_Text(c.Description, "Muted")
	c.Controls = create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 34), LayoutOrder = 2}, c.Frame)
	c.Scope:Connect(c.Frame.Destroying, function() c:Destroy() end)
	return c
end
function Component:_Accent() return (self.Config.Colors or {}).Accent or self.Library.Theme.Accent end
function Component:_Callback(value) invoke(self.Config.Callback, copy(value)) end
function Component:Get() return copy(self.Value) end
function Component:SetEnabled(enabled)
	self.Enabled = enabled == true
	if not self.Enabled then self.Library:_ReleasePointer(self) end
	if not self.Enabled and self.Library.CapturingKey == self then self.Library.CapturingKey = nil end
	if not self.Enabled and self.Box then self.Box:ReleaseFocus(false) end
	self:_Refresh()
	return self
end
function Component:SetVisible(visible) if self.Scope.Alive then if not visible then self.Library:_ReleasePointer(self) end; self.Frame.Visible = visible == true end; return self end
function Component:SetTitle(value) self.Title.Text = tostring(value); return self end
function Component:SetDescription(value)
	self.Description.Text = tostring(value or ""); self.Description.Visible = self.Description.Text ~= ""; return self
end
function Component:SetColors(colors) self.Config.Colors = colors or {}; self:_Refresh(); return self end
function Component:_Refresh()
	if not self.Scope.Alive then return end
	self.Frame.GroupTransparency = self.Enabled and 0 or 0.55
	local colors = self.Config.Colors or {}
	self.Frame.BackgroundColor3 = colors.Background or self.Library.Theme.Surface
	self.Title.TextColor3 = colors.Text or self.Library.Theme.Text
	self.Description.TextColor3 = colors.Secondary or self.Library.Theme.Muted
	if self.Refresh then self:Refresh() end
end
function Component:Set(value, silent)
	if not self.Scope.Alive then return self end
	local normalized = value
	if self.Normalize then normalized = self:Normalize(value) end
	local changed = normalized ~= self.Value
	if type(normalized) == "table" and type(self.Value) == "table" then
		changed = #normalized ~= #self.Value
		if not changed then for index, v in ipairs(normalized) do if self.Value[index] ~= v then changed = true; break end end end
	end
	self.Value = copy(normalized)
	self:_Refresh()
	if changed and not silent then self:_Callback(self.Value); if self.ChangedEvent then self.ChangedEvent:Fire(copy(self.Value)) end end
	return self
end
function Component:Destroy()
	if not self.Scope.Alive then return end
	self.Library:_ReleasePointer(self)
	if self.BeforeDestroy then self:BeforeDestroy() end
	self.Scope:Clean()
	if self.OptionScope then self.OptionScope:Clean() end
	for other, visible in pairs(self.FilterOriginal or {}) do if other.Scope.Alive then other.Frame.Visible = visible end end
	if self.Library.CapturingKey == self then self.Library.CapturingKey = nil end
	self.Library.Keybinds[self] = nil
	self.Library.Components[self] = nil
	for _,other in ipairs(self.Tab.Components) do if other.FilterOriginal then other.FilterOriginal[self] = nil end end
	local index = table.find(self.Tab.Components, self); if index then table.remove(self.Tab.Components, index) end
	self.Frame:Destroy()
end
local function controlButton(c, caption)
	local b = button(c.Controls, caption, {Size = UDim2.fromScale(1, 1)})
	c.Library:_Surface(b, "Secondary"); c.Library:_Text(b)
	c.Library:_Hover(b, c.Scope, function() return c.Enabled end)
	return b
end
function Tab:CreateButton(config)
	local c = self:_Row("Button", config)
	c.Action = controlButton(c, c.Config.ButtonText or "Run action  →")
	c.Scope:Connect(c.Action.Activated, function()
		if not c.Enabled then return end
		animate(c.Action, {BackgroundColor3 = c:_Accent()}, 0.08)
		c.Scope:Delay(0.13, function() animate(c.Action, {BackgroundColor3 = c.Library.Theme.Secondary}, 0.22) end)
		c:_Callback(c.Value)
	end)
	c.Refresh = function(s) s.Action.TextColor3 = s:_Accent() end
	c:_Refresh(); return c
end
function Tab:CreateToggle(config)
	local c = self:_Row("Toggle", config)
	c.Switch = button(c.Controls, "", {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(52, 28)})
	corner(c.Switch, 14)
	c.Knob = create("Frame", {Size = UDim2.fromOffset(20, 20), Position = UDim2.fromOffset(4, 4), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0}, c.Switch); corner(c.Knob, 10)
	c.State = text(c.Controls, "", 12, {Size = UDim2.new(1, -65, 1, 0)}); c.Library:_Text(c.State, "Muted")
	c.Normalize = function(_, v) return v == true end
	c.Refresh = function(s)
		animate(s.Switch, {BackgroundColor3 = s.Value and s:_Accent() or s.Library.Theme.Secondary}, 0.2)
		animate(s.Knob, {Position = UDim2.fromOffset(s.Value and 28 or 4, 4)}, 0.25, Enum.EasingStyle.Back)
		s.State.Text = s.Value and "Enabled" or "Disabled"
	end
	c.Scope:Connect(c.Switch.Activated, function() if c.Enabled then c:Set(not c.Value) end end)
	c:Set(c.Config.Default == true, true); return c
end
function Tab:CreateSlider(config)
	local c = self:_Row("Slider", config)
	c.Min = finite(c.Config.Min, 0); c.Max = math.max(c.Min, finite(c.Config.Max, 100)); c.Step = math.max(0.000001, finite(c.Config.Step, 1))
	c.Controls.Size = UDim2.new(1, 0, 0, 48)
	c.Readout = text(c.Controls, "", 12, {Size = UDim2.new(1, 0, 0, 16), TextXAlignment = Enum.TextXAlignment.Right}); c.Library:_Text(c.Readout, "Accent")
	c.Hit = button(c.Controls, "", {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 16), Size = UDim2.new(1, 0, 0, 32)})
	c.Track = create("Frame", {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.new(1, 0, 0, 6), BorderSizePixel = 0}, c.Hit); corner(c.Track, 3); c.Library:_Bind(c.Track, "BackgroundColor3", "Secondary")
	c.Fill = create("Frame", {Size = UDim2.fromScale(0, 1), BorderSizePixel = 0}, c.Track); corner(c.Fill, 3)
	c.Knob = create("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(16, 16), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0}, c.Track); corner(c.Knob, 8)
	c.Normalize = function(s, value)
		local n = math.clamp(finite(value, s.Min), s.Min, s.Max)
		return math.clamp(s.Min + math.floor((n-s.Min)/s.Step+0.5)*s.Step, s.Min, s.Max)
	end
	c.Refresh = function(s)
		local fraction = s.Max == s.Min and 0 or (s.Value-s.Min)/(s.Max-s.Min)
		s.Fill.BackgroundColor3 = s:_Accent()
		animate(s.Fill, {Size = UDim2.fromScale(fraction, 1)}, 0.08)
		animate(s.Knob, {Position = UDim2.fromScale(fraction, 0.5)}, 0.08)
		s.Readout.Text = string.format("%.4g%s", s.Value, s.Config.Suffix or "")
	end
	c.Scope:Connect(c.Hit.InputBegan, function(input)
		if not c.Enabled or (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) then return end
		c.Library:_Capture(input, function(position)
			if not c.Scope.Alive or not c.Enabled then return end
			local fraction = math.clamp((position.X-c.Track.AbsolutePosition.X)/math.max(1, c.Track.AbsoluteSize.X), 0, 1)
			c:Set(c.Min+fraction*(c.Max-c.Min))
		end,nil,c)
	end)
	c:Set(c.Config.Default or c.Min, true); return c
end

-- Dropdowns use inline clipped expansion, so they never escape screen edges.
function Tab:_Dropdown(config, multi)
	local c = self:_Row(multi and "MultiDropdown" or "Dropdown", config)
	c.Multi = multi
	c.Controls.Size = UDim2.new(1, 0, 0, 36)
	c.Action = controlButton(c, "Select  ▾")
	c.List = create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), ClipsDescendants = true, LayoutOrder = 3}, c.Frame)
	c.OptionScroll = create("ScrollingFrame", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y}, c.List)
	create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, c.OptionScroll)
	c.OptionScope = Scope.new()
	c.Scope:Connect(c.Frame.Destroying, function() c.OptionScope:Clean() end)
	c.Normalize = function(s, value)
		if not s.Multi then return table.find(s.Options, tostring(value)) and tostring(value) or nil end
		local result, seen = {}, {}
		if type(value) == "table" then for _, v in ipairs(value) do local str = tostring(v); if table.find(s.Options, str) and not seen[str] then seen[str] = true; table.insert(result, str) end end end
		return result
	end
	c.Refresh = function(s)
		local caption = s.Multi and table.concat(s.Value or {}, ", ") or s.Value
		s.Action.Text = ((caption and caption ~= "") and caption or "Select") .. (s.Expanded and "  ▴" or "  ▾")
		s.Action.TextTruncate = Enum.TextTruncate.AtEnd
		for option, b in pairs(s.OptionButtons or {}) do
			local selected = s.Multi and table.find(s.Value or {}, option) ~= nil or (not s.Multi and s.Value == option)
			b.Text = (selected and "✓  " or "    ") .. option
			b.TextColor3 = selected and s:_Accent() or s.Library.Theme.Text
			b.BackgroundColor3 = s.Library.Theme.Secondary
		end
	end
	function c:SetExpanded(state)
		self.Expanded = state == true
		animate(self.List, {Size = UDim2.new(1, 0, 0, self.Expanded and math.min(190, #self.Options*36) or 0)}, 0.25)
		self:_Refresh()
	end
	function c:SetOptions(options, silent)
		self.OptionScope:Clean(); self.OptionScope = Scope.new()
		for _, child in ipairs(self.OptionScroll:GetChildren()) do if child:IsA("GuiButton") then child:Destroy() end end
		self.Options = {}; self.OptionButtons = {}
		local seen = {}
		for _, value in ipairs(options or {}) do
			local option = tostring(value)
			if not seen[option] then
				seen[option] = true; table.insert(self.Options, option)
				local b = button(self.OptionScroll, option, {Size = UDim2.new(1, -5, 0, 32), LayoutOrder = #self.Options, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd})
				corner(b, 7); padding(b, 8); self.OptionButtons[option] = b
				self.OptionScope:Connect(b.Activated, function()
					if not self.Enabled then return end
					if self.Multi then
						local values = self:Get() or {}; local index = table.find(values, option)
						if index then table.remove(values, index) else table.insert(values, option) end
						self:Set(values)
					else self:Set(option); self:SetExpanded(false) end
				end)
			end
		end
		self:Set(self.Value, silent)
		self:SetExpanded(self.Expanded)
		return self
	end
	c.Scope:Connect(c.Action.Activated, function() if c.Enabled then c:SetExpanded(not c.Expanded) end end)
	c:SetOptions(c.Config.Options or {}, true)
	c:Set(c.Config.Default or (multi and {} or nil), true)
	return c
end
function Tab:CreateDropdown(config) return self:_Dropdown(config, false) end
function Tab:CreateMultiDropdown(config) return self:_Dropdown(config, true) end

local function inputBox(c, placeholder)
	local box = create("TextBox", {Size = UDim2.fromScale(1, 1), BackgroundColor3 = c.Library.Theme.Secondary, BorderSizePixel = 0, Text = "", PlaceholderText = placeholder or "Enter text…", Font = Enum.Font.Gotham, TextSize = 13, ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Left}, c.Controls)
	corner(box, 8); padding(box, 10)
	c.Library:_Bind(box, "BackgroundColor3", "Secondary"); c.Library:_Text(box); c.Library:_Bind(box, "PlaceholderColor3", "Muted")
	return box
end
function Tab:CreateTextbox(config)
	local c = self:_Row("Textbox", config)
	c.Box = inputBox(c, c.Config.Placeholder)
	c.Normalize = function(s, value)
		local str = tostring(value or "")
		local maximum = math.max(0, math.floor(finite(s.Config.MaxLength, 512)))
		local length = utf8.len(str)
		if not length then return "" end
		if length > maximum then local offset = utf8.offset(str, maximum+1); str = string.sub(str, 1, (offset or (#str+1))-1) end
		return str
	end
	c.Refresh = function(s) s.Box.TextEditable = s.Enabled; if s.Box.Text ~= s.Value then s.Box.Text = s.Value or "" end end
	c.Scope:Connect(c.Box.FocusLost, function(enter)
		if not c.Enabled then return end
		if c.Config.EnterOnly and not enter then c:_Refresh() else c:Set(c.Box.Text) end
	end)
	if c.Config.Live then
		c.Scope:Connect(c.Box:GetPropertyChangedSignal("Text"), function() if c.Enabled and c.Box:IsFocused() then c:Set(c.Box.Text) end end)
	end
	c:Set(c.Config.Default or "", true); return c
end
function Tab:CreateInputField(config) local c = self:CreateTextbox(config); c.Kind = "InputField"; return c end
function Tab:CreateKeybind(config)
	local c = self:_Row("Keybind", config)
	c.Action = controlButton(c, "")
	c.Normalize = function(_, value)
		if type(value) == "string" then value = Enum.KeyCode[value] end
		return typeof(value) == "EnumItem" and value.EnumType == Enum.KeyCode and value or Enum.KeyCode.Unknown
	end
	-- Keybind Callback fires on key press; Changed fires when binding is edited.
	c._Callback = function(s, value) invoke(s.Config.Changed, value) end
	c.Refresh = function(s) s.Action.Text = s.Library.CapturingKey == s and "Press a key · Esc cancels · Backspace clears" or ((s.Value and s.Value.Name or "Unknown") .. "  /  click to rebind") end
	c.Scope:Connect(c.Action.Activated, function()
		if not c.Enabled then return end
		local old = c.Library.CapturingKey; c.Library.CapturingKey = c
		if old and old ~= c then old:_Refresh() end
		c:_Refresh()
	end)
	-- Touch-only devices get a key menu rather than an impossible physical-key prompt.
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		local menu = create("ScrollingFrame", {Size = UDim2.new(1, 0, 0, 160), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false, LayoutOrder = 3}, c.Frame)
		create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, menu)
		local names = {"Unknown", "Space", "Return", "Tab", "LeftShift", "RightShift", "LeftControl", "LeftAlt", "Up", "Down", "Left", "Right"}
		for code = 65, 90 do table.insert(names, string.char(code)) end
		for _, name in ipairs({"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"}) do table.insert(names, name) end
		for number = 1, 12 do table.insert(names, "F" .. number) end
		for order, name in ipairs(names) do
			local option = button(menu, name == "Unknown" and "Clear binding" or name, {Size = UDim2.new(1, -5, 0, 32), LayoutOrder = order})
			c.Library:_Surface(option, "Secondary"); c.Library:_Text(option)
			c.Scope:Connect(option.Activated, function() if c.Enabled then c:Set(Enum.KeyCode[name]); menu.Visible = false end end)
		end
		c.Scope:Connect(c.Action.Activated, function()
			if not c.Enabled then return end
			if c.Library.CapturingKey == c then c.Library.CapturingKey = nil end
			menu.Visible = not menu.Visible; c:_Refresh()
		end)
	end
	c.Library.Keybinds[c] = true
	c:Set(c.Config.Default or Enum.KeyCode.Unknown, true); return c
end
function Tab:CreateLabel(config)
	local c = self:_Row("Label", config)
	c.Controls.Visible = false
	c.Normalize = function(_, value) return tostring(value or "") end
	c.Refresh = function(s) s.Title.Text = s.Value end
	c:Set(c.Config.Default or c.Config.Text or c.Config.Title or c.Config.Name or "Label", true); return c
end
function Tab:CreateParagraph(config)
	local c = self:_Row("Paragraph", config)
	c.Controls.Visible = false
	c.Normalize = function(_, value) return tostring(value or "") end
	c.Refresh = function(s) s.Description.Text = s.Value; s.Description.Visible = s.Value ~= "" end
	c:Set(c.Config.Default or c.Config.Content or c.Config.Description or "", true); return c
end
function Tab:CreateDivider(config)
	local c = self:_Row("Divider", config)
	c.Frame.BackgroundTransparency = 1
	for _, child in ipairs(c.Frame:GetChildren()) do if child:IsA("UIStroke") then child.Transparency = 1 end end
	c.Heading.Visible = c.Config.Title ~= nil or c.Config.Name ~= nil
	c.Controls.Size = UDim2.new(1, 0, 0, 1)
	c.Line = create("Frame", {Size = UDim2.fromScale(1, 1), BorderSizePixel = 0}, c.Controls)
	c.Library:_Bind(c.Line, "BackgroundColor3", "Border")
	c:_Refresh(); return c
end
function Tab:CreateSection(config)
	local c = self:_Row("Section", config)
	c.Controls.Visible = false
	c.Frame.BackgroundTransparency = 0.5
	c.Refresh = function(s) s.Title.TextColor3 = s:_Accent() end
	-- A visual section heading; subsequent controls remain in the same tab.
	c:_Refresh(); return c
end
function Tab:CreateProgressBar(config)
	local c = self:_Row("ProgressBar", config)
	c.Readout = text(c.Controls, "", 12, {Size = UDim2.new(1, 0, 0, 16), TextXAlignment = Enum.TextXAlignment.Right}); c.Library:_Text(c.Readout, "Muted")
	c.Track = create("Frame", {Position = UDim2.fromOffset(0, 24), Size = UDim2.new(1, 0, 0, 7), BorderSizePixel = 0}, c.Controls); corner(c.Track, 4); c.Library:_Bind(c.Track, "BackgroundColor3", "Secondary")
	c.Fill = create("Frame", {Size = UDim2.fromScale(0, 1), BorderSizePixel = 0}, c.Track); corner(c.Fill, 4)
	c.Normalize = function(_, v) return math.clamp(finite(v, 0), 0, 1) end
	c.Refresh = function(s) s.Fill.BackgroundColor3 = s:_Accent(); animate(s.Fill, {Size = UDim2.fromScale(s.Value, 1)}, 0.25); s.Readout.Text = string.format("%d%%", math.floor(s.Value*100+0.5)) end
	c:Set(c.Config.Default or 0, true); return c
end
function Tab:CreateImage(config)
	local c = self:_Row("Image", config)
	c.Controls.Size = UDim2.new(1, 0, 0, math.max(24, finite(c.Config.Height, 160)))
	c.Image = create("ImageButton", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = "", ScaleType = c.Config.ScaleType or Enum.ScaleType.Fit, AutoButtonColor = false}, c.Controls); corner(c.Image, 8)
	c.Normalize = function(_, v) return tostring(v or "") end
	c.Refresh = function(s) s.Image.Image = s.Value; s.Image.ImageColor3 = (s.Config.Colors or {}).Image or Color3.new(1, 1, 1) end
	c.Scope:Connect(c.Image.Activated, function() if c.Enabled then c:_Callback(c.Value) end end)
	c:Set(c.Config.Image or c.Config.Default or "", true); return c
end
function Tab:CreateSearchBar(config)
	config = table.clone(config or {})
	local callback = config.Callback
	config.Live = true; config.Placeholder = config.Placeholder or "Search this tab…"
	config.Callback = nil
	local c = self:CreateTextbox(config); c.Kind = "SearchBar"
	function c:ApplyFilter(query)
		local needle = string.lower(query)
		for _, other in ipairs(self.Tab.Components) do
			if other ~= self then
				if not self.FilterOriginal then self.FilterOriginal = {} end
				if self.FilterOriginal[other] == nil then self.FilterOriginal[other] = other.Frame.Visible end
				local haystack = string.lower(other.Title.Text .. " " .. other.Description.Text)
				other.Frame.Visible = self.FilterOriginal[other] and (needle == "" or string.find(haystack, needle, 1, true) ~= nil)
			end
		end
		if needle == "" then self.FilterOriginal = nil end
	end
	c.Config.Callback = function(query) if c.Scope.Alive then c:ApplyFilter(query); invoke(callback, query) end end
	c.Scope:Connect(c.Frame.Destroying, function()
		for other, visible in pairs(c.FilterOriginal or {}) do if other.Scope.Alive then other.Frame.Visible = visible end end
	end)
	return c
end

-- HSV COLOR PICKER: SV square, hue rail, hex entry, live preview -----------------
function Tab:CreateColorPicker(config)
	local c = self:_Row("ColorPicker", config)
	c.Controls.Size = UDim2.new(1, 0, 0, 36)
	c.Action = controlButton(c, "")
	c.Panel = create("Frame", {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1, ClipsDescendants = true, LayoutOrder = 3}, c.Frame)
	c.SV = button(c.Panel, "", {Size = UDim2.new(1, -34, 0, 130), BackgroundColor3 = Color3.fromHSV(0, 1, 1)})
	corner(c.SV, 7)
	local white = create("Frame", {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Active = false}, c.SV); corner(white, 7)
	create("UIGradient", {Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})}, white)
	local black = create("Frame", {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, Active = false}, c.SV); corner(black, 7)
	create("UIGradient", {Rotation = 90, Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})}, black)
	c.Cursor = create("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1, ZIndex = 3}, c.SV); corner(c.Cursor, 6); create("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1)}, c.Cursor)
	c.Hue = button(c.Panel, "", {AnchorPoint = Vector2.new(1, 0), Position = UDim2.fromScale(1, 0), Size = UDim2.fromOffset(24, 130), BackgroundColor3 = Color3.new(1, 1, 1)})
	corner(c.Hue, 7)
	local keys = {}; for index = 0, 6 do table.insert(keys, ColorSequenceKeypoint.new(index/6, Color3.fromHSV(index/6, 1, 1))) end
	create("UIGradient", {Rotation = 90, Color = ColorSequence.new(keys)}, c.Hue)
	c.HueMark = create("Frame", {AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.new(1, 0, 0, 4), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0}, c.Hue)
	c.Hex = create("TextBox", {Position = UDim2.fromOffset(0, 140), Size = UDim2.new(1, 0, 0, 34), Text = "", ClearTextOnFocus = false, Font = Enum.Font.Code, TextSize = 14, BorderSizePixel = 0}, c.Panel)
	corner(c.Hex, 7); c.Library:_Bind(c.Hex, "BackgroundColor3", "Secondary"); c.Library:_Text(c.Hex)
	c.Normalize = function(s, v) return typeof(v) == "Color3" and v or (s.Value or Color3.fromRGB(114, 137, 255)) end
	c.Refresh = function(s)
		local h, sat, val = s.Value:ToHSV()
		if not s.DraggingColor then s.H = h end
		s.H = s.H or h
		s.SV.BackgroundColor3 = Color3.fromHSV(s.H, 1, 1)
		s.Cursor.Position = UDim2.fromScale(sat, 1-val)
		s.HueMark.Position = UDim2.fromScale(0, s.H)
		s.Action.Text = "#" .. s.Value:ToHex():upper() .. "  ◈"
		s.Action.TextColor3 = s.Value
		if not s.Hex:IsFocused() then s.Hex.Text = "#" .. s.Value:ToHex():upper() end
		s.Hex.TextEditable = s.Enabled
	end
	c.Scope:Connect(c.Action.Activated, function()
		if not c.Enabled then return end
		c.Expanded = not c.Expanded
		animate(c.Panel, {Size = UDim2.new(1, 0, 0, c.Expanded and 176 or 0)}, 0.25)
	end)
	local function capture(target, hue)
		c.Scope:Connect(target.InputBegan, function(input)
			if not c.Enabled or (input.UserInputType ~= Enum.UserInputType.Touch and input.UserInputType ~= Enum.UserInputType.MouseButton1) then return end
			c.DraggingColor = true
			c.Library:_Capture(input, function(position)
				if not c.Scope.Alive or not c.Enabled then return end
				local _, sat, val = c.Value:ToHSV()
				local x = math.clamp((position.X-target.AbsolutePosition.X)/math.max(1, target.AbsoluteSize.X), 0, 1)
				local y = math.clamp((position.Y-target.AbsolutePosition.Y)/math.max(1, target.AbsoluteSize.Y), 0, 1)
				if hue then c.H = y else sat = x; val = 1-y end
				c:Set(Color3.fromHSV(c.H or 0, sat, val))
			end, function() c.DraggingColor = false end,c)
		end)
	end
	capture(c.SV, false); capture(c.Hue, true)
	c.Scope:Connect(c.Hex.FocusLost, function()
		if not c.Enabled then return end
		local hex = c.Hex.Text:gsub("#", ""):gsub("%s", "")
		if #hex == 6 and hex:match("^%x+$") then c:Set(Color3.fromHex(hex)) end
		c:_Refresh()
	end)
	c:Set(c.Config.Default or Color3.fromRGB(114, 137, 255), true); return c
end

-- STACKED NOTIFICATIONS -------------------------------------------------------
function Library:Notify(config)
	if not self.Scope.Alive then return end
	config = config or {}
	self.Notifications = self.Notifications or {}
	self.NotificationOrder = (self.NotificationOrder or 0)+1
	-- Bounded stack protects mobile layouts and prevents unbounded toast allocations.
	local count, oldest = 0, nil
	for n in pairs(self.Notifications) do count += 1; if not oldest or n.Order < oldest.Order then oldest = n end end
	if count >= 4 and oldest then oldest:Destroy() end
	local n = {Scope = Scope.new(), Library = self, Order = self.NotificationOrder}
	self.Notifications[n] = true
	local colors = {Success = Color3.fromRGB(80, 210, 155), Warning = Color3.fromRGB(255, 195, 85), Error = Color3.fromRGB(255, 108, 128), Information = self.Theme.Accent}
	local kind = config.Type or "Information"
	local accent = config.Color or colors[kind] or self.Theme.Accent
	local duration = math.max(0.25, finite(config.Duration, 4))
	n.Slot = create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), LayoutOrder = n.Order}, self.NotificationHost)
	n.Frame = create("CanvasGroup", {Position = UDim2.fromOffset(30, 0), Size = UDim2.new(1, 0, 0, 106), GroupTransparency = 1, BorderSizePixel = 0}, n.Slot)
	self:_Surface(n.Frame, "Surface", true)
	local mark = text(n.Frame, icon(config.Icon or string.lower(kind)), 23, {Position = UDim2.fromOffset(15, 17), Size = UDim2.fromOffset(28, 28), TextColor3 = accent})
	local title = text(n.Frame, tostring(config.Title or kind), 14, {Position = UDim2.fromOffset(52, 15), Size = UDim2.new(1, -88, 0, 21), Font = Enum.Font.GothamMedium, TextTruncate = Enum.TextTruncate.AtEnd}); self:_Text(title)
	local desc = text(n.Frame, tostring(config.Description or ""), 12, {Position = UDim2.fromOffset(52, 41), Size = UDim2.new(1, -68, 0, 46), TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top, TextTruncate = Enum.TextTruncate.AtEnd}); self:_Text(desc, "Muted")
	local dismiss = button(n.Frame, "×", {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -6, 0, 5), Size = UDim2.fromOffset(30, 30), BackgroundTransparency = 1, TextSize = 20}); self:_Text(dismiss, "Muted")
	local timerTrack = create("Frame", {Position = UDim2.new(0, 12, 1, -7), Size = UDim2.new(1, -24, 0, 3), BackgroundTransparency = 1}, n.Frame)
	local timer = create("Frame", {Size = UDim2.fromScale(1, 1), BackgroundColor3 = accent, BorderSizePixel = 0}, timerTrack); corner(timer, 2)
	function n:Destroy()
		if not self.Scope.Alive then return end
		self.Scope:Clean()
		if self.TimerTween then self.TimerTween:Cancel() end
		self.Library.Notifications[self] = nil
		self.Slot:Destroy()
	end
	function n:Dismiss()
		if self.Dismissing or not self.Scope.Alive then return end
		self.Dismissing = true
		animate(self.Frame, {GroupTransparency = 1, Position = UDim2.fromOffset(30, 0)}, 0.2)
		animate(self.Slot, {Size = UDim2.new(1, 0, 0, 0)}, 0.22)
		self.Scope:Delay(0.23, function() self:Destroy() end)
	end
	n.Scope:Connect(dismiss.Activated, function() n:Dismiss() end)
	animate(n.Slot, {Size = UDim2.new(1, 0, 0, 106)}, 0.25)
	animate(n.Frame, {GroupTransparency = 0, Position = UDim2.fromOffset(0, 0)}, 0.3)
	n.TimerTween = TweenService:Create(timer, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.fromScale(0, 1)})
	n.TimerTween:Play()
	n.Scope:Delay(duration, function() n:Dismiss() end)
	if config.Island ~= false and self.Island then self.Island:Notify(config) end
	return n
end
function Tab:CreateNotification(config)
	local c = self:CreateButton(config)
	c.Kind = "Notification"
	c.Action.Text = c.Config.ButtonText or "Preview notification  ↗"
	c.Config.Callback = function() c.Library:Notify(config or {}) end
	function c:Show() if self.Enabled then return self.Library:Notify(config or {}) end end
	return c
end


--!nonstrict
--[[============================================================================
	NEJI HUB · SIGNATURE → BLOB → DYNAMIC ISLAND   (LocalScript)
	----------------------------------------------------------------------------
	Diễn hoạt mở đầu:
	  1. Chữ ký "NEJI HUB": chữ in hoa viết tay đọc RÕ "NEJI HUB", nét bo mềm
	     bằng spline, nghiêng italic, hơi xoay/lệch chân từng chữ, cuối cùng là
	     nét vút lớn dưới chân + cú hất bút. Đầu bút chạy tới đâu mới có nét
	     tới đó (không hiện sẵn cả chữ).
	     Chưa vẽ tới đâu thì chưa có nét ở đó -> KHÔNG hiện sẵn cả chữ.
	     Cuối cùng là nét vút (flourish) dưới chân chữ ký.
	     STEP = 2.2px -> các chấm nét nằm sát nhau, đường vẽ mượt không hở.
	     Chữ bị nắn "nguệch ngoạc": xoay/lệch/rung tay, vài chữ có nét chấm lại ngắn,
	     nét mảnh ở đầu-cuối dày ở giữa, đầu nét có chấm mực, cuối nét vuốt dài.
	  2. Viết xong -> chữ thu nhỏ thành 1 điểm, đồng thời 1 CỤC TRÒN gradient
	     bật ra (pop) kèm 2 vòng sáng lan.
	  3. Cục tròn BAY LÊN mép trên giữa màn hình, vừa bay vừa giãn thành
	     Dynamic Island (44×44 -> 244×44), nội dung island hiện dần.
	  4. Island chạy tiếp như bình thường: bấm để mở rộng, kéo để dời,
	     tự nới khi Beli/Fragment/Level thay đổi, RightShift ẩn/hiện.

	Dán vào 1 LocalScript là chạy. Không config, không hàm executor.
============================================================================]]

--============================================================================
-- BÁO LỖI RA MÀN HÌNH (script chết vẫn thấy lý do ngay trong game)
-- REAL CAR DATA extracted from Place2.rbxl / Workspace.chassis
-- 372 visual instances, 0 BaseParts
-- Center offset -72.70, 2.84, 79.63 | bounds -76.7, -68.7, 1.0, 4.7, 69.5, 89.8
local CAR_CENTER = Vector3.new(-42.6250, 2.8440, 51.0150)
local DATA = {
	{cls="Model",name="chassis",par=0},
	{cls="Model",name="Wheels",par=1},
	{cls="Part",name="RL",par=2,cf={-46.12,1.688,56.41, 0,-1,0, 0,0,-1, 1,0,0},sz={2.75, 2.75, 2.75},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Ball"},
	{cls="Model",name="Parts",par=3},
	{cls="Model",name="tire3",par=4},
	{cls="MeshPart",name="MeshPart",par=5,cf={-46.12,1.687,56.41, 1,0,0, 0,1,0, 0,0,1},sz={1.343, 2.779, 2.779},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266058589",ms={29.09, 60.18, 60.18}},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1211244820",face="Front"},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1211244820",face="Top"},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1211244820",face="Back"},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1211244820",face="Bottom"},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1266067303",face="Left"},
	{cls="Decal",name="Decal",par=6,tr=0,tex="rbxassetid://1266067303",face="Right"},
	{cls="MeshPart",name="MeshPart",par=5,cf={-46.29,1.687,56.41, -1,0,0, 0,-1,0, 0,0,1},sz={0.06465, 1.803, 1.793},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1115765687",tid="rbxassetid://1115765763",ms={8.645, 36.1, 36.1}},
	{cls="MeshPart",name="MeshPart",par=5,cf={-46.13,1.687,56.41, 1,0,0, 0,1,0, 0,0,1},sz={1.379, 2.299, 2.299},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266034993",tid="rbxassetid://1266035050",ms={29.86, 49.78, 49.78}},
	{cls="UnionOperation",name="Heat",par=4,cf={-46.29,1.688,56.41, 0,1,8.6e-05, -1,0,0, 0,-8.6e-05,1},sz={1.734, 0.1825, 1.734},col={196, 40, 28},mat="Neon",tr=1},
	{cls="PointLight",name="L",par=15,br=1,rg=0},
	{cls="Model",name="Fixed",par=3},
	{cls="Model",name="Model",par=17},
	{cls="MeshPart",name="MeshPart",par=18,cf={-46.26,1.82,56.34, 1,0,0, 0,1,0, 0,0,1},sz={0.3842, 1.134, 1.911},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266057329",tid="rbxassetid://1266056003",ms={8.32, 24.56, 41.38}},
	{cls="CylinderMesh",name="Mesh",par=3},
	{cls="Part",name="FR",par=2,cf={-39.18,1.626,45.4, 0,1,0, 0,0,-1, -1,0,0},sz={2.7, 2.7, 2.7},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Ball"},
	{cls="Model",name="Parts",par=21},
	{cls="Model",name="tire2",par=22},
	{cls="MeshPart",name="MeshPart",par=23,cf={-39.18,1.625,45.4, -1,0,0, 0,-0.9705,-0.2411, 0,-0.2411,0.9705},sz={1.294, 2.676, 2.676},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266058589",ms={29.09, 60.18, 60.18}},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1211244820",face="Front"},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1211244820",face="Top"},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1211244820",face="Back"},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1211244820",face="Bottom"},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1266067303",face="Left"},
	{cls="Decal",name="Decal",par=24,tr=0,tex="rbxassetid://1266067303",face="Right"},
	{cls="MeshPart",name="MeshPart",par=23,cf={-39.02,1.625,45.4, 1,0,0, 0,0.9705,-0.2411, 0,0.2411,0.9705},sz={0.06226, 1.736, 1.727},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1115765687",tid="rbxassetid://1115765763",ms={8.645, 36.1, 36.1}},
	{cls="MeshPart",name="MeshPart",par=23,cf={-39.18,1.625,45.4, -1,0,0, 0,-0.9705,-0.2411, 0,-0.2411,0.9705},sz={1.328, 2.214, 2.214},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266034993",tid="rbxassetid://1266035050",ms={29.86, 49.78, 49.78}},
	{cls="UnionOperation",name="Heat",par=22,cf={-39.02,1.626,45.4, 0,1,8.6e-05, -1,0,0, 0,-8.6e-05,1},sz={1.734, 0.1825, 1.734},col={196, 40, 28},mat="Neon",tr=1},
	{cls="PointLight",name="L",par=33,br=1,rg=0},
	{cls="Model",name="Fixed",par=21},
	{cls="Model",name="Model",par=35},
	{cls="MeshPart",name="MeshPart",par=36,cf={-39.04,1.543,46.17, -1,0,0, 0,-0.9705,-0.2411, 0,-0.2411,0.9705},sz={0.37, 1.105, 0.4207},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266055934",tid="rbxassetid://1266056003",ms={8.32, 24.84, 9.46}},
	{cls="CylinderMesh",name="Mesh",par=21},
	{cls="Part",name="RR",par=2,cf={-39.08,1.688,56.41, 0,1,0, 0,0,-1, -1,0,0},sz={2.75, 2.75, 2.75},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Ball"},
	{cls="Model",name="Parts",par=39},
	{cls="Model",name="tire4",par=40},
	{cls="MeshPart",name="MeshPart",par=41,cf={-39.08,1.687,56.41, -1,0,0, 0,-0.8616,-0.5076, 0,-0.5076,0.8616},sz={1.343, 2.779, 2.779},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266058589",ms={29.09, 60.18, 60.18}},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1211244820",face="Front"},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1211244820",face="Top"},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1211244820",face="Back"},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1211244820",face="Bottom"},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1266067303",face="Left"},
	{cls="Decal",name="Decal",par=42,tr=0,tex="rbxassetid://1266067303",face="Right"},
	{cls="MeshPart",name="MeshPart",par=41,cf={-38.92,1.687,56.41, 1,0,0, 0,0.8616,-0.5076, 0,0.5076,0.8616},sz={0.06465, 1.803, 1.793},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1115765687",tid="rbxassetid://1115765763",ms={8.645, 36.1, 36.1}},
	{cls="MeshPart",name="MeshPart",par=41,cf={-39.08,1.687,56.41, -1,0,0, 0,-0.8616,-0.5076, 0,-0.5076,0.8616},sz={1.379, 2.299, 2.299},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266034993",tid="rbxassetid://1266035050",ms={29.86, 49.78, 49.78}},
	{cls="UnionOperation",name="Heat",par=40,cf={-38.92,1.688,56.41, 0,1,8.6e-05, -1,0,0, 0,-8.6e-05,1},sz={1.734, 0.1825, 1.734},col={196, 40, 28},mat="Neon",tr=1},
	{cls="PointLight",name="L",par=51,br=1,rg=0},
	{cls="Model",name="Fixed",par=39},
	{cls="Model",name="Model",par=53},
	{cls="MeshPart",name="MeshPart",par=54,cf={-38.94,1.608,56.28, -1,0,0, 0,-0.8616,-0.5076, 0,-0.5076,0.8616},sz={0.3842, 1.134, 1.911},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266057329",tid="rbxassetid://1266056003",ms={8.32, 24.56, 41.38}},
	{cls="CylinderMesh",name="Mesh",par=39},
	{cls="Part",name="FL",par=2,cf={-46.05,1.626,45.4, 0,-1,0, 0,0,-1, 1,0,0},sz={2.7, 2.7, 2.7},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Ball"},
	{cls="Model",name="Fixed",par=57},
	{cls="Model",name="Model",par=58},
	{cls="MeshPart",name="MeshPart",par=59,cf={-46.18,1.518,46.17, 1,0,0, 0,1,0, 0,0,1},sz={0.37, 1.105, 0.4207},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266055934",tid="rbxassetid://1266056003",ms={8.32, 24.84, 9.46}},
	{cls="Model",name="Parts",par=57},
	{cls="UnionOperation",name="Heat",par=61,cf={-46.2,1.626,45.4, 0,1,8.6e-05, -1,0,0, 0,-8.6e-05,1},sz={1.734, 0.1825, 1.734},col={196, 40, 28},mat="Neon",tr=1},
	{cls="PointLight",name="L",par=62,br=1,rg=0},
	{cls="Model",name="tire1",par=61},
	{cls="MeshPart",name="MeshPart",par=64,cf={-46.05,1.625,45.4, 1,0,0, 0,1,0, 0,0,1},sz={1.294, 2.676, 2.676},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266058589",ms={29.09, 60.18, 60.18}},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1211244820",face="Front"},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1211244820",face="Top"},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1211244820",face="Back"},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1211244820",face="Bottom"},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1266067303",face="Left"},
	{cls="Decal",name="Decal",par=65,tr=0,tex="rbxassetid://1266067303",face="Right"},
	{cls="MeshPart",name="MeshPart",par=64,cf={-46.2,1.625,45.4, -1,0,0, 0,-1,0, 0,0,1},sz={0.06226, 1.736, 1.727},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1115765687",tid="rbxassetid://1115765763",ms={8.645, 36.1, 36.1}},
	{cls="MeshPart",name="MeshPart",par=64,cf={-46.05,1.625,45.4, 1,0,0, 0,1,0, 0,0,1},sz={1.328, 2.214, 2.214},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266034993",tid="rbxassetid://1266035050",ms={29.86, 49.78, 49.78}},
	{cls="CylinderMesh",name="Mesh",par=57},
	{cls="Model",name="Body",par=1},
	{cls="Part",name="SW",par=75,cf={-44.15,3.141,48.94, 0.006776,-0.9995,-0.03021, 0.9688,-0.0009281,0.248, -0.2479,-0.03095,0.9683},sz={0.8, 0.8, 0.05},col={248, 248, 248},mat="Plastic",tr=1,shape="Block"},
	{cls="Model",name="Exhaust",par=75},
	{cls="Part",name="Backfire2",par=77,cf={-43.17,1.586,59.62, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.4897, 0.1768},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="Part",name="BFLight2",par=77,cf={-43.17,1.705,59.49, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.1768, 0.1768},col={163, 162, 165},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="SpotLight",name="SpotLight",par=79,face="Top",br=70,rg=7,ag=120},
	{cls="SpecialMesh",name="Mesh",par=79,sc={0.9565, 0.9565, 0.9565},off={0, 0, 0}},
	{cls="Part",name="Backfire1",par=77,cf={-42.07,1.586,59.62, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.4897, 0.1768},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="Part",name="BFLight1",par=77,cf={-42.07,1.705,59.49, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.1768, 0.1768},col={163, 162, 165},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="SpotLight",name="SpotLight",par=83,face="Top",br=70,rg=7,ag=120},
	{cls="SpecialMesh",name="Mesh",par=83,sc={0.9565, 0.9565, 0.9565},off={0, 0, 0}},
	{cls="Model",name="Exhaust2",par=75},
	{cls="Part",name="Backfire1",par=86,cf={-42.62,1.706,59.62, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.4897, 0.1768},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="Part",name="BFLight1",par=86,cf={-42.62,1.825,59.49, 1,0,0, 0,0,-1, 0,1,0},sz={0.1768, 0.1768, 0.1768},col={163, 162, 165},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="SpotLight",name="SpotLight",par=88,face="Top",br=70,rg=7,ag=120},
	{cls="SpecialMesh",name="Mesh",par=88,sc={0.9565, 0.9565, 0.9565},off={0, 0, 0}},
	{cls="Seat",name="Seat",par=75,cf={-41.09,1.009,51.28, 1,0,0, 0,1,0, 0,0,1},sz={0.94, 0.05, 0.9},col={27, 42, 53},mat="Plastic",tr=1,shape="Block"},
	{cls="Model",name="Model",par=75},
	{cls="Model",name="engine",par=92},
	{cls="MeshPart",name="MeshPart",par=93,cf={-43.89,3.589,54.97, 1,0,0, 0,1,0, 0,0,1},sz={2.394, 1.468, 3.766},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265572116",tid="rbxassetid://1265672665",ms={58.59, 35.93, 92.16}},
	{cls="MeshPart",name="MeshPart",par=93,cf={-41.88,3.548,54.97, 1,0,0, 0,1,0, 0,0,1},sz={3.358, 1.55, 3.766},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265571251",tid="rbxassetid://1265672665",ms={82.18, 37.93, 92.16}},
	{cls="MeshPart",name="engine",par=93,cf={-42.62,3.366,56.35, 1,0,0, 0,1,0, 0,0,1},sz={7.153, 2.64, 6.843},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265569846",tid="rbxassetid://1265672665",ms={175.1, 64.61, 167.5}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.15,42.13, 1,0,0, 0,1,0, 0,0,1},sz={7.915, 0.9565, 3.681},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264626444",ms={193.7, 23.41, 90.1}},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=97,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.78,53.28, 1,0,0, 0,1,0, 0,0,1},sz={8.424, 3.831, 12.97},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264718809",ms={206.2, 93.77, 317.4}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.73,2.9,43.93, 1,0,0, 0,1,0, 0,0,1},sz={4.526, 0.8662, 1.481},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265407769",ms={110.8, 21.2, 36.25}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.298,44.6, 1,0,0, 0,1,0, 0,0,1},sz={8.198, 2.381, 5.812},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264733961",ms={200.6, 58.27, 142.2}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.908,48.12, 1,0,0, 0,1,0, 0,0,1},sz={9.202, 0.9153, 0.9304},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265388620",ms={225.2, 22.4, 22.77}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.982,48.15, 1,0,0, 0,1,0, 0,0,1},sz={7.101, 1.647, 6.987},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265400728",ms={173.8, 40.31, 171}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,4.679,53.34, 1,0,0, 0,1,0, 0,0,1},sz={4.284, 0.3726, 2.094},col={159, 161, 172},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265414171",ms={104.8, 9.12, 51.26}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.013,43.7, 1,0,0, 0,1,0, 0,0,1},sz={8.104, 1.725, 1.792},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264709608",ms={198.3, 42.23, 43.86}},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=110,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-40.55,2.061,58.62, 1,0,0, 0,1,0, 0,0,1},sz={4.15, 2.691, 3.536},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264699422",ms={101.6, 65.87, 86.55}},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=117,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Model",name="Model",par=92},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.38,3.328,45, 1,0,0, 0,1,0, 0,0,1},sz={5.921, 0.3265, 1.249},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265402871",ms={144.9, 7.99, 30.58}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.862,58.41, 1,0,0, 0,1,0, 0,0,1},sz={3.188, 0.7224, 1.41},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265428932",ms={78.02, 17.68, 34.51}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.474,49.48, 1,0,0, 0,1,0, 0,0,1},sz={8.178, 2.692, 5.91},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264779651",ms={200.2, 65.88, 144.6}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.088,58.13, 1,0,0, 0,1,0, 0,0,1},sz={2.622, 0.713, 2.222},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264707209",ms={64.16, 17.45, 54.38}},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=128,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.86,42.38, 1,0,0, 0,1,0, 0,0,1},sz={8.133, 1.933, 4.1},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264735687",ms={199, 47.32, 100.3}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-46.33,3.293,52.83, 1,0,0, 0,1,0, 0,0,1},sz={0.1226, 0.266, 0.6488},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264750334",ms={3, 6.51, 15.88}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.894,48.33, 1,0,0, 0,1,0, 0,0,1},sz={6.938, 1.434, 6.686},col={17, 17, 17},mat="SmoothPlastic",tr=0.8,mid="rbxassetid://1266003124",ms={169.8, 35.09, 163.6}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.695,50.94, 1,0,0, 0,1,0, 0,0,1},sz={8.222, 4.017, 18.1},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265365362",ms={201.2, 98.31, 442.9}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.81,42.43, 1,0,0, 0,1,0, 0,0,1},sz={7.537, 2.037, 3.657},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265386516",ms={184.5, 49.85, 89.49}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.868,51.12, 1,0,0, 0,1,0, 0,0,1},sz={9.286, 2.157, 7.776},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264739866",ms={227.3, 52.78, 190.3}},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=140,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.034,50.89, 1,0,0, 0,1,0, 0,0,1},sz={8.416, 0.704, 8.275},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264651729",ms={206, 17.23, 202.5}},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=147,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-44.7,2.061,58.62, 1,0,0, 0,1,0, 0,0,1},sz={4.15, 2.691, 3.536},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264701433",ms={101.6, 65.87, 86.55}},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=154,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.903,59.41, 1,0,0, 0,1,0, 0,0,1},sz={4.085, 1.177, 1.878},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264768120",ms={99.98, 28.81, 45.97}},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=161,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-43.62,2.269,47.79, 1,0,0, 0,1,0, 0,0,1},sz={5.816, 2.842, 6.697},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265609703",tid="rbxassetid://1265590396",ms={142.3, 69.55, 163.9}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-40.48,2.771,48.8, 1,0,0, 0,1,0, 0,0,1},sz={3.824, 3.934, 7.633},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265643321",tid="rbxassetid://1265590396",ms={93.59, 96.29, 186.8}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-44.1,2.705,47.91, 1,0,0, 0,1,0, 0,0,1},sz={5.071, 3.779, 5.947},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265645074",tid="rbxassetid://1265590396",ms={124.1, 92.49, 145.6}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.688,55.11, 1,0,0, 0,1,0, 0,0,1},sz={3.37, 0.4572, 3.746},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265649871",ms={82.48, 11.19, 91.69}},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=171,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.63,49.02, 1,0,0, 0,1,0, 0,0,1},sz={8.159, 3.6, 6.846},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265651183",ms={199.7, 88.1, 167.6}},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=178,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-38.63,2.085,43.73, 1,0,0, 0,1,0, 0,0,1},sz={0.05761, 0.1692, 0.6276},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265846414",tid="rbxassetid://1265844960",ms={1.41, 4.14, 15.36}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.124,48.38, 1,0,0, 0,1,0, 0,0,1},sz={5.626, 0.5255, 1.138},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265812621",tid="rbxassetid://1265812695",ms={137.7, 12.86, 27.86}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.757,43.19, 1,0,0, 0,1,0, 0,0,1},sz={5.594, 1.442, 3.846},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265654280",ms={136.9, 35.3, 94.12}},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=187,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.755,55.25, 1,0,0, 0,1,0, 0,0,1},sz={8.325, 3.835, 10.03},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265477455",ms={203.7, 93.87, 245.6}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-44.31,2.772,50.81, 1,0,0, 0,1,0, 0,0,1},sz={4.737, 3.935, 4.574},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265646052",tid="rbxassetid://1265590396",ms={115.9, 96.31, 111.9}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.598,59.39, 1,0,0, 0,1,0, 0,0,1},sz={1.983, 1.179, 1.793},col={159, 161, 172},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265439122",ms={48.54, 28.85, 43.89}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.73,58.41, 1,0,0, 0,1,0, 0,0,1},sz={7.165, 1.121, 0.05308},col={91, 93, 105},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265470704",ms={175.4, 27.44, 0}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.749,53.57, 1,0,0, 0,1,0, 0,0,1},sz={8.178, 3.058, 13.53},col={163, 162, 165},mat="SmoothPlastic",tr=0.1,mid="rbxassetid://1265546863",tid="rbxassetid://1265533877",ms={200.1, 74.83, 331.2}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.526,55.96, 1,0,0, 0,1,0, 0,0,1},sz={7.637, 2.47, 4.884},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265576254",tid="rbxassetid://1265576264",ms={186.9, 60.46, 119.5}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-44.1,2.749,50.17, 1,0,0, 0,1,0, 0,0,1},sz={4.593, 3.639, 3.948},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265638662",tid="rbxassetid://1265590396",ms={112.4, 89.05, 96.63}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.981,40.84, 1,0,0, 0,1,0, 0,0,1},sz={0.2721, 0.1777, 0.2586},col={163, 162, 165},mat="SmoothPlastic",tr=0.1,mid="rbxassetid://1265533811",tid="rbxassetid://1265533877",ms={6.66, 4.35, 6.33}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.568,54.72, 1,0,0, 0,1,0, 0,0,1},sz={1.13, 0.344, 2.445},col={163, 162, 165},mat="SmoothPlastic",tr=0.1,mid="rbxassetid://1265535701",tid="rbxassetid://1265533877",ms={27.66, 8.42, 59.83}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.366,42.59, 1,0,0, 0,1,0, 0,0,1},sz={7.513, 0.8817, 2.027},col={248, 248, 248},mat="SmoothPlastic",tr=0.9,mid="rbxassetid://1265989771",tid="rbxassetid://192248506",ms={183.9, 21.58, 49.6}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,3.904,48.33, 1,0,0, 0,1,0, 0,0,1},sz={6.971, 1.437, 6.691},col={17, 17, 17},mat="SmoothPlastic",tr=0.4,mid="rbxassetid://1265555585",ms={170.6, 35.18, 163.8}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.61,2.289,50.45, 1,0,0, 0,1,0, 0,0,1},sz={5.239, 2.595, 3.068},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265601985",tid="rbxassetid://1265590396",ms={128.2, 63.52, 75.09}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.041,49.21, 1,0,0, 0,1,0, 0,0,1},sz={5.293, 2.553, 5.762},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265603713",tid="rbxassetid://1265590396",ms={129.5, 62.48, 141}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.373,43.01, 1,0,0, 0,1,0, 0,0,1},sz={8.124, 0.8634, 2.859},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265580091",ms={198.8, 21.13, 69.97}},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=207,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.204,43.62, 1,0,0, 0,1,0, 0,0,1},sz={6.651, 2.561, 3.982},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265599389",tid="rbxassetid://1265590396",ms={162.8, 62.69, 97.46}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-41.06,2.757,48.55, 1,0,0, 0,1,0, 0,0,1},sz={4.682, 3.59, 7.254},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265606520",tid="rbxassetid://1265590396",ms={114.6, 87.86, 177.5}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.355,58.78, 1,0,0, 0,1,0, 0,0,1},sz={3.188, 1.866, 2.162},col={91, 93, 105},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265442067",ms={78.02, 45.67, 52.92}},
	{cls="Model",name="hood",par=92},
	{cls="MeshPart",name="trunk",par=217,cf={-42.62,4.087,56.23, 1,0,0, 0,1,0, 0,0,1},sz={3.685, 0.4719, 2.192},col={17, 17, 17},mat="SmoothPlastic",tr=0.4,mid="rbxassetid://1265554617",ms={90.18, 11.55, 53.65}},
	{cls="MeshPart",name="trunk",par=217,cf={-42.62,4.105,56.36, 1,0,0, 0,1,0, 0,0,1},sz={4.034, 0.7469, 3.589},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264773654",ms={98.74, 18.28, 87.83}},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=219,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="MeshPart",name="trunk",par=217,cf={-42.62,4.088,56.07, 1,0,0, 0,1,0, 0,0,1},sz={4.698, 1.242, 6.108},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264786616",ms={115, 30.4, 149.5}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-45.55,2.374,42.78, 1,0,0, 0,1,0, 0,0,1},sz={1.699, 0.9103, 2.315},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265978412",tid="rbxassetid://1265844960",ms={41.59, 22.28, 56.66}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-39.7,2.374,42.78, 1,0,0, 0,1,0, 0,0,1},sz={1.699, 0.9103, 2.315},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265977421",tid="rbxassetid://1265844960",ms={41.59, 22.28, 56.66}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,4.262,53.19, 1,0,0, 0,1,0, 0,0,1},sz={6.19, 1.448, 3.147},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265999894",ms={151.5, 35.45, 77.03}},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=230,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.583,55.36, 1,0,0, 0,1,0, 0,0,1},sz={8.165, 1.431, 9.772},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265975926",tid="rbxassetid://1265844960",ms={199.8, 35.03, 239.2}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-46.62,2.085,43.73, 1,0,0, 0,1,0, 0,0,1},sz={0.05761, 0.1692, 0.6276},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265844884",tid="rbxassetid://1265844960",ms={1.41, 4.14, 15.36}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.762,49.39, 1,0,0, 0,1,0, 0,0,1},sz={6.973, 2.048, 4.213},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266082037",ms={170.7, 50.13, 103.1}},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=239,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,1.444,59.41, 1,0,0, 0,1,0, 0,0,1},sz={0.6848, 0.1565, 0.2063},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265997336",tid="rbxassetid://1265997343",ms={16.76, 3.83, 5.05}},
	{cls="Model",name="Picture Frame",par=92},
	{cls="Part",name="Picture",par=247,cf={-42.62,1.796,43.15, -0.9999,-0.003523,0.01315, 0,0.9659,0.2588, -0.01361,0.2588,-0.9658},sz={0.8, 1.2, 0.2},col={241, 231, 199},mat="SmoothPlastic",tr=0,shape="Block"},
	{cls="Decal",name="Decal",par=248,tr=0,tex="rbxassetid://1267195008",face="Back"},
	{cls="Part",name="Box",par=247,cf={-42.62,1.846,43.2, -0.9999,0,0.01361, 0,1,0, -0.01361,0,-0.9999},sz={1, 1.5, 1},col={163, 162, 165},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="UnionOperation",name="Frame",par=247,cf={-42.62,1.809,43.1, -0.9999,-0.003523,0.01315, 0,0.9659,0.2588, -0.01361,0.2588,-0.9658},sz={1, 1.4, 0.2},col={90, 76, 66},mat="Wood",tr=0},
	{cls="UnionOperation",name="Stand",par=247,cf={-42.62,1.396,43.35, -0.9999,0.003523,0.01315, 0,0.9659,-0.2588, -0.01361,-0.2588,-0.9658},sz={0.7, 0.6, 0.1},col={27, 42, 53},mat="SmoothPlastic",tr=0},
	{cls="Part",name="Back",par=247,cf={-42.62,1.783,43.2, -0.9999,-0.003523,0.01315, 0,0.9659,0.2588, -0.01361,0.2588,-0.9658},sz={0.85, 1.25, 0.2},col={90, 76, 66},mat="Wood",tr=0,shape="Block"},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.554,49.92, 1,0,0, 0,1,0, 0,0,1},sz={5.965, 1.024, 2.435},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265809803",ms={146, 25.05, 59.59}},
	{cls="MeshPart",name="MeshPart",par=92,cf={-42.62,2.677,51.86, 1,0,0, 0,1,0, 0,0,1},sz={8.187, 1.353, 16.89},col={248, 248, 248},mat="SmoothPlastic",tr=0.9,mid="rbxassetid://1265990926",ms={200.4, 33.11, 413.3}},
	{cls="Model",name="TK",par=75},
	{cls="MeshPart",name="RB",par=256,cf={-40.2,3.022,59.41, 1,0,0, 0,1,0, 0,0,1},sz={2.651, 0.4719, 1.547},col={151, 0, 0},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265855231",ms={64.89, 11.55, 37.85}},
	{cls="SurfaceLight",name="Light",par=257,face="Back",br=3,rg=15,ag=50},
	{cls="MeshPart",name="Brake",par=256,cf={-45.04,3.022,59.44, 1,0,0, 0,1,0, 0,0,1},sz={2.657, 0.4719, 1.567},col={151, 0, 0},mat="SmoothPlastic",tr=0.6,mid="rbxassetid://1265969997",ms={65.02, 11.55, 38.36}},
	{cls="SurfaceLight",name="Light",par=259,face="Back",br=3,rg=15,ag=50},
	{cls="MeshPart",name="RLeft",par=256,cf={-45.04,3.022,59.43, 1,0,0, 0,1,0, 0,0,1},sz={2.657, 0.4719, 1.567},col={196, 40, 28},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265969997",ms={65.02, 11.55, 38.36}},
	{cls="MeshPart",name="Reverse",par=256,cf={-43.52,2.888,59.9, 1,0,0, 0,1,0, 0,0,1},sz={0.2452, 0.05308, 0.05308},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265974479",ms={6, 0.5, 0.01001}},
	{cls="SpotLight",name="Light",par=262,face="Back",br=1,rg=16,ag=90},
	{cls="MeshPart",name="RRight",par=256,cf={-40.2,3.022,59.43, 1,0,0, 0,1,0, 0,0,1},sz={2.651, 0.4719, 1.547},col={196, 40, 28},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265855231",ms={64.89, 11.55, 37.85}},
	{cls="Model",name="Lights",par=75},
	{cls="MeshPart",name="RunR",par=265,cf={-39.69,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.308},col={248, 248, 248},mat="Neon",tr=1,mid="rbxassetid://1265824551",ms={31.17, 12.4, 32.02}},
	{cls="MeshPart",name="RunL",par=265,cf={-45.56,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.315},col={248, 248, 248},mat="Neon",tr=1,mid="rbxassetid://1265825518",ms={31.17, 12.4, 32.18}},
	{cls="MeshPart",name="Brake",par=265,cf={-42.62,3.333,59.83, 1,0,0, 0,1,0, 0,0,1},sz={1.58, 0.05308, 0.05557},col={151, 0, 0},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265971832",ms={38.66, 0.97, 1.36}},
	{cls="MeshPart",name="HB",par=265,cf={-42.62,2.459,42.36, 1,0,0, 0,1,0, 0,0,1},sz={6.608, 0.297, 0.9095},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265839664",ms={161.7, 7.27, 22.26}},
	{cls="Part",name="L",par=265,cf={-42.63,1.698,42.26, 1,-1.058e-08,0.000149, -3.638e-12,1,7.1e-05, -0.000149,-7.1e-05,1},sz={1.107, 0.7793, 0.2002},col={248, 248, 248},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=270},
	{cls="SurfaceLight",name="SpotLight",par=270,face="Front",br=3,rg=10,ag=100},
	{cls="Part",name="L2",par=265,cf={-42.63,1.698,42.16, 1,-1.058e-08,0.000149, -3.638e-12,1,7.1e-05, -0.000149,-7.1e-05,1},sz={1.107, 0.7793, 0.2002},col={248, 248, 248},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="SurfaceLight",name="SpotLight",par=273,face="Front",br=3,rg=30,ag=100},
	{cls="BlockMesh",name="Mesh",par=273},
	{cls="MeshPart",name="B",par=265,cf={-45.56,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.315},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265825518",ms={31.17, 12.4, 32.18}},
	{cls="Model",name="TK2",par=75},
	{cls="MeshPart",name="Brake",par=277,cf={-40.2,3.022,59.44, 1,0,0, 0,1,0, 0,0,1},sz={2.651, 0.4719, 1.547},col={151, 0, 0},mat="SmoothPlastic",tr=0.6,mid="rbxassetid://1265855231",ms={64.89, 11.55, 37.85}},
	{cls="SurfaceLight",name="Light",par=278,face="Back",br=3,rg=15,ag=50},
	{cls="MeshPart",name="RB",par=277,cf={-45.04,3.022,59.41, 1,0,0, 0,1,0, 0,0,1},sz={2.657, 0.4719, 1.567},col={151, 0, 0},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265969997",ms={65.02, 11.55, 38.36}},
	{cls="SurfaceLight",name="Light",par=280,face="Back",br=3,rg=15,ag=50},
	{cls="MeshPart",name="RRight",par=277,cf={-40.2,3.022,59.43, 1,0,0, 0,1,0, 0,0,1},sz={2.651, 0.4719, 1.547},col={196, 40, 28},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265855231",ms={64.89, 11.55, 37.85}},
	{cls="MeshPart",name="RLeft",par=277,cf={-45.04,3.022,59.43, 1,0,0, 0,1,0, 0,0,1},sz={2.657, 0.4719, 1.567},col={196, 40, 28},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265969997",ms={65.02, 11.55, 38.36}},
	{cls="MeshPart",name="Reverse",par=277,cf={-43.52,2.888,59.9, 1,0,0, 0,1,0, 0,0,1},sz={0.2452, 0.05308, 0.05308},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265974479",ms={6, 0.5, 0.01001}},
	{cls="SpotLight",name="Light",par=284,face="Back",br=1,rg=16,ag=90},
	{cls="Model",name="Lights2",par=75},
	{cls="MeshPart",name="RunR",par=286,cf={-39.69,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.308},col={248, 248, 248},mat="Neon",tr=1,mid="rbxassetid://1265824551",ms={31.17, 12.4, 32.02}},
	{cls="MeshPart",name="RunL",par=286,cf={-45.56,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.315},col={248, 248, 248},mat="Neon",tr=1,mid="rbxassetid://1265825518",ms={31.17, 12.4, 32.18}},
	{cls="MeshPart",name="Brake",par=286,cf={-42.62,3.333,59.83, 1,0,0, 0,1,0, 0,0,1},sz={1.58, 0.05308, 0.05557},col={151, 0, 0},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265971832",ms={38.66, 0.97, 1.36}},
	{cls="MeshPart",name="HB",par=286,cf={-42.62,2.459,42.36, 1,0,0, 0,1,0, 0,0,1},sz={6.608, 0.297, 0.9095},col={248, 248, 248},mat="SmoothPlastic",tr=1,mid="rbxassetid://1265839664",ms={161.7, 7.27, 22.26}},
	{cls="Part",name="L",par=286,cf={-42.63,1.698,42.26, 1,-1.058e-08,0.000149, -3.638e-12,1,7.1e-05, -0.000149,-7.1e-05,1},sz={1.107, 0.7793, 0.2002},col={248, 248, 248},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=291},
	{cls="SurfaceLight",name="SpotLight",par=291,face="Front",br=3,rg=10,ag=100},
	{cls="Part",name="L2",par=286,cf={-42.63,1.698,42.16, 1,-1.058e-08,0.000149, -3.638e-12,1,7.1e-05, -0.000149,-7.1e-05,1},sz={1.107, 0.7793, 0.2002},col={248, 248, 248},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="SurfaceLight",name="SpotLight",par=294,face="Front",br=3,rg=30,ag=100},
	{cls="BlockMesh",name="Mesh",par=294},
	{cls="MeshPart",name="B",par=286,cf={-39.69,2.415,42.42, 1,0,0, 0,1,0, 0,0,1},sz={1.274, 0.5067, 1.308},col={248, 248, 248},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265824551",ms={31.17, 12.4, 32.02}},
	{cls="Part",name="HK",par=75,cf={-42.63,3.305,44.93, 0,0,1, 0,1,-0, -1,0,0},sz={0.2, 0.2, 0.2},col={117, 0, 0},mat="Plastic",tr=1,shape="Block"},
	{cls="Model",name="Misc",par=1},
	{cls="Model",name="SW",par=299},
	{cls="Model",name="Model",par=300},
	{cls="MeshPart",name="steering wheel",par=301,cf={-44.15,3.231,48.94, 1,0,0, 0,1,0, 0,0,1},sz={1.459, 1.37, 0.6762},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265596479",tid="rbxassetid://1265590396",ms={35.72, 33.53, 16.55}},
	{cls="MeshPart",name="steering wheel",par=301,cf={-44.15,2.903,49, 1,0,0, 0,1,0, 0,0,1},sz={1.135, 0.7134, 0.5516},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1266079886",ms={27.79, 17.46, 13.5}},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=303,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="steering wheel",par=301,cf={-44.16,3.257,49.14, 1,0,0, 0,1,0, 0,0,1},sz={0.1516, 0.152, 0.05308},col={163, 162, 165},mat="SmoothPlastic",tr=0.1,mid="rbxassetid://1265539844",tid="rbxassetid://1265533877",ms={3.71, 3.72, 1.24}},
	{cls="Part",name="SS",par=300,cf={-44.15,3.141,48.94, 0.006731,-0.9995,-0.03018, 0.9688,-0.0009624,0.248, -0.2479,-0.0309,0.9683},sz={0.8, 0.8, 0.06},col={248, 248, 248},mat="Plastic",tr=1,shape="Block"},
	{cls="Model",name="Spoiler",par=299},
	{cls="Model",name="Wing",par=312},
	{cls="UnionOperation",name="Union",par=313,cf={-42.62,3.455,59.41, -1.382e-10,-1,2.419e-10, -0.8873,0,-0.4611, 0.4611,3.141e-10,-0.8873},sz={0.07317, 2.173, 0.3752},col={91, 93, 105},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Color",par=313,cf={-42.62,3.605,59.34, -1,7.276e-11,2.701e-10, 0,0.9722,-0.2344, 3.141e-10,-0.2344,-0.9722},sz={5.227, 0.4086, 0.8188},col={151, 0, 0},mat="SmoothPlastic",tr=1},
	{cls="MeshPart",name="spoiler",par=313,cf={-42.62,3.492,59.62, 1,0,0, 0,1,0, 0,0,1},sz={5.522, 0.2104, 1.393},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264771106",ms={135.1, 5.15, 34.1}},
	{cls="Model",name="A",par=312},
	{cls="Part",name="A1",par=317,cf={-42.63,1.712,61.19, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=318},
	{cls="Part",name="A3",par=317,cf={-42.63,1.712,61.19, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=320},
	{cls="Part",name="A2",par=317,cf={-42.63,2.835,59.73, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=322},
	{cls="Part",name="D",par=312,cf={-42.62,3.02,59.62, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=324},
	{cls="Model",name="B",par=312},
	{cls="Part",name="B3",par=326,cf={-42.62,3.309,59.87, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=327},
	{cls="Part",name="B1",par=326,cf={-42.62,3.309,59.87, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=329},
	{cls="Part",name="B2",par=326,cf={-42.62,2.284,59.08, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=331},
	{cls="UnionOperation",name="B",par=326,cf={-42.62,3.422,59.72, -2.256e-10,2.146e-10,1, -0.6237,-0.7817,0, 0.7817,-0.6237,-3.141e-10},sz={0.5219, 0.06614, 2.161},col={27, 42, 53},mat="SmoothPlastic",tr=1},
	{cls="Model",name="C",par=312},
	{cls="UnionOperation",name="C",par=334,cf={-42.62,2.96,59.66, -2.256e-10,-1,2.146e-10, -0.6237,0,-0.7817, 0.7817,3.141e-10,-0.6237},sz={0.4341, 2.127, 0.06614},col={91, 93, 105},mat="SmoothPlastic",tr=1},
	{cls="Part",name="C1",par=334,cf={-42.62,2.974,59.7, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=336},
	{cls="Part",name="C3",par=334,cf={-42.62,2.974,59.7, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=338},
	{cls="Part",name="C2",par=334,cf={-42.62,1.949,58.91, -5.9e-05,-6.7e-05,1, -0.6085,-0.7936,-8.907e-05, 0.7936,-0.6085,6.054e-06},sz={0.2185, 0.2185, 0.2185},col={17, 17, 17},mat="SmoothPlastic",tr=1,shape="Block"},
	{cls="BlockMesh",name="Mesh",par=340},
	{cls="Model",name="Base",par=312},
	{cls="UnionOperation",name="Union",par=342,cf={-43.66,2.316,59.15, -2.256e-10,2.146e-10,1, -0.6237,-0.7817,0, 0.7817,-0.6237,-3.141e-10},sz={0.1701, 1.563, 0.01664},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-43.66,2.896,59.26, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1281, 0.01642, 0.1621},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-43.66,2.461,58.93, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1488, 0.0124, 0.8942},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-43.65,2.899,59.26, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1281, 0.01642, 0.1621},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-43.65,2.462,58.94, 2.547e-10,1,1.965e-10, 0.6219,0,-0.7831, -0.7831,-3.141e-10,-0.6219},sz={0.1488, 0.0124, 0.8942},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-41.59,2.316,59.15, -2.256e-10,2.146e-10,1, -0.6237,-0.7817,0, 0.7817,-0.6237,-3.141e-10},sz={0.1701, 1.563, 0.01664},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-41.58,2.896,59.26, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1281, 0.01642, 0.1621},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-41.58,2.461,58.94, 2.547e-10,1,1.965e-10, 0.6219,0,-0.7831, -0.7831,-3.141e-10,-0.6219},sz={0.1488, 0.0124, 0.8942},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-41.59,2.899,59.26, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1281, 0.01642, 0.1621},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-41.59,2.462,58.94, 2.547e-10,-1,-1.965e-10, 0.6219,0,0.7831, -0.7831,3.141e-10,0.6219},sz={0.1488, 0.0124, 0.8942},col={17, 17, 17},mat="SmoothPlastic",tr=1},
	{cls="UnionOperation",name="Union",par=342,cf={-42.62,2.44,59.08, -2.256e-10,2.146e-10,1, -0.6237,-0.7817,0, 0.7817,-0.6237,-3.141e-10},sz={0.501, 1.656, 2.179},col={163, 162, 165},mat="SmoothPlastic",tr=1},
	{cls="MeshPart",name="spoiler",par=342,cf={-42.62,2.936,59.22, 1,0,0, 0,1,0, 0,0,1},sz={4.322, 1.033, 1.256},col={17, 17, 17},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265461421",ms={105.8, 25.29, 30.74}},
	{cls="Model",name="HK",par=299},
	{cls="Part",name="SS",par=355,cf={-42.63,3.305,44.93, 0,0,1, 0,1,-0, -1,0,0},sz={0.2, 0.2, 0.2},col={117, 0, 0},mat="Plastic",tr=1,shape="Block"},
	{cls="MeshPart",name="MeshPart",par=355,cf={-42.62,2.83,43.19, 1,0,0, 0,1,0, 0,0,1},sz={5.555, 1.299, 3.822},col={199, 212, 228},mat="SmoothPlastic",tr=0,mid="rbxassetid://1264784895",ms={136, 31.8, 93.55}},
	{cls="MeshPart",name="MeshPart",par=355,cf={-42.62,2.566,42.86, 1,0,0, 0,1,0, 0,0,1},sz={4.7, 0.5994, 1.074},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265652651",ms={115, 14.67, 26.28}},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=358,tr=0,tex="rbxassetid://652553983",face="Top"},
	{cls="MeshPart",name="MeshPart",par=355,cf={-42.62,2.822,43.19, 1,0,0, 0,1,0, 0,0,1},sz={5.555, 1.283, 3.82},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265590339",tid="rbxassetid://1265590396",ms={136, 31.41, 93.48}},
	{cls="MeshPart",name="MeshPart",par=355,cf={-42.62,2.561,42.86, 1,0,0, 0,1,0, 0,0,1},sz={4.639, 0.5847, 1.042},col={163, 162, 165},mat="SmoothPlastic",tr=0,mid="rbxassetid://1265578613",ms={113.5, 14.31, 25.5}},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Left"},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Front"},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Bottom"},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Back"},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Right"},
	{cls="Decal",name="Decal",par=366,tr=0,tex="rbxassetid://652553983",face="Top"}
}

local AssetService = game:GetService("AssetService")
local meshCache = {}
local building = false

local function getMeshTemplate(meshId)
	local cached = meshCache[meshId]
	if cached ~= nil then return cached or nil end
	local ok, mp = pcall(function()
		return AssetService:CreateMeshPartAsync(Content.fromUri(meshId))
	end)
	if ok and typeof(mp) == "Instance" and mp:IsA("MeshPart") then
		meshCache[meshId] = mp
		return mp
	end
	meshCache[meshId] = false
	return nil
end

local function orthoCFrame(c, ox, oy, oz)
	local pos = Vector3.new(c[1] - ox, c[2] - oy, c[3] - oz)
	local x = Vector3.new(c[4], c[7], c[10])
	local y = Vector3.new(c[5], c[8], c[11])
	if x.Magnitude < 1e-6 or y.Magnitude < 1e-6 then return CFrame.new(pos) end
	x = x.Unit
	y = y - x * x:Dot(y)
	if y.Magnitude < 1e-6 then return CFrame.new(pos) end
	return CFrame.fromMatrix(pos, x, y.Unit)
end

-- Subtle factory-style color correction: neutral pearl paint, darker rubber,
-- and less blue-cast silver. Preserve glass and signal-light colors.
local function naturalCarColor(rgb)
	local r, g, b = rgb[1], rgb[2], rgb[3]
	if r >= 190 and g >= 195 and b >= 205 then
		-- Deep, natural automotive blue with a lighter blue highlight/trim.
		if r >= 240 then return Color3.fromRGB(48, 123, 205) end
		return Color3.fromRGB(30, 99, 184)
	elseif r >= 150 and r <= 175 and g >= 150 and g <= 175 and b >= 150 and b <= 180 then
		return Color3.fromRGB(148, 150, 153)
	elseif r <= 22 and g <= 22 and b <= 25 then
		return Color3.fromRGB(24, 24, 26)
	end
	return Color3.fromRGB(r, g, b)
end

local function buildCar()
	-- Load unique meshes concurrently; unavailable meshes use scaled SpecialMesh.
	local unique, pending = {}, 0
	for i = 2, #DATA do
		local id = DATA[i].mid
		if id and not unique[id] then unique[id] = true end
	end
	for id in pairs(unique) do
		pending += 1
		task.spawn(function()
			pcall(getMeshTemplate, id)
			pending -= 1
		end)
	end
	local deadline = os.clock() + 45
	while pending > 0 and os.clock() < deadline do task.wait() end

	local instances = {}
	local model = Instance.new("Model")
	model.Name = "chassis"
	instances[1] = model
	for i = 2, #DATA do
		local d = DATA[i]
		local inst
		if d.cls == "MeshPart" or d.cls == "Part" or d.cls == "UnionOperation" or d.cls == "Seat" then
			local real = false
			if d.mid then
				local tpl = meshCache[d.mid]
				if tpl then
					local ok, copy = pcall(function() return tpl:Clone() end)
					if ok then inst = copy; real = inst ~= nil end
				end
			end
			if not inst then inst = Instance.new("Part") end
			inst.Name = d.name
			if d.sz then inst.Size = Vector3.new(d.sz[1], d.sz[2], d.sz[3]) end
			if d.cf then inst.CFrame = orthoCFrame(d.cf, CAR_CENTER.X, CAR_CENTER.Y, CAR_CENTER.Z) end
			if d.col then inst.Color = naturalCarColor(d.col) end
			if d.mat then pcall(function() inst.Material = Enum.Material[d.mat] end) end
			if d.tr then inst.Transparency = tonumber(d.tr) end
			if d.shape and not real then pcall(function() inst.Shape = Enum.PartType[d.shape] end) end
			inst.Anchored = true; inst.CanCollide = false; inst.CanTouch = false
			inst.CanQuery = false; inst.Massless = true
			if real then
				if d.tid then pcall(function() inst.TextureID = d.tid end) end
			elseif d.mid then
				local sm = Instance.new("SpecialMesh")
				sm.MeshType = Enum.MeshType.FileMesh
				sm.MeshId = d.mid
				if d.tid then sm.TextureId = d.tid end
				if d.sz and d.ms then
					local function ratio(k)
						return d.ms[k] > 1e-4 and d.sz[k] / d.ms[k] or 1
					end
					sm.Scale = Vector3.new(ratio(1), ratio(2), ratio(3))
				end
				sm.Parent = inst
			end
		elseif d.cls == "Model" then
			inst = Instance.new("Model"); inst.Name = d.name
		elseif d.cls == "Decal" or d.cls == "Texture" then
			local parentData = DATA[d.par]
			if not (parentData and parentData.mid) then
				inst = Instance.new(d.cls); inst.Name = d.name
				if d.tex then inst.Texture = d.tex end
				if d.face then pcall(function() inst.Face = Enum.NormalId[d.face] end) end
				if d.tr then inst.Transparency = tonumber(d.tr) end
			end
		elseif d.cls == "PointLight" or d.cls == "SpotLight" or d.cls == "SurfaceLight" then
			inst = Instance.new(d.cls); inst.Name = d.name
			if d.br then inst.Brightness = tonumber(d.br) end
			if d.rg then inst.Range = tonumber(d.rg) end
			if d.ag then inst.Angle = tonumber(d.ag) end
			if d.face then pcall(function() inst.Face = Enum.NormalId[d.face] end) end
		elseif d.cls == "BlockMesh" or d.cls == "CylinderMesh" or d.cls == "SpecialMesh" then
			inst = Instance.new(d.cls); inst.Name = d.name
			if d.cls == "SpecialMesh" then inst.MeshType = Enum.MeshType.Brick end
			if d.sc then inst.Scale = Vector3.new(d.sc[1], d.sc[2], d.sc[3]) end
			if d.off then inst.Offset = Vector3.new(d.off[1], d.off[2], d.off[3]) end
		else
			inst = Instance.new("Folder"); inst.Name = d.name
		end
		instances[i] = inst
	end
	for i = 2, #DATA do
		local inst = instances[i]
		if inst then
			local parent = instances[DATA[i].par]
			inst.Parent = parent or model
		end
	end
	return model
end

local function BuildRealCar()
	if building then error("Xe đang được tạo, đợi một chút…", 0) end
	building = true
	local ok, result = pcall(buildCar)
	building = false
	if not ok then error(result, 0) end
	return result
end

-- NEJI MOTOR STUDIO: client-built car from embedded data (no external model needed).
-- BuildRealCar() constructs the full hierarchy purely on the client.
local RunService = game:GetService("RunService")
function Tab:CreateVehicleViewer(config)
	local c = self:_Row("VehicleViewer", config or {})
	c.Controls.Size = UDim2.new(1,0,0,math.max(210,finite(c.Config.Height,320)))
	c.Yaw, c.Pitch, c.Zoom = 38, 16, 2.1
	c.AutoRotate, c.RotationSpeed = c.Config.AutoRotate ~= false, 14
	c.Paint = c.Config.Color or Color3.fromRGB(57,185,231)
	c.PaintParts, c.LampParts, c.DoorParts = {}, {}, {}
	c.DoorsOpen, c.Headlights = false, true
	c.View = create("ViewportFrame", {Name = "MotorStudio", Size = UDim2.fromScale(1,1), BorderSizePixel = 0, Ambient = Color3.fromRGB(118,120,124), LightColor = Color3.fromRGB(255,249,239), LightDirection = Vector3.new(-0.7,-1,-0.55), Active = true}, c.Controls)
	c.Library:_Bind(c.View,"BackgroundColor3","Background"); corner(c.View,12)
	c.World = create("WorldModel", {Name = "ShowroomWorld"}, c.View)
	c.Camera = create("Camera", {FieldOfView = 35}, c.View); c.View.CurrentCamera = c.Camera
	c.Model = create("Model", {Name = "NEJI_GT_01"}, c.World)
	local function part(name,size,cf,color,material,parent,shape)
		local p = create("Part",{Name = name,Size = size,CFrame = cf,Color = color,Material = material or Enum.Material.SmoothPlastic,Anchored = true,CanCollide = false,CanTouch = false,CanQuery = false},parent or c.World)
		if shape then p.Shape = shape end
		return p
	end
	c.Stage = part("Display plinth",Vector3.new(0.16,12,12),CFrame.new(0,-0.08,0)*CFrame.Angles(0,0,math.rad(90)),Color3.fromRGB(36,43,58),Enum.Material.Metal,c.World,Enum.PartType.Cylinder)
	c.Loaded = false
	c.Bounds = Vector3.new(6,4,12)
	c.Target = Vector3.new(0,2,0)
	c.Status = text(c.Controls,"ĐANG TẠO XE…",12,{AnchorPoint = Vector2.new(0.5,0.5),Position = UDim2.fromScale(0.5,0.5),Size = UDim2.new(1,-30,0,100),TextWrapped = true,TextXAlignment = Enum.TextXAlignment.Center,ZIndex = 3})
	c.Library:_Text(c.Status,"Muted")
	function c:LoadModel(_source)
		if not self.Scope.Alive then return false, "Viewer đã bị hủy." end
		local clone
		local source
		do
			local storage = game:GetService("ReplicatedStorage")
			local assets = storage:FindFirstChild("NejiAssets")
			source = assets and assets:FindFirstChild("ShowcaseCar")
			if not source then source = workspace:FindFirstChild("chassis") end
			if source and source:IsA("Model") and source:FindFirstChildWhichIsA("BasePart", true) then
				source.Archivable = true
				local ok, c = pcall(function() return source:Clone() end)
				if ok and c then clone = c end
			end
		end
		if not clone then
			local ok, m = pcall(BuildRealCar)
			if not self.Scope.Alive then if ok and m then m:Destroy() end return false, "Viewer đã bị hủy." end
			if ok and m then clone = m; source = m else
				self.LoadError = "Không tìm thấy template và tạo Part thất bại: "..tostring(m)
				self.Status.Text = self.LoadError; self.Status.Visible = true
				return false, self.LoadError
			end
		end
		local success, reason = xpcall(function()
			for _, item in ipairs(clone:GetDescendants()) do
				if item:IsA("LuaSourceContainer") or item:IsA("Sound") or item:IsA("SoundEffect") or item:IsA("BodyMover") or item:IsA("Constraint") or item:IsA("JointInstance") or item:IsA("ClickDetector") or item:IsA("ProximityPrompt") then
					item:Destroy()
				elseif item:IsA("BasePart") then
					item.Anchored = true; item.CanCollide = false; item.CanTouch = false; item.CanQuery = false
					item.AssemblyLinearVelocity = Vector3.zero; item.AssemblyAngularVelocity = Vector3.zero
					if item:IsA("Seat") or item:IsA("VehicleSeat") then item.Disabled = true end
				elseif item:IsA("ParticleEmitter") then item.Enabled = false end
			end
			local cf, size = clone:GetBoundingBox()
			local pivotBefore = clone:GetPivot()
			clone:PivotTo(CFrame.new(-cf.Position + Vector3.new(0, size.Y/2, 0)) * pivotBefore)
			local paint, lamps, doors = {}, {}, {}
			local colorCounts, originalLamps = {}, {}
			for _, item in ipairs(clone:GetDescendants()) do
				if item:IsA("BasePart") then
					if item:GetAttribute("NejiPaintable") == true then table.insert(paint, item) end
					if item:GetAttribute("NejiHeadlight") == true then
						table.insert(lamps, item); originalLamps[item] = {Color = item.Color, Material = item.Material}
					end
					if item.Transparency < 0.9 then local hex = item.Color:ToHex(); colorCounts[hex] = (colorCounts[hex] or 0) + 1 end
				elseif item:IsA("Model") then
					local side = item:GetAttribute("NejiDoorSide")
					if side == -1 or side == 1 then table.insert(doors, {Model = item, Hinge = item:GetPivot(), Side = side}) end
				end
			end
			local doorTween = activeTweens[self.DoorAngle]; if doorTween then doorTween:Cancel() end
			self.DoorParts = {}; self.DoorAngle.Value = 0; self.DoorsOpen = false
			if self.Model then self.Model:Destroy() end
			if self.ModelRef and self.ModelRef.Parent then self.ModelRef:Destroy() end
			clone.Name = "ShowcaseCar"; clone.Parent = self.World
			self.Model, self.Source = clone, source
			self.ModelRef = clone
			self.Bounds, self.Target = size, Vector3.new(0, size.Y/2, 0)
			self.PaintParts, self.LampParts, self.DoorParts, self.OriginalLamps = paint, lamps, doors, originalLamps
			if paint[1] then self.Paint = paint[1].Color
			else
				local best, count
				for hex, n in pairs(colorCounts) do if not count or n > count then best, count = hex, n end end
				if best then self.Paint = Color3.fromHex(best) end
			end
			local diameter = math.max(size.X, size.Z) * 1.25
			self.Stage.Size = Vector3.new(0.16, diameter, diameter)
			self.Loaded, self.LoadError = true, nil
			self.Status.Visible = false; self.Dirty = true
			self.PartCount = #clone:GetDescendants()
		end, debug.traceback)
		if not success then
			pcall(function() clone:Destroy() end)
			self.LoadError = tostring(reason); self.Status.Text = self.LoadError; self.Status.Visible = true
			return false, self.LoadError
		end
		invoke(self.Config.ModelLoaded, self.Model, self.Source)
		return true
	end
	local badge = text(c.Controls,"PLACE2 / CLIENT-BUILT CAR",11,{Position = UDim2.fromOffset(14,12),Size = UDim2.new(1,-28,0,18),Font = Enum.Font.GothamBold}); c.Library:_Text(badge,"Accent")
	c.Hint = text(c.Controls,"KÉO ĐỂ XOAY  /  CUỘN ĐỂ ZOOM",10,{AnchorPoint = Vector2.new(0.5,1),Position = UDim2.new(0.5,0,1,-10),Size = UDim2.new(1,-20,0,16),TextXAlignment = Enum.TextXAlignment.Center}); c.Library:_Text(c.Hint,"Muted")
	c.Toolbar = create("Frame",{Size = UDim2.new(1,0,0,84),BackgroundTransparency = 1,LayoutOrder = 3},c.Frame)
	create("UIGridLayout",{CellSize = UDim2.new(1/3,-4,0,38),CellPadding = UDim2.fromOffset(6,6),SortOrder = Enum.SortOrder.LayoutOrder},c.Toolbar)
	c.DoorAngle = create("NumberValue",{Value = 0},c.World)
	c.Scope:Connect(c.DoorAngle.Changed,function(angle)
		for _,entry in ipairs(c.DoorParts) do entry.Model:PivotTo(entry.Hinge*CFrame.Angles(0,math.rad(-entry.Side*angle),0)) end
	end)
	function c:SetColor(color)
		if not self.Scope.Alive then return false,"Viewer đã bị hủy" end
		if #self.PaintParts == 0 then return false,"Đánh dấu NejiPaintable=true trên các BasePart muốn đổi màu trong model gốc, rồi LoadCar lại." end
		assert(typeof(color) == "Color3","SetColor expects Color3")
		self.Paint = color
		for _,p in ipairs(self.PaintParts) do p.Color = color end
		invoke(self.Config.ColorChanged,color); return true
	end
	function c:GetColor() return self.Paint end
	function c:SetAutoRotate(value) self.AutoRotate = value == true; if self.AutoButton then self.AutoButton.Text = self.AutoRotate and "Auto: ON" or "Auto: OFF" end; return self end
	function c:SetRotationSpeed(value) self.RotationSpeed = math.clamp(finite(value,14),-120,120); return self end
	function c:SetRotation(yaw,pitch) self.Yaw = finite(yaw,self.Yaw)%360; self.Pitch = math.clamp(finite(pitch,self.Pitch),-4,65); self.Dirty = true; return self end
	function c:GetRotation() return self.Yaw,self.Pitch end
	function c:SetZoom(value) self.Zoom = math.clamp(finite(value,1),0.65,10); self.Dirty = true; return self end
	function c:GetZoom() return self.Zoom end
	function c:ResetCamera() self:SetRotation(38,16); self:SetZoom(2.1); return self end
	function c:SetDoorsOpen(value)
		if not self.Scope.Alive then return false,"Viewer đã bị hủy" end
		if #self.DoorParts == 0 then return false,"Model chưa có rig cửa. Cần Model cửa có pivot tại bản lề và attribute NejiDoorSide = -1 hoặc 1." end
		self.DoorsOpen = value == true
		animate(self.DoorAngle,{Value = self.DoorsOpen and 58 or 0},0.4,Enum.EasingStyle.Sine)
		if self.DoorButton then self.DoorButton.Text = self.DoorsOpen and "Đóng cửa" or "Mở cửa" end
		return self
	end
	function c:SetHeadlights(value)
		if #self.LampParts == 0 then return false,"Gắn attribute NejiHeadlight=true trên các BasePart đèn trước, rồi LoadCar lại." end
		self.Headlights = value == true
		for _,p in ipairs(self.LampParts) do
			local original = self.OriginalLamps[p]
			p.Material = self.Headlights and Enum.Material.Neon or Enum.Material.SmoothPlastic
			p.Color = self.Headlights and original.Color or Color3.fromRGB(35,39,45)
		end
		return true
	end
	function c:SetStageVisible(value) self.Stage.Transparency = value == true and 0 or 1; return self end
	function c:SetFieldOfView(value) self.Camera.FieldOfView = math.clamp(finite(value,35),20,70); self.Dirty = true; return self end
	function c:GetModel() return self.Model end
	function c:SetLighting(ambient,light,direction)
		if typeof(ambient) == "Color3" then self.View.Ambient = ambient end
		if typeof(light) == "Color3" then self.View.LightColor = light end
		if typeof(direction) == "Vector3" and direction.Magnitude > 0 then self.View.LightDirection = direction.Unit end
		return self
	end
	function c:UpdateCamera()
		local aspect = math.max(0.2,self.View.AbsoluteSize.X/math.max(1,self.View.AbsoluteSize.Y))
		local fov = math.rad(self.Camera.FieldOfView/2)
		local radius = self.Bounds.Magnitude/2
		local distance = radius/(math.sin(fov)*math.min(1,aspect))*self.Zoom*1.08
		local yaw,pitch = math.rad(self.Yaw),math.rad(self.Pitch)
		local target = self.Target
		local orbit = Vector3.new(math.sin(yaw)*math.cos(pitch),math.sin(pitch),-math.cos(yaw)*math.cos(pitch))*distance
		self.Camera.CFrame = CFrame.lookAt(target+orbit,target)
		self.Dirty = false
	end
	local function tool(label,callback)
		local b = button(c.Toolbar,label,{Size = UDim2.fromOffset(80,38),LayoutOrder = #c.Toolbar:GetChildren()})
		corner(b,8); c.Library:_Bind(b,"BackgroundColor3","Secondary"); c.Library:_Text(b)
		c.Scope:Connect(b.Activated,function() if c.Enabled then callback() end end)
		return b
	end
	c.AutoButton = tool("Auto: ON",function() c:SetAutoRotate(not c.AutoRotate) end)
	tool("Zoom +",function() c:SetZoom(c.Zoom-0.15) end)
	tool("Zoom −",function() c:SetZoom(c.Zoom+0.15) end)
	tool("Góc trước",function() c:SetAutoRotate(false); c:SetRotation(0,12) end)
	tool("Góc sau",function() c:SetAutoRotate(false); c:SetRotation(180,12) end)
	tool("Reset góc",function() c:ResetCamera() end)
	c.Scope:Connect(c.View:GetPropertyChangedSignal("AbsoluteSize"),function() c.Dirty = true end)
	c.Scope:Connect(c.View.InputBegan,function(input)
		if not c.Enabled or c.Dragging or (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) then return end
		local origin = input.Position
		local yaw,pitch = c.Yaw,c.Pitch
		c.Dragging = true; c.PreviousScroll = c.Tab.Scroll.ScrollingEnabled; c.Tab.Scroll.ScrollingEnabled = false
		c.Library:_Capture(input,function(position)
			if not c.Scope.Alive or not c.Enabled then return end
			c:SetRotation(yaw+(position.X-origin.X)*0.45,pitch+(position.Y-origin.Y)*0.28)
		end,function()
			c.Dragging = false
			if c.Tab.Scope.Alive then c.Tab.Scroll.ScrollingEnabled = c.PreviousScroll ~= false end
			if c.Scope.Alive then invoke(c.Config.Callback,{Yaw = c.Yaw,Pitch = c.Pitch,Zoom = c.Zoom}) end
		end,c)
	end)
	c.Scope:Connect(c.View.InputChanged,function(input)
		if c.Enabled and input.UserInputType == Enum.UserInputType.MouseWheel then c:SetZoom(c.Zoom-input.Position.Z*0.12) end
	end)
	c.Scope:Connect(RunService.RenderStepped,function(dt)
		if not c.Enabled or not actuallyVisible(c.View) then return end
		if c.AutoRotate and not c.Dragging then c.Yaw = (c.Yaw+c.RotationSpeed*math.min(dt,0.1))%360; c.Dirty = true end
		if c.Dirty then c:UpdateCamera() end
	end)
	c.BeforeDestroy = function(s)
		if s.Dragging and s.Tab.Scope.Alive then s.Tab.Scroll.ScrollingEnabled = s.PreviousScroll ~= false end
		local t = activeTweens[s.DoorAngle]; if t then t:Cancel() end
	end
	c.Refresh = function(s) s.Dirty = true end
	task.spawn(function() c:LoadModel(c.Config.Model) end)
	c:SetAutoRotate(c.AutoRotate); c.Dirty = true; c:_Refresh()
	return c
end
Tab.CreateCarViewer = Tab.CreateVehicleViewer

-- ADDITIONAL REUSABLE APIs ----------------------------------------------------
function Component:SetCallback(callback) assert(type(callback) == "function" or callback == nil,"Callback must be function or nil"); self.Config.Callback = callback; return self end
function Component:SetSilent(value) return self:Set(value,true) end
function Component:IsEnabled() return self.Enabled end
function Component:IsVisible() return self.Scope.Alive and self.Frame.Visible end
function Component:IsDestroyed() return not self.Scope.Alive end
function Component:OnChanged(callback)
	assert(type(callback) == "function","OnChanged expects function")
	if not self.ChangedEvent then self.ChangedEvent = create("BindableEvent",{},self.Frame) end
	return self.Scope:Connect(self.ChangedEvent.Event,function(value) invoke(callback,copy(value)) end)
end
function Component:SetOrder(order) self.Frame.LayoutOrder = math.floor(finite(order,self.Frame.LayoutOrder)); return self end
function Component:Focus() if self.Box and self.Enabled and self.Scope.Alive then self.Box:CaptureFocus() end; return self end
function Component:SetPlaceholder(value) if self.Box then self.Box.PlaceholderText = tostring(value) end; return self end
function Component:SetRange(minimum,maximum,step)
	assert(self.Kind == "Slider","SetRange only applies to Slider")
	self.Min = finite(minimum,self.Min); self.Max = math.max(self.Min,finite(maximum,self.Max)); self.Step = math.max(0.000001,finite(step,self.Step))
	return self:Set(self.Value)
end
function Tab:GetComponents() return table.clone(self.Components) end
function Tab:GetComponent(id)
	for _,c in ipairs(self.Components) do if c.Config.Id == id or c.Config.Flag == id then return c end end
	return nil
end
function Tab:SetName(name)
	self.Name = tostring(name); self.Nav.Text = icon(self.Config.Icon or "home") .. "  " .. self.Name; return self
end
function Tab:SetIcon(value) self.Config.Icon = value; return self:SetName(self.Name) end
function Tab:ScrollToTop() self.Scroll.CanvasPosition = Vector2.zero; return self end
function Tab:ScrollTo(component)
	if component.Tab == self and component.Scope.Alive then self.Scroll.CanvasPosition = Vector2.new(0,math.max(0,component.Frame.AbsolutePosition.Y-self.Scroll.AbsolutePosition.Y+self.Scroll.CanvasPosition.Y)) end
	return self
end
function Window:GetTabs() return table.clone(self.Tabs) end
function Window:GetTab(name) for _,tab in ipairs(self.Tabs) do if tab.Name == name then return tab end end end
function Window:SetTitle(value) self.Title.Text = tostring(value); return self end
function Window:SetSubtitle(value) self.Subtitle.Text = tostring(value); return self end
function Window:SetSize(width,height) self.BaseSize = Vector2.new(math.max(300,finite(width,self.BaseSize.X)),math.max(220,finite(height,self.BaseSize.Y))); self:_Layout(); return self end
function Window:SetPosition(position) assert(typeof(position) == "UDim2","Expected UDim2"); self.Frame.Position = position; self:_Layout(); return self end
function Window:Center() return self:SetPosition(UDim2.fromScale(0.5,0.5)) end
function Window:IsOpen() return self.Scope.Alive and self.Visible end
function Library:GetComponent(id)
	for _,w in ipairs(self.Windows) do for _,tab in ipairs(w.Tabs) do local c = tab:GetComponent(id); if c then return c end end end
end
function Library:GetFlags()
	local flags = {}
	for c in pairs(self.Components) do
		local id = c.Config.Id or c.Config.Flag
		if id then flags[id] = c:Get() end
	end
	return flags
end
function Library:SetFlags(flags,silent)
	for id,value in pairs(flags or {}) do local c = self:GetComponent(id); if c then c:Set(value,silent) end end
end

--============================================================================
local function showError(message: string)
	warn("[NejiHub] " .. tostring(message))
	pcall(function()
		local pg = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
		if not pg then
			return
		end
		local oldErr = pg:FindFirstChild("NejiError")
		if oldErr then
			oldErr:Destroy()
		end

		local g = Instance.new("ScreenGui")
		g.Name = "NejiError"
		g.ResetOnSpawn = false
		g.IgnoreGuiInset = true
		g.DisplayOrder = 99999
		g.Parent = pg

		local f = Instance.new("Frame")
		f.Size = UDim2.new(1, -40, 0, 0)
		f.AutomaticSize = Enum.AutomaticSize.Y
		f.Position = UDim2.new(0, 20, 0, 20)
		f.BackgroundColor3 = Color3.fromRGB(28, 10, 12)
		f.BorderSizePixel = 0
		f.Parent = g

		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, 10)
		c.Parent = f

		local st = Instance.new("UIStroke")
		st.Color = Color3.fromRGB(255, 90, 90)
		st.Thickness = 1.2
		st.Parent = f

		local pad = Instance.new("UIPadding")
		pad.PaddingTop = UDim.new(0, 10)
		pad.PaddingBottom = UDim.new(0, 10)
		pad.PaddingLeft = UDim.new(0, 12)
		pad.PaddingRight = UDim.new(0, 12)
		pad.Parent = f

		local t = Instance.new("TextLabel")
		t.Size = UDim2.new(1, 0, 0, 0)
		t.AutomaticSize = Enum.AutomaticSize.Y
		t.BackgroundTransparency = 1
		t.Font = Enum.Font.Code
		t.TextSize = 13
		t.TextWrapped = true
		t.TextXAlignment = Enum.TextXAlignment.Left
		t.TextColor3 = Color3.fromRGB(255, 170, 170)
		t.Text = "[NejiHub] LỖI\n\n" .. tostring(message) .. "\n\n(Chi tiết đầy đủ ở cửa sổ Output)"
		t.Parent = f
	end)
end

print("[NejiHub] bắt đầu chạy")

local rollback
local __ok, __err = xpcall(function()
	if shared.NejiIsland and type(shared.NejiIsland.Destroy) == "function" then
		pcall(function() shared.NejiIsland.Destroy() end)
	end
	local lifecycle = Scope.new()
	local owned = {}
	local destroying = false
	local function connect(signal, callback) return lifecycle:Connect(signal, callback) end
	local function spawn(callback)
		local thread
		thread = task.defer(function()
			local ok, err = xpcall(callback, debug.traceback)
			lifecycle.Tasks[coroutine.running()] = nil
			if not ok and lifecycle.Alive then showError(err) end
		end)
		lifecycle.Tasks[thread] = true
		return thread
	end
	local function delay(seconds, callback) return lifecycle:Delay(seconds, callback) end
	local statOverrides, statSources = {}, {}
	local draggingEnabled = true
	local automaticStats = true
	local autoCollapse = 6
	local collapseToken = 0
	local notifySerial = 0
	local events = {}
	local api, dashboardApp
	local stopSignature
	local actionName = "NejiVisibility_" .. HttpService:GenerateGUID(false)
	rollback = function()
		lifecycle:Clean()
		ContextActionService:UnbindAction(actionName)
		if dashboardApp then dashboardApp:Destroy() end
		for i = #owned,1,-1 do pcall(function() owned[i]:Destroy() end) end
	end
	local function fire(name, ...)
		if events[name] then events[name]:Fire(...) end
	end

	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")

	local plr = Players.LocalPlayer
	local playerGui = plr:WaitForChild("PlayerGui")
	print("[NejiHub] PlayerGui ok, dựng GUI...")

	--============================================================================
	-- THÔNG SỐ
	--============================================================================
	local SIGN_TEXT = "NEJI HUB"
	local SIGN_W = 300 -- sẽ được tính lại theo bề rộng chữ

	local COMPACT_W, COMPACT_H = 244, 44
	local EXPAND_W, EXPAND_H = 334, 208
	local TOAST_EXTRA = 58
	local BLOB_SIZE = 46

	local ISLAND_COLOR = Color3.fromRGB(7, 7, 9)
	local TEXT_MAIN = Color3.fromRGB(240, 243, 250)
	local TEXT_DIM = Color3.fromRGB(138, 146, 162)
	local C_A = Color3.fromRGB(96, 200, 255)
	local C_B = Color3.fromRGB(236, 120, 255)
	local C_LEVEL = Color3.fromRGB(96, 200, 255)
	local C_BELI = Color3.fromRGB(255, 200, 84)
	local C_FRAG = Color3.fromRGB(186, 130, 255)
	local C_LIVE = Color3.fromRGB(80, 235, 140)
	local C_DOWN = Color3.fromRGB(255, 110, 110)

	--============================================================================
	-- HELPER
	--============================================================================
	local function new(className: string, props: { [string]: any }, parent: Instance?): any
		local inst = Instance.new(className)
		table.insert(owned, inst)
		for k, v in pairs(props) do
			inst[k] = v
		end
		if parent then
			inst.Parent = parent
		end
		return inst
	end

	local function corner(inst: Instance, radius: number): UICorner
		return new("UICorner", { CornerRadius = UDim.new(0, radius) }, inst) :: UICorner
	end

	local function gradient(inst: Instance, a: Color3, b: Color3, rotation: number?): UIGradient
		return new("UIGradient", {
			Rotation = rotation or 0,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, a),
				ColorSequenceKeypoint.new(1, b),
			}),
		}, inst) :: UIGradient
	end

	--============================================================================
	-- ĐỌC SỐ LIỆU
	--============================================================================
	local function readStat(name: string): number
		if statOverrides[name] ~= nil then return statOverrides[name] end
		local provider = statSources[name]
		if provider then
			local ok, result = pcall(provider)
			if ok then return finite(result, 0) end
		end
		local data = plr:FindFirstChild("Data")
		local value = data and data:FindFirstChild(name)
		if value then
			local ok, n = pcall(function()
				return tonumber((value :: any).Value)
			end)
			if ok and n then
				return n
			end
		end
		return 0
	end

	local function commas(n: number): string
		local s = tostring(math.floor(tonumber(n) or 0))
		local neg = string.sub(s, 1, 1) == "-"
		if neg then
			s = string.sub(s, 2)
		end
		local grouped = string.gsub(string.reverse(s), "%d%d%d", "%1,")
		s = string.gsub(string.reverse(grouped), "^,", "")
		return if neg then "-" .. s else s
	end

	local function short(n: number): string
		local v = tonumber(n) or 0
		if math.abs(v) >= 1e9 then
			return string.format("%.1fB", v / 1e9)
		elseif math.abs(v) >= 1e6 then
			return string.format("%.1fM", v / 1e6)
		elseif math.abs(v) >= 1e3 then
			return string.format("%.1fK", v / 1e3)
		end
		return tostring(math.floor(v))
	end

	local function hms(sec: number): string
		local t = math.max(0, math.floor(tonumber(sec) or 0))
		return string.format("%02d:%02d:%02d", math.floor(t / 3600), math.floor(t % 3600 / 60), t % 60)
	end

	--============================================================================
	-- GUI GỐC
	--============================================================================
	local oldGui = playerGui:FindFirstChild("NejiIsland")
	if oldGui then
		oldGui:Destroy()
	end
	local oldGui2 = playerGui:FindFirstChild("NejiIntro")
	if oldGui2 then
		oldGui2:Destroy()
	end

	local gui = new("ScreenGui", {
		Name = "NejiIsland",
		DisplayOrder = 60,
		ResetOnSpawn = false,
		IgnoreGuiInset = false,
		ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
		ClipToDeviceSafeArea = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, playerGui)

	local introGui = new("ScreenGui", {
		Name = "NejiIntro",
		ResetOnSpawn = false,
		IgnoreGuiInset = false,
		ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
		ClipToDeviceSafeArea = true,
		DisplayOrder = 70,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, playerGui)

	local safeRoot = new("Frame", {Name = "SafeArea", Size = UDim2.fromScale(1,1), BackgroundTransparency = 1}, gui)
	local introRoot = new("Frame", {Name = "IntroSafeArea", Size = UDim2.fromScale(1,1), BackgroundTransparency = 1}, introGui)
	local savedPosition = UDim2.new(0.5, 0, 0, 12)
	-- làm tối nền khi diễn hoạt
	local vignette = new("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, introRoot)

	--============================================================================
	-- 1. CHỮ KÝ
	--============================================================================
	local SIGN_H = 54 -- cao chữ (px)
	local THICK = 5 -- độ dày nét
	local STEP = 2.2 -- mỗi bước vẽ dài bao nhiêu px (nhỏ = các nét "." sát nhau hơn)
	local OVERLAP = 2 -- nối dài thêm mỗi đoạn để không hở giữa 2 nét

	--============================================================================
	-- BỘ NÉT CHỮ (polyline chuẩn hoá: x 0..0.62, y 0..1, gốc trên-trái)
	-- đủ cho "NEJI HUB"; thêm chữ khác thì bổ sung vào bảng này
	--============================================================================
	local EM = SIGN_H -- 1 em = bao nhiêu px
	local GROUP_H = EM * 1.8
	local OFFY = 12 -- canh giữa theo chiều dọc

	local GLYPHS = {
		N = { { { 0, 1 }, { 0, 0 }, { 0.56, 1 }, { 0.56, 0 } } },
		E = { { { 0.56, 0 }, { 0, 0 }, { 0, 1 }, { 0.56, 1 } }, { { 0, 0.52 }, { 0.42, 0.52 } } },
		J = { { { 0.5, 0 }, { 0.5, 0.7 }, { 0.42, 0.92 }, { 0.26, 1 }, { 0.1, 0.9 }, { 0.04, 0.76 } } },
		I = { { { 0.28, 0 }, { 0.28, 1 } }, { { 0.1, 0 }, { 0.46, 0 } }, { { 0.1, 1 }, { 0.46, 1 } } },
		H = { { { 0, 0 }, { 0, 1 } }, { { 0.56, 0 }, { 0.56, 1 } }, { { 0, 0.52 }, { 0.56, 0.52 } } },
		U = { { { 0, 0 }, { 0, 0.68 }, { 0.12, 0.92 }, { 0.28, 1 }, { 0.44, 0.92 }, { 0.56, 0.68 }, { 0.56, 0 } } },
		B = {
			{ { 0, 0 }, { 0, 1 } },
			{ { 0, 0 }, { 0.36, 0 }, { 0.5, 0.13 }, { 0.5, 0.37 }, { 0.36, 0.5 }, { 0, 0.5 } },
			{ { 0.36, 0.5 }, { 0.52, 0.63 }, { 0.52, 0.86 }, { 0.38, 1 }, { 0, 1 } },
		},
	}

	local LETTER_W = 0.56 -- rộng chữ (em)
	local LETTER_GAP = 0.2 -- khe giữa 2 chữ
	local WORD_GAP = 0.45 -- khe giữa 2 từ
	local SLANT = 0.13 -- độ nghiêng italic (chữ ký hay nghiêng)

	-- spline Catmull-Rom: điểm điều khiển -> nét mượt (góc chữ bo mềm như viết tay)
	local function catmull(ctrl: any, stepPx: number): { any }
		local out: { any } = {}
		if #ctrl < 2 then
			return out
		end
		for i = 1, #ctrl - 1 do
			local p0 = ctrl[math.max(1, i - 1)]
			local p1 = ctrl[i]
			local p2 = ctrl[i + 1]
			local p3 = ctrl[math.min(#ctrl, i + 2)]
			local segLen = math.sqrt((p2.x - p1.x) ^ 2 + (p2.y - p1.y) ^ 2)
			local n = math.max(2, math.ceil(segLen / stepPx))
			for sIdx = 0, n do
				local t = sIdx / n
				local t2, t3 = t * t, t * t * t
				local x = 0.5
					* (
						2 * p1.x
						+ (-p0.x + p2.x) * t
						+ (2 * p0.x - 5 * p1.x + 4 * p2.x - p3.x) * t2
						+ (-p0.x + 3 * p1.x - 3 * p2.x + p3.x) * t3
					)
				local y = 0.5
					* (
						2 * p1.y
						+ (-p0.y + p2.y) * t
						+ (2 * p0.y - 5 * p1.y + 4 * p2.y - p3.y) * t2
						+ (-p0.y + 3 * p1.y - 3 * p2.y + p3.y) * t3
					)
				table.insert(out, { x = x, y = y })
			end
		end
		return out
	end

	local rng = Random.new(2403)
	local function rand(a: number, b: number): number
		return a + rng:NextNumber() * (b - a)
	end

	--============================================================================
	-- DỰNG NÉT: chữ in hoa viết tay (đọc rõ "NEJI HUB") + nghiêng italic
	--   • mỗi chữ vài nét, nét được làm mượt bằng spline -> góc bo như viết tay
	--   • nghiêng đều sang phải (SLANT) + mỗi chữ hơi xoay/lệch chân
	--   • rung tay nhẹ, nét mảnh đầu-cuối, chấm mực đầu nét
	--   • cuối cùng: nét vút lớn dưới chân + cú hất bút
	--============================================================================
	local pts = {}
	do
		local cursor = 0
		local strokeId = 0
		local strokes: { any } = {}

		for i = 1, #SIGN_TEXT do
			local ch = string.upper(string.sub(SIGN_TEXT, i, i))
			if ch == " " then
				cursor += WORD_GAP * EM
			else
				local g = GLYPHS[ch]
				if g then
					local rot = math.rad(rand(-0.8, 0.8))
					local sc = rand(0.97, 1.04)
					local dropY = rand(-0.4, 0.4)
					local pivX, pivY = 0.28 * EM, EM
					local cosR, sinR = math.cos(rot), math.sin(rot)

					for _, stroke in ipairs(g) do
						local ctrl: { any } = {}
						for _, p in ipairs(stroke) do
							-- nghiêng italic + phóng/thu + xoay quanh chân chữ
							local lx = p[1] * EM * sc + (1 - p[2]) * SLANT * EM
							local ly = p[2] * EM * sc
							local dx, dy = lx - pivX, ly - pivY
							table.insert(ctrl, {
								x = cursor + pivX + dx * cosR - dy * sinR,
								y = pivY + dx * sinR + dy * cosR + dropY,
							})
						end
						table.insert(strokes, catmull(ctrl, STEP))
					end

					cursor += (LETTER_W + LETTER_GAP) * EM
				end
			end
		end

		SIGN_W = cursor - LETTER_GAP * EM + 24

		-- nét vút lớn dưới chân, kết thúc bằng cú hất lên
		local flourishCtrl = {
			{ x = -8, y = EM * 1.42 },
			{ x = cursor * 0.2, y = EM * 1.62 },
			{ x = cursor * 0.48, y = EM * 1.26 },
			{ x = cursor * 0.74, y = EM * 1.55 },
			{ x = cursor + 2, y = EM * 1.1 },
			{ x = cursor + 24, y = EM * 0.72 },
		}
		table.insert(strokes, catmull(flourishCtrl, STEP))

		-- rung tay rồi đổ hết vào danh sách điểm
		for _, path in ipairs(strokes) do
			strokeId += 1
			local jx, jy = 0, 0
			local n = #path
			for k = 1, n do
				local p = path[k]
				jx = math.clamp(jx + rand(-0.1, 0.1), -0.35, 0.35)
				jy = math.clamp(jy + rand(-0.1, 0.1), -0.35, 0.35)
				table.insert(pts, {
					x = p.x + jx,
					y = p.y + jy + OFFY,
					jump = (k == 1),
					stroke = strokeId,
					t = k / n,
					blob = (k == 1),
				})
			end
		end

	end
	-- Measure actual spline bounds, including the flourish, to avoid clipping/off-center ink.
	do
		local minX,minY,maxX,maxY = math.huge,math.huge,-math.huge,-math.huge
		for _,p in ipairs(pts) do minX = math.min(minX,p.x); minY = math.min(minY,p.y); maxX = math.max(maxX,p.x); maxY = math.max(maxY,p.y) end
		for _,p in ipairs(pts) do p.x = p.x-minX+12; p.y = p.y-minY+12 end
		SIGN_W,GROUP_H = maxX-minX+24,maxY-minY+24
	end

	local signGroup = new("Frame", {
		Name = "Signature",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(SIGN_W, GROUP_H),
		BackgroundTransparency = 1,
	}, introRoot)

	local inkLayer = new("CanvasGroup", {
		Name = "Ink",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
	}, signGroup)

	-- đầu bút
	local pen = new("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(pts[1].x, pts[1].y),
		Size = UDim2.fromOffset(9, 9),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
	}, signGroup)
	corner(pen, 5)

	local penGlow = new("UIStroke", { Thickness = 2.5, Transparency = 0.5 }, pen)
	gradient(penGlow, C_A, C_B, 45)

	-- vẽ 1 đoạn nét: dày/mảnh theo vị trí trong nét + rung + chấm mực đầu nét
	local function drawSeg(a: any, b: any, progress: number)
		local dx, dy = b.x - a.x, b.y - a.y
		local len = math.sqrt(dx * dx + dy * dy)
		if len < 0.3 then
			return
		end
		local angle = math.deg(math.atan2(dy, dx))
		local col = C_A:Lerp(C_B, math.clamp(progress, 0, 1))

		-- nét mảnh ở đầu/cuối, dày ở giữa
		local t = a.t or 0.5
		local taper = 1
		if t < 0.14 then
			taper = 0.66 + (t / 0.14) * 0.34
		elseif t > 0.86 then
			taper = 0.66 + ((1 - t) / 0.14) * 0.34
		end
		local th = math.max(2, THICK * taper * rand(0.9, 1.12))
		if a.scribble then
			th = th * 0.55
		end

		local seg = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(a.x + dx / 2, a.y + dy / 2),
			Size = UDim2.fromOffset(len + OVERLAP, th),
			Rotation = angle,
			BackgroundColor3 = col,
			BackgroundTransparency = if a.scribble then 0.35 else 0,
			BorderSizePixel = 0,
		}, inkLayer)
		corner(seg, th / 2)

		-- chấm mực đậm ở chỗ đặt bút
		if a.blob then
			local dotInk = new("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromOffset(a.x, a.y),
				Size = UDim2.fromOffset(th * 1.7, th * 1.7),
				BackgroundColor3 = col,
				BackgroundTransparency = 0.12,
				BorderSizePixel = 0,
			}, inkLayer)
			corner(dotInk, th)
		end
	end

	-- chấm mực (dấu của i / j)
	local function drawDotPt(p: any, progress: number)
		local col = C_A:Lerp(C_B, math.clamp(progress, 0, 1))
		local th = THICK * 1.15
		local d = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(p.x, p.y),
			Size = UDim2.fromOffset(th, th),
			BackgroundColor3 = col,
			BorderSizePixel = 0,
		}, inkLayer)
		corner(d, th / 2)
	end

	local introBaseScale = math.clamp((safeRoot.AbsoluteSize.X-30)/SIGN_W,0.1,1)
	local signScale = new("UIScale", {Scale = introBaseScale}, signGroup)

	--============================================================================
	-- 2. CỤC TRÒN (blob)
	--============================================================================
	local blob = new("Frame", {
		Name = "Blob",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(0, 0),
		BackgroundColor3 = C_A,
		BorderSizePixel = 0,
		Visible = false,
	}, introRoot)
	local blobCorner = corner(blob, BLOB_SIZE / 2)
	gradient(blob, C_A, C_B, 45)

	local blobStroke = new("UIStroke", { Thickness = 2, Transparency = 0.15 }, blob)
	gradient(blobStroke, C_A, C_B, 45)

	-- 2 vòng sáng lan khi bung ra
	local function ringPulse()
		local ring = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(BLOB_SIZE, BLOB_SIZE),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, introRoot)
		corner(ring, BLOB_SIZE / 2)
		local rs = new("UIStroke", { Thickness = 1.5, Transparency = 0.15 }, ring)
		gradient(rs, C_A, C_B, 45)

		TweenService:Create(ring, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(BLOB_SIZE * 2.6, BLOB_SIZE * 2.6),
		}):Play()
		TweenService:Create(rs, TweenInfo.new(0.75, Enum.EasingStyle.Quad), { Transparency = 1 }):Play()
		delay(0.8, function()
			if ring then
				ring:Destroy()
			end
		end)
	end

	--============================================================================
	-- 3. ISLAND (đích đến)
	--============================================================================
	local island = new("TextButton", {
		Name = "Island",
		Text = "",
		AutoButtonColor = false,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 12),
		Size = UDim2.fromOffset(COMPACT_W, COMPACT_H),
		BackgroundColor3 = ISLAND_COLOR,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Visible = false,
	}, safeRoot)
	local islandCorner = corner(island, 18)

	local islandStroke = new("UIStroke", {
		Thickness = 1,
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, island)

	-- LỚP THU GỌN
	local compactLayer = new("Frame", {
		Name = "Compact",
		Size = UDim2.new(1, 0, 0, COMPACT_H),
		BackgroundTransparency = 1,
	}, island)

	local dot = new("Frame", {
		Size = UDim2.fromOffset(8, 8),
		Position = UDim2.fromOffset(14, 18),
		BackgroundColor3 = C_LEVEL,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
	}, compactLayer)
	corner(dot, 4)
	gradient(dot, C_LEVEL, C_B, 45)

	local miniLbl = new("TextLabel", {
		Text = "LV 0 · 0 · 0",
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = TEXT_MAIN,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(30, 0),
		Size = UDim2.new(1, -46, 0, COMPACT_H),
		TextTransparency = 1,
	}, compactLayer)

	local toastLbl = new("TextLabel", {
		Text = "",
		Font = Enum.Font.GothamBlack,
		TextSize = 11,
		TextColor3 = C_LIVE,
		TextXAlignment = Enum.TextXAlignment.Right,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 0),
		Size = UDim2.fromOffset(58, COMPACT_H),
		Visible = false,
	}, compactLayer)

	-- LỚP MỞ RỘNG
	local expandedLayer = new("Frame", {
		Name = "Expanded",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Visible = false,
	}, island)

	local avatar = new("ImageLabel", {
		Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", plr.UserId),
		Size = UDim2.fromOffset(22, 22),
		Position = UDim2.fromOffset(12, 9),
		BackgroundColor3 = Color3.fromRGB(34, 38, 48),
		BorderSizePixel = 0,
	}, expandedLayer)
	corner(avatar, 11)

	local titleLbl = new("TextLabel", {
		Text = "NEJI HUB",
		Font = Enum.Font.GothamBlack,
		TextSize = 11,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(41, 8),
		Size = UDim2.fromOffset(120, 14),
	}, expandedLayer)
	gradient(titleLbl, C_A, C_B, 0)

	new("TextLabel", {
		Text = "tap để thu gọn",
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextColor3 = TEXT_DIM,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(41, 20),
		Size = UDim2.fromOffset(120, 12),
	}, expandedLayer)

	local pill = new("Frame", {
		Size = UDim2.fromOffset(38, 14),
		Position = UDim2.new(1, -50, 0, 13),
		BackgroundColor3 = C_LIVE,
		BackgroundTransparency = 0.88,
		BorderSizePixel = 0,
	}, expandedLayer)
	corner(pill, 7)

	local liveDot = new("Frame", {
		Size = UDim2.fromOffset(4, 4),
		Position = UDim2.fromOffset(6, 5),
		BackgroundColor3 = C_LIVE,
		BorderSizePixel = 0,
	}, pill)
	corner(liveDot, 2)

	new("TextLabel", {
		Text = "LIVE",
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextColor3 = C_LIVE,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(13, 0),
		Size = UDim2.new(1, -13, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
	}, pill)

	local function makeRow(y: number, label: string, icon: string, color: Color3): TextLabel
		local row = new("Frame", {
			Position = UDim2.fromOffset(12, y),
			Size = UDim2.new(1, -24, 0, 26),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.955,
			BorderSizePixel = 0,
		}, expandedLayer)
		corner(row, 9)

		local box = new("Frame", {
			Size = UDim2.fromOffset(18, 18),
			Position = UDim2.fromOffset(5, 4),
			BackgroundColor3 = color,
			BackgroundTransparency = 0.12,
			BorderSizePixel = 0,
		}, row)
		corner(box, 6)
		gradient(box, color, C_B, 45)

		new("TextLabel", {
			Text = icon,
			Font = Enum.Font.GothamBlack,
			TextSize = 10,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
		}, box)

		new("TextLabel", {
			Text = label,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = TEXT_DIM,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(30, 0),
			Size = UDim2.new(0, 100, 1, 0),
		}, row)

		return new("TextLabel", {
			Text = "0",
			Font = Enum.Font.GothamBlack,
			TextSize = 13,
			TextColor3 = color,
			TextXAlignment = Enum.TextXAlignment.Right,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -140, 0, 0),
			Size = UDim2.new(0, 130, 1, 0),
		}, row)
	end

	local vLevel = makeRow(48, "LEVEL", "LV", C_LEVEL)
	local vBeli = makeRow(79, "BELI", "$", C_BELI)
	local vFrag = makeRow(110, "FRAGMENT", "◆", C_FRAG)

	local footer = new("Frame", {
		Position = UDim2.fromOffset(12, 145),
		Size = UDim2.new(1, -24, 0, 36),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.965,
		BorderSizePixel = 0,
	}, expandedLayer)
	corner(footer, 9)

	local function makeClock(x: number, width: number, label: string): TextLabel
		new("TextLabel", {
			Text = label,
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = TEXT_DIM,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(x, 6),
			Size = UDim2.new(0, width, 0, 11),
		}, footer)

		return new("TextLabel", {
			Text = "00:00:00",
			Font = Enum.Font.Code,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(228, 234, 245),
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(x, 18),
			Size = UDim2.new(0, width, 0, 15),
		}, footer)
	end

	local tTotal = makeClock(9, 120, "TOTAL TIME")
	local tSession = makeClock(140, 100, "SESSION")

	new("Frame", {
		Position = UDim2.fromOffset(130, 8),
		Size = UDim2.fromOffset(1, 20),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.86,
		BorderSizePixel = 0,
	}, footer)

	--============================================================================
	-- DIỄN HOẠT: chữ ký -> cục tròn -> bay lên -> island
	--============================================================================
	local ready = false -- chưa cho bấm/kéo island khi còn diễn hoạt
	print("[NejiHub] GUI đã dựng, bắt đầu diễn hoạt")

	local function playIntro()
		-- tối nền
		TweenService:Create(vignette, TweenInfo.new(0.45), { BackgroundTransparency = 0.55 }):Play()

		-- 1) VIẾT TAY TỪNG NÉT: đầu bút chạy theo polyline, mỗi bước đẻ ra 1 đoạn nét
		task.wait(0.15)
		introBaseScale = math.clamp(math.min((safeRoot.AbsoluteSize.X-30)/SIGN_W,(safeRoot.AbsoluteSize.Y-100)/GROUP_H),0.1,1)
		signScale.Scale = introBaseScale
		local speed = 560 -- px / giây (tốc độ bút)
		local tStart = os.clock()
		local idx = 1
		while idx <= #pts do
			local budget = (os.clock() - tStart) * speed / STEP
			while idx <= #pts and idx <= budget do
				local p = pts[idx]
				if p.dot then
					drawDotPt(p, idx / #pts)
				elseif idx > 1 and not p.jump then
					drawSeg(pts[idx - 1], p, idx / #pts)
				end
				pen.Position = UDim2.fromOffset(p.x, p.y)
				idx += 1
			end
			task.wait()
		end

		-- nhấc bút
		TweenService:Create(pen, TweenInfo.new(0.22), { BackgroundTransparency = 1 }):Play()
		TweenService:Create(penGlow, TweenInfo.new(0.22), { Transparency = 1 }):Play()

		-- nhịp thở nhẹ sau khi viết xong
		TweenService:Create(signScale, TweenInfo.new(0.22, Enum.EasingStyle.Sine), { Scale = introBaseScale*1.05 }):Play()
		task.wait(0.22)
		TweenService:Create(signScale, TweenInfo.new(0.22, Enum.EasingStyle.Sine), { Scale = introBaseScale }):Play()
		task.wait(0.18)

		-- 2) CHỮ THU THÀNH ĐIỂM + BLOB BUNG RA
		TweenService:Create(signScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), { Scale = 0.06 }):Play()
		TweenService:Create(inkLayer, TweenInfo.new(0.3), { GroupTransparency = 1 }):Play()

		task.wait(0.16)
		blob.Visible = true
		blob.Size = UDim2.fromOffset(0, 0)
		ringPulse()
		TweenService:Create(blob, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(BLOB_SIZE, BLOB_SIZE),
		}):Play()

		task.wait(0.42)
		signGroup.Visible = false
		task.wait(0.22)

		-- 3) BAY LÊN + giãn thành island
		-- đổi neo sang top-center ngay lúc bắt đầu bay (hình không nhảy vì cùng tâm)
		blob.AnchorPoint = Vector2.new(0.5, 0)
		blob.Position = UDim2.new(0.5, 0, 0.5, -(BLOB_SIZE / 2))

		local flyInfo = TweenInfo.new(0.62, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		TweenService:Create(blob, flyInfo, {
			Position = UDim2.new(0.5, 0, 0, 12),
			Size = UDim2.fromOffset(COMPACT_W, COMPACT_H),
		}):Play()
		TweenService:Create(blobCorner, flyInfo, { CornerRadius = UDim.new(0, 18) }):Play()
		TweenService:Create(blobStroke, TweenInfo.new(0.45), { Transparency = 0.85 }):Play()

		-- vệt sáng kéo theo khi bay
		local trail = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0.5, 6),
			Size = UDim2.fromOffset(BLOB_SIZE * 0.6, 1),
			BackgroundColor3 = C_A,
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
		}, introRoot)
		corner(trail, 1)
		gradient(trail, C_A, C_B, 90)
		TweenService:Create(trail, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			Size = UDim2.fromOffset(2, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0, 30),
		}):Play()
		delay(0.6, function()
			if trail then
				trail:Destroy()
			end
		end)

		-- 4) ĐỔI SANG ISLAND THẬT (cùng vị trí/size nên không thấy đường nối)
		task.wait(0.5)
		island.Visible = true
		TweenService:Create(island, TweenInfo.new(0.22), { BackgroundTransparency = 0.03 }):Play()
		TweenService:Create(islandStroke, TweenInfo.new(0.22), { Transparency = 0.86 }):Play()
		TweenService:Create(blob, TweenInfo.new(0.24), { BackgroundTransparency = 1 }):Play()
		TweenService:Create(blobStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()

		-- "đáp đất": pop nhẹ
		-- The single responsive UIScale remains authoritative after landing.

		-- nội dung island hiện dần
		task.wait(0.12)
		TweenService:Create(miniLbl, TweenInfo.new(0.35), { TextTransparency = 0 }):Play()
		TweenService:Create(dot, TweenInfo.new(0.35), { BackgroundTransparency = 0 }):Play()

		task.wait(0.4)
		if blob then
			blob:Destroy()
		end
		TweenService:Create(vignette, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
		task.wait(0.5)
		if introGui then
			introGui:Destroy()
		end

		ready = true
		fire("Ready")
		print("[NejiHub] sẵn sàng")
	end

	--============================================================================
	-- TRẠNG THÁI ISLAND
	--============================================================================
	local expanded = false
	local toastToken = 0
	local totalStart = os.clock()
	local sessionStart = os.clock()

	local function applyCompactText()
		if api and api.CustomCompactText then miniLbl.Text = api.CustomCompactText; return end
		miniLbl.TextTruncate = Enum.TextTruncate.AtEnd
		miniLbl.Text = string.format(
			"LV %s · %s · %s",
			commas(readStat("Level")),
			short(readStat("Beli")),
			short(readStat("Fragments"))
		)
	end
	applyCompactText()

	local function setExpanded(state: boolean)
		if expanded == state then
			return
		end
		expanded = state
		collapseToken += 1
		local token = collapseToken
		if state and autoCollapse > 0 then delay(autoCollapse, function() if token == collapseToken then setExpanded(false) end end) end
		fire("ExpandedChanged", state)
		toastToken += 1
		toastLbl.Visible = false
		miniLbl.Size = UDim2.new(1, -46, 0, COMPACT_H)

		if state then
			compactLayer.Visible = false
			expandedLayer.Visible = true
			expandedLayer.Position = UDim2.fromOffset(0, 4)
			TweenService:Create(expandedLayer, TweenInfo.new(0.32, Enum.EasingStyle.Quad), { Position = UDim2.fromOffset(0, 0) }):Play()
		else
			expandedLayer.Visible = false
			compactLayer.Visible = true
		end

		local info = TweenInfo.new(0.42, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		animate(island, {
			Size = if state then UDim2.fromOffset(EXPAND_W, EXPAND_H) else UDim2.fromOffset(COMPACT_W, COMPACT_H),
		}, 0.42)
		TweenService:Create(islandCorner, info, {
			CornerRadius = UDim.new(0, if state then 24 else 18),
		}):Play()
	end

	local function flashToast(text: string, color: Color3)
		if expanded then return end
		toastToken += 1
		local token = toastToken

		toastLbl.Text = text
		toastLbl.TextTruncate = Enum.TextTruncate.AtEnd
		toastLbl.TextColor3 = color
		toastLbl.Visible = true
		miniLbl.Size = UDim2.new(1, -108, 0, COMPACT_H)
		toastLbl.TextTransparency = 1
		TweenService:Create(toastLbl, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()

		animate(island, {
			Size = UDim2.fromOffset(COMPACT_W + TOAST_EXTRA, COMPACT_H),
		}, 0.34)

		delay(1.9, function()
			if token ~= toastToken or expanded then
				return
			end
			TweenService:Create(toastLbl, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
			task.wait(0.2)
			if token ~= toastToken then
				return
			end
			toastLbl.Visible = false
			miniLbl.Size = UDim2.new(1, -46, 0, COMPACT_H)
			animate(island, {
				Size = UDim2.fromOffset(COMPACT_W, COMPACT_H),
			}, 0.34)
		end)
	end

	--============================================================================
	-- VÒNG CẬP NHẬT
	--============================================================================
	connect(plr.CharacterAdded, function()
		sessionStart = os.clock()
	end)

	local bootAt = os.clock()
	local prev = {
		Level = readStat("Level"),
		Beli = readStat("Beli"),
		Fragments = readStat("Fragments"),
	}

	local function setValue(lbl: TextLabel, text: string)
		if lbl.Text ~= text then
			lbl.Text = text
			lbl.TextTransparency = 1
			TweenService:Create(lbl, TweenInfo.new(0.26, Enum.EasingStyle.Quad), { TextTransparency = 0 }):Play()
		end
	end

	spawn(function()
		while gui.Parent ~= nil do
			local lv, beli, frag = readStat("Level"), readStat("Beli"), readStat("Fragments")
			local warm = (os.clock() - bootAt) > 3.5

			if not warm then
				prev.Level, prev.Beli, prev.Fragments = lv, beli, frag
			elseif automaticStats and lv ~= prev.Level and lv > 0 then
				flashToast("LV " .. short(lv), C_LEVEL)
			elseif automaticStats and frag ~= prev.Fragments then
				local d = frag - prev.Fragments
				flashToast((d > 0 and "+" or "") .. short(d) .. " ◆", d >= 0 and C_FRAG or C_DOWN)
			elseif automaticStats and beli ~= prev.Beli then
				local d = beli - prev.Beli
				flashToast((d > 0 and "+" or "") .. short(d) .. " $", d >= 0 and C_BELI or C_DOWN)
			end

			for name, value in pairs({Level = lv, Beli = beli, Fragments = frag}) do
				if value ~= prev[name] then fire("StatChanged", name, value, prev[name], value-prev[name]) end
			end
			prev.Level, prev.Beli, prev.Fragments = lv, beli, frag

			if not expanded then
				applyCompactText()
			end
			setValue(vLevel, commas(lv))
			setValue(vBeli, commas(beli))
			setValue(vFrag, commas(frag))

			task.wait(0.25)
		end
	end)

	spawn(function()
		while gui.Parent ~= nil do
			tSession.Text = hms(os.clock() - sessionStart)
			tTotal.Text = hms(os.clock() - totalStart)
			task.wait(0.5)
		end
	end)

	spawn(function()
		local on = true
		while gui.Parent ~= nil do
			on = not on
			TweenService:Create(liveDot, TweenInfo.new(0.8), { BackgroundTransparency = if on then 0 else 0.8 }):Play()
			task.wait(0.8)
		end
	end)

	--============================================================================
	-- CHẠM / KÉO
	--============================================================================
	-- Responsive, safe-area-aware geometry. All drag deltas are in screen pixels.
	local islandScale = new("UIScale", {Scale = 1}, island)
	local activePointer, pointerOrigin, positionOrigin
	local moved = 0
	local function clampPosition()
		local area = safeRoot.AbsoluteSize
		if area.X < 1 or area.Y < 1 then return end
		local half = island.AbsoluteSize.X/2
		local x = island.Position.X.Scale*area.X + island.Position.X.Offset
		local y = island.Position.Y.Scale*area.Y + island.Position.Y.Offset
		island.Position = UDim2.fromOffset(math.clamp(x, half+6, math.max(half+6, area.X-half-6)), math.clamp(y, 6, math.max(6, area.Y-island.AbsoluteSize.Y-6)))
	end
	local function responsive()
		local area = safeRoot.AbsoluteSize
		if area.X < 1 or area.Y < 1 then return end
		islandScale.Scale = math.min(1, math.max(0.1, (area.X-16)/EXPAND_W), math.max(0.1, (area.Y-16)/EXPAND_H))
		if signScale.Parent and not ready then introBaseScale = math.clamp(math.min((area.X-30)/SIGN_W,(area.Y-100)/GROUP_H),0.1,1); signScale.Scale = introBaseScale end
		clampPosition()
	end
	connect(safeRoot:GetPropertyChangedSignal("AbsoluteSize"), responsive)
	connect(island:GetPropertyChangedSignal("AbsoluteSize"), clampPosition)
	connect(island.InputBegan, function(input)
		if not ready or activePointer then return end
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		activePointer = input; moved = 0
		pointerOrigin = Vector2.new(input.Position.X, input.Position.Y)
		positionOrigin = island.Position
	end)
	connect(UIS.InputChanged, function(input)
		if not activePointer or not ready then return end
		local valid = input == activePointer or (activePointer.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)
		if not valid then return end
		local delta = Vector2.new(input.Position.X, input.Position.Y)-pointerOrigin
		moved = math.max(moved, delta.Magnitude)
		if draggingEnabled and moved >= 6 then
			island.Position = UDim2.new(positionOrigin.X.Scale, positionOrigin.X.Offset+delta.X, positionOrigin.Y.Scale, positionOrigin.Y.Offset+delta.Y)
			clampPosition()
		end
	end)
	connect(UIS.InputEnded, function(input)
		if not activePointer or input ~= activePointer then return end
		activePointer = nil
		if moved < 6 and ready then setExpanded(not expanded) else fire("PositionChanged", island.Position) end
	end)
	connect(UIS.WindowFocusReleased, function() activePointer = nil end)

	local progressTrack = new("Frame", {Name = "Progress", Position = UDim2.new(0, 18, 1, -7), Size = UDim2.new(1, -36, 0, 3), BackgroundColor3 = Color3.fromRGB(35,40,52), BorderSizePixel = 0, Visible = false}, island)
	corner(progressTrack, 2)
	local progressFill = new("Frame", {Size = UDim2.fromScale(0,1), BackgroundColor3 = C_A, BorderSizePixel = 0}, progressTrack)
	corner(progressFill, 2); gradient(progressFill, C_A, C_B, 0)
	local loadingTween
	local progressValue = 0
	local function setLoading(value)
		if loadingTween then loadingTween:Cancel(); loadingTween = nil end
		local old = activeTweens[progressFill]; if old then old:Cancel(); activeTweens[progressFill] = nil end
		progressFill.Position = UDim2.fromScale(0,0)
		progressFill.Size = UDim2.fromScale(progressValue,1)
		if value then
			progressTrack.Visible = true
			progressFill.Size = UDim2.fromScale(0.28,1)
			loadingTween = TweenService:Create(progressFill, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.fromScale(0.72,0)})
			loadingTween:Play()
		end
	end

	dashboardApp = Library.new({Title = "NEJI HUB", Subtitle = "SIGNATURE EDITION · NATIVE LUAU", Theme = "Midnight", DynamicIsland = false, DisplayOrder = 50})
	dashboardApp.Gui.Enabled = false
	local mainWindow = dashboardApp:CreateWindow({Title = "NEJI HUB", Subtitle = "ISLAND / WORKSPACE", Logo = "star", ToggleKey = false})
	mainWindow:Close()
	local dashboard = mainWindow:CreateTab({Name = "Overview", Icon = "home"})
	dashboard:CreateSearchBar({Name = "Tìm nhanh", Placeholder = "Tìm chức năng trong tab…"})
	dashboard:CreateSection({Name = "NEJI / LIVE DASHBOARD", Description = "Giữ intro gốc, thêm cửa sổ và API có thể tái sử dụng."})
	local statLabel = dashboard:CreateLabel({Text = "Đang đọc thống kê…"})
	dashboard:CreateParagraph({Name = "Hướng dẫn", Content = "Chạm island để mở/thu gọn. Kéo để di chuyển. Nút NEJI HUB ở góc dưới mở cửa sổ. RightShift ẩn/hiện toàn bộ giao diện. Thống kê đọc từ LocalPlayer.Data nếu có."})
	dashboard:CreateToggle({Name = "Cho phép kéo island", Default = true, Callback = function(v) draggingEnabled = v end})
	dashboard:CreateSlider({Name = "Tự thu gọn sau", Min = 0, Max = 30, Default = 6, Suffix = "s", Description = "0 = không tự thu gọn; áp dụng ở lần mở tiếp theo.", Callback = function(v) autoCollapse = v end})
	dashboard:CreateButton({Name = "Thông báo thử", ButtonText = "Gửi thông báo  →", Callback = function() if api then api:Notify({Title = "NEJI HUB", Description = "UI đã được nâng cấp thành công.", Type = "Success", Duration = 3}) end end})
	dashboard:CreateButton({Name = "Tiến trình thử", ButtonText = "Chạy tác vụ mẫu", Callback = function()
		if not api then return end
		api:SetLoading(true)
		delay(2, function() api:SetProgress(1); api:Notify({Title = "Hoàn tất", Description = "Đã xong tác vụ mẫu.", Type = "Success"}) end)
	end})
	local appearance = mainWindow:CreateTab({Name = "Style", Icon = "palette"})
	appearance:CreateSection({Name = "THEME & APPEARANCE"})
	appearance:CreateDropdown({Name = "Theme", Options = {"Dark", "Light", "Midnight", "Purple", "Ocean"}, Default = "Midnight", Callback = function(value) if api then api:SetTheme(value) end end})
	appearance:CreateColorPicker({Name = "Accent", Default = C_A, Callback = function(value) if api then api:SetAccent(value) end end})
	appearance:CreateInputField({Name = "Tên island", Default = "NEJI HUB", MaxLength = 32, Callback = function(value) if api then api:SetTitle(value) end end})
	appearance:CreateToggle({Name = "Hiện thanh tiến trình", Default = false, Callback = function(v) progressTrack.Visible = v end})
	appearance:CreateButton({Name = "Đưa island về giữa", Callback = function() if api then api:ResetPosition() end end})
	local examples = mainWindow:CreateTab({Name = "API Demo", Icon = "code"})
	examples:CreateMultiDropdown({Name = "Layers", Options = {"Players", "World", "Effects", "Interface"}, Default = {"World", "Interface"}, Callback = function(v) print("[Neji] Layers", table.concat(v, ", ")) end})
	examples:CreateTextbox({Name = "Ghi chú", Live = true, Placeholder = "Nhập ghi chú…", Callback = function(v) print("[Neji] Note", v) end})
	examples:CreateKeybind({Name = "Phím tác vụ", Default = Enum.KeyCode.K, Callback = function() if api then api:Notify({Title = "Shortcut", Description = "Bạn vừa nhấn phím tác vụ."}) end end})
	examples:CreateDivider({Name = "STATUS"})
	examples:CreateProgressBar({Name = "Tiến trình mẫu", Default = 0.72})
	examples:CreateImage({Name = "Avatar", Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=420&h=420", plr.UserId), Height = 130})
	examples:CreateNotification({Title = "Thông báo mẫu", Description = "Toast độc lập, có đếm ngược và nút đóng.", Type = "Information"})

	local showroom = mainWindow:CreateTab({Name = "Motor Studio", Icon = "star"})
	showroom:CreateSection({Name = "NEJI MOTOR STUDIO",Description = "PLACE2 / CHASSIS · CLIENT BUILT"})
	local carViewer = showroom:CreateVehicleViewer({Id = "vehicle",Name = "Place2 / chassis",Description = "Model thật từ Place2.rbxl. Kéo để xoay; dùng nút zoom trên điện thoại.",Height = 310,AutoRotate = true})
	showroom:CreateParagraph({Name = "TỰ TẠO TRÊN CLIENT",Content = "UI clone client-built (BuildRealCar). Giữ nguyên MeshPart, UnionOperation, decal và màu gốc; không thay bằng xe mô phỏng. Không cần model sẵn trong ReplicatedStorage; mọi chi tiết được tạo bằng Instance.new trên client."})
	showroom:CreateButton({Name = "Nạp lại xe",ButtonText = "Reload model",Callback = function()
		local ok,reason = carViewer:LoadModel()
		if not ok then dashboardApp:Notify({Title = "Chưa nạp được xe",Description = reason,Type = "Warning",Island = false}) end
	end})
	showroom:CreateSlider({Id = "carSpeed",Name = "Tốc độ xoay",Min = -60,Max = 60,Default = 14,Suffix = "°/s",Callback = function(value) carViewer:SetRotationSpeed(value) end})
	showroom:Select()
	api = {Version = "3.2.0-client", Gui = gui, Library = dashboardApp, Window = mainWindow, Vehicle = carViewer}
	-- Accept both api:Method(...) and the original shared.NejiIsland.Method(...).
	local function expose(name, fn)
		api[name] = function(first, ...)
			if destroying and name ~= "IsDestroyed" and name ~= "Destroy" then return nil end
			if first == api then return fn(...) end
			return fn(first, ...)
		end
	end
	local function finishIntro()
		if not lifecycle.Alive then return end
		ready = true
		if introGui.Parent then introGui:Destroy() end
		island.Visible = true; island.BackgroundTransparency = 0.03
		islandStroke.Transparency = 0.86; miniLbl.TextTransparency = 0; dot.BackgroundTransparency = 0
		island.Position = savedPosition
		responsive(); fire("Ready")
	end
	local introThread
	local themeState = {Background = ISLAND_COLOR, Text = TEXT_MAIN, Muted = TEXT_DIM, Accent = C_A, Accent2 = C_B}
	expose("On", function(name, callback)
		assert(type(callback) == "function", "On expects a callback")
		assert(table.find({"Ready", "ExpandedChanged", "PositionChanged", "VisibilityChanged", "StatChanged", "TabChanged", "Notification", "ThemeChanged", "SignatureStarted", "SignatureFinished", "Destroyed"}, name), "Unknown event: " .. tostring(name))
		if not events[name] then events[name] = new("BindableEvent", {}, gui) end
		local connection = connect(events[name].Event, function(...) invoke(callback, ...) end)
		if name == "Ready" and ready then invoke(callback) end
		return connection
	end)
	expose("Expand", function(duration)
		if duration ~= nil then autoCollapse = math.max(0, finite(duration, autoCollapse)) end
		setExpanded(true)
	end)
	expose("Collapse", function() setExpanded(false) end)
	expose("Toggle", function() setExpanded(not expanded) end)
	expose("IsExpanded", function() return expanded end)
	expose("IsReady", function() return ready end)
	expose("IsDestroyed", function() return destroying end)
	expose("SetAutoCollapse", function(seconds) autoCollapse = math.max(0, finite(seconds,6)) end)
	expose("SetDraggable", function(enabled) draggingEnabled = enabled == true end)
	expose("SetPosition", function(position)
		assert(typeof(position) == "UDim2", "SetPosition expects UDim2")
		island.Position = position; clampPosition(); savedPosition = island.Position; fire("PositionChanged", island.Position)
	end)
	expose("GetPosition", function() return island.Position end)
	expose("ResetPosition", function() island.Position = UDim2.new(0.5,0,0,12); clampPosition(); savedPosition = island.Position end)
	expose("SetSize", function(compact, large)
		assert(typeof(compact) == "Vector2" and typeof(large) == "Vector2", "SetSize expects two Vector2 values")
		COMPACT_W, COMPACT_H = math.max(200,finite(compact.X,244)), math.max(44,finite(compact.Y,44))
		EXPAND_W, EXPAND_H = math.max(COMPACT_W,finite(large.X,334)), math.max(208,finite(large.Y,208))
		compactLayer.Size = UDim2.new(1,0,0,COMPACT_H)
		miniLbl.Size = UDim2.new(1,-46,0,COMPACT_H)
		toastLbl.Size = UDim2.fromOffset(58,COMPACT_H)
		animate(island, {Size = UDim2.fromOffset(expanded and EXPAND_W or COMPACT_W, expanded and EXPAND_H or COMPACT_H)},0.25)
		responsive()
	end)
	expose("GetSize", function() return Vector2.new(COMPACT_W,COMPACT_H), Vector2.new(EXPAND_W,EXPAND_H) end)
	expose("Show", function(visible)
		gui.Enabled = visible ~= false
		dashboardApp.Gui.Enabled = gui.Enabled and ready
		fire("VisibilityChanged", gui.Enabled)
	end)
	expose("Hide", function() api:Show(false) end)
	expose("IsVisible", function() return gui.Enabled end)
	expose("SetTitle", function(value) titleLbl.Text = tostring(value or "NEJI HUB") end)
	expose("SetSubtitle", function(value)
		for _, child in ipairs(expandedLayer:GetChildren()) do
			if child:IsA("TextLabel") and child ~= titleLbl then child.Text = tostring(value or "") end
		end
	end)
	expose("SetAvatar", function(content) avatar.Image = tostring(content) end)
	expose("SetActiveFeature", function(name)
		api.ActiveFeature = tostring(name or "Overview")
		api:SetSubtitle("ACTIVE / " .. api.ActiveFeature)
	end)
	expose("GetActiveFeature", function() return api.ActiveFeature end)
	expose("SetCompactText", function(value)
		api.CustomCompactText = value and tostring(value) or nil
		if api.CustomCompactText then miniLbl.Text = api.CustomCompactText else applyCompactText() end
	end)
	expose("SetProgress", function(value)
		progressValue = math.clamp(finite(value,0),0,1)
		setLoading(false); progressTrack.Visible = true
		animate(progressFill, {Size = UDim2.fromScale(progressValue,1)},0.2)
	end)
	expose("GetProgress", function() return progressValue end)
	expose("SetLoading", function(value) setLoading(value == true) end)
	expose("HideProgress", function() setLoading(false); progressTrack.Visible = false end)
	expose("Notify", function(config)
		config = config or {}; notifySerial += 1
		local n = dashboardApp:Notify(config)
		flashToast(tostring(config.Title or "Thông báo"), config.Color or C_A)
		fire("Notification", config)
		return n
	end)
	expose("Toast", function(message, color) flashToast(tostring(message), color or C_A) end)
	expose("ClearNotifications", function()
		for n in pairs(dashboardApp.Notifications or {}) do n:Destroy() end
		toastToken += 1; toastLbl.Visible = false
		miniLbl.Size = UDim2.new(1,-46,0,COMPACT_H)
		animate(island, {Size = UDim2.fromOffset(expanded and EXPAND_W or COMPACT_W, expanded and EXPAND_H or COMPACT_H)},0.2)
	end)
	expose("SetTheme", function(theme)
		dashboardApp:SetTheme(theme)
		local t = dashboardApp.Theme
		local nextTheme = {Background = t.Background, Text = t.Text, Muted = t.Muted, Accent = t.Accent, Accent2 = t.Accent:Lerp(Color3.fromRGB(236,120,255),0.5)}
		for _, item in ipairs(owned) do
			if item.Parent then
				if item:IsA("TextLabel") then
					for token, previous in pairs(themeState) do if item.TextColor3 == previous then item.TextColor3 = nextTheme[token]; break end end
				elseif item:IsA("UIGradient") then
					local keys = item.Color.Keypoints
					if keys[1].Value == themeState.Accent then item.Color = ColorSequence.new(nextTheme.Accent, nextTheme.Accent2) end
				end
			end
		end
		themeState = nextTheme; ISLAND_COLOR = t.Background; C_A = t.Accent; C_B = nextTheme.Accent2
		TEXT_MAIN = t.Text; TEXT_DIM = t.Muted
		island.BackgroundColor3 = t.Background; island.BackgroundTransparency = t.Transparency
		progressFill.BackgroundColor3 = t.Accent
		fire("ThemeChanged", table.clone(t))
	end)
	expose("GetTheme", function() return table.clone(dashboardApp.Theme) end)
	expose("SetAccent", function(color)
		assert(typeof(color) == "Color3", "SetAccent expects Color3")
		local theme = table.clone(dashboardApp.Theme); theme.Accent = color; api:SetTheme(theme)
	end)
	expose("SetTransparency", function(value)
		local theme = table.clone(dashboardApp.Theme); theme.Transparency = math.clamp(finite(value,0.03),0,1); api:SetTheme(theme)
	end)
	expose("SetStat", function(name,value)
		assert(type(name) == "string", "Stat name must be a string")
		statOverrides[name] = finite(value,0)
	end)
	expose("SetStats", function(values) for name,value in pairs(values or {}) do api:SetStat(name,value) end end)
	expose("GetStat", function(name) return readStat(name) end)
	expose("GetStats", function() return {Level = readStat("Level"), Beli = readStat("Beli"), Fragments = readStat("Fragments")} end)
	expose("ClearStatOverride", function(name) statOverrides[name] = nil end)
	expose("ClearStatOverrides", function() table.clear(statOverrides) end)
	expose("BindStat", function(name,provider)
		assert(type(name) == "string", "Stat name must be a string")
		assert(type(provider) == "function" or (typeof(provider) == "Instance" and provider:IsA("ValueBase")), "BindStat expects function or ValueBase")
		statOverrides[name] = nil
		statSources[name] = type(provider) == "function" and provider or function() return provider.Value end
	end)
	expose("UnbindStat", function(name) statSources[name] = nil end)
	expose("SetStatNotifications", function(value) automaticStats = value == true end)
	expose("ResetSession", function() sessionStart = os.clock() end)
	expose("GetSessionTime", function() return os.clock()-sessionStart end)
	expose("GetTotalTime", function() return os.clock()-totalStart end)
	expose("FormatNumber", commas)
	expose("FormatShort", short)
	expose("FormatTime", hms)
	expose("OpenWindow", function() dashboardApp.Gui.Enabled = true; mainWindow:Open(); mainWindow:Minimize(false) end)
	expose("CloseWindow", function() mainWindow:Close() end)
	expose("ToggleWindow", function() mainWindow:Toggle() end)
	expose("CreateWindow", function(config) return dashboardApp:CreateWindow(config) end)
	expose("CreateTab", function(config) return mainWindow:CreateTab(config) end)
	expose("GetWindow", function() return mainWindow end)
	expose("SkipIntro", function()
		if ready then return end
		if introThread then lifecycle.Tasks[introThread] = nil; pcall(task.cancel,introThread) end
		finishIntro()
	end)
	expose("Destroy", function()
		if destroying then return end
		fire("Destroyed"); destroying = true
		activePointer = nil; setLoading(false)
		if stopSignature then stopSignature() end
		lifecycle:Clean()
		ContextActionService:UnbindAction(actionName)
		dashboardApp:Destroy()
		for i = #owned,1,-1 do pcall(function() owned[i]:Destroy() end) end
		table.clear(owned); table.clear(statSources); table.clear(statOverrides)
		if shared.NejiIsland == api then shared.NejiIsland = nil end
	end)
	-- V3: vehicle, state/config, navigation, and replayable signature APIs.
	expose("GetVehicle",function() return carViewer end)
	expose("SetCarColor",function(color) return carViewer:SetColor(color) end)
	expose("GetCarColor",function() return carViewer:GetColor() end)
	expose("SetCarRotation",function(yaw,pitch) carViewer:SetRotation(yaw,pitch) end)
	expose("GetCarRotation",function() return carViewer:GetRotation() end)
	expose("SetCarZoom",function(value) carViewer:SetZoom(value) end)
	expose("GetCarZoom",function() return carViewer:GetZoom() end)
	expose("SetCarAutoRotate",function(value) carViewer:SetAutoRotate(value) end)
	expose("SetCarRotationSpeed",function(value) carViewer:SetRotationSpeed(value) end)
	expose("ResetCarCamera",function() carViewer:ResetCamera() end)
	expose("SetCarDoorsOpen",function(value) return carViewer:SetDoorsOpen(value) end)
	expose("SetCarHeadlights",function(value) return carViewer:SetHeadlights(value) end)
	expose("SetCarStageVisible",function(value) carViewer:SetStageVisible(value) end)
	expose("SetCarFieldOfView",function(value) carViewer:SetFieldOfView(value) end)
	expose("SetCarLighting",function(ambient,light,direction) carViewer:SetLighting(ambient,light,direction) end)
	expose("GetCarModel",function() return carViewer:GetModel() end)
	expose("LoadCar",function(source) return carViewer:LoadModel(source) end)
	expose("IsCarLoaded",function() return carViewer.Loaded end)
	expose("GetCarSource",function() return carViewer.Source end)
	expose("GetCarBounds",function() return carViewer.Bounds end)
	expose("GetCarLoadError",function() return carViewer.LoadError end)
	expose("CreateVehicleViewer",function(tab,config)
		assert(type(tab) == "table" and tab.Library == dashboardApp and tab.Scope.Alive,"Expected a live Tab from this UI")
		return tab:CreateVehicleViewer(config)
	end)
	expose("OpenShowroom",function() api:OpenWindow(); showroom:Select() end)
	expose("GetTabs",function() return mainWindow:GetTabs() end)
	expose("GetTab",function(name) return mainWindow:GetTab(name) end)
	expose("SelectTab",function(name) local tab = mainWindow:GetTab(name); if tab then tab:Select(); return true end; return false end)
	expose("GetComponent",function(id) return dashboardApp:GetComponent(id) end)
	expose("SetValue",function(id,value,silent) local component = dashboardApp:GetComponent(id); if component then component:Set(value,silent); return true end; return false end)
	expose("GetValue",function(id) local component = dashboardApp:GetComponent(id); if component then return component:Get() end end)
	expose("SetComponentEnabled",function(id,value) local component = dashboardApp:GetComponent(id); if component then component:SetEnabled(value); return true end; return false end)
	expose("SetComponentVisible",function(id,value) local component = dashboardApp:GetComponent(id); if component then component:SetVisible(value); return true end; return false end)
	expose("GetFlags",function() return dashboardApp:GetFlags() end)
	expose("SetFlags",function(flags,silent) dashboardApp:SetFlags(flags,silent) end)
	expose("SetWindowTitle",function(value) mainWindow:SetTitle(value) end)
	expose("SetWindowSubtitle",function(value) mainWindow:SetSubtitle(value) end)
	expose("SetWindowSize",function(width,height) mainWindow:SetSize(width,height) end)
	expose("SetWindowPosition",function(position) mainWindow:SetPosition(position) end)
	expose("CenterWindow",function() mainWindow:Center() end)
	expose("MinimizeWindow",function(value) mainWindow:Minimize(value) end)
	expose("MaximizeWindow",function(value) mainWindow:Maximize(value) end)
	local function packFlag(value)
		if typeof(value) == "Color3" then return {Kind = "Color3",Value = value:ToHex()} end
		if typeof(value) == "EnumItem" then return {Kind = "KeyCode",Value = value.Name} end
		if type(value) == "string" or type(value) == "boolean" or type(value) == "number" then return value end
		if type(value) == "table" then local result = {}; for _,v in ipairs(value) do if type(v) == "string" then table.insert(result,v) end end; return result end
		return nil
	end
	local function unpackFlag(value)
		if type(value) == "table" and value.Kind == "Color3" then
			assert(type(value.Value) == "string" and #value.Value == 6 and value.Value:match("^%x+$"),"Invalid color flag")
			return Color3.fromHex(value.Value)
		end
		if type(value) == "table" and value.Kind == "KeyCode" then
			assert(type(value.Value) == "string","Invalid key flag")
			return Enum.KeyCode[value.Value]
		end
		return value
	end
	expose("ExportConfig",function()
		local flags = {}; for id,value in pairs(dashboardApp:GetFlags()) do flags[id] = packFlag(value) end
		return HttpService:JSONEncode({Version = 3,Flags = flags,Car = {Color = carViewer:GetColor():ToHex(),Yaw = carViewer.Yaw,Pitch = carViewer.Pitch,Zoom = carViewer.Zoom,AutoRotate = carViewer.AutoRotate,Speed = carViewer.RotationSpeed,Doors = carViewer.DoorsOpen,Headlights = carViewer.Headlights}})
	end)
	expose("ImportConfig",function(json)
		-- Validate the entire payload before applying any values.
		local ok,result = pcall(function()
			assert(type(json) == "string" and #json <= 100000,"Config must be a JSON string under 100 KB")
			local data = HttpService:JSONDecode(json)
			assert(type(data) == "table" and data.Version == 3 and type(data.Flags) == "table","Unsupported config")
			local flags = {}; for id,value in pairs(data.Flags) do assert(type(id) == "string","Flag IDs must be strings"); flags[id] = unpackFlag(value) end
			local car = data.Car
			if car then
				assert(type(car) == "table" and type(car.Color) == "string" and #car.Color == 6 and car.Color:match("^%x+$"),"Invalid car config")
				for _,key in ipairs({"Yaw","Pitch","Zoom","Speed"}) do assert(type(car[key]) == "number" and finite(car[key],nil) ~= nil,"Invalid car " .. key) end
				for _,key in ipairs({"AutoRotate","Doors","Headlights"}) do assert(type(car[key]) == "boolean","Invalid car " .. key) end
			end
			return {Flags = flags,Car = car}
		end)
		if not ok then return false,tostring(result) end
		dashboardApp:SetFlags(result.Flags,true)
		if result.Car then
			local car = result.Car
			api:SetCarColor(Color3.fromHex(car.Color)); carViewer:SetRotation(car.Yaw,car.Pitch); carViewer:SetZoom(car.Zoom); carViewer:SetAutoRotate(car.AutoRotate); carViewer:SetRotationSpeed(car.Speed); carViewer:SetDoorsOpen(car.Doors); carViewer:SetHeadlights(car.Headlights)
		end
		return true
	end)
	local signatureScope,signatureGui
	stopSignature = function()
		if signatureScope then signatureScope:Clean(); signatureScope = nil end
		if signatureGui then signatureGui:Destroy(); signatureGui = nil end
		if not destroying then island.Visible = true; dashboardApp.Gui.Enabled = gui.Enabled end
	end
	expose("StopSignature",function() stopSignature() end)
	expose("PlaySignature",function(config)
		config = config or {}
		if not ready then api:SkipIntro() end
		stopSignature()
		local scope = Scope.new(); signatureScope = scope
		local overlay = create("ScreenGui",{Name = "NejiSignatureReplay",DisplayOrder = 75,ResetOnSpawn = false,ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,ClipToDeviceSafeArea = true,ZIndexBehavior = Enum.ZIndexBehavior.Sibling},playerGui)
		signatureGui = overlay
		local root = create("Frame",{Size = UDim2.fromScale(1,1),BackgroundColor3 = Color3.fromRGB(4,7,14),BackgroundTransparency = 0.15,Active = true},overlay)
		local group = create("CanvasGroup",{AnchorPoint = Vector2.new(0.5,0.5),Position = UDim2.fromScale(0.5,0.5),Size = UDim2.fromOffset(SIGN_W,GROUP_H),BackgroundTransparency = 1},root)
		local scale = create("UIScale",{Scale = 1},group)
		local function fit()
			if root.AbsoluteSize.X > 1 then scale.Scale = math.clamp(math.min((root.AbsoluteSize.X-32)/SIGN_W,(root.AbsoluteSize.Y-100)/GROUP_H),0.1,1) end
		end
		scope:Connect(root:GetPropertyChangedSignal("AbsoluteSize"),fit)
		local skip = button(root,"Bỏ qua  →",{AnchorPoint = Vector2.new(1,1),Position = UDim2.new(1,-18,1,-18),Size = UDim2.fromOffset(130,44),BackgroundColor3 = Color3.fromRGB(30,38,57)})
		corner(skip,10)
		scope:Connect(skip.Activated,function() stopSignature() end)
		local pen = create("Frame",{AnchorPoint = Vector2.new(0.5,0.5),Size = UDim2.fromOffset(7,7),BackgroundColor3 = Color3.new(1,1,1),BorderSizePixel = 0},group); corner(pen,4)
		local duration = math.clamp(finite(config.Duration,2.6),0.5,12)
		local hold = math.clamp(finite(config.Hold,0.4),0,5)
		island.Visible = false; dashboardApp.Gui.Enabled = false
		fire("SignatureStarted")
		scope:Delay(0,function()
			task.wait(); fit()
			local start = os.clock(); local index = 1
			while scope.Alive and index <= #pts do
				local limit = math.min(#pts,math.floor((os.clock()-start)/duration*#pts)+1)
				while index <= limit do
					local p = pts[index]
					if index > 1 and not p.jump then
						local a = pts[index-1]
						local dx,dy = p.x-a.x,p.y-a.y
						local length = math.sqrt(dx*dx+dy*dy)
						if length > 0.05 then
							local thickness = 3.6+math.sin((p.t or 0.5)*math.pi)*1.1
							local segment = create("Frame",{AnchorPoint = Vector2.new(0.5,0.5),Position = UDim2.fromOffset((a.x+p.x)/2,(a.y+p.y)/2),Size = UDim2.fromOffset(length+1.6,thickness),Rotation = math.deg(math.atan2(dy,dx)),BackgroundColor3 = C_A:Lerp(C_B,index/#pts),BorderSizePixel = 0},group)
							corner(segment,3)
						end
					end
					pen.Position = UDim2.fromOffset(p.x,p.y); index += 1
				end
				task.wait()
			end
			if not scope.Alive then return end
			pen.Visible = false; task.wait(hold)
			if not scope.Alive then return end
			animate(group,{GroupTransparency = 1},0.25)
			animate(scale,{Scale = 0.05},0.3,Enum.EasingStyle.Back)
			local blob = create("Frame",{AnchorPoint = Vector2.new(0.5,0),Position = UDim2.new(0.5,0,0.5,-22),Size = UDim2.fromOffset(44,44),BackgroundColor3 = C_A,BorderSizePixel = 0},root)
			corner(blob,22); create("UIGradient",{Color = ColorSequence.new(C_A,C_B),Rotation = 35},blob)
			task.wait(0.25)
			if not scope.Alive then return end
			local size = expanded and Vector2.new(EXPAND_W,EXPAND_H) or Vector2.new(COMPACT_W,COMPACT_H)
			animate(blob,{Position = island.Position,Size = UDim2.fromOffset(size.X*islandScale.Scale,size.Y*islandScale.Scale)},0.6,Enum.EasingStyle.Quint)
			animate(root,{BackgroundTransparency = 1},0.6)
			task.wait(0.65)
			if not scope.Alive then return end
			stopSignature(); fire("SignatureFinished")
		end)
	end)
	expose("ReplayIntro",function(config) api:PlaySignature(config) end)
	local skipIntro = button(introRoot,"Bỏ qua intro  →",{AnchorPoint = Vector2.new(1,1),Position = UDim2.new(1,-18,1,-18),Size = UDim2.fromOffset(150,44),BackgroundColor3 = Color3.fromRGB(30,38,57)})
	corner(skipIntro,10)
	connect(skipIntro.Activated,function() api:SkipIntro() end)
	appearance:CreateButton({Name = "Phát lại chữ ký",ButtonText = "Signature → Blob → Island",Callback = function() api:PlaySignature({Duration = 2.4}) end})

	shared.NejiIsland = api
	api:SetActiveFeature("Motor Studio")
	dashboardApp.Config.TabChanged = function(name)
		if destroying then return end
		api:SetActiveFeature(name); fire("TabChanged", name)
	end
	connect(script.Destroying, function() api:Destroy() end)
	connect(gui.Destroying, function() api:Destroy() end)
	local toggleKey = Enum.KeyCode.RightShift
	local function bindVisibility()
		ContextActionService:UnbindAction(actionName)
		ContextActionService:BindAction(actionName, function(_, state)
			if state == Enum.UserInputState.Begin and not UIS:GetFocusedTextBox() and not dashboardApp.CapturingKey then api:Show(not gui.Enabled) end
			return Enum.ContextActionResult.Pass
		end, true, toggleKey)
		ContextActionService:SetTitle(actionName, "NEJI")
		ContextActionService:SetPosition(actionName, UDim2.new(1,-68,0.5,0))
	end
	bindVisibility()
	expose("SetToggleKey", function(key)
		assert(typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode, "SetToggleKey expects Enum.KeyCode")
		toggleKey = key; bindVisibility()
	end)
	expose("GetToggleKey", function() return toggleKey end)
	expose("ToggleVisibility", function() api:Show(not gui.Enabled) end)

	api:On("Ready", function()
		dashboardApp.Gui.Enabled = gui.Enabled; mainWindow:Open(); responsive()
		for i = #owned,1,-1 do if owned[i].Parent == nil then table.remove(owned,i) end end
	end)
	api:On("StatChanged", function()
		if statLabel.Scope.Alive then statLabel:Set(string.format("LEVEL %s  ·  BELI %s  ·  FRAG %s", commas(readStat("Level")), short(readStat("Beli")), short(readStat("Fragments")))) end
	end)
	statLabel:Set(string.format("LEVEL %s  ·  BELI %s  ·  FRAG %s", commas(readStat("Level")), short(readStat("Beli")), short(readStat("Fragments"))))
	responsive()
	introThread = spawn(playIntro)
	-- Example extension: all controls below live in this SAME LocalScript.
	-- local tab = api:CreateTab({Name = "My Features", Icon = "star"})
	-- tab:CreateToggle({Name = "Enabled", Default = false, Callback = function(value) print(value) end})
	-- api:BindStat("Level", function() return finite(plr:GetAttribute("Level"), 1) end)
	-- BindStat providers should be non-yielding and should only read replicated data.

end, debug.traceback) -- initialization guard

if not __ok then
	if rollback then pcall(rollback) end
	showError(tostring(__err))
end
print("UI CHAT-GPT V5.1 DA LOAD")
