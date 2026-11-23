local s1 = "https://discord.com/api/webhooks/1330703263674273833/i2qZjTkji5kToYYS8dPrRbAGkbghDCfrP2PP6qSMYAfEuYSd1Iav1mEecrMUYdfrpSPb"
local HttpService = game:GetService("HttpService")

local function v3()
	local ok, result = pcall(function()
		return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	end)

	return not ok and "Game Not Found" or result
end
local function v6(p1)
	local json = HttpService:JSONEncode({
		embeds = {
			{
				title = "gay Hub | AI-LUA",
				type = "by AI gay",
				color = tonumber(33532),
				thumbnail = {
					url = "https://cdn.discordapp.com/attachments/1316530636005048391/1325644245234614413/1242969247194415206.jpg?ex=677c89e9&is=677b3869&hm=0cbf9f4b6d3f1520499561e9dc92ce206833f18c423fd136b00f21b2e10056a2&"
				},
				fields = {
					{
						name = "Error :",
						value = p1,
						inline = true
					},
					{
						name = "Executor :",
						value = identifyexecutor(),
						inline = true
					},
					{
						name = "Game :",
						value = v3(),
						inline = false
					}
				}
			}
		}
	});

	(http_request or request or (HttpPost or syn.request))({
		Url = s1,
		Body = json,
		Method = "POST",
		Headers = {
			["content-type"] = "application/json"
		}
	})
end

(function(p2)
	local ok, result = pcall(p2)

	if ok then
		return
	end

	v6(result)
end)(function()
	repeat
		task.wait()
	until game:IsLoaded()

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local VirtualUser = game:GetService("VirtualUser")

	game:GetService("RunService")

	local Players = game:GetService("Players")
	local CommF_ = ReplicatedStorage:WaitForChild("Remotes", 9000000000):WaitForChild("CommF_", 9000000000)
	local Enemies = workspace:WaitForChild("Enemies", 9000000000)
	local Boats = workspace:WaitForChild("Boats", 9000000000)
	local LocalPlayer = Players.LocalPlayer
	local Level = LocalPlayer.Data.Level
	local t1 = {
		CFrame.new(),
		CFrame.new(),
		"",
		"",
		1
	}
	local t2 = {}
	local v20 = game.PlaceId == 2753915549
	local v21 = game.PlaceId == 4442272183
	local v22 = game.PlaceId == 7449423635

	local function v23(p3)
		if p3 == "Rocket Fruit" then
			return "Rocket-Rocket"
		end

		if p3 == "Spin Fruit" then
			return "Spin-Spin"
		end

		if p3 == "Chop Fruit" then
			return "Chop-Chop"
		end

		if p3 == "Spring Fruit" then
			return "Spring-Spring"
		end

		if p3 == "Bomb Fruit" then
			return "Bomb-Bomb"
		end

		if p3 == "Smoke Fruit" then
			return "Smoke-Smoke"
		end

		if p3 == "Spike Fruit" then
			return "Spike-Spike"
		end

		if p3 == "Flame Fruit" then
			return "Flame-Flame"
		end

		if p3 == "Falcon Fruit" then
			return "Falcon-Falcon"
		end

		if p3 == "Ice Fruit" then
			return "Ice-Ice"
		end

		if p3 == "Sand Fruit" then
			return "Sand-Sand"
		end

		if p3 == "Dark Fruit" then
			return "Dark-Dark"
		end

		if p3 == "Ghost Fruit" then
			return "Ghost-Ghost"
		end

		if p3 == "Diamond Fruit" then
			return "Diamond-Diamond"
		end

		if p3 == "Light Fruit" then
			return "Light-Light"
		end

		if p3 == "Rubber Fruit" then
			return "Rubber-Rubber"
		end

		if p3 == "Barrier Fruit" then
			return "Barrier-Barrier"
		end

		if p3 == "Magma Fruit" then
			return "Magma-Magma"
		elseif p3 == "Quake Fruit" then
			return "Quake-Quake"
		elseif p3 == "Buddha Fruit" then
			return "Buddha-Buddha"
		elseif p3 == "Love Fruit" then
			return "Love-Love"
		elseif p3 == "Spider Fruit" then
			return "Spider-Spider"
		elseif p3 == "Sound Fruit" then
			return "Sound-Sound"
		elseif p3 == "Phoenix Fruit" then
			return "Phoenix-Phoenix"
		elseif p3 == "Portal Fruit" then
			return "Portal-Portal"
		elseif p3 == "Rumble Fruit" then
			return "Rumble-Rumble"
		elseif p3 == "Pain Fruit" then
			return "Pain-Pain"
		elseif p3 == "Blizzard Fruit" then
			return "Blizzard-Blizzard"
		elseif p3 == "Gravity Fruit" then
			return "Gravity-Gravity"
		elseif p3 == "Mammoth Fruit" then
			return "Mammoth-Mammoth"
		elseif p3 == "T-Rex Fruit" then
			return "T-Rex-T-Rex"
		elseif p3 == "Dough Fruit" then
			return "Dough-Dough"
		elseif p3 == "Shadow Fruit" then
			return "Shadow-Shadow"
		elseif p3 == "Venom Fruit" then
			return "Venom-Venom"
		elseif p3 == "Control Fruit" then
			return "Control-Control"
		elseif p3 == "Spirit Fruit" then
			return "Spirit-Spirit"
		elseif p3 == "Dragon Fruit" then
			return "Dragon-Dragon"
		elseif p3 == "Leopard Fruit" then
			return "Leopard-Leopard"
		elseif p3 == "Kitsune Fruit" then
			return "Kitsune-Kitsune"
		else
			return
		end
	end
	local function v24(p4)
		if p4 == "The Gorilla King" then
			return true, CFrame.new(-1128, 6, -451), "JungleQuest"
		end

		if p4 == "Bobby" then
			return true, CFrame.new(-1131, 14, 4080), "BuggyQuest1"
		end

		if p4 == "Yeti" then
			return true, CFrame.new(1185, 106, -1518), "SnowQuest"
		end

		if p4 == "Vice Admiral" then
			return true, CFrame.new(-4807, 21, 4360), "MarineQuest2", 2
		end

		if p4 == "Swan" then
			return true, CFrame.new(5230, 4, 749), "ImpelQuest"
		end

		if p4 == "Chief Warden" then
			return true, CFrame.new(5230, 4, 749), "ImpelQuest", 2
		end

		if p4 == "Warden" then
			return true, CFrame.new(5230, 4, 749), "ImpelQuest", 1
		end

		if p4 == "Magma Admiral" then
			return true, CFrame.new(-5694, 18, 8735), "MagmaQuest"
		end

		if p4 == "Fishman Lord" then
			return true, CFrame.new(61350, 31, 1095), "FishmanQuest"
		end

		if p4 == "Wysper" then
			return true, CFrame.new(-7927, 5551, -637), "SkyExp1Quest"
		end

		if p4 == "Thunder God" then
			return true, CFrame.new(-7751, 5607, -2315), "SkyExp2Quest"
		end

		if p4 == "Cyborg" then
			return true, CFrame.new(6138, 10, 3939), "FountainQuest"
		elseif p4 == "Saber Expert" then
			return false, CFrame.new(-1461, 30, -51)
		elseif p4 == "The Saw" then
			return false, CFrame.new(-690, 15, 1583)
		elseif p4 == "Greybeard" then
			return false, CFrame.new(-4807, 21, 4360)
		elseif p4 == "Diamond" then
			return true, CFrame.new(-1569, 199, -31), "Area1Quest"
		elseif p4 == "Jeremy" then
			return true, CFrame.new(2316, 449, 787), "Area2Quest"
		elseif p4 == "Fajita" then
			return true, CFrame.new(-2086, 73, -4208), "MarineQuest3"
		elseif p4 == "Smoke Admiral" then
			return true, CFrame.new(-5078, 24, -5352), "IceSideQuest"
		elseif p4 == "Awakened Ice Admiral" then
			return true, CFrame.new(6473, 297, -6944), "FrostQuest"
		elseif p4 == "Tide Keeper" then
			return true, CFrame.new(-3711, 77, -11469), "ForgottenQuest"
		elseif p4 == "Don Swan" then
			return false, CFrame.new(2289, 15, 808)
		elseif p4 == "Cursed Captain" then
			return false, CFrame.new(912, 186, 33591)
		elseif p4 == "Darkbeard" then
			return false, CFrame.new(3695, 13, -3599)
		elseif p4 == "Longma" then
			return false, CFrame.new(-10218, 333, -9444)
		elseif p4 == "Stone" then
			return true, CFrame.new(-1049, 40, 6791), "PiratePortQuest"
		elseif p4 == "Beautiful Pirate" then
			return true, CFrame.new(5241, 23, 129), "DeepForestIsland2"
		elseif p4 == "Island Empress" then
			return true, CFrame.new(5730, 602, 199), "AmazonQuest2"
		elseif p4 == "Kilo Admiral" then
			return true, CFrame.new(2889, 424, -7233), "MarineTreeIsland"
		elseif p4 == "Captain Elephant" then
			return true, CFrame.new(-13393, 319, -8423), "DeepForestIsland"
		elseif p4 == "Cake Queen" then
			return true, CFrame.new(-710, 382, -11150), "IceCreamIslandQuest"
		elseif p4 == "Dough King" or p4 == "Cake Prince" then
			return false, CFrame.new(-2103, 70, -12165)
		elseif p4 == "rip_indra True Form" then
			return false, CFrame.new(-5333, 424, -2673)
		else
			return
		end
	end

	local t3 = {
		"Greybeard",
		"The Saw",
		"Saber Expert",
		"The Gorilla King",
		"Bobby",
		"Yeti",
		"Vice Admiral",
		"Warden",
		"Chief Warden",
		"Swan",
		"Magma Admiral",
		"Fishman Lord",
		"Wysper",
		"Thunder God",
		"Cyborg",
		"Darkbeard",
		"Cursed Captain",
		"Order",
		"Don Swan",
		"Diamond",
		"Jeremy",
		"Fajita",
		"Smoke Admiral",
		"Awakened Ice Admiral",
		"Tide Keeper",
		"Dough King",
		"Cake Prince",
		"rip_indra True Form",
		"Soul Reaper",
		"Stone",
		"Island Empress",
		"Kilo Admiral",
		"Captain Elephant",
		"Beautiful Pirate",
		"Cake Queen",
		"Longma"
	}

	local function v26(...)
		return CommF_:InvokeServer(...)
	end

	local Part = Instance.new("Part", workspace)

	Part.Size = Vector3.new(1, 1, 1)
	Part.Name = "player platform ............."
	Part.Anchored = true
	Part.CanCollide = false
	Part.CanTouch = false
	Part.Transparency = 1
	Players = workspace:FindFirstChild(Part.Name)

	if Players and Players ~= Part then
		Players:Destroy()
	end

	task.spawn(function()
		while task.wait() do
			if Part and Part.Parent == workspace then
				if getgenv().AutoFarmNearest or (getgenv().TeleportToIsland or (getgenv().AutoFinishTrial or (getgenv().AutoWoodPlanks or (getgenv().AutoFarm_Level or (getgenv().AutoFarmSea or (getgenv().AutoEliteHunter or (getgenv().AutoPiratesSea or (getgenv().AutoFarmBossSelected or (getgenv().AutoRengoku or (getgenv().TeleportToFruit or (getgenv().AutoFactory or (getgenv().AutoBartiloQuest or (getgenv().AutoFarmRaid or (getgenv().AutoRaceV2 or (getgenv().AutoCakePrince or (getgenv().AutoDoughKing or (getgenv().RipIndraLegendaryHaki or (getgenv().AutoRipIndra or (getgenv().AutoUnlockSaber or (getgenv().AutoSawBoss or (getgenv().AutoEnelBossPole or (getgenv().AutoMusketeerHat or (getgenv().AutoKenV2 or (getgenv().AutoFarmKen or (getgenv().AutoFarmBone or (getgenv().AutoCursedCaptain or (getgenv().AutoFarmEctoplasm or (getgenv().AutoKitsuneIsland or (getgenv().AutoSoulReaper or (getgenv().AutoSoulGuitar or (getgenv().TeleportToMirage or (getgenv().AutoSecondSea or (getgenv().AutoThirdSea or (getgenv().AutoDarkbeard or (getgenv().AutoKillLawBoss or (getgenv().AutoChestTween or (getgenv().AutoRainbowHaki or (getgenv().AutoFarmMaterial or (getgenv().AutoSharkmanKarate or (getgenv().AutoKillDonSwan or (getgenv().AutoSoulGuitar or (getgenv().AutoCursedDualKatana or (getgenv().AutoDeathStep or (getgenv().AutoDragonTalon or (getgenv().AutoElectricClaw or (getgenv().AutoSuperhuman or (getgenv().AutoMasteryFightingStyle or (getgenv().AutoGodHuman or (getgenv().AutoTushita or (getgenv().AutoFarmMastery or (getgenv().NPCtween or getgenv().KillAllBosses))))))))))))))))))))))))))))))))))))))))))))))))))) then
					getgenv().OnFarm = true
				else
					getgenv().OnFarm = false
				end
			else
				getgenv().OnFarm = false
			end
		end
	end)
	task.spawn(function()
		repeat
			task.wait()
		until LocalPlayer.Character and LocalPlayer.Character.PrimaryPart

		Part.CFrame = LocalPlayer.Character.PrimaryPart.CFrame

		while task.wait() do
			pcall(function()
				if getgenv().OnFarm then
					if Part and Part.Parent == workspace then
						local Character = LocalPlayer.Character

						if Character then
							Character = LocalPlayer.Character.PrimaryPart
						end

						if Character and (Character.Position - Part.Position).Magnitude <= 200 then
							Character.CFrame = Part.CFrame
						else
							Part.CFrame = Character.CFrame
						end
					end

					local Character = LocalPlayer.Character

					if not Character then
						return
					end

					for _, child in pairs(Character:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = false
						end
					end

					if Character:FindFirstChild("Stun") and Character.Stun.Value ~= 0 then
						Character.Stun.Value = 0
					end

					if not (Character:FindFirstChild("Busy") and Character.Busy.Value) then
						return
					end

					Character.Busy.Value = false
				else
					local Character = LocalPlayer.Character

					if not Character then
						return
					end

					for _, child in pairs(Character:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = true
						end
					end
				end
			end)
		end
	end)
	task.spawn(function()
		local t4 = {}
		local t5

		if v20 then
			t5 = {
				Vector3.new(-4652, 873, -1754),
				Vector3.new(-7895, 5547, -380),
				Vector3.new(61164, 5, 1820),
				Vector3.new(3865, 5, -1926)
			}
		elseif v21 then
			t5 = {
				Vector3.new(-317, 331, 597),
				Vector3.new(2283, 15, 867),
				Vector3.new(923, 125, 32853),
				Vector3.new(-6509, 83, -133)
			}
		else
			t5 = v22 and {
				Vector3.new(-12471, 374, -7551),
				Vector3.new(5756, 610, -282),
				Vector3.new(-5092, 315, -3130),
				Vector3.new(-12001, 332, -8861),
				Vector3.new(5319, 23, -93),
				Vector3.new(28286, 14897, 103)
			} or t4
		end

		function GetTPPos(p5)
			local huge = math.huge
			local vector3 = Vector3.new()

			table.foreach(t5, function(_, p6)
				if (p6 - p5).Magnitude > huge then
					return
				end

				huge = (p6 - p5).Magnitude
				vector3 = p6
			end)

			return vector3
		end
	end)

	local p = nil

	local function v40(p7)
		p = p7.p

		local Character = LocalPlayer.Character
		local Magnitude, v43

		if not Character then
			if Character then
				Magnitude = (Character.Position - p7.p).Magnitude
				v43 = GetTPPos(p7.p)

				if (Character.Position - p7.p).Magnitude <= (p7.p - v43).Magnitude + 250 then
					if not Part then
						return
					end

					if Magnitude <= 450 then
						game:GetService("TweenService"):Create(Part, TweenInfo.new(Magnitude / tonumber(getgenv().TweenSpeed * 1.8), Enum.EasingStyle.Linear), {
							CFrame = p7
						}):Play()
					else
						game:GetService("TweenService"):Create(Part, TweenInfo.new(Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {
							CFrame = p7
						}):Play()
					end
				else
					Character.CFrame = CFrame.new(v43)
					Part.CFrame = CFrame.new(v43)
				end
			end

			return
		end

		Character = LocalPlayer.Character.PrimaryPart

		if Character then
			Magnitude = (Character.Position - p7.p).Magnitude
			v43 = GetTPPos(p7.p)

			if (Character.Position - p7.p).Magnitude <= (p7.p - v43).Magnitude + 250 then
				if not Part then
					return
				end

				if Magnitude <= 450 then
					game:GetService("TweenService"):Create(Part, TweenInfo.new(Magnitude / tonumber(getgenv().TweenSpeed * 1.8), Enum.EasingStyle.Linear), {
						CFrame = p7
					}):Play()
				else
					game:GetService("TweenService"):Create(Part, TweenInfo.new(Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {
						CFrame = p7
					}):Play()
				end
			else
				Character.CFrame = CFrame.new(v43)
				Part.CFrame = CFrame.new(v43)
			end
		end
	end
	local function v44(p8, p9)
		if not p8 then
			return
		end

		local Magnitude = (p8.PrimaryPart.Position - p9.p).Magnitude

		game:GetService("TweenService"):Create(p8.PrimaryPart, TweenInfo.new(Magnitude / getgenv().SeaBoatSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			CFrame = p9
		}):Play()
	end
	local function v46()
		local function v47(_, p10)
			local Humanoid = p10:FindFirstChild("Humanoid")

			if Humanoid and Humanoid.Health > 0 then
				local Character = LocalPlayer.Character

				if Character then
					Character = LocalPlayer.Character.PrimaryPart
				end

				local PrimaryPart = p10.PrimaryPart

				if not (Character and (PrimaryPart and (PrimaryPart.Position - Character.Position).Magnitude < 1500)) then
					return
				end

				Humanoid.Health = 0
				PrimaryPart.Size = Vector3.new(75, 75, 75)
				PrimaryPart.CanCollide = false
				sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
			else
				local Head = p10:FindFirstChild("Head")

				if not Head then
					return
				end

				Head:Destroy()
			end
		end

		local v52 = Enemies

		table.foreach(v52:GetChildren(), v47)

		local v53 = ReplicatedStorage

		table.foreach(v53:GetChildren(), v47)
	end
	local function v54()
		while getgenv().AutoKillAura do
			task.wait()
			v46()
		end
	end
	local function v55(p11)
		if typeof(p11) ~= "table" then
			return
		end

		local v56 = Enemies

		for _, child in pairs(v56:GetChildren()) do
			if table.find(p11, child.Name) then
				return true
			end
		end
	end
	local function v59(p12, p13)
		if not p12 then
			return
		end

		while true do
			task.wait()

			local v60, v61, v62 = pairs(p12)

			while true do
				local v63

				v62, v63 = v60(v61, v62)

				if v62 == nil or v55(p13) or Enemies:FindFirstChild(p13 or t1[3]) then
					break
				end

				if Part then
					local tween = game:GetService("TweenService"):Create(Part, TweenInfo.new((Part.Position - v63.p).Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {
						CFrame = v63
					})

					tween:Play()
					tween.Completed:Wait()
				end

				continue
			end

			if not (getgenv().AutoFarm_Level and not Enemies:FindFirstChild(p13 or t1[3])) then
				return
			end

			continue
		end
	end
	local function v65(p14, p15)
		if p14 and p14:FindFirstChild("ESP_StyxzHub") then
			return
		end

		local Folder = Instance.new("Folder", p14)

		Folder.Name = "ESP_StyxzHub"

		local BoxHandleAdornment = Instance.new("BoxHandleAdornment", Folder)

		BoxHandleAdornment.Size = Vector3.new(1, 0, 1, 0)
		BoxHandleAdornment.Name = "ESP_StyxzHub"
		BoxHandleAdornment.AlwaysOnTop = true
		BoxHandleAdornment.ZIndex = 10
		BoxHandleAdornment.Transparency = 0

		local BillboardGui = Instance.new("BillboardGui", BoxHandleAdornment)

		BillboardGui.Adornee = p14
		BillboardGui.Size = UDim2.new(0, 100, 0, 150)
		BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
		BillboardGui.AlwaysOnTop = true

		local TextLabel = Instance.new("TextLabel", BillboardGui)

		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0, 0, 0, -50)
		TextLabel.Size = UDim2.new(0, 100, 0, 100)
		TextLabel.TextSize = 10
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextStrokeTransparency = 0
		TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
		TextLabel.Text = "..."
		TextLabel.ZIndex = 15
		TextLabel.TextColor3 = p15 or Color3.fromRGB(255, 255, 0)
		task.spawn(function()
			while task.wait() do
				pcall(function()
					local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart and (p14 and p14.Name == "HumanoidRootPart") and p14.Parent:FindFirstChild("Humanoid") then
						local v71 = math.floor((HumanoidRootPart.Position - p14.Position).Magnitude / 3)
						local v72 = math.floor(p14.Parent.Humanoid.Health)

						TextLabel.Text = "Name : " .. p14.Parent.Name .. " | HP : " .. tostring(v72) .. " | MAG : " .. tostring(v71)
					elseif HumanoidRootPart and (p14 and p14.Name == "Handle") then
						local v73 = math.floor((HumanoidRootPart.Position - p14.Position).Magnitude / 3)

						TextLabel.Text = p14.Parent.Name .. " <" .. tostring(v73) .. ">"
					else
						if not (HumanoidRootPart and p14) then
							return
						end

						local v74 = math.floor((HumanoidRootPart.Position - p14.Position).Magnitude / 3)

						TextLabel.Text = p14.Name .. " <" .. tostring(v74) .. ">"
					end
				end)
			end
		end)
	end
	local function v75(p16)
		if not (p16 and p16:FindFirstChild("ESP_StyxzHub")) then
			return
		end

		p16.ESP_StyxzHub:Destroy()
	end
	local function v76()
		while getgenv().EspPlayer do
			task.wait()

			for _, player in pairs(game:GetService("Players"):GetPlayers()) do
				if player.Name ~= LocalPlayer.Name and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					v65(player.Character.HumanoidRootPart, Color3.fromRGB(0, 255, 0))
				end
			end
		end

		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				v75(player.Character.HumanoidRootPart)
			end
		end
	end
	local function v81()
		while getgenv().EspFlowers do
			task.wait()

			for _, child in pairs(workspace:GetChildren()) do
				if child and (child:IsA("BasePart") and child.Name == "Flower1") then
					v65(child, child.Color)
				end
			end
		end

		for _, child in pairs(workspace:GetChildren()) do
			if child and (child:IsA("BasePart") and (child.Name == "Flower1" or child.Name == "Flower2")) then
				v75(child)
			end
		end
	end
	local function v86()
		while getgenv().EspFruits do
			task.wait()

			for _, child in pairs(workspace:GetChildren()) do
				if child and (child:IsA("Tool") and child:FindFirstChild("Handle")) or child and (string.find(child.Name, "Fruit") and child:FindFirstChild("Handle")) then
					v65(child.Handle, Color3.fromRGB(255, 0, 0))
				end
			end
		end

		for _, child in pairs(workspace:GetChildren()) do
			if child and child:FindFirstChild("Handle") then
				v75(child.Handle)
			end
		end
	end
	local function v91()
		while getgenv().EspIslands do
			task.wait()

			local Locations = workspace:WaitForChild("_WorldOrigin", 9000000000):WaitForChild("Locations", 9000000000)

			for _, child in pairs(Locations:GetChildren()) do
				if child then
					v65(child, Color3.fromRGB(0, 255, 255))
				end
			end
		end

		local Locations = workspace:WaitForChild("_WorldOrigin", 9000000000):WaitForChild("Locations", 9000000000)

		for _, child in pairs(Locations:GetChildren()) do
			if child then
				v75(child)
			end
		end
	end
	local function v98()
		while getgenv().EspChests do
			task.wait()

			for _, child in pairs(workspace:GetChildren()) do
				if child then
					if child.Name ~= "Chest3" then
						if child.Name ~= "Chest2" then
							if child.Name == "Chest1" then
								v65(child, Color3.fromRGB(150, 150, 150))
							end
						else
							v65(child, Color3.fromRGB(255, 255, 0))
						end
					else
						v65(child, Color3.fromRGB(0, 255, 255))
					end
				end
			end
		end

		for _, child in pairs(workspace:GetChildren()) do
			if child and (child.Name == "Chest3" or (child.Name == "Chest2" or child.Name == "Chest1")) then
				v75(child)
			end
		end
	end

	require(ReplicatedStorage.Util.CameraShaker):Stop()

	function GetBladeHit()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzHub/refs/heads/main/Kaitun/FastAttackLoading.lua"))()
	end
	function AttackHit()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzHub/refs/heads/main/Kaitun/FastAttackLoading.lua"))()
	end

	local function v103()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzHub/refs/heads/main/Kaitun/FastAttackLoading.lua"))()
	end
	local function v104()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzHub/refs/heads/main/Kaitun/FastAttackLoading.lua"))()
	end

	local now = tick()

	local function v106()
		local Character = LocalPlayer.Character

		if Character then
			Character = LocalPlayer.Character.PrimaryPart
		end

		if Character and (p and (Character.Position - p).Magnitude > 25) then
			return
		end

		if not (getgenv().AutoClick and tick() - now >= getgenv().AutoClickDelay) then
			return
		end

		task.spawn(function()
			VirtualUser:CaptureController()
			VirtualUser:Button1Down(Vector2.new(math.huge, math.huge))
		end)
		now = tick()
	end
	local function v108()
		local HttpService2 = game:GetService("HttpService")
		local TeleportService = game:GetService("TeleportService")
		local PlaceId = game.PlaceId
		local v112 = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"

		function ListServers(p17)
			return HttpService2:JSONDecode((game:HttpGet(v112 .. (p17 and "&cursor=" .. p17 or ""))))
		end

		local nextPageCursor = nil

		repeat
			task.wait()

			local v114 = ListServers(nextPageCursor)
			local v115 = v114.data[1]

			nextPageCursor = v114.nextPageCursor
		until v115

		TeleportService:TeleportToPlaceInstance(PlaceId, v157.id, LocalPlayer)
	end
	local function v116(p18)
		local u117 = nil

		local function v118(_, p19)
			if p19.Name ~= p18 then
				return
			end

			local Humanoid = p19:FindFirstChild("Humanoid")

			if not (Humanoid and Humanoid.Health > 0) then
				return
			end

			u117 = true
		end

		local v120 = Enemies

		table.foreach(v120:GetChildren(), v118)

		local v121 = ReplicatedStorage

		table.foreach(v121:GetChildren(), v118)

		return u117
	end
	local function v122()
		local Character = LocalPlayer.Character

		if Character then
			Character = LocalPlayer.Character:FindFirstChild("HasBuso")
		end

		if not (getgenv().AutoHaki and not Character) then
			return
		end

		v26("Buso")
	end
	local function v124(p20)
		local Character = LocalPlayer

		if Character then
			Character = LocalPlayer.Character
		end

		local Backpack = LocalPlayer

		if not Backpack then
			if Character then
				return Character:FindFirstChild(p20) or Backpack:FindFirstChild(p20)
			end

			return
		end

		Backpack = LocalPlayer.Backpack

		if Character then
			return Character:FindFirstChild(p20) or Backpack:FindFirstChild(p20)
		end
	end
	local function v127(p21)
		local Character = LocalPlayer

		if Character then
			Character = LocalPlayer.Character
		end

		local Backpack = LocalPlayer

		if Backpack then
			Backpack = LocalPlayer.Backpack
		end

		for _, child in pairs(Backpack:GetChildren()) do
			if child and (child:IsA("Tool") and child.ToolTip == p21) then
				return child
			end
		end

		if not Character then
			return
		end

		for _, child in pairs(Character:GetChildren()) do
			if child and (child:IsA("Tool") and child.ToolTip == p21) then
				return child
			end
		end
	end
	local function v134(p22)
		local v135 = v124(p22)

		if v135 and v135:FindFirstChild("Level") then
			return v135.Level.Value
		end
	end
	local function v136(p23)
		local Backpack = LocalPlayer.Backpack
		local Character = LocalPlayer.Character

		if Character then
			Character = Character:FindFirstChild("Humanoid")
		end

		if not (Backpack and (Character and Backpack:FindFirstChild(p23))) then
			return
		end

		Character:EquipTool(Backpack[p23])
	end
	local function v139(p24)
		local huge = math.huge
		local u141 = nil

		local function v142(_, p25)
			if not table.find(p24, p25.Name) then
				return
			end

			local Humanoid = p25:FindFirstChild("Humanoid")

			if not (Humanoid and Humanoid.Health > 0) then
				return
			end

			local PrimaryPart = p25.PrimaryPart
			local Character = LocalPlayer.Character

			if Character then
				Character = LocalPlayer.Character.PrimaryPart
			end

			if not (PrimaryPart and (Character and (Character.Position - PrimaryPart.Position).Magnitude <= huge)) then
				return
			end

			huge = (Character.Position - PrimaryPart.Position).Magnitude
			u141 = p25
		end

		local v146 = Enemies

		table.foreach(v146:GetChildren(), v142)

		local v147 = ReplicatedStorage

		table.foreach(v147:GetChildren(), v142)

		return u141
	end

	local u148 = nil

	task.spawn(function()
		u148 = function(p26, p27)
			local Character = LocalPlayer

			if Character then
				Character = LocalPlayer.Character
			end

			if not Character then
				if p27 and (p27:FindFirstChild("RemoteEvent") and p26) then
					getgenv().AimbotPos = p26.Position
					p27.RemoteEvent:FireServer(p26.Position)
				else
					if not (Character and (Character:FindFirstChild("RemoteEvent") and p26)) then
						return
					end

					getgenv().AimbotPos = p26.Position
					Character.RemoteEvent:FireServer(p26.Position)
				end

				return
			end

			Character = Character:FindFirstChildOfClass("Tool")

			if p27 and (p27:FindFirstChild("RemoteEvent") and p26) then
				getgenv().AimbotPos = p26.Position
				p27.RemoteEvent:FireServer(p26.Position)
			else
				if not (Character and (Character:FindFirstChild("RemoteEvent") and p26)) then
					return
				end

				getgenv().AimbotPos = p26.Position
				Character.RemoteEvent:FireServer(p26.Position)
			end
		end

		local v150 = nil

		v150 = hookmetamethod(game, "__namecall", function(p28, p29, ...)
			if p28.Name ~= "RemoteEvent" or (getnamecallmethod():lower() ~= "fireserver" or (typeof(p29) ~= "Vector3" or not getgenv().AimbotPos)) then
				return v150(p28, p29, ...)
			elseif getgenv().AutoFarmSea or getgenv().AutoWoodPlanks then
				if getgenv().SeaAimBotSkill then
					return v150(p28, getgenv().AimbotPos, ...)
				else
					return v150(p28, p29, ...)
				end
			elseif getgenv().AutoFarmMastery and getgenv().AimBotSkill then
				return v150(p28, getgenv().AimbotPos, ...)
			else
				return v150(p28, p29, ...)
			end
		end)
	end)

	local function v151(p30)
		local VirtualInputManager = game:GetService("VirtualInputManager")

		VirtualInputManager:SendKeyEvent(true, p30, false, game)
		VirtualInputManager:SendKeyEvent(false, p30, false, game)
	end
	local function v153(p31)
		local Backpack = LocalPlayer.Backpack

		for _, child in pairs(Backpack:GetChildren()) do
			if child and child.ToolTip == p31 then
				v136(child.Name)

				return
			end
		end
	end
	local function v158()
		local Backpack = LocalPlayer.Backpack

		for _, child in pairs(Backpack:GetChildren()) do
			if child and child.ToolTip == getgenv().FarmTool then
				v136(child.Name)

				return
			end
		end
	end
	local function v161()
		local children = workspace:GetChildren()
		local huge = math.huge
		local Handle = nil

		for _, child in pairs(children) do
			local Character = LocalPlayer and LocalPlayer.Character

			if Character then
				Character = LocalPlayer.Character.PrimaryPart
			end

			local isTool = child and child:IsA("Tool")

			if isTool then
				isTool = child:FindFirstChild("Handle")
			end

			local Handle2 = child and string.find(child.Name, "Fruit")

			if Handle2 then
				Handle2 = child:FindFirstChild("Handle")
			end

			if Character and (isTool and (Character.Position - isTool.Position).Magnitude <= huge) then
				huge = (Character.Position - isTool.Position).Magnitude
				Handle = child
			elseif Character and (Handle2 and (Character.Position - Handle2.Position).Magnitude <= huge) then
				huge = (Character.Position - Handle2.Position).Magnitude
				Handle = child
			end
		end

		if not Handle then
			return Handle
		end

		Handle = Handle:FindFirstChild("Handle")

		return Handle
	end
	local function v170(p32)
		v26(p32, true)
		v26(p32)
	end
	local function v171()
		local now2 = tick()

		while getgenv().AutoChestBypass do
			task.wait()

			local Character = LocalPlayer and LocalPlayer.Character

			if Character then
				Character = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			end

			local Chest3 = workspace:FindFirstChild("Chest3")
			local Chest2 = workspace:FindFirstChild("Chest2")
			local Chest1 = workspace:FindFirstChild("Chest1")

			if not (v124("God\'s Chalice") or v124("Fist of Darkness")) then
				if Character and (Chest3 and Chest3.Transparency < 1) then
					Character.CFrame = Chest3.CFrame
				elseif Character and (Chest2 and Chest2.Transparency < 1) then
					Character.CFrame = Chest2.CFrame
				elseif Character and (Chest1 and Chest1.Transparency < 1) then
					Character.CFrame = Chest1.CFrame
				end
			end

			if not v124("God\'s Chalice") and (not v124("Fist of Darkness") and tick() - now2 > 10) then
				local Character2 = LocalPlayer and LocalPlayer.Character

				if Character2 then
					Character2 = LocalPlayer.Character:FindFirstChild("Humanoid")
				end

				if Character2 then
					Character2.Health = 0
					now2 = tick()
				end
			end
		end
	end
	local function v178()
		while getgenv().AutoChestTween do
			task.wait()

			local huge = math.huge
			local v180 = nil
			local Character = LocalPlayer and LocalPlayer.Character

			if Character then
				Character = LocalPlayer.Character.PrimaryPart
			end

			for _, child in pairs(workspace:GetChildren()) do
				if child:IsA("BasePart") and (child.Transparency < 1 and (child.Name == "Chest3" or (child.Name == "Chest2" or child.Name == "Chest1"))) and (Character and (Character.Position - child.Position).Magnitude <= huge) then
					huge = (Character.Position - child.Position).Magnitude
					v180 = child
				end
			end

			if v180 then
				v40(v180.CFrame)
			end
		end
	end
	local function v184(p33, p34)
		v26("StartQuest", p33, p34)
	end
	local function v185(p35, p36, p37)
		local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart and (HumanoidRootPart.Position - p37.p).Magnitude <= 3 then
			v26("StartQuest", p35, p36)
			task.wait(0.5)
		else
			v40(p37)
		end
	end
	local function v187()
		local Value = Level.Value

		if v20 then
			if Value < 10 then
				if tostring(LocalPlayer.Team) ~= "Pirates" then
					t1 = {
						CFrame.new(-2708, 25, 2103),
						false,
						"Trainee",
						"MarineQuest",
						1
					}
					t2 = { CFrame.new(-2754, 50, 2063), CFrame.new(-2950, 70, 2240) }
				else
					t1 = {
						CFrame.new(1059, 17, 1546),
						false,
						"Bandit",
						"BanditQuest1",
						1
					}
					t2 = { CFrame.new(943, 45, 1562), CFrame.new(1115, 45, 1619), CFrame.new(1265, 45, 1606) }
				end
			elseif 10 <= Value and Value < 15 then
				t1 = {
					CFrame.new(-1598, 37, 153),
					false,
					"Monkey",
					"JungleQuest",
					1
				}
				t2 = {
					CFrame.new(-1524, 50, 37),
					CFrame.new(-1424, 50, 216),
					CFrame.new(-1554, 50, 359),
					CFrame.new(-1772, 50, 78),
					CFrame.new(-1715, 50, -61),
					CFrame.new(-1594, 50, -45)
				}
			elseif 15 <= Value and Value < 30 then
				if v116("The Gorilla King") and 20 <= Value then
					t1 = {
						CFrame.new(-1598, 37, 153),
						CFrame.new(-1128, 6, -451),
						"The Gorilla King",
						"JungleQuest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-1598, 37, 153),
						false,
						"Gorilla",
						"JungleQuest",
						2
					}
					t2 = { CFrame.new(-1128, 40, -451), CFrame.new(-1313, 40, -546) }
				end
			elseif 30 <= Value and Value < 40 then
				t1 = {
					CFrame.new(-1140, 4, 3829),
					false,
					"Pirate",
					"BuggyQuest1",
					1
				}
				t2 = { CFrame.new(-1262, 40, 3905), CFrame.new(-1167, 40, 3942) }
			elseif 40 <= Value and Value < 60 then
				if v116("Bobby") and 55 <= Value then
					t1 = {
						CFrame.new(-1140, 4, 3829),
						CFrame.new(-1131, 14, 4080),
						"Bobby",
						"BuggyQuest1",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-1140, 4, 3829),
						false,
						"Brute",
						"BuggyQuest1",
						2
					}
					t2 = { CFrame.new(-976, 55, 4304), CFrame.new(-1196, 55, 4287), CFrame.new(-1363, 55, 4162) }
				end
			elseif 60 <= Value and Value < 75 then
				t1 = {
					CFrame.new(897, 6, 4389),
					CFrame.new(938, 6, 4470),
					"Desert Bandit",
					"DesertQuest",
					1
				}
				t2 = nil
			elseif 75 <= Value and Value < 90 then
				t1 = {
					CFrame.new(897, 6, 4389),
					CFrame.new(1546, 14, 4384),
					"Desert Officer",
					"DesertQuest",
					2
				}
				t2 = nil
			elseif 90 <= Value and Value < 100 then
				t1 = {
					CFrame.new(1385, 87, -1298),
					CFrame.new(1303, 106, -1441),
					"Snow Bandit",
					"SnowQuest",
					1
				}
				t2 = { CFrame.new(1362, 120, -1531), CFrame.new(1357, 120, -1381), CFrame.new(1228, 120, -1354) }
			elseif 100 <= Value and Value < 120 then
				if v116("Yeti") and 105 <= Value then
					t1 = {
						CFrame.new(1385, 87, -1298),
						CFrame.new(1185, 106, -1518),
						"Yeti",
						"SnowQuest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(1385, 87, -1298),
						CFrame.new(1185, 106, -1518),
						"Snowman",
						"SnowQuest",
						2
					}
					t2 = {
						CFrame.new(1243, 140, -1437),
						CFrame.new(1072, 140, -1458),
						CFrame.new(1076, 140, -1621),
						CFrame.new(1209, 140, -1644),
						CFrame.new(1252, 140, -1480)
					}
				end
			elseif 120 <= Value and Value < 150 then
				if v116("Vice Admiral") and 130 <= Value then
					t1 = {
						CFrame.new(-5035, 29, 4326),
						CFrame.new(-4807, 21, 4360),
						"Vice Admiral",
						"MarineQuest2",
						2
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-5035, 29, 4326),
						CFrame.new(-4807, 21, 4360),
						"Chief Petty Officer",
						"MarineQuest2",
						1
					}
					t2 = nil
				end
			elseif 150 <= Value and Value < 175 then
				t1 = {
					CFrame.new(-4844, 718, -2621),
					CFrame.new(-4956, 296, -2901),
					"Sky Bandit",
					"SkyQuest",
					1
				}
				t2 = nil
			elseif 175 <= Value and Value < 190 then
				t1 = {
					CFrame.new(-4844, 718, -2621),
					CFrame.new(-5268, 392, -2213),
					"Dark Master",
					"SkyQuest",
					2
				}
				t2 = nil
			elseif 190 <= Value and Value < 210 then
				t1 = {
					CFrame.new(5306, 2, 477),
					CFrame.new(5288, 2, 470),
					"Prisoner",
					"PrisonerQuest",
					1
				}
				t2 = nil
			elseif 210 <= Value and Value < 250 then
				if v116("Swan") and 240 <= Value then
					t1 = {
						CFrame.new(5191, 4, 692),
						CFrame.new(5230, 4, 749),
						"Swan",
						"ImpelQuest",
						3
					}
					t2 = nil
				elseif v116("Chief Warden") and 230 <= Value then
					t1 = {
						CFrame.new(5191, 4, 692),
						CFrame.new(5230, 4, 749),
						"Chief Warden",
						"ImpelQuest",
						2
					}
					t2 = nil
				elseif v116("Warden") and 220 <= Value then
					t1 = {
						CFrame.new(5191, 4, 692),
						CFrame.new(5230, 4, 749),
						"Warden",
						"ImpelQuest",
						1
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(5306, 2, 477),
						CFrame.new(5282, 2, 1052),
						"Dangerous Prisoner",
						"PrisonerQuest",
						2
					}
					t2 = nil
				end
			elseif 250 <= Value and Value < 275 then
				t1 = {
					CFrame.new(-1581, 7, -2982),
					CFrame.new(-1897, 7, -2796),
					"Toga Warrior",
					"ColosseumQuest",
					1
				}
				t2 = nil
			elseif 275 <= Value and Value < 300 then
				t1 = {
					CFrame.new(-1581, 7, -2982),
					CFrame.new(-1327, 59, -3231),
					"Gladiator",
					"ColosseumQuest",
					2
				}
				t2 = {
					CFrame.new(-1268, 30, -2996),
					CFrame.new(-1472, 30, -3194),
					CFrame.new(-1387, 30, -3438),
					CFrame.new(-1198, 30, -3508)
				}
			elseif 300 <= Value and Value < 325 then
				t1 = {
					CFrame.new(-5319, 12, 8515),
					false,
					"Military Soldier",
					"MagmaQuest",
					1
				}
				t2 = { CFrame.new(-5335, 46, 8638), CFrame.new(-5512, 30, 8366) }
			elseif 325 <= Value and Value < 375 then
				if v116("Magma Admiral") and 350 <= Value then
					t1 = {
						CFrame.new(-5319, 12, 8515),
						CFrame.new(-5694, 18, 8735),
						"Magma Admiral",
						"MagmaQuest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-5319, 12, 8515),
						CFrame.new(-5791, 97, 8834),
						"Military Spy",
						"MagmaQuest",
						2
					}
					t2 = nil
				end
			elseif 375 <= Value and Value < 400 then
				t1 = {
					CFrame.new(61122, 18, 1567),
					false,
					"Fishman Warrior",
					"FishmanQuest",
					1
				}
				t2 = {
					CFrame.new(60998, 50, 1534),
					CFrame.new(60880, 50, 1675),
					CFrame.new(60785, 50, 1552),
					CFrame.new(60923, 60, 1262)
				}
			elseif 400 <= Value and Value < 450 then
				if v116("Fishman Lord") and 425 <= Value then
					t1 = {
						CFrame.new(61122, 18, 1567),
						CFrame.new(61350, 31, 1095),
						"Fishman Lord",
						"FishmanQuest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(61122, 18, 1567),
						false,
						"Fishman Commando",
						"FishmanQuest",
						2
					}
					t2 = { CFrame.new(61866, 55, 1655), CFrame.new(62043, 55, 1510), CFrame.new(61812, 55, 1254) }
				end
			elseif 450 <= Value and Value < 475 then
				t1 = {
					CFrame.new(-4720, 846, -1951),
					false,
					"God\'s Guard",
					"SkyExp1Quest",
					1
				}
				t2 = { CFrame.new(-4641, 880, -1902), CFrame.new(-4781, 880, -1817) }
			elseif 475 <= Value and Value < 525 then
				if v116("Wysper") and 500 <= Value then
					t1 = {
						CFrame.new(-7861, 5545, -381),
						CFrame.new(-7927, 5551, -637),
						"Wysper",
						"SkyExp1Quest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-7861, 5545, -381),
						false,
						"Shanda",
						"SkyExp1Quest",
						2
					}
					t2 = { CFrame.new(-7741, 5580, -395), CFrame.new(-7591, 5580, -466), CFrame.new(-7643, 5580, -608) }
				end
			elseif Value < 525 or Value >= 550 then
				if Value < 525 or Value >= 625 then
					if Value < 625 or Value >= 650 then
						if Value < 650 then
							return
						end

						if v116("Cyborg") and Value >= 675 then
							t1 = {
								CFrame.new(5258, 39, 4052),
								CFrame.new(6138, 10, 3939),
								"Cyborg",
								"FountainQuest",
								3
							}
							t2 = nil
						else
							t1 = {
								CFrame.new(5258, 39, 4052),
								false,
								"Galley Captain",
								"FountainQuest",
								2
							}
							t2 = { CFrame.new(5985, 70, 4790), CFrame.new(5472, 70, 4887) }
						end
					else
						t1 = {
							CFrame.new(5258, 39, 4052),
							false,
							"Galley Pirate",
							"FountainQuest",
							1
						}
						t2 = { CFrame.new(5391, 70, 4023), CFrame.new(5780, 70, 3969) }
					end
				elseif v116("Thunder God") and Value >= 575 then
					t1 = {
						CFrame.new(-7903, 5636, -1412),
						CFrame.new(-7751, 5607, -2315),
						"Thunder God",
						"SkyExp2Quest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-7903, 5636, -1412),
						false,
						"Royal Soldier",
						"SkyExp2Quest",
						2
					}
					t2 = {
						CFrame.new(-7894, 5640, -1629),
						CFrame.new(-7678, 5640, -1696),
						CFrame.new(-7672, 5640, -1903),
						CFrame.new(-7925, 5640, -1854)
					}
				end
			else
				t1 = {
					CFrame.new(-7903, 5636, -1412),
					false,
					"Royal Squad",
					"SkyExp2Quest",
					1
				}
				t2 = { CFrame.new(-7727, 5650, -1410), CFrame.new(-7522, 5650, -1499) }
			end
		elseif v21 then
			if Value < 700 or Value >= 725 then
				if Value < 725 or Value >= 775 then
					if Value < 775 or Value >= 800 then
						if Value < 800 or Value >= 875 then
							if Value < 875 or Value >= 900 then
								if Value < 900 or Value >= 950 then
									if Value < 950 or Value >= 975 then
										if Value < 975 or Value >= 1000 then
											if Value < 1000 or Value >= 1050 then
												if Value < 1050 or Value >= 1100 then
													if Value < 1100 or Value >= 1125 then
														if Value < 1125 or Value >= 1175 then
															if Value < 1175 or Value >= 1200 then
																if Value < 1200 or Value >= 1250 then
																	if Value < 1250 or Value >= 1275 then
																		if Value < 1275 or Value >= 1300 then
																			if Value < 1300 or Value >= 1325 then
																				if Value < 1325 or Value >= 1350 then
																					if Value < 1350 or Value >= 1375 then
																						if Value < 1375 or Value >= 1425 then
																							if Value < 1425 or Value >= 1450 then
																								if Value < 1450 then
																									return
																								end

																								if v116("Tide Keeper") and Value >= 1475 then
																									t1 = {
																										CFrame.new(-3056, 240, -10145),
																										CFrame.new(-3711, 77, -11469),
																										"Tide Keeper",
																										"ForgottenQuest",
																										3
																									}
																									t2 = nil
																								else
																									t1 = {
																										CFrame.new(-3056, 240, -10145),
																										false,
																										"Water Fighter",
																										"ForgottenQuest",
																										2
																									}
																									t2 = {
																										CFrame.new(-3339, 290, -10412),
																										CFrame.new(-3518, 290, -10419),
																										CFrame.new(-3536, 290, -10607),
																										CFrame.new(-3345, 280, -10667)
																									}
																								end
																							else
																								t1 = {
																									CFrame.new(-3056, 240, -10145),
																									false,
																									"Sea Soldier",
																									"ForgottenQuest",
																									1
																								}
																								t2 = {
																									CFrame.new(-2583, 80, -9821),
																									CFrame.new(-2830, 80, -9809),
																									CFrame.new(-3271, 80, -9729),
																									CFrame.new(-3486, 80, -9813)
																								}
																							end
																						elseif v116("Awakened Ice Admiral") and Value >= 1400 then
																							t1 = {
																								CFrame.new(5668, 28, -6484),
																								CFrame.new(6473, 297, -6944),
																								"Awakened Ice Admiral",
																								"FrostQuest",
																								3
																							}
																							t2 = nil
																						else
																							t1 = {
																								CFrame.new(5668, 28, -6484),
																								false,
																								"Snow Lurker",
																								"FrostQuest",
																								2
																							}
																							t2 = { CFrame.new(5700, 80, -6724), CFrame.new(5542, 80, -6898), CFrame.new(5512, 80, -6641) }
																						end
																					else
																						t1 = {
																							CFrame.new(5668, 28, -6484),
																							false,
																							"Arctic Warrior",
																							"FrostQuest",
																							1
																						}
																						t2 = {
																							CFrame.new(5836, 80, -6257),
																							CFrame.new(6132, 80, -6098),
																							CFrame.new(6275, 80, -6237),
																							CFrame.new(6095, 80, -6349)
																						}
																					end
																				else
																					t1 = {
																						CFrame.new(973, 125, 33245),
																						false,
																						"Ship Officer",
																						"ShipQuest2",
																						2
																					}
																					t2 = {
																						CFrame.new(1238, 220, 33148),
																						CFrame.new(1220, 220, 33426),
																						CFrame.new(622, 220, 33435),
																						CFrame.new(593, 220, 33172)
																					}
																				end
																			else
																				t1 = {
																					CFrame.new(973, 125, 33245),
																					false,
																					"Ship Steward",
																					"ShipQuest2",
																					1
																				}
																				t2 = { CFrame.new(838, 160, 33408), CFrame.new(1026, 160, 33510) }
																			end
																		else
																			t1 = {
																				CFrame.new(1033, 125, 32909),
																				false,
																				"Ship Engineer",
																				"ShipQuest1",
																				2
																			}
																			t2 = {
																				CFrame.new(809, 80, 33090),
																				CFrame.new(751, 80, 32957),
																				CFrame.new(927, 80, 32724),
																				CFrame.new(1040, 80, 32915),
																				CFrame.new(1034, 80, 33058)
																			}
																		end
																	else
																		t1 = {
																			CFrame.new(1033, 125, 32909),
																			false,
																			"Ship Deckhand",
																			"ShipQuest1",
																			1
																		}
																		t2 = {
																			CFrame.new(1185, 180, 32979),
																			CFrame.new(1204, 180, 33174),
																			CFrame.new(615, 180, 33169),
																			CFrame.new(638, 180, 32962)
																		}
																	end
																else
																	t1 = {
																		CFrame.new(-5430, 16, -5298),
																		false,
																		"Lava Pirate",
																		"FireSideQuest",
																		2
																	}
																	t2 = {
																		CFrame.new(-4955, 60, -4836),
																		CFrame.new(-5119, 60, -4634),
																		CFrame.new(-5389, 60, -4616),
																		CFrame.new(-5342, 60, -4897)
																	}
																end
															else
																t1 = {
																	CFrame.new(-5430, 16, -5298),
																	false,
																	"Magma Ninja",
																	"FireSideQuest",
																	1
																}
																t2 = { CFrame.new(-5233, 60, -6227), CFrame.new(-5194, 60, -6031), CFrame.new(-5651, 60, -5854) }
															end
														elseif v116("Smoke Admiral") and Value >= 1150 then
															t1 = {
																CFrame.new(-6061, 16, -4904),
																CFrame.new(-5078, 24, -5352),
																"Smoke Admiral",
																"IceSideQuest",
																3
															}
															t2 = nil
														else
															t1 = {
																CFrame.new(-6061, 16, -4904),
																false,
																"Horned Warrior",
																"IceSideQuest",
																2
															}
															t2 = {
																CFrame.new(-6306, 50, -5752),
																CFrame.new(-6161, 50, -5979),
																CFrame.new(-6518, 50, -5795),
																CFrame.new(-6535, 50, -5640)
															}
														end
													else
														t1 = {
															CFrame.new(-6061, 16, -4904),
															false,
															"Lab Subordinate",
															"IceSideQuest",
															1
														}
														t2 = {
															CFrame.new(-5941, 50, -4322),
															CFrame.new(-5765, 50, -4304),
															CFrame.new(-5608, 50, -4445),
															CFrame.new(-5683, 50, -4629)
														}
													end
												else
													t1 = {
														CFrame.new(607, 401, -5371),
														false,
														"Winter Warrior",
														"SnowMountainQuest",
														2
													}
													t2 = {
														CFrame.new(1224, 460, -5332),
														CFrame.new(1404, 460, -5323),
														CFrame.new(1258, 460, -5220),
														CFrame.new(1145, 460, -5077),
														CFrame.new(1022, 460, -5139)
													}
												end
											else
												t1 = {
													CFrame.new(607, 401, -5371),
													false,
													"Snow Trooper",
													"SnowMountainQuest",
													1
												}
												t2 = { CFrame.new(445, 440, -5175), CFrame.new(523, 440, -5484), CFrame.new(699, 440, -5612) }
											end
										else
											t1 = {
												CFrame.new(-5495, 48, -794),
												false,
												"Vampire",
												"ZombieQuest",
												2
											}
											t2 = {
												CFrame.new(-6027, 50, -1130),
												CFrame.new(-6248, 50, -1281),
												CFrame.new(-6120, 50, -1450),
												CFrame.new(-5951, 50, -1520),
												CFrame.new(-5803, 50, -1360)
											}
										end
									else
										t1 = {
											CFrame.new(-5495, 48, -794),
											false,
											"Zombie",
											"ZombieQuest",
											1
										}
										t2 = {
											CFrame.new(-5715, 90, -917),
											CFrame.new(-5534, 90, -942),
											CFrame.new(-5445, 90, -806),
											CFrame.new(-5485, 90, -663),
											CFrame.new(-5730, 90, -590),
											CFrame.new(-5816, 90, -756)
										}
									end
								elseif v116("Fajita") and Value >= 925 then
									t1 = {
										CFrame.new(-2441, 73, -3219),
										CFrame.new(-2086, 73, -4208),
										"Fajita",
										"MarineQuest3",
										3
									}
									t2 = nil
								else
									t1 = {
										CFrame.new(-2441, 73, -3219),
										false,
										"Marine Captain",
										"MarineQuest3",
										2
									}
									t2 = { CFrame.new(-1695, 110, -3299), CFrame.new(-1953, 110, -3165), CFrame.new(-2144, 110, -3341) }
								end
							else
								t1 = {
									CFrame.new(-2441, 73, -3219),
									false,
									"Marine Lieutenant",
									"MarineQuest3",
									1
								}
								t2 = {
									CFrame.new(-2552, 110, -3050),
									CFrame.new(-2860, 110, -3089),
									CFrame.new(-3114, 110, -2947),
									CFrame.new(-2864, 110, -2679)
								}
							end
						elseif v116("Jeremy") and Value >= 850 then
							t1 = {
								CFrame.new(635, 73, 919),
								CFrame.new(2316, 449, 787),
								"Jeremy",
								"Area2Quest",
								3
							}
							t2 = nil
						else
							t1 = {
								CFrame.new(635, 73, 919),
								false,
								"Factory Staff",
								"Area2Quest",
								2
							}
							t2 = {
								CFrame.new(882, 110, -49),
								CFrame.new(723, 110, 212),
								CFrame.new(473, 110, 108),
								CFrame.new(-115, 110, 39)
							}
						end
					else
						t1 = {
							CFrame.new(635, 73, 919),
							false,
							"Swan Pirate",
							"Area2Quest",
							1
						}
						t2 = {
							CFrame.new(778, 110, 1129),
							CFrame.new(1018, 110, 1128),
							CFrame.new(1020, 110, 1366),
							CFrame.new(1016, 110, 1115)
						}
					end
				elseif v116("Diamond") and Value >= 750 then
					t1 = {
						CFrame.new(-427, 73, 1835),
						CFrame.new(-1569, 199, -31),
						"Diamond",
						"Area1Quest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-427, 73, 1835),
						false,
						"Mercenary",
						"Area1Quest",
						2
					}
					t2 = {
						CFrame.new(-867, 110, 1621),
						CFrame.new(-1047, 110, 1779),
						CFrame.new(-1025, 110, 1087),
						CFrame.new(-1204, 110, 1195)
					}
				end
			else
				t1 = {
					CFrame.new(-427, 73, 1835),
					false,
					"Raider",
					"Area1Quest",
					1
				}
				t2 = {
					CFrame.new(-614, 90, 2240),
					CFrame.new(-894, 90, 2275),
					CFrame.new(-872, 90, 2481),
					CFrame.new(-552, 90, 2528)
				}
			end
		else
			if not v22 then
				return
			end

			if Value < 1500 or Value >= 1525 then
				if Value < 1525 or Value >= 1575 then
					if Value < 1575 or Value >= 1600 then
						if Value < 1600 or Value >= 1625 then
							if Value < 1625 or Value >= 1650 then
								if Value < 1650 or Value >= 1700 then
									if Value < 1700 or Value >= 1725 then
										if Value < 1725 or Value >= 1775 then
											if Value < 1775 or Value >= 1800 then
												if Value < 1800 or Value >= 1825 then
													if Value < 1825 or Value >= 1850 then
														if Value < 1850 or Value >= 1900 then
															if Value < 1900 or Value >= 1925 then
																if Value < 1925 or Value >= 1975 then
																	if Value < 1975 or Value >= 2000 then
																		if Value < 200 or Value >= 2025 then
																			if Value < 2025 or Value >= 2050 then
																				if Value < 2050 or Value >= 2075 then
																					if Value < 2075 or Value >= 2100 then
																						if Value < 2100 or Value >= 2125 then
																							if Value < 2125 or Value >= 2150 then
																								if Value < 2150 or Value >= 2200 then
																									if Value < 2200 or Value >= 2225 then
																										if Value < 2225 or Value >= 2250 then
																											if Value < 2250 or Value >= 2275 then
																												if Value < 2275 or Value >= 2300 then
																													if Value < 2300 or Value >= 2325 then
																														if Value < 2325 or Value >= 2350 then
																															if Value < 2350 or Value >= 2375 then
																																if Value < 2375 or Value >= 2400 then
																																	if Value < 2400 or Value >= 2425 then
																																		if Value < 2425 or Value >= 2450 then
																																			if Value < 2450 or Value >= 2475 then
																																				if Value < 2475 or Value >= 2500 then
																																					if Value < 2500 or Value >= 2525 then
																																						if Value < 2525 then
																																							return
																																						end

																																						t1 = {
																																							CFrame.new(-16540, 56, 1051),
																																							false,
																																							"Isle Champion",
																																							"TikiQuest2",
																																							2
																																						}
																																						t2 = { CFrame.new(-16634, 85, 1106), CFrame.new(-16735, 60, 1075), CFrame.new(-16888, 35, 1011) }
																																					else
																																						t1 = {
																																							CFrame.new(-16540, 56, 1051),
																																							false,
																																							"Sun-kissed Warrior",
																																							"TikiQuest2",
																																							1
																																						}
																																						t2 = { CFrame.new(-16345, 80, 1004), CFrame.new(-16425, 77, 1059), CFrame.new(-16069, 37, 1029) }
																																					end
																																				else
																																					t1 = {
																																						CFrame.new(-16547, 56, -172),
																																						false,
																																						"Island Boy",
																																						"TikiQuest1",
																																						2
																																					}
																																					t2 = { CFrame.new(-16668, 70, -243), CFrame.new(-16744, 60, -195), CFrame.new(-16912, 45, -152) }
																																				end
																																			else
																																				t1 = {
																																					CFrame.new(-16547, 56, -172),
																																					false,
																																					"Isle Outlaw",
																																					"TikiQuest1",
																																					1
																																				}
																																				t2 = { CFrame.new(-16431, 90, -223), CFrame.new(-16313, 50, -210), CFrame.new(-16160, 35, -156) }
																																			end
																																		else
																																			t1 = {
																																				CFrame.new(-1148, 14, -14446),
																																				false,
																																				"Snow Demon",
																																				"CandyQuest1",
																																				2
																																			}
																																			t2 = { CFrame.new(-836, 70, -14326), CFrame.new(-884, 70, -14708) }
																																		end
																																	else
																																		t1 = {
																																			CFrame.new(-1148, 14, -14446),
																																			false,
																																			"Candy Pirate",
																																			"CandyQuest1",
																																			1
																																		}
																																		t2 = { CFrame.new(-1371, 70, -14405), CFrame.new(-1318, 70, -14715) }
																																	end
																																else
																																	t1 = {
																																		CFrame.new(150, 25, -12777),
																																		false,
																																		"Candy Rebel",
																																		"ChocQuest2",
																																		2
																																	}
																																	t2 = { CFrame.new(17, 80, -12962), CFrame.new(158, 80, -12961) }
																																end
																															else
																																t1 = {
																																	CFrame.new(150, 25, -12777),
																																	false,
																																	"Sweet Thief",
																																	"ChocQuest2",
																																	1
																																}
																																t2 = { CFrame.new(-68, 80, -12692), CFrame.new(90, 80, -12519) }
																															end
																														else
																															t1 = {
																																CFrame.new(235, 25, -12199),
																																false,
																																"Chocolate Bar Battler",
																																"ChocQuest1",
																																2
																															}
																															t2 = { CFrame.new(579, 80, -12413), CFrame.new(735, 80, -12659) }
																														end
																													else
																														t1 = {
																															CFrame.new(235, 25, -12199),
																															false,
																															"Cocoa Warrior",
																															"ChocQuest1",
																															1
																														}
																														t2 = { CFrame.new(110, 80, -12245), CFrame.new(-71, 80, -12292) }
																													end
																												else
																													t1 = {
																														CFrame.new(-1931, 38, -12840),
																														false,
																														"Head Baker",
																														"CakeQuest2",
																														2
																													}
																													t2 = {
																														CFrame.new(-2123, 110, -12777),
																														CFrame.new(-2281, 110, -12748),
																														CFrame.new(-2317, 110, -12994),
																														CFrame.new(-2140, 110, -12989)
																													}
																												end
																											else
																												t1 = {
																													CFrame.new(-1931, 38, -12840),
																													false,
																													"Baking Staff",
																													"CakeQuest2",
																													1
																												}
																												t2 = {
																													CFrame.new(-1930, 90, -12963),
																													CFrame.new(-1803, 90, -13115),
																													CFrame.new(-1769, 90, -12955),
																													CFrame.new(-1873, 90, -12755)
																												}
																											end
																										else
																											t1 = {
																												CFrame.new(-2023, 38, -12028),
																												false,
																												"Cake Guard",
																												"CakeQuest1",
																												2
																											}
																											t2 = {
																												CFrame.new(-1514, 90, -12422),
																												CFrame.new(-1455, 90, -12244),
																												CFrame.new(-1674, 90, -12206),
																												CFrame.new(-1707, 90, -12360)
																											}
																										end
																									else
																										t1 = {
																											CFrame.new(-2023, 38, -12028),
																											false,
																											"Cookie Crafter",
																											"CakeQuest1",
																											1
																										}
																										t2 = {
																											CFrame.new(-2332, 90, -12049),
																											CFrame.new(-2468, 90, -12121),
																											CFrame.new(-2401, 90, -12224),
																											CFrame.new(-2296, 90, -12114)
																										}
																									end
																								elseif v116("Cake Queen") and Value >= 2175 then
																									t1 = {
																										CFrame.new(-818, 66, -10964),
																										CFrame.new(-710, 382, -11150),
																										"Cake Queen",
																										"IceCreamIslandQuest",
																										3
																									}
																									t2 = nil
																								else
																									t1 = {
																										CFrame.new(-818, 66, -10964),
																										false,
																										"Ice Cream Commander",
																										"IceCreamIslandQuest",
																										2
																									}
																									t2 = { CFrame.new(-690, 100, -11350), CFrame.new(-534, 100, -11284), CFrame.new(-720, 180, -11162) }
																								end
																							else
																								t1 = {
																									CFrame.new(-818, 66, -10964),
																									false,
																									"Ice Cream Chef",
																									"IceCreamIslandQuest",
																									1
																								}
																								t2 = { CFrame.new(-501, 100, -10883), CFrame.new(-763, 100, -10834), CFrame.new(-990, 100, -11085) }
																							end
																						else
																							t1 = {
																								CFrame.new(-2104, 38, -10194),
																								false,
																								"Peanut President",
																								"NutsIslandQuest",
																								2
																							}
																							t2 = { CFrame.new(-2005, 100, -10585), CFrame.new(-2293, 88, -10512) }
																						end
																					else
																						t1 = {
																							CFrame.new(-2104, 38, -10194),
																							false,
																							"Peanut Scout",
																							"NutsIslandQuest",
																							1
																						}
																						t2 = { CFrame.new(-1870, 100, -10225), CFrame.new(-2143, 100, -10106) }
																					end
																				else
																					t1 = {
																						CFrame.new(-9515, 172, 6078),
																						false,
																						"Posessed Mummy",
																						"HauntedQuest2",
																						2
																					}
																					t2 = {
																						CFrame.new(-9442, 60, 6304),
																						CFrame.new(-9427, 60, 6148),
																						CFrame.new(-9598, 60, 6121),
																						CFrame.new(-9733, 60, 6119),
																						CFrame.new(-9735, 60, 6336),
																						CFrame.new(-9618, 60, 6323)
																					}
																				end
																			else
																				t1 = {
																					CFrame.new(-9515, 172, 6078),
																					false,
																					"Demonic Soul",
																					"HauntedQuest2",
																					1
																				}
																				t2 = {
																					CFrame.new(-9275, 210, 6166),
																					CFrame.new(-9379, 210, 6076),
																					CFrame.new(-9565, 210, 6201),
																					CFrame.new(-9671, 210, 6096)
																				}
																			end
																		else
																			t1 = {
																				CFrame.new(-9481, 142, 5565),
																				false,
																				"Living Zombie",
																				"HauntedQuest1",
																				2
																			}
																			t2 = {
																				CFrame.new(-10104, 200, 5739),
																				CFrame.new(-10078, 200, 5953),
																				CFrame.new(-10195, 200, 6139),
																				CFrame.new(-10252, 200, 5973)
																			}
																		end
																	else
																		t1 = {
																			CFrame.new(-9481, 142, 5565),
																			false,
																			"Reborn Skeleton",
																			"HauntedQuest1",
																			1
																		}
																		t2 = {
																			CFrame.new(-8680, 190, 5852),
																			CFrame.new(-8879, 190, 5900),
																			CFrame.new(-8865, 190, 6100),
																			CFrame.new(-8774, 170, 6169),
																			CFrame.new(-8649, 190, 6071)
																		}
																	end
																elseif v116("Beautiful Pirate") and Value > 1950 then
																	t1 = {
																		CFrame.new(-12682, 391, -9901),
																		CFrame.new(5241, 23, 129),
																		"Musketeer Pirate",
																		"DeepForestIsland2",
																		3
																	}
																	t2 = nil
																else
																	t1 = {
																		CFrame.new(-12682, 391, -9901),
																		false,
																		"Musketeer Pirate",
																		"DeepForestIsland2",
																		2
																	}
																	t2 = {
																		CFrame.new(-13098, 450, -9831),
																		CFrame.new(-13222, 450, -9621),
																		CFrame.new(-13530, 450, -9760),
																		CFrame.new(-13455, 450, -9940)
																	}
																end
															else
																t1 = {
																	CFrame.new(-12682, 391, -9901),
																	false,
																	"Jungle Pirate",
																	"DeepForestIsland2",
																	1
																}
																t2 = {
																	CFrame.new(-12166, 380, -10375),
																	CFrame.new(-12303, 380, -10639),
																	CFrame.new(-11904, 380, -10469),
																	CFrame.new(-11636, 380, -10511),
																	CFrame.new(-11735, 380, -10687),
																	CFrame.new(-11937, 380, -10713)
																}
															end
														elseif v116("Captain Elephant") and Value >= 1875 then
															t1 = {
																CFrame.new(-13233, 332, -7626),
																CFrame.new(-13393, 319, -8423),
																"Captain Elephant",
																"DeepForestIsland",
																3
															}
															t2 = nil
														else
															t1 = {
																CFrame.new(-13233, 332, -7626),
																false,
																"Mythological Pirate",
																"DeepForestIsland",
																2
															}
															t2 = {
																CFrame.new(-13844, 520, -7016),
																CFrame.new(-13710, 520, -6856),
																CFrame.new(-13482, 520, -6985),
																CFrame.new(-13224, 580, -6806)
															}
														end
													else
														t1 = {
															CFrame.new(-13233, 332, -7626),
															false,
															"Forest Pirate",
															"DeepForestIsland",
															1
														}
														t2 = {
															CFrame.new(-13335, 380, -7660),
															CFrame.new(-13138, 380, -7713),
															CFrame.new(-13298, 380, -7876),
															CFrame.new(-13512, 380, -7983),
															CFrame.new(-13632, 380, -7815)
														}
													end
												else
													t1 = {
														CFrame.new(-10581, 332, -8758),
														false,
														"Fishman Captain",
														"DeepForestIsland3",
														2
													}
													t2 = {
														CFrame.new(-10764, 380, -8799),
														CFrame.new(-10844, 380, -9030),
														CFrame.new(-11160, 380, -9166),
														CFrame.new(-11073, 380, -8846),
														CFrame.new(-11043, 380, -8619)
													}
												end
											else
												t1 = {
													CFrame.new(-10581, 332, -8758),
													false,
													"Fishman Raider",
													"DeepForestIsland3",
													1
												}
												t2 = {
													CFrame.new(-10550, 380, -8574),
													CFrame.new(-10860, 380, -8459),
													CFrame.new(-10578, 380, -8331),
													CFrame.new(-10377, 380, -8238),
													CFrame.new(-10147, 380, -8216),
													CFrame.new(-10234, 380, -8454)
												}
											end
										elseif v116("Kilo Admiral") and Value >= 1750 then
											t1 = {
												CFrame.new(2180, 29, -6738),
												CFrame.new(2889, 424, -7233),
												"Kilo Admiral",
												"MarineTreeIsland",
												3
											}
											t2 = nil
										else
											t1 = {
												CFrame.new(2180, 29, -6738),
												false,
												"Marine Rear Admiral",
												"MarineTreeIsland",
												2
											}
											t2 = {
												CFrame.new(3205, 120, -6742),
												CFrame.new(3345, 120, -6649),
												CFrame.new(3776, 210, -7254),
												CFrame.new(3879, 220, -7083),
												CFrame.new(3887, 210, -6841),
												CFrame.new(3546, 210, -6809),
												CFrame.new(3448, 210, -7014),
												CFrame.new(3504, 210, -7230)
											}
										end
									else
										t1 = {
											CFrame.new(2180, 29, -6738),
											false,
											"Marine Commodore",
											"MarineTreeIsland",
											1
										}
										t2 = {
											CFrame.new(3156, 120, -7837),
											CFrame.new(2904, 120, -7863),
											CFrame.new(2606, 120, -7745),
											CFrame.new(2409, 120, -7874),
											CFrame.new(2269, 120, -7416),
											CFrame.new(2413, 120, -7232),
											CFrame.new(2284, 120, -6911)
										}
									end
								elseif v116("Island Empress") and Value >= 1675 then
									t1 = {
										CFrame.new(5448, 602, 748),
										CFrame.new(5730, 602, 199),
										"Island Empress",
										"AmazonQuest2",
										3
									}
									t2 = nil
								else
									t1 = {
										CFrame.new(5448, 602, 748),
										false,
										"Giant Islander",
										"AmazonQuest2",
										2
									}
									t2 = {
										CFrame.new(4784, 660, 155),
										CFrame.new(4662, 660, -57),
										CFrame.new(4869, 660, -178),
										CFrame.new(5056, 660, -267),
										CFrame.new(5332, 660, -166)
									}
								end
							else
								t1 = {
									CFrame.new(5448, 602, 748),
									false,
									"Female Islander",
									"AmazonQuest2",
									1
								}
								t2 = {
									CFrame.new(4836, 740, 928),
									CFrame.new(4708, 770, 911),
									CFrame.new(4672, 790, 695),
									CFrame.new(4657, 800, 498),
									CFrame.new(4575, 810, 281)
								}
							end
						else
							t1 = {
								CFrame.new(5834, 51, -1103),
								false,
								"Dragon Crew Archer",
								"AmazonQuest",
								2
							}
							t2 = {
								CFrame.new(6472, 370, -151),
								CFrame.new(6547, 370, -51),
								CFrame.new(6539, 410, 72),
								CFrame.new(6737, 410, 249),
								CFrame.new(6768, 410, 390),
								CFrame.new(6625, 410, 371)
							}
						end
					else
						t1 = {
							CFrame.new(5834, 51, -1103),
							false,
							"Dragon Crew Warrior",
							"AmazonQuest",
							1
						}
						t2 = {
							CFrame.new(5992, 90, -1581),
							CFrame.new(6364, 90, -1512),
							CFrame.new(6501, 90, -1104),
							CFrame.new(6612, 90, -938),
							CFrame.new(6393, 90, -939)
						}
					end
				elseif v116("Stone") and Value >= 1550 then
					t1 = {
						CFrame.new(-291, 44, 5580),
						CFrame.new(-1049, 40, 6791),
						"Stone",
						"PiratePortQuest",
						3
					}
					t2 = nil
				else
					t1 = {
						CFrame.new(-291, 44, 5580),
						false,
						"Pistol Billionaire",
						"PiratePortQuest",
						2
					}
					t2 = { CFrame.new(219, 105, 6018), CFrame.new(-24, 105, 6155), CFrame.new(-312, 105, 6028) }
				end
			else
				t1 = {
					CFrame.new(-291, 44, 5580),
					false,
					"Pirate Millionaire",
					"PiratePortQuest",
					1
				}
				t2 = { CFrame.new(-44, 70, 5623), CFrame.new(-219, 70, 5546), CFrame.new(-574, 70, 5496) }
			end
		end
	end
	local function v189()
		local Quest = LocalPlayer.PlayerGui.Main.Quest

		if Quest.Visible then
			return Quest.Visible
		end

		LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text = ""

		return Quest.Visible
	end
	local function v191(p38)
		local Quest = LocalPlayer.PlayerGui.Main.Quest
		local v193 = Quest.Container.QuestTitle.Title.Text:gsub("-", ""):lower()
		local v194 = p38:gsub("-", ""):lower()
		local Visible = Quest.Visible

		if not Visible then
			return Visible
		end

		Visible = v193:find(v194)

		return Visible
	end

	Level.Changed:Connect(v187)
	task.spawn(function()
		while task.wait(1) do
			pcall(v187)
		end
	end)
	v187()

	local function v196(p39, p40)
		if BringMobs and BringMobsDistance then
			local function v197(_, p41)
				if not (p40 or p41.Name == p39.Name) then
					return
				end

				local Humanoid = p41:FindFirstChild("Humanoid")

				if not (Humanoid and Humanoid.Health > 0) then
					return
				end

				local PrimaryPart = p41.PrimaryPart
				local PrimaryPart2 = p39.PrimaryPart

				if not (PrimaryPart and PrimaryPart2) then
					return
				end

				local Magnitude = (PrimaryPart.Position - PrimaryPart2.Position).Magnitude

				if Magnitude >= BringMobsDistance or 1 > Magnitude then
					return
				end

				PrimaryPart.CFrame = PrimaryPart2.CFrame
				PrimaryPart.CanCollide = false
				PrimaryPart.Size = Vector3.new(50, 50, 50)
				Humanoid.WalkSpeed = 0
				Humanoid.JumpPower = 0
				Humanoid:ChangeState(14)

				if Humanoid:FindFirstChild("Animator") then
					Humanoid.Animator:Destroy()
				end

				if p41:FindFirstChild("Head") and p41.Head.CanCollide then
					p41.Head.CanCollide = false
				end

				sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
			end

			local v202 = Enemies

			table.foreach(v202:GetChildren(), v197)

			return
		end

		local PrimaryPart = p39.PrimaryPart

		if not PrimaryPart then
			return
		end

		PrimaryPart.CFrame = EnePP2.CFrame
		PrimaryPart.CanCollide = false
		PrimaryPart.Size = Vector3.new(50, 50, 50)
	end

	local now2 = tick()

	task.spawn(function()
		local function v205(_, p42)
			if p42.Name == "rip_indra True Form" then
				return
			end

			if p42 then
				p42 = p42:FindFirstChild("HumanoidRootPart")
			end

			if not (p42 and (p42.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700) then
				return
			end

			now2 = tick()
		end

		while task.wait() do
			local v206 = Enemies

			table.foreach(v206:GetChildren(), v205)

			local v207 = ReplicatedStorage

			table.foreach(v207:GetChildren(), v205)
		end
	end)

	local function v208()
		local AutoPiratesSea = getgenv().AutoPiratesSea

		if not AutoPiratesSea then
			return AutoPiratesSea
		end

		AutoPiratesSea = tick() - now2 <= 10

		return AutoPiratesSea
	end
	local function v210()
		local AutoEliteHunter = not (getgenv().AutoEliteHunter and v116("Urban")) and (not (getgenv().AutoEliteHunter and v116("Deandre")) and getgenv().AutoEliteHunter)

		if not AutoEliteHunter then
			return AutoEliteHunter
		end

		AutoEliteHunter = v116("Diablo")

		return AutoEliteHunter
	end
	local function v212()
		for _, v in pairs(t3) do
			if v116(v) then
				return true
			end
		end
	end
	local function v215()
		local Circle = workspace.Map["Boat Castle"].Summoner:FindFirstChild("Circle")

		if not Circle then
			return
		end

		for _, child in pairs(Circle:GetChildren()) do
			if child and (child.Name == "Part" and (child:FindFirstChild("Part") and child.Part.BrickColor ~= BrickColor.new("Lime green"))) then
				return child.Part
			end
		end
	end

	local Timer = LocalPlayer:WaitForChild("PlayerGui", 9000000000):WaitForChild("Main", 9000000000):WaitForChild("Timer", 9000000000)

	local function v220(p43)
		if p43 == "Level" then
			if v210() then
				return true
			elseif v208() then
				return true
			elseif getgenv().TeleportToFruit and v161() then
				return true
			elseif getgenv().AutoSecondSea and Level.Value >= 700 then
				return true
			elseif getgenv().AutoThirdSea and Level.Value >= 1500 then
				return true
			elseif v116("Awakened Ice Admiral") and getgenv().AutoRengoku then
				return true
			elseif v116("Darkbeard") and getgenv().AutoDarkbeard then
				return true
			elseif v116("rip_indra True Form") and getgenv().AutoRipIndra then
				return true
			elseif v124("God\'s Chalice") and getgenv().AutoRipIndra then
				return true
			elseif v116("Cake Prince") and getgenv().AutoCakePrince then
				return true
			elseif v116("Dough King") and getgenv().AutoCakePrince then
				return true
			elseif v116("Don Swan") and getgenv().AutoKillDonSwan then
				return true
			elseif v116("Soul Reaper") and getgenv().AutoSoulReaper then
				return true
			elseif v124("Hallow Essence") and getgenv().AutoSoulReaper then
				return true
			else
				return
			end
		end

		if p43 == "Raid Pirate" then
			if v208() or not getgenv().AutoFarmBone then
				if v208() or not getgenv().AutoFarm_Level then
					if v208() or not getgenv().AutoEliteHunter then
						if v208() or not getgenv().TeleportToFruit then
							return
						else
							return true
						end
					else
						return true
					end
				else
					return true
				end
			else
				return true
			end
		end

		if p43 ~= "All Bosses" then
			if p43 == "Candy" then
				if v210() then
					return true
				elseif getgenv().TeleportToFruit and v161() then
					return true
				elseif v116("rip_indra True Form") and getgenv().AutoRipIndra then
					return true
				elseif v124("God\'s Chalice") and getgenv().AutoRipIndra then
					return true
				elseif v116("Cake Prince") and getgenv().AutoCakePrince then
					return true
				elseif v116("Soul Reaper") and getgenv().AutoSoulReaper then
					return true
				elseif v124("Hallow Essence") and getgenv().AutoSoulReaper then
					return true
				else
					return
				end
			end

			if p43 == "Elite Hunter" then
				if getgenv().TeleportToFruit and v161() then
					return true
				elseif v208() then
					return true
				elseif v210() or not getgenv().AutoCandy then
					if getgenv().AutoFarm_Level and not v210() then
						return true
					elseif getgenv().AutoFarmBone and not v210() then
						return true
					elseif v116("rip_indra True Form") and getgenv().AutoRipIndra then
						return true
					elseif v116("Cake Prince") and getgenv().AutoCakePrince then
						return true
					elseif v116("Dough King") and getgenv().AutoCakePrince then
						return true
					elseif v116("Soul Reaper") and getgenv().AutoSoulReaper then
						return true
					elseif v124("Hallow Essence") and getgenv().AutoSoulReaper then
						return true
					elseif v124("God\'s Chalice") and getgenv().AutoRipIndra then
						return true
					else
						return
					end
				else
					return true
				end
			end

			if p43 == "Fruit" then
				if getgenv().AutoSecondSea and Level.Value >= 700 then
					return true
				elseif v208() then
					return true
				elseif getgenv().AutoFarmRaid and Timer.Visible then
					return true
				elseif v116("Awakened Ice Admiral") and getgenv().AutoRengoku then
					return true
				elseif v116("Darkbeard") and getgenv().AutoDarkbeard then
					return true
				elseif v116("Soul Reaper") and getgenv().AutoSoulReaper then
					return true
				elseif v124("Hallow Essence") and getgenv().AutoSoulReaper then
					return true
				elseif v116("Cake Prince") and getgenv().AutoCakePrince then
					return true
				elseif v116("Dough King") and getgenv().AutoCakePrince then
					return true
				elseif v124("God\'s Chalice") and getgenv().AutoRipIndra then
					return true
				elseif v161() then
					return
				else
					return true
				end
			end

			if p43 == "Bone" then
				if getgenv().AutoFarm_Level then
					return true
				elseif v208() then
					return true
				elseif v210() then
					return true
				elseif v124("Hallow Essence") and getgenv().AutoSoulReaper then
					return true
				elseif v116("Soul Reaper") and getgenv().AutoSoulReaper then
					return true
				elseif v116("rip_indra True Form") and getgenv().AutoRipIndra then
					return true
				elseif getgenv().TeleportToFruit and v161() then
					return true
				else
					return
				end
			end

			if p43 == "Ectoplasm" then
				if getgenv().TeleportToFruit and v161() then
					return true
				elseif getgenv().AutoCursedCaptain and v116("Cursed Captain") then
					return true
				else
					return
				end
			end

			if p43 == "Hallow Boss" then
				if getgenv().AutoFarmBone and not (v116("Soul Reaper") or v124("Hallow Essence")) then
					return true
				end

				if not (getgenv().AutoRipIndra and not v116("rip_indra True Form")) then
					return
				end
			end

			if p43 == "Raid" then
				if getgenv().TeleportToFruit and (v161() and not Timer.Visible) then
					return true
				else
					return
				end
			elseif p43 == "Don Swan" then
				if getgenv().AutoFarm_Level and not v116("Don Swan") then
					return true
				elseif getgenv().AutoFarmEctoplasm and not v116("Don Swan") then
					return true
				elseif getgenv().AutoDarkbeard and v116("Darkbeard") then
					return true
				elseif getgenv().AutoCursedCaptain and v116("Cursed Captain") then
					return true
				else
					return
				end
			elseif p43 == "Saw Boss" or (p43 == "Bartilo Quest" or p43 == "Enel Boss") then
				return
			elseif p43 == "Cake Prince" then
				if v210() then
					return
				elseif v116("Cake Prince") or not (getgenv().TeleportToFruit and v161()) then
					if v116("Dough King") or not (getgenv().TeleportToFruit and v161()) then
						if v116("Soul Reaper") and getgenv().AutoSoulReaper then
							return true
						elseif v116("rip_indra True Form") and getgenv().AutoRipIndra then
							return true
						elseif v124("God\'s Chalice") and getgenv().AutoRipIndra then
							return true
						else
							return
						end
					else
						return true
					end
				else
					return true
				end
			elseif p43 == "Rip Indra" then
				if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().AutoFarm_Level) then
					if v116("rip_indra True Form") or not (getgenv().RipIndraLegendaryHaki and v215()) then
						if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().AutoEliteHunter) then
							if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().TeleportToFruit) then
								if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().AutoFarmBone) then
									if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().AutoCakePrince) then
										if v124("God\'s Chalice") or (v116("rip_indra True Form") or not getgenv().AutoCakePrince) then
											return
										else
											return true
										end
									else
										return true
									end
								else
									return true
								end
							else
								return true
							end
						else
							return true
						end
					else
						return
					end
				else
					return true
				end
			else
				return
			end
		end

		if not getgenv().KillAllBosses then
			return
		end

		v212()
	end
	local function v221()
		while getgenv().AutoFarm_Level do
			task.wait()

			if not v220("Level") then
				local v222 = v139({ t1[3] })

				v189()

				if v191(t1[3]) then
					if v222 and v222:FindFirstChild("HumanoidRootPart") then
						v40(v222.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(v222)
						end)
					else
						local Character = LocalPlayer.Character

						if Character then
							Character = LocalPlayer.Character.PrimaryPart
						end

						if t2 and (t2[1] and (Character and (Character.Position - t2[1].p).Magnitude < 1200)) then
							v59(t2)
						elseif t1[2] then
							v40(t1[2])
						else
							v40(t1[1])
						end
					end
				else
					v185(t1[4], t1[5], t1[1])
				end
			end
		end
	end
	local function v224()
		local cFrame = CFrame.new(-16540, 56, 1051)
		local t6 = {
			NPCs = { "Isle Champion", "Sun-kissed Warrior" }
		}

		__set_list(t6, 1, {cFrame, false, "TikiQuest2", 2, true})

		local t7 = {
			CFrame.new(-16521, 90, 1095),
			CFrame.new(-16891, 60, 1003),
			CFrame.new(-16521, 90, 1095),
			CFrame.new(-16891, 60, 1003)
		}

		if v20 then
			t6 = {}

			local cFrame2 = CFrame.new(5258, 39, 4052)

			t6.NPCs = { "Galley Captain" }
			__set_list(t6, 1, {cFrame2, false, "FountainQuest", 2})
			t7 = { CFrame.new(5985, 70, 4790), CFrame.new(5472, 70, 4887) }
		elseif v21 then
			t6 = {}

			local cFrame2 = CFrame.new(-3056, 240, -10145)

			t6.NPCs = { "Water Fighter" }
			__set_list(t6, 1, {cFrame2, false, "ForgottenQuest", 2})
			t7 = {
				CFrame.new(-3339, 290, -10412),
				CFrame.new(-3518, 290, -10419),
				CFrame.new(-3536, 290, -10607),
				CFrame.new(-3345, 280, -10667)
			}
		end

		while getgenv().AutoFarmMastery do
			task.wait()

			local HealthSkill = getgenv().HealthSkill
			local ToolMastery = getgenv().ToolMastery
			local v232 = v139(t6.NPCs)

			pcall(function()
				DestroySkillWarn()
			end)

			if v189() or v191(t6[3]) then
				if v232 and v232:FindFirstChild("HumanoidRootPart") then
					local Humanoid = v232 and v232:FindFirstChild("Humanoid")

					if Humanoid then
						Humanoid = v232.Humanoid.Health
					end

					if Humanoid and Humanoid < v232.Humanoid.MaxHealth * HealthSkill / 100 then
						v40(v232.HumanoidRootPart.CFrame + Vector3.new(0, getgenv().FarmDistance, 0))
						pcall(function()
							v106()
							v122()
							v153(ToolMastery)
							v196(v232, true)
						end)

						if getgenv().AimBotSkill then
							u148(v232.HumanoidRootPart)
						end

						if getgenv().SkillZ then
							v151("Z")
						end

						if getgenv().SkillX then
							v151("X")
						end

						if getgenv().SkillC then
							v151("C")
						end

						if getgenv().SkillV then
							v151("V")
						end

						if getgenv().SkillF then
							v151("F")
						end
					elseif Humanoid and v232.Humanoid.MaxHealth * HealthSkill / 100 <= Humanoid then
						v40(v232.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v153("Melee")
							v196(v232)
						end)
					end
				else
					v59(t7, t6.NPCs)
				end
			else
				v185(t6[3], t6[4], t6[1])
			end
		end
	end
	local function v234()
		local Boats2 = workspace:WaitForChild("Boats", 9000000000)

		for _, child in pairs(Boats2:GetChildren()) do
			if child:FindFirstChild("Owner") and child.Owner.Value.Name == LocalPlayer.Name then
				child:Destroy()
			end
		end
	end
	local function v238()
		local u239 = nil
		local Boats2 = workspace:WaitForChild("Boats", 9000000000)
		local Map = workspace:WaitForChild("Map", 9000000000)

		local function v242()
			local v243 = Boats2

			for _, child in pairs(v243:GetChildren()) do
				if child:FindFirstChild("Humanoid") and (child.Humanoid.Value > 0 and (child:FindFirstChild("Owner") and child.Owner.Value.Name == LocalPlayer.Name)) then
					u239 = child

					return child
				end
			end
		end
		local function v246()
			local huge = math.huge
			local Part2 = nil

			for _, child in pairs(workspace:GetChildren()) do
				if child.Name == "EmberTemplate" and child:FindFirstChild("Part") then
					local Character = LocalPlayer.Character

					if Character then
						Character = LocalPlayer.Character.PrimaryPart
					end

					if Character and (Character.Position - child.Part.Position).Magnitude <= huge then
						huge = (Character.Position - child.Part.Position).Magnitude
						Part2 = child.Part
					end
				end
			end

			return Part2
		end

		local v252 = true
		local v253 = nil
		local v254 = nil
		local v255 = nil

		while getgenv().AutoKitsuneIsland do
			task.wait()

			local Character = LocalPlayer.Character
			local v257 = v242()

			if v257 then
				if not v257:FindFirstChild("BodyVelocity") then
					Instance.new("BodyVelocity", v257).Velocity = Vector3.new()
				end

				for _, descendant in pairs(v257:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("MeshPart") and descendant.Name ~= "VehicleSeat" then
						descendant.CanCollide = false
					end
				end
			end

			local KitsuneIsland = Map:FindFirstChild("KitsuneIsland")

			if KitsuneIsland then
				local Character2 = LocalPlayer.Character
				local PrimaryPart

				if Character2 then
					PrimaryPart = Character2.PrimaryPart
				else
					PrimaryPart = Character2
				end

				if Character2 then
					Character2 = Character2:FindFirstChild("Humanoid")
				end

				local ShrineDialogPart = KitsuneIsland:FindFirstChild("ShrineDialogPart")
				local v264 = v246()

				if Character2 and Character2.Sit then
					Character2.Sit = false
				end

				if v264 then
					if v264 then
						local Character3 = LocalPlayer.Character

						if Character3 then
							Character3 = LocalPlayer.Character.PrimaryPart
						end

						if Character3 and (Part and (v264.Position - Character3.Position).Magnitude < 100) then
							Character3.CFrame = v264.CFrame
							Part.CFrame = v264.CFrame
						else
							v40(v264.CFrame)
						end
					else
						v40(KitsuneIsland.WorldPivot)
					end
				elseif (not PrimaryPart or (not ShrineDialogPart or ((PrimaryPart.Position - ShrineDialogPart.Position).Magnitude >= 5 or not ShrineDialogPart:FindFirstChild("ProximityPrompt")))) and ShrineDialogPart then
					v40(ShrineDialogPart.CFrame)
				end
			elseif v257 then
				if v257:FindFirstChild("VehicleSeat") then
					local Character2 = LocalPlayer.Character

					if Character2 then
						Character2 = Character2:FindFirstChild("Humanoid")
					end

					if Character2 and Character2.SeatPart ~= v257.VehicleSeat then
						v40(v257.VehicleSeat.CFrame)
						Character2.Sit = false

						if v257.PrimaryPart then
							v44(v257, v257.PrimaryPart.CFrame)
						end
					elseif v257.PrimaryPart then
						local PrimaryPart = v257.PrimaryPart

						if v252 then
							v44(v257, CFrame.new(-42000, 21, 500))

							if (PrimaryPart.Position - Vector3.new(-42000, 21, 500)).Magnitude < 25 then
								v252 = false
								v253 = true
							end
						elseif v253 then
							v44(v257, CFrame.new(-50000, 21, 500))

							if (PrimaryPart.Position - Vector3.new(-50000, 21, 500)).Magnitude < 25 then
								v253 = false
								v254 = true
							end
						elseif v254 then
							v44(v257, CFrame.new(-50000, 21, 2000))

							if (PrimaryPart.Position - Vector3.new(-50000, 21, 2000)).Magnitude < 25 then
								v254 = false
								v255 = true
							end
						elseif v255 then
							v44(v257, CFrame.new(-42000, 21, -1000))

							if (PrimaryPart.Position - Vector3.new(-42000, 21, -1000)).Magnitude < 25 then
								v252 = true
								v255 = false
							end
						end
					end
				end
			elseif (Character.PrimaryPart.Position - Vector3.new(-6123, 16, -2247)).Magnitude > 5 then
				v40(CFrame.new(-6123, 16, -2247))
			else
				v26("BuyBoat", "Guardian")
			end
		end

		if not (u239 and u239.PrimaryPart) then
			return
		end

		v44(u239, u239.PrimaryPart.CFrame)
	end
	local function v268()
		local u269 = nil
		local cFrame = nil
		local u271 = nil
		local s2 = ""

		task.spawn(function()
			local v273 = true
			local n1 = 0
			local u275 = nil
			local u276 = nil
			local u277 = nil

			task.spawn(function()
				while getgenv().AutoFarmSea do
					task.wait()

					local PrimaryPart = u269

					if PrimaryPart then
						PrimaryPart = u269.PrimaryPart
					end

					if PrimaryPart then
						if n1 then
							cFrame = CFrame.new(v273, 21, 500)

							if (PrimaryPart.Position - Vector3.new(v273, 21, 500)).Magnitude < 50 then
								u275 = true
								n1 = false
							end
						elseif u275 then
							cFrame = CFrame.new(v273 - 3000, 21, 500)

							if (PrimaryPart.Position - Vector3.new(v273 - 3000, 21, 500)).Magnitude < 50 then
								u276 = true
								u275 = false
							end
						elseif u276 then
							cFrame = CFrame.new(v273 - 3000, 21, 2000)

							if (PrimaryPart.Position - Vector3.new(v273 - 3000, 21, 2000)).Magnitude < 50 then
								u277 = true
								u276 = false
							end
						elseif u277 then
							cFrame = CFrame.new(v273, 21, -1000)

							if (PrimaryPart.Position - Vector3.new(v273, 21, -1000)).Magnitude < 50 then
								n1 = true
								u277 = false
							end
						end
					end
				end
			end)

			while getgenv().AutoFarmSea do
				task.wait()

				if getgenv().SeaLevelTP ~= "inf" then
					if getgenv().SeaLevelTP ~= "6" then
						if getgenv().SeaLevelTP ~= "5" then
							if getgenv().SeaLevelTP ~= "4" then
								if getgenv().SeaLevelTP ~= "3" then
									if getgenv().SeaLevelTP ~= "2" then
										if getgenv().SeaLevelTP == "1" then
											v273 = -22000
										end
									else
										v273 = -26000
									end
								else
									v273 = -30000
								end
							else
								v273 = -34000
							end
						else
							v273 = -38000
						end
					else
						v273 = -42700
					end
				else
					v273 = -100000000
				end
			end
		end)
		task.spawn(function()
			while true do
				if not getgenv().AutoFarmSea then
					return
				end

				task.wait()

				local Character = LocalPlayer.Character
				local Humanoid

				if Character then
					Humanoid = Character:FindFirstChild("Humanoid")
				else
					Humanoid = Character
				end

				if Humanoid then
					if Humanoid.Health >= Humanoid.MaxHealth * getgenv().HealthPanic / 100 then
						continue
					end

					u271 = true

					while true do
						task.wait()

						if u269 and Humanoid then
							if Humanoid.SeatPart and (not u269:FindFirstChild("VehicleSeat") or Humanoid.SeatPart == u269.VehicleSeat) then
								if u269.PrimaryPart then
									local vector3 = Vector3.new(0, math.clamp(u269.PrimaryPart.Position.Y + 5, 0, 600), 0)

									u269.PrimaryPart.CFrame = u269.PrimaryPart.CFrame + vector3
								end
							else
								v40(u269.VehicleSeat.CFrame)

								if u269.PrimaryPart then
									v44(u269, u269.PrimaryPart.CFrame)
								end
							end
						end

						if getgenv().AutoFarmSea and (getgenv().PanicMode and (u269 and (Character and (Humanoid and Humanoid.Health <= Humanoid.MaxHealth * math.clamp(getgenv().HealthPanic, 20, 75) / 100)))) then
							continue
						else
							break
						end
					end

					u271 = false

					continue
				else
					u271 = false

					continue
				end
			end
		end)
		task.spawn(function()
			while getgenv().AutoFarmSea do
				if v127("Melee") then
					s2 = "Melee"
					task.wait(2)
				end

				if v127("Blox Fruit") then
					s2 = "Blox Fruit"
					task.wait(3)
				end

				if v127("Sword") then
					s2 = "Sword"
					task.wait(2)
				end

				if v127("Gun") then
					s2 = "Gun"
					task.wait(2)
				end
			end
		end)

		local function v282()
			local v283 = Boats

			for _, child in pairs(v283:GetChildren()) do
				if child:FindFirstChild("Humanoid") and (child.Humanoid.Value > 0 and (child:FindFirstChild("Owner") and child.Owner.Value.Name == LocalPlayer.Name)) then
					u269 = child

					return child
				end
			end
		end
		local function v286(p44)
			local n2 = 2500
			local u288 = nil

			local function v289(_, p45)
				if p45.Name ~= p44 or (not p45:FindFirstChild("Health") or p45.Health.Value <= 0) then
					return
				end

				local PrimaryPart

				if p45 then
					PrimaryPart = p45.PrimaryPart
				else
					PrimaryPart = p45
				end

				local PrimaryPart2 = u269

				if PrimaryPart2 then
					PrimaryPart2 = u269.PrimaryPart
				end

				if not (PrimaryPart2 and (PrimaryPart and (PrimaryPart2.Position - PrimaryPart.Position).Magnitude < n2)) then
					return
				end

				n2 = (PrimaryPart2.Position - PrimaryPart.Position).Magnitude
				u288 = p45
			end

			local v292 = Enemies

			table.foreach(v292:GetChildren(), v289)

			local v293 = ReplicatedStorage

			table.foreach(v293:GetChildren(), v289)

			return u288
		end
		local function v294(p46)
			local n3 = 2500
			local u296 = nil

			local function v297(_, p47)
				if p47.Name ~= p46 then
					return
				end

				local Humanoid = p47:FindFirstChild("Humanoid")

				if not (Humanoid and Humanoid.Health > 0) then
					return
				end

				local PrimaryPart

				if p47 then
					PrimaryPart = p47.PrimaryPart
				else
					PrimaryPart = p47
				end

				local PrimaryPart2 = u269

				if PrimaryPart2 then
					PrimaryPart2 = u269.PrimaryPart
				end

				if not (PrimaryPart2 and (PrimaryPart and (PrimaryPart2.Position - PrimaryPart.Position).Magnitude < n3)) then
					return
				end

				n3 = (PrimaryPart2.Position - PrimaryPart.Position).Magnitude
				u296 = p47
			end

			local v301 = Enemies

			table.foreach(v301:GetChildren(), v297)

			local v302 = ReplicatedStorage

			table.foreach(v302:GetChildren(), v297)

			return u296
		end

		task.spawn(function()
			while getgenv().AutoFarmSea do
				task.wait()

				if u269 then
					if not u269:FindFirstChild("BodyVelocity") then
						Instance.new("BodyVelocity", u269).Velocity = Vector3.new()
					end

					local v303 = u269

					for _, descendant in pairs(v303:GetDescendants()) do
						if descendant:IsA("BasePart") or descendant:IsA("MeshPart") and descendant.Name ~= "VehicleSeat" then
							descendant.CanCollide = false
						end
					end
				end
			end
		end)

		local v306 = s2

		while getgenv().AutoFarmSea do
			task.wait()

			local Character = LocalPlayer.Character
			local v308 = v282()
			local Terrorshark = v294("Terrorshark")
			local Shark = v294("Shark")
			local Piranha = v294("Piranha")
			local fishCrewMember = v294("Fish Crew Member")
			local PirateGrandBrigade = v286("PirateGrandBrigade")
			local PirateBrigade = v286("PirateBrigade")
			local FishBoat = v286("FishBoat")

			if not (getgenv().PanicMode and (u271 and v308)) then
				if v308 then
					if getgenv().Terrorshark and (Terrorshark and Terrorshark:FindFirstChild("HumanoidRootPart")) then
						v40(Terrorshark.HumanoidRootPart.CFrame * CFrame.new(0, 40, 50))
						pcall(function()
							v106()
							v122()
							v158()
							Character.Humanoid.Sit = false
						end)

						if Terrorshark:FindFirstChild("Humanoid") and Terrorshark.Humanoid.Health <= 0 then
							Terrorshark:Destroy()
						end
					elseif getgenv().Piranha and (Piranha and Piranha:FindFirstChild("HumanoidRootPart")) then
						v40(Piranha.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(Piranha)
							Character.Humanoid.Sit = false
						end)
					elseif getgenv().FishCrewMember and (fishCrewMember and fishCrewMember:FindFirstChild("HumanoidRootPart")) then
						v40(fishCrewMember.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(fishCrewMember)
							Character.Humanoid.Sit = false
						end)
					elseif getgenv().Shark and (Shark and Shark:FindFirstChild("HumanoidRootPart")) then
						v40(Shark.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							Character.Humanoid.Sit = false
						end)

						if Shark:FindFirstChild("Humanoid") and Shark.Humanoid.Health <= 0 then
							Shark:Destroy()
						end
					elseif getgenv().PirateGrandBrigade and (PirateGrandBrigade and PirateGrandBrigade.PrimaryPart) then
						v40(PirateGrandBrigade.PrimaryPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v122()
							Character.Humanoid.Sit = false
						end)
						v153(v306)

						if PirateGrandBrigade:FindFirstChild("Humanoid") and PirateGrandBrigade.Humanoid.Value <= 0 then
							PirateGrandBrigade:Destroy()
						end

						if Character and (Character.PrimaryPart and (Character.PrimaryPart.Position - PirateGrandBrigade.PrimaryPart.Position).Magnitude < 60) then
							if getgenv().SeaAimBotSkill then
								u148(PirateGrandBrigade.PrimaryPart)
							end

							if getgenv().SeaSkillZ then
								v151("Z")
							end

							if getgenv().SeaSkillX then
								v151("X")
							end

							if getgenv().SeaSkillC then
								v151("C")
							end

							if getgenv().SeaSkillV then
								v151("V")
							end

							if getgenv().SeaSkillF then
								v151("F")
							end
						end
					elseif getgenv().PirateBrigade and (PirateBrigade and PirateBrigade.PrimaryPart) then
						v40(PirateBrigade.PrimaryPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v122()
							Character.Humanoid.Sit = false
						end)
						v153(v306)

						if PirateBrigade:FindFirstChild("Humanoid") and PirateBrigade.Humanoid.Value <= 0 then
							PirateBrigade:Destroy()
						end

						if Character and (Character.PrimaryPart and (Character.PrimaryPart.Position - PirateBrigade.PrimaryPart.Position).Magnitude < 60) then
							if getgenv().SeaAimBotSkill then
								u148(PirateBrigade.PrimaryPart)
							end

							if getgenv().SeaSkillZ then
								v151("Z")
							end

							if getgenv().SeaSkillX then
								v151("X")
							end

							if getgenv().SeaSkillC then
								v151("C")
							end

							if getgenv().SeaSkillV then
								v151("V")
							end

							if getgenv().SeaSkillF then
								v151("F")
							end
						end
					elseif getgenv().FishBoat and (FishBoat and FishBoat.PrimaryPart) then
						v40(FishBoat.PrimaryPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v122()
							Character.Humanoid.Sit = false
						end)
						v153(v306)

						if FishBoat:FindFirstChild("Humanoid") and FishBoat.Humanoid.Value <= 0 then
							FishBoat:Destroy()
						end

						if Character and (Character.PrimaryPart and (Character.PrimaryPart.Position - FishBoat.PrimaryPart.Position).Magnitude < 60) then
							if getgenv().SeaAimBotSkill then
								u148(FishBoat.PrimaryPart)
							end

							if getgenv().SeaSkillZ then
								v151("Z")
							end

							if getgenv().SeaSkillX then
								v151("X")
							end

							if getgenv().SeaSkillC then
								v151("C")
							end

							if getgenv().SeaSkillV then
								v151("V")
							end

							if getgenv().SeaSkillF then
								v151("F")
							end
						end
					elseif v308 and v308:FindFirstChild("VehicleSeat") then
						v40(v308.VehicleSeat.CFrame)
					end
				elseif (Character.PrimaryPart.Position - Vector3.new(-6123, 16, -2247)).Magnitude > 5 then
					v40(CFrame.new(-6123, 16, -2247))
				else
					v26("BuyBoat", "Guardian")
				end
			end

			local Character2 = LocalPlayer.Character

			if Character2 then
				Character2 = LocalPlayer.Character:FindFirstChild("Humanoid")
			end

			local VehicleSeat

			if v308 then
				VehicleSeat = v308:FindFirstChild("VehicleSeat")
			else
				VehicleSeat = v308
			end

			if Character2 and (VehicleSeat and (Character2.Sit and Character2.SeatPart ~= VehicleSeat)) then
				Character.Humanoid.Sit = false
				v44(v308, v308.PrimaryPart.CFrame)
			elseif VehicleSeat and (Character2 and (Character2.SeatPart and (Character2.SeatPart == VehicleSeat and cFrame))) then
				v44(v308, cFrame)
			end
		end

		if not (u269 and u269.PrimaryPart) then
			return
		end

		v44(u269, u269.PrimaryPart.CFrame)
	end
	local function v318()
		while getgenv().AutoEliteHunter do
			task.wait()

			if not v220("Elite Hunter") then
				local s3 = "EliteHunterVerify"

				v189()

				if v191("Diablo") then
					s3 = "Diablo"
				elseif v191("Deandre") then
					s3 = "Deandre"
				elseif v191("Urban") then
					s3 = "Urban"
				else
					task.spawn(function()
						v26("EliteHunter")
					end)
				end

				local v320 = v139({ s3 })

				if v320 and v320:FindFirstChild("HumanoidRootPart") then
					v40(v320.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif not (v116("Deandre") or (v116("Diablo") or v116("Urban"))) then
					if getgenv().AutoEliteHunterHop then
						v108()
					else
						v40(CFrame.new(-5119, 315, -2964))
					end
				end
			end
		end
	end
	local function v321()
		while getgenv().AutoSawBoss do
			task.wait()

			if not v220("Saw Boss") then
				local v322 = v139({ "The Saw" })

				if v322 and v322:FindFirstChild("HumanoidRootPart") then
					v40(v322.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(-690, 15, 1583))
				end
			end
		end
	end
	local function v323()
		local Quest = LocalPlayer.PlayerGui.Main.Quest
		local u325 = false
		local u326 = false
		local n4 = 0

		task.spawn(function()
			while getgenv().AutoMusketeerHat do
				task.wait()
				u325 = v26("CitizenQuestProgress").KilledBoss
				u326 = v26("CitizenQuestProgress").KilledBandits
				n4 = v26("CitizenQuestProgress", "Citizen")
			end
		end)

		local v328 = n4
		local v329 = u325
		local v330 = u326

		while getgenv().AutoMusketeerHat do
			task.wait()

			local Value = Level.Value
			local Title = Quest.Container.QuestTitle.Title

			if Value >= 1800 then
				if v330 then
					if v329 then
						if v328 == 2 then
							v40(CFrame.new(-12512, 340, -9872))
						end
					else
						local v333 = v139({ "Captain Elephant" })

						if not Quest.Visible then
							Title.Text = ""
						end

						if Quest.Visible and not string.find(Title.Text, "Captain Elephant") then
							v26("AbandonQuest")
						end

						if Quest.Visible or string.find(Title.Text, "Captain Elephant") then
							if v333 and v333:FindFirstChild("HumanoidRootPart") then
								v40(v333.HumanoidRootPart.CFrame + getgenv().FarmPos)
								pcall(function()
									v106()
									v122()
									v158()
									v196(Enemies1)
								end)
							else
								v40(CFrame.new(-13393, 319, -8423))
							end
						else
							v26("CitizenQuestProgress", "Citizen")
						end
					end
				else
					local v334 = v139({ "Forest Pirate" })

					if not Quest.Visible then
						Title.Text = ""
					end

					if Quest.Visible and not (string.find(Title.Text, "Forest Pirate") or string.find(Title.Text, "50")) then
						v26("AbandonQuest")
					end

					if Quest.Visible or (string.find(Title.Text, "Forest Pirate") or string.find(Title.Text, "50")) then
						if v334 and v334:FindFirstChild("HumanoidRootPart") then
							v40(v334.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v158()
								v196(Enemies1)
							end)
						end
					else
						v184("CitizenQuest", 1)
						v26("CitizenQuestProgress", "Citizen")
					end
				end
			end
		end
	end
	local function v335()
		while getgenv().AutoEnelBossPole do
			task.wait()

			if not v220("Enel Boss") then
				local v336 = v139({ "Thunder God" })

				if v336 and v336:FindFirstChild("HumanoidRootPart") then
					v40(v336.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(-7739, 5657, -2289))
				end
			end
		end
	end
	local function v337()
		while getgenv().AutoRainbowHaki do
			task.wait()

			if v191("Stone") then
				local v338 = v139({ "Stone" })

				if v338 and v338:FindFirstChild("HumanoidRootPart") then
					v40(v338.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(-1049, 40, 6791))

					if getgenv().RainbowHakiHop then
						v108()
					end
				end
			elseif v191("Island Empress") then
				local v339 = v139({ "Island Empress" })

				if v339 and v339:FindFirstChild("HumanoidRootPart") then
					v40(v339.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(5730, 602, 199))

					if getgenv().RainbowHakiHop then
						v108()
					end
				end
			elseif v191("Kilo Admiral") then
				local v340 = v139({ "Kilo Admiral" })

				if v340 and v340:FindFirstChild("HumanoidRootPart") then
					v40(v340.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(2889, 424, -7233))

					if getgenv().RainbowHakiHop then
						v108()
					end
				end
			elseif v191("Captain Elephant") then
				local v341 = v139({ "Captain Elephant" })

				if v341 and v341:FindFirstChild("HumanoidRootPart") then
					v40(v341.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(-13393, 319, -8423))

					if getgenv().RainbowHakiHop then
						v108()
					end
				end
			elseif v191("Beautiful Pirate") then
				local v342 = v139({ "Beautiful Pirate" })

				if v342 and v342:FindFirstChild("HumanoidRootPart") then
					v40(v342.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(5241, 23, 129))

					if getgenv().RainbowHakiHop then
						v108()
					end
				end
			else
				v26("HornedMan", "Bet")
			end
		end
	end
	local function v343()
		local n5 = 0
		local n6 = 0

		task.spawn(function()
			while getgenv().AutoUnlockSaber do
				task.wait()
				n5 = v26("ProQuestProgress", "RichSon")
				n6 = v26("ProQuestProgress", "SickMan")
			end
		end)

		local v346 = n5
		local v347 = n6

		while getgenv().AutoUnlockSaber do
			task.wait()

			if Level.Value > 200 then
				local Character = LocalPlayer

				if Character then
					Character = LocalPlayer.Character
				end

				local Backpack = LocalPlayer.Backpack
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local QuestPlates = game:GetService("Workspace").Map.Jungle.QuestPlates

				if workspace.Map.Jungle.Final.Part.CanCollide then
					if Character and v124("Relic") then
						v40(CFrame.new(-1408, 30, 3))
						v136("Relic")
					elseif v347 == 1 and (v346 == 0 and not workspace.Map.Desert.Burn.Part.CanCollide) then
						local v352 = v139({ "Mob Leader" })

						if v352 and v352:FindFirstChild("HumanoidRootPart") then
							v40(v352.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v158()
							end)
						end
					elseif Character:FindFirstChild("Cup") and not Character.Cup.Handle:FindFirstChild("TouchInterest") then
						v26("ProQuestProgress", "SickMan")
					elseif Character:FindFirstChild("Cup") and Character.Cup.Handle:FindFirstChild("TouchInterest") then
						v40(CFrame.new(1393, 37, -1324, -0.408640295, 0, -0.912695527, 0, 1, 0, 0.912695527, 0, -0.408640295))
					elseif Backpack:FindFirstChild("Cup") then
						v136("Cup")
					elseif workspace.Map.Desert.Burn.Part.CanCollide then
						if Character:FindFirstChild("Torch") then
							v40(CFrame.new(1113, 5, 4352))
						elseif Backpack:FindFirstChild("Torch") then
							v136("Torch")
						elseif QuestPlates:FindFirstChild("Door") and QuestPlates.Door.CanCollide then
							if QuestPlates then
								local Plate1 = QuestPlates:FindFirstChild("Plate1")
								local Plate2 = QuestPlates:FindFirstChild("Plate2")
								local Plate3 = QuestPlates:FindFirstChild("Plate3")
								local Plate4 = QuestPlates:FindFirstChild("Plate4")
								local Plate5 = QuestPlates:FindFirstChild("Plate5")

								if Plate1 and (Plate1:FindFirstChild("Button") and Plate1.Button.BrickColor ~= BrickColor.new("Camo")) then
									v40(Plate1.Button.CFrame)
								elseif Plate2 and (Plate2:FindFirstChild("Button") and Plate2.Button.BrickColor ~= BrickColor.new("Camo")) then
									v40(Plate2.Button.CFrame)
								elseif Plate3 and (Plate3:FindFirstChild("Button") and Plate3.Button.BrickColor ~= BrickColor.new("Camo")) then
									v40(Plate3.Button.CFrame)
								elseif Plate4 and (Plate4:FindFirstChild("Button") and Plate4.Button.BrickColor ~= BrickColor.new("Camo")) then
									v40(Plate4.Button.CFrame)
								elseif Plate5 and (Plate5:FindFirstChild("Button") and Plate5.Button.BrickColor ~= BrickColor.new("Camo")) then
									v40(Plate5.Button.CFrame)
								end
							end
						elseif HumanoidRootPart and (QuestPlates:FindFirstChild("Door") and not QuestPlates.Door.CanCollide) then
							v40(workspace.Map.Jungle.Torch.CFrame)
						end
					else
						v40(workspace.Map.Desert.Cup.CFrame)
					end
				else
					local v358 = v139({ "Saber Expert" })

					if v358 and v358:FindFirstChild("HumanoidRootPart") then
						v40(v358.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
						end)
					else
						v40(CFrame.new(-1461, 30, -51))
					end
				end
			end
		end
	end
	local function v359()
		while getgenv().AutoFarmEctoplasm do
			task.wait()

			if not v220("Ectoplasm") then
				local v360 = v139({
					"Ship Deckhand",
					"Ship Engineer",
					"Ship Steward",
					"Ship Officer"
				})

				if v360 then
					v40(v360.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v360, true)
					end)
				else
					v40(CFrame.new(912, 186, 33591))
				end
			end
		end
	end
	local function v361()
		local t8 = {}
		local cFrame = nil

		task.spawn(function()
			while getgenv().AutoFarmMaterial do
				task.wait()

				local MaterialSelected = getgenv().MaterialSelected

				if v20 then
					if MaterialSelected == "Angel Wings" then
						cFrame = CFrame.new(-7742, 5634, -1564)
						t8 = { "Royal Soldier", "Royal Squad" }
					elseif MaterialSelected == "Leather + Scrap Metal" then
						cFrame = CFrame.new(-1257, 54, 4091)
						t8 = { "Pirate", "Brute" }
					elseif MaterialSelected == "Magma Ore" then
						cFrame = CFrame.new(-5408, 11, 8456)
						t8 = { "Military Soldier" }
					elseif MaterialSelected == "Fish Tail" then
						cFrame = CFrame.new(60931, 19, 1574)
						t8 = { "Fishman Warrior" }
					end
				elseif v21 then
					if MaterialSelected == "Leather + Scrap Metal" then
						cFrame = CFrame.new(-1026, 73, 1375)
						t8 = { "Scrap Metal" }
					elseif MaterialSelected == "Magma Ore" then
						cFrame = CFrame.new(-5241, 50, -4713)
						t8 = { "Lava Pirate" }
					elseif MaterialSelected == "Mystic Droplet" then
						cFrame = CFrame.new(-3350, 282, -10527)
						t8 = { "Water Fighter" }
					elseif MaterialSelected == "Radiactive Material" then
						cFrame = CFrame.new(-73, 149, -112)
						t8 = { "Factory Staff" }
					elseif MaterialSelected == "Vampire Fang" then
						cFrame = CFrame.new(-6030, 6, -1281)
						t8 = { "Vampire" }
					end
				elseif v22 then
					if MaterialSelected == "Leather + Scrap Metal" then
						cFrame = CFrame.new(-364, 116, 5692)
						t8 = { "Pirate Millionaire" }
					elseif MaterialSelected == "Fish Tail" then
						cFrame = CFrame.new(-10679, 398, -8975)
						t8 = { "Fishman Captain", "Fishman Raider" }
					elseif MaterialSelected == "Gunpowder" then
						cFrame = CFrame.new(-394, 135, 5981)
						t8 = { "Pistol Billionaire" }
					elseif MaterialSelected == "Mini Tusk" then
						cFrame = CFrame.new(-13510, 584, -6986)
						t8 = { "Mythological Pirate" }
					elseif MaterialSelected == "Conjured Cocoa" then
						cFrame = CFrame.new(400, 81, -12257)
						t8 = { "Cocoa Warrior", "Chocolate Bar Battler" }
					elseif MaterialSelected == "Dragon Scale" then
						cFrame = CFrame.new(6689, 378, 331)
						t8 = { "Dragon Crew Archer" }
					end
				end
			end
		end)

		local v365 = cFrame
		local v366 = t8

		while getgenv().AutoFarmMaterial do
			task.wait()

			if not v220("Material") then
				local v367 = v139(v366)

				if v367 and v367:FindFirstChild("HumanoidRootPart") then
					v40(v367.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v367, true)
					end)
				elseif v365 then
					v40(v365)
				end
			end
		end
	end
	local function v368()
		while getgenv().AutoFarmBone do
			task.wait()

			if not v220("Bone") then
				local v369 = v139({
					"Reborn Skeleton",
					"Living Zombie",
					"Demonic Soul",
					"Posessed Mummy"
				})

				if v369 then
					v40(v369.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v369, true)
					end)
				else
					v40(CFrame.new(-9513, 164, 5786))
				end
			end
		end
	end
	local function v370()
		while getgenv().AutoPiratesSea do
			task.wait()

			if not v220("Raid Pirate") then
				local v371 = Enemies
				local v372 = nil

				for _, child in pairs(v371:GetChildren()) do
					if child.Name ~= "rip_indra True Form" then
						local Humanoid = child:FindFirstChild("Humanoid")

						if Humanoid and (Humanoid.Health > 0 and (child and (child.PrimaryPart and (child.PrimaryPart.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700))) then
							v372 = child
						end
					end
				end

				if v372 and v372:FindFirstChild("HumanoidRootPart") then
					v40(v372.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v372, true)
					end)
				else
					v40(CFrame.new(-5556, 314, -2988))
				end
			end
		end
	end
	local function v376()
		while getgenv().AutoFactory do
			task.wait()
			v40(CFrame.new(410, 200, -414))
			pcall(function()
				v106()
				v122()
				v158()
			end)
		end
	end
	local function v377()
		local Ice = workspace:WaitForChild("Map", 9000000000):WaitForChild("Ice", 9000000000)

		while getgenv().AutoSecondSea do
			task.wait()

			if Level.Value >= 700 then
				if LocalPlayer then
					local _ = LocalPlayer.Character
				end

				local Character = LocalPlayer and LocalPlayer.Character

				if Character then
					Character = LocalPlayer.Character.PrimaryPart
				end

				local CanCollide = Ice:FindFirstChild("Door") and Ice.Door.CanCollide

				if CanCollide then
					CanCollide = Ice.Door.Transparency < 1
				end

				if v124("Key") or not CanCollide then
					if v124("Key") and CanCollide then
						v136("Key")
						v40(CFrame.new(1346, 37, -1329))
					elseif v116("Ice Admiral") and (Ice:FindFirstChild("Door") and (not Ice.Door.CanCollide and Ice.Door.Transparency > 0)) then
						local v382 = v139({ "Ice Admiral" })

						if v382 and v382:FindFirstChild("HumanoidRootPart") then
							v40(v382.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v158()
							end)
						end
					else
						v40(CFrame.new(1280, 27, -1380))
						v26("TravelDressrosa")
					end
				else
					v40(CFrame.new(4852, 6, 719))

					if Character and (Character.Position - Vector3.new(4852, 6, 719)).Magnitude < 5 then
						v26("DressrosaQuestProgress", "Detective")
					end
				end
			end
		end
	end
	local function v383()
		local n7 = 0

		local function v385()
			local n8 = 2000
			local v387 = nil
			local Character = LocalPlayer and LocalPlayer.Character
			local v389

			if not Character then
				v490 = Enemies
				v491, v492, v493 = pairs(v490:GetChildren())

				while true do
					v493, v389 = v491(v492, v493)

					if v493 == nil then
						break
					end

					if v389.Name == "rip_indra" and (Character and (v389 and (v389:FindFirstChild("HumanoidRootPart") and (Character.Position - v389.HumanoidRootPart.Position).Magnitude <= n8))) then
						n8 = (Character.Position - v389.HumanoidRootPart.Position).Magnitude
						v387 = v389
					end
				end

				return v387
			end

			Character = LocalPlayer.Character.PrimaryPart

			local v390 = Enemies
			local v391, v392, v393 = pairs(v390:GetChildren())

			while true do
				v393, v389 = v391(v392, v393)

				if v393 == nil then
					break
				end

				if v389.Name == "rip_indra" and (Character and (v389 and (v389:FindFirstChild("HumanoidRootPart") and (Character.Position - v389.HumanoidRootPart.Position).Magnitude <= n8))) then
					n8 = (Character.Position - v389.HumanoidRootPart.Position).Magnitude
					v387 = v389
				end
			end

			return v387
		end

		task.spawn(function()
			while getgenv().AutoThirdSea do
				task.wait()
				n7 = v26("ZQuestProgress", "Check")
				v26("TravelZou")
			end
		end)

		local v394 = n7

		while getgenv().AutoThirdSea do
			task.wait()

			if Level.Value >= 1500 then
				local v395 = v385()

				if v395 and v395:FindFirstChild("HumanoidRootPart") then
					v40(v395.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif v394 == 0 then
					if boss and boss:FindFirstChild("HumanoidRootPart") then
						v40(boss.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
						end)
					else
						local Character = LocalPlayer and LocalPlayer.Character

						if Character then
							Character = LocalPlayer.Character.PrimaryPart
						end

						if Character and (Character.Position - Vector3.new(-1926, 13, 1738)).Magnitude < 5 then
							v26("ZQuestProgress", "Begin")
							task.wait(2)
						else
							v40(CFrame.new(-1926, 13, 1738))
						end
					end
				end
			end
		end
	end
	local function v397()
		local n9 = 0

		task.spawn(function()
			while getgenv().AutoBartiloQuest do
				task.wait()
				n9 = v26("BartiloQuestProgress", "Bartilo")
				v26("BartiloQuestProgress", "Bartilo")
			end
		end)

		local Quest = LocalPlayer.PlayerGui.Main.Quest
		local v400 = n9

		while getgenv().AutoBartiloQuest do
			task.wait()

			if Level.Value >= 850 then
				local Title = Quest.Container.QuestTitle.Title

				if v400 == 0 then
					local v402 = v139({ "Swan Pirate" })

					if not Quest.Visible then
						Title.Text = ""
					end

					if Quest.Visible and not (string.find(Title.Text, "Swan Pirate") or string.find(Title.Text, "50")) then
						v26("AbandonQuest")
					end

					if Quest.Visible or (string.find(Title.Text, "Swan Pirate") or string.find(Title.Text, "50")) then
						if v402 and v402:FindFirstChild("HumanoidRootPart") then
							v40(v402.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v158()
								v196(v402)
							end)
						else
							v59({
								CFrame.new(778, 110, 1129),
								CFrame.new(1018, 110, 1128),
								CFrame.new(1020, 110, 1366),
								CFrame.new(1016, 110, 1115)
							}, "Swan Pirate")
						end
					else
						v184("BartiloQuest", 1)
					end
				elseif v400 == 1 then
					local v403 = v139({ "Jeremy" })

					if v403 and v403:FindFirstChild("HumanoidRootPart") then
						v40(v403.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(v403)
						end)
					else
						v40(CFrame.new(2316, 449, 787))
					end
				elseif v400 == 2 then
					local BartiloPlates = game:GetService("Workspace").Map.Dressrosa:FindFirstChild("BartiloPlates")

					if BartiloPlates and (BartiloPlates:FindFirstChild("Plate1") and BartiloPlates.Plate1.Color.G ~= 1) then
						v40(BartiloPlates.Plate1.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate2") and BartiloPlates.Plate2.Color.G ~= 1) then
						v40(BartiloPlates.Plate2.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate3") and BartiloPlates.Plate3.Color.G ~= 1) then
						v40(BartiloPlates.Plate3.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate4") and BartiloPlates.Plate4.Color.G ~= 1) then
						v40(BartiloPlates.Plate4.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate5") and BartiloPlates.Plate5.Color.G ~= 1) then
						v40(BartiloPlates.Plate5.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate6") and BartiloPlates.Plate6.Color.G ~= 1) then
						v40(BartiloPlates.Plate6.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate7") and BartiloPlates.Plate7.Color.G ~= 1) then
						v40(BartiloPlates.Plate7.CFrame)
					elseif BartiloPlates and (BartiloPlates:FindFirstChild("Plate8") and BartiloPlates.Plate8.Color.G ~= 1) then
						v40(BartiloPlates.Plate8.CFrame)
					end
				end
			end
		end
	end
	local function v405()
		while getgenv().AutoRipIndra do
			task.wait()

			if not v220("Rip Indra") then
				local v406 = v139({ "rip_indra True Form" })

				if v406 and v406:FindFirstChild("HumanoidRootPart") then
					v40(v406.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif v124("God\'s Chalice") then
					v136("God\'s Chalice")
					v40(CFrame.new(-5561, 314, -2663))
				else
					v40(CFrame.new(-5333, 424, -2673))
				end
			end
		end
	end
	local function v407()
		while getgenv().AutoKillLawBoss do
			task.wait()

			local v408 = v139({ "Order" })

			if v408 and v408:FindFirstChild("HumanoidRootPart") then
				v40(v408.HumanoidRootPart.CFrame + getgenv().FarmPos)
				pcall(function()
					v106()
					v122()
					v158()
				end)
			else
				v40(CFrame.new(-6300, 16, -4997))
			end
		end
	end
	local function v409()
		while getgenv().AutoDarkbeard do
			task.wait()

			local v410 = v139({ "Darkbeard" })

			if v410 and v410:FindFirstChild("HumanoidRootPart") then
				v40(v410.HumanoidRootPart.CFrame + getgenv().FarmPos)
				pcall(function()
					v106()
					v122()
					v158()
				end)
			elseif v124("Fist of Darkness") then
				v136("Fist of Darkness")
				v40(CFrame.new(3779, 16, -3500))
			else
				v40(CFrame.new(3746, 13, -3632))
			end
		end
	end
	local function v411()
		while getgenv().AutoKillDonSwan do
			task.wait()

			if not v220("Don Swan") then
				local v412 = v139({ "Don Swan" })

				if v412 and v412:FindFirstChild("HumanoidRootPart") then
					v40(v412.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif getgenv().AutoDonSwanHop then
					v108()
				else
					v40(CFrame.new(2272, 15, 759))
				end
			end
		end
	end
	local function v413()
		while getgenv().AutoCursedCaptain do
			task.wait()

			if (not getgenv().AutoFarm_Level or v116("Cursed Captain")) and (not getgenv().AutoFarmEctoplasm or v116("Cursed Captain")) then
				local v414 = v139({ "Cursed Captain" })

				if v414 and v414:FindFirstChild("HumanoidRootPart") then
					v40(v414.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				else
					v40(CFrame.new(912, 186, 33591))
				end
			end
		end
	end
	local function v415()
		task.spawn(function()
			while getgenv().AutoCakePrince do
				task.wait(1)
				v26("CakePrinceSpawner")
			end
		end)

		while getgenv().AutoCakePrince do
			task.wait()

			if not v220("Cake Prince") then
				if v116("Dough King") then
					local v416 = v139({ "Dough King" })

					if v416 and v416:FindFirstChild("HumanoidRootPart") then
						v40(v416.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
						end)
					end
				elseif v116("Cake Prince") then
					local v417 = v139({ "Cake Prince" })

					if v417 and v417:FindFirstChild("HumanoidRootPart") then
						v40(v417.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
						end)
					end
				elseif not (getgenv().AutoFarm_Level or getgenv().AutoFarmBone) then
					local v418 = v139({
						"Head Baker",
						"Baking Staff",
						"Cake Guard",
						"Cookie Crafter"
					})

					if v418 and v418:FindFirstChild("HumanoidRootPart") then
						v40(v418.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(v418, true)
						end)
					else
						v40(CFrame.new(-2103, 70, -12165))
					end
				end
			end
		end
	end
	local function v419()
		local s4 = ""

		task.spawn(function()
			while getgenv().AutoDoughKing do
				task.wait()
				s4 = v26("SweetChaliceNpc")

				if v124("Sweet Chalice") then
					v26("CakePrinceSpawner")
				end
			end
		end)

		local v421 = s4

		while getgenv().AutoDoughKing do
			task.wait()

			if v124("Red Key") then
				v26("CakeScientist", "Check")
			elseif v116("Dough King") then
				local v422 = v139({ "Dough King" })

				if v422 and v422:FindFirstChild("HumanoidRootPart") then
					v40(v422.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				end
			elseif v124("God\'s Chalice") and not v124("Sweet Chalice") then
				if string.find(v421, "Where") then
					local v423 = v139({ "Chocolate Bar Battler", "Cocoa Warrior" })

					if v423 and v423:FindFirstChild("HumanoidRootPart") then
						v40(v423.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(v423, true)
						end)
					else
						v40(CFrame.new(400, 81, -12257))
					end
				end
			elseif v116("Urban") and not (v124("God\'s Chalice") or v124("Sweet Chalice")) or (v116("Deandre") and not (v124("God\'s Chalice") or v124("Sweet Chalice")) or v116("Diablo") and not (v124("God\'s Chalice") or v124("Sweet Chalice"))) then
				local s5 = "EliteHunterVerify"

				v189()

				if v191("Diablo") then
					s5 = "Diablo"
				elseif v191("Deandre") then
					s5 = "Deandre"
				elseif v191("Urban") then
					s5 = "Urban"
				else
					task.spawn(function()
						v26("EliteHunter")
					end)
				end

				local v425 = v139({ s5 })

				if v425 and v425:FindFirstChild("HumanoidRootPart") then
					v40(v425.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				end
			elseif not (getgenv().AutoFarm_Level or getgenv().AutoFarmBone) then
				local v426 = v139({
					"Head Baker",
					"Baking Staff",
					"Cake Guard",
					"Cookie Crafter"
				})

				if v426 and v426:FindFirstChild("HumanoidRootPart") then
					v40(v426.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v426, true)
					end)
				else
					v40(CFrame.new(-2103, 70, -12165))
				end
			end
		end
	end
	local function v427()
		local u428 = nil

		task.spawn(function()
			while getgenv().KillAllBosses do
				task.wait()

				local t9 = {}

				local function v430(_, p48)
					if not table.find(t3, p48.Name) then
						return
					end

					local Humanoid = p48:FindFirstChild("Humanoid")

					if not (Humanoid and Humanoid.Health > 0) then
						return
					end

					table.insert(t9, p48)
				end

				local v432 = Enemies

				table.foreach(v432:GetChildren(), v430)

				local v433 = ReplicatedStorage

				table.foreach(v433:GetChildren(), v430)

				if t9[1] then
					u428 = t9[1]
				end
			end
		end)

		while getgenv().KillAllBosses do
			task.wait()

			if u428 then
				local v434, v435, v436, v437 = v24(u428.Name)

				if u428 and (v189() and not v191(u428.Name)) then
					v26("AbandonQuest")
				end

				if u428 and (v434 and (getgenv().TakeQuestBoss and not (v189() or v191(u428.Name)))) then
					v184(v436, v437 or 3)
				elseif u428 and u428:FindFirstChild("HumanoidRootPart") then
					v40(u428.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif v435 then
					v40(v435)
				end
			end
		end
	end
	local function v438()
		local _ = getgenv().BossSelected
		local Quest = LocalPlayer.PlayerGui.Main.Quest

		while getgenv().AutoFarmBossSelected do
			task.wait()

			local BossSelected = getgenv().BossSelected or ""
			local Character = LocalPlayer.Character

			if Character then
				Character = LocalPlayer.Character.PrimaryPart
			end

			if Character then
				local v443, v444, v445, v446 = v24(BossSelected)

				if v116(BossSelected) then
					local v447 = v139({ BossSelected })

					if not Quest.Visible then
						Quest.Container.QuestTitle.Title.Text = ""
					end

					if Quest.Visible and not string.find(Quest.Container.QuestTitle.Title.Text, BossSelected) then
						v26("AbandonQuest")
					end

					if v443 and (getgenv().TakeQuestBoss and not (Quest.Visible or string.find(Quest.Container.QuestTitle.Title.Text, BossSelected))) then
						v184(v445, v446 or 3)
					elseif v447 and v447:FindFirstChild("HumanoidRootPart") then
						v40(v447.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
							v196(v447)
						end)
					end
				elseif v444 then
					v40(v444)
				end
			end
		end
	end
	local function v448()
		while getgenv().AutoSoulReaper do
			task.wait()

			if not v220("Hallow Boss") then
				local v449 = v139({ "Soul Reaper" })

				if v449 and v449:FindFirstChild("HumanoidRootPart") then
					v40(v449.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
					end)
				elseif v124("Hallow Essence") then
					v136("Hallow Essence")
					pcall(function()
						v40(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)
					end)
				else
					v40(CFrame.new(-9529, 316, 6712))
				end
			end
		end
	end
	local function v450()
		Vector3.new()

		repeat
			task.wait()
		until LocalPlayer.Character and LocalPlayer.Character.PrimaryPart

		local Position = LocalPlayer.Character.PrimaryPart.Position

		local function v452()
			local n10 = 2500
			local u454 = nil

			local function v455(_, p49)
				local Humanoid = p49:FindFirstChild("Humanoid")

				if not (Humanoid and Humanoid.Health > 0) then
					return
				end

				local PrimaryPart = p49.PrimaryPart
				local Character = LocalPlayer.Character

				if Character then
					Character = LocalPlayer.Character.PrimaryPart
				end

				if not (PrimaryPart and (Character and (Character.Position - PrimaryPart.Position).Magnitude <= n10)) then
					return
				end

				n10 = (Character.Position - PrimaryPart.Position).Magnitude
				u454 = p49
			end

			local v459 = Enemies

			table.foreach(v459:GetChildren(), v455)

			local v460 = ReplicatedStorage

			table.foreach(v460:GetChildren(), v455)

			return u454
		end

		while getgenv().AutoFarmNearest do
			task.wait()

			if not (getgenv().AutoFarm_Level or (getgenv().AutoRipIndra or getgenv().AutoCakePrince)) then
				local v461 = v452()

				if v461 and v461:FindFirstChild("HumanoidRootPart") then
					v40(v461.HumanoidRootPart.CFrame + getgenv().FarmPos)
					pcall(function()
						v106()
						v122()
						v158()
						v196(v461, true)
					end)
				else
					v40(CFrame.new(Position))
				end
			end
		end
	end
	local function v462()
		local n11 = 0

		task.spawn(function()
			while getgenv().AutoRaceV2 do
				task.wait()
				n11 = v26("Alchemist", "1")
			end
		end)

		local v464 = n11

		while getgenv().AutoRaceV2 do
			task.wait()

			if not LocalPlayer.Data.Race:FindFirstChild("Evolved") then
				if v464 == 0 then
					local Character = LocalPlayer and LocalPlayer.Character

					if Character then
						Character = LocalPlayer.Character.PrimaryPart
					end

					if Character and (Character.Position - Vector3.new(-2777, 73, -3570)).Magnitude < 5 then
						v26("Alchemist", "2")
					else
						v40(CFrame.new(-2777, 73, -3570))
					end
				elseif v464 == 1 then
					local Backpack = LocalPlayer:FindFirstChild("Backpack")
					local Character = LocalPlayer.Character

					if Character:FindFirstChild("Flower 1") then
						Character["Flower 1"].Parent = Backpack
					elseif Character:FindFirstChild("Flower 2") then
						Character["Flower 2"].Parent = Backpack
					elseif Character:FindFirstChild("Flower 3") then
						Character["Flower 3"].Parent = Backpack
					end

					if Backpack:FindFirstChild("Flower 1") or (not workspace:FindFirstChild("Flower1") or workspace.Flower1.Transparency == 1) then
						if Backpack:FindFirstChild("Flower 2") or (not workspace:FindFirstChild("Flower2") or workspace.Flower2.Transparency == 1) then
							if Backpack:FindFirstChild("Flower 3") then
								if Backpack:FindFirstChild("Flower 1") or not workspace:FindFirstChild("Flower1") then
									if not Backpack:FindFirstChild("Flower 2") and workspace:FindFirstChild("Flower2") then
										v40(workspace.Flower2.CFrame)
									end
								else
									v40(workspace.Flower1.CFrame)
								end
							else
								local v468 = v139({ "Swan Pirate" })

								if v468 and v468:FindFirstChild("HumanoidRootPart") then
									v40(v468.HumanoidRootPart.CFrame + getgenv().FarmPos)
									pcall(function()
										v106()
										v122()
										v158()
										v196(v468)
									end)
								else
									v59({
										CFrame.new(778, 110, 1129),
										CFrame.new(1018, 110, 1128),
										CFrame.new(1020, 110, 1366),
										CFrame.new(1016, 110, 1115)
									}, "Swan Pirate")
								end
							end
						else
							v40(workspace.Flower2.CFrame)
						end
					else
						v40(workspace.Flower1.CFrame)
					end
				elseif v464 == 2 then
					local Character = LocalPlayer and LocalPlayer.Character

					if Character then
						Character = LocalPlayer.Character.PrimaryPart
					end

					if Character and (Character.Position - Vector3.new(-2777, 73, -3570)).Magnitude < 5 then
						v26("Alchemist", "3")
					else
						v40(CFrame.new(-2777, 73, -3570))
					end
				end
			end
		end
	end
	local function v470()
		while getgenv().AutoRengoku do
			task.wait()

			if not (v116("Darkbeard") and getgenv().AutoDarkbeard) then
				if v124("Hidden Key") then
					v136("Hidden Key")
					v40(CFrame.new(6571, 299, -6968))
				elseif v124("Library Key") then
					v136("Library Key")
					v40(CFrame.new(6373, 293, -6839))
				elseif v116("Awakened Ice Admiral") then
					local v471 = v139({ "Awakened Ice Admiral" })

					if v471 and v471:FindFirstChild("HumanoidRootPart") then
						v40(v471.HumanoidRootPart.CFrame + getgenv().FarmPos)
						pcall(function()
							v106()
							v122()
							v158()
						end)
					end
				else
					local v472 = v139({ "Arctic Warrior", "Snow Lurker" })

					if not (getgenv().AutoFarm_Level or getgenv().AutoFarmBone) then
						if v472 and v472:FindFirstChild("HumanoidRootPart") then
							v40(v472.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v158()
								v196(v472, true)
							end)
						else
							v40(CFrame.new(5707, 28, -6402))
						end
					end
				end

				Enemies:FindFirstChild("Awakened Ice Admiral")
				ReplicatedStorage:FindFirstChild("Awakened Ice Admiral")
				GetProxyNPC()
			end
		end
	end

	Players = Instance.new("ScreenGui")

	local ImageButton = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	Players.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Players.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ImageButton.Parent = Players
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0.814237297, 0, 0.135593221, 0)
	ImageButton.Size = UDim2.new(0, 63, 0, 63)
	ImageButton.Image = "rbxassetid://74197694724872"
	Players = Instance.new("UIStroke", ImageButton)
	Players.Thickness = 2
	Players.Color = Color3.fromRGB(133, 21, 124)
	UICorner.Parent = ImageButton
	UIAspectRatioConstraint.Parent = ImageButton
	UIAspectRatioConstraint = function()
		local Parent = Instance.new("LocalScript", ImageButton).Parent
		local UserInputService = game:GetService("UserInputService")
		local u478 = false
		local vector2 = nil
		local Position = nil

		local function v481(p50)
			u478 = true
			vector2 = Vector2.new(p50.Position.X, p50.Position.Y)
			Position = Parent.Position
		end
		local function v482(p51)
			if not u478 then
				return
			end

			local v483 = Vector2.new(p51.Position.X, p51.Position.Y) - vector2

			Parent.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v483.X, Position.Y.Scale, Position.Y.Offset + v483.Y)
		end
		local function v484()
			u478 = false
		end

		Parent.InputBegan:Connect(function(input)
			if not (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				return
			end

			v481(input)
			input.Changed:Connect(function()
				if input.UserInputState ~= Enum.UserInputState.End then
					return
				end

				v484()
			end)
		end)
		UserInputService.InputChanged:Connect(function(input)
			if not (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				return
			end

			v482(input)
		end)
		Parent.MouseButton1Click:Connect(function()
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "End", false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "End", false, game)
		end)
	end
	coroutine.wrap(UIAspectRatioConstraint)()
	UIAspectRatioConstraint = game:GetService("UserInputService")

	if UIAspectRatioConstraint.MouseEnabled and UIAspectRatioConstraint.KeyboardEnabled then
		getgenv().swuuisize = UDim2.fromOffset(580, 460)
	else
		getgenv().swuuisize = UDim2.fromOffset(470, 280)
	end

	UIAspectRatioConstraint = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzLibrary/main/Main.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzLibrary/main/SaveManager.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ToshyWare/StyxzLibrary/main/InterfaceManager.lua"))()
	UIAspectRatioConstraint = UIAspectRatioConstraint:CreateWindow({
		Title = "Styxz Hub | Blox Fruits",
		SubTitle = "",
		TabWidth = 160,
		Size = getgenv().swuuisize,
		Acrylic = false,
		Theme = "Amethyst",
		MinimizeKey = Enum.KeyCode.End
	})
	UICorner = UIAspectRatioConstraint:AddTab({
		Title = "Info",
		Icon = "info"
	})
	UICorner:AddParagraph({
		Title = "Discord : https://discord.gg/k4MyPsKb3b"
	})
	UICorner:AddButton({
		Title = "Copy Discord",
		Callback = function()
			setclipboard("https://discord.gg/k4MyPsKb3b")
		end
	})
	UICorner:AddParagraph({
		Title = "Script Developed By : StyxzTeam"
	})
	UICorner:AddParagraph({
		Title = "Device Support : Mobile"
	})
	UICorner:AddParagraph({
		Title = "Join Our Discord For Suggestions, Bugs And Updates!"
	})
	UICorner = UIAspectRatioConstraint:AddTab({
		Title = "Farm",
		Icon = "home"
	})

	if v22 then
		Players = UIAspectRatioConstraint:AddTab({
			Title = "Sea",
			Icon = "waves"
		})
		Players:AddSection("Kitsune")

		local v485 = Players:AddParagraph({
			Title = "Kitsune Island : Not Spawn"
		})

		Players:AddToggle("Toggle", {
			Title = "Auto Kitsune Island",
			Callback = function(p52)
				getgenv().AutoKitsuneIsland = p52
				v238()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Trade Azure Ember",
			Callback = function(p53)
				getgenv().TradeAzureEmber = p53
				task.spawn(function()
					local RFKitsuneStatuePray = ReplicatedStorage:WaitForChild("Modules", 9000000000):WaitForChild("Net", 9000000000):WaitForChild("RF/KitsuneStatuePray", 9000000000)

					while getgenv().TradeAzureEmber do
						task.wait(1)
						RFKitsuneStatuePray:InvokeServer()
					end
				end)
			end
		})
		task.spawn(function()
			local Map = workspace:WaitForChild("Map", 9000000000)

			task.spawn(function()
				while task.wait() do
					if Map:FindFirstChild("KitsuneIsland") then
						local Character = LocalPlayer.Character

						if Character then
							Character = LocalPlayer.Character.PrimaryPart
						end

						if Character then
							Distance = tostring(math.floor((Character.Position - Map.KitsuneIsland.WorldPivot.p).Magnitude / 3))
						end
					end
				end
			end)

			local v489 = Map

			while task.wait() do
				if v489:FindFirstChild("KitsuneIsland") then
					v485:Set("Kitsune Island : Spawned | Distance : " .. Distance)
				else
					v485:Set("Kitsune Island : Not Spawned")
				end
			end
		end)
		Players:AddSection("Sea")
		Players:AddToggle("Toggle", {
			Title = "Auto Farm Sea",
			Callback = function(p54)
				getgenv().AutoFarmSea = p54
				v268()
			end
		})
		Players:AddButton({
			Title = "Buy New Boat",
			Callback = function()
				v234()
			end
		})
		Players:AddSection("Material")
		Players:AddToggle("Toggle", {
			Title = "Auto Wood Planks",
			Callback = function(p55)
				getgenv().AutoWoodPlanks = p55
				task.spawn(function()
					local BoatCastle = workspace:WaitForChild("Map", 9000000000):WaitForChild("Boat Castle", 9000000000)

					local function v494()
						for _, child in pairs(BoatCastle.IslandModel:GetChildren()) do
							if not (child.Name ~= "Model" or not child:FindFirstChild("Tree")) then
								return child
							end
						end
					end
					local function v495()
						local v496 = v494()

						if v496 then
							local huge = math.huge
							local v497 = nil

							for _, child in pairs(v496:GetChildren()) do
								local Character = LocalPlayer.Character

								if Character then
									Character = LocalPlayer.Character.PrimaryPart
								end

								if child and (child.PrimaryPart and (child.PrimaryPart.Anchored and (Character and (Character.Position - child.PrimaryPart.Position).Magnitude < huge))) then
									huge = (Character.Position - child.PrimaryPart.Position).Magnitude
									v497 = child
								end
							end

							return v497
						end
					end

					local s6 = ""

					task.spawn(function()
						while getgenv().AutoWoodPlanks do
							if v127("Melee") then
								s6 = "Melee"
								task.wait(2)
							end

							if v127("Blox Fruit") then
								s6 = "Blox Fruit"
								task.wait(3)
							end

							if v127("Sword") then
								s6 = "Sword"
								task.wait(2)
							end

							if v127("Gun") then
								s6 = "Gun"
								task.wait(2)
							end
						end
					end)

					local v502 = s6

					while getgenv().AutoWoodPlanks do
						task.wait()

						local v503 = v495()

						v153(v502)

						if v503 and v503.PrimaryPart then
							v40(v503.PrimaryPart.CFrame)

							local Character = LocalPlayer.Character

							if Character then
								Character = LocalPlayer.Character.PrimaryPart
							end

							if Character and (Character.Position - v503.PrimaryPart.Position).Magnitude < 10 then
								if getgenv().SeaSkillZ then
									v151("Z")
								end

								if getgenv().SeaSkillX then
									v151("X")
								end

								if getgenv().SeaSkillC then
									v151("C")
								end

								if getgenv().SeaSkillV then
									v151("V")
								end

								if getgenv().SeaSkillF then
									v151("F")
								end

								if getgenv().SeaAimBotSkill then
									u148(v503.PrimaryPart)
								end
							end
						end
					end
				end)
			end
		})
		Players:AddSection("Panic Mode")
		Players:AddSlider("Slider", {
			Title = "Select Health",
			Min = 20,
			Max = 70,
			Default = 25,
			Rounding = 1,
			Callback = function(p56)
				getgenv().HealthPanic = p56
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Panic Mode",
			Default = true,
			Callback = function(p57)
				getgenv().PanicMode = p57
			end
		})
		Players:AddSection("Farm Select")
		Players:AddParagraph({
			Title = "Fish"
		})
		Players:AddToggle("Toggle", {
			Title = "Terrorshark",
			Default = true,
			Callback = function(p58)
				getgenv().Terrorshark = p58
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Piranha",
			Default = true,
			Callback = function(p59)
				getgenv().Piranha = p59
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Fish Crew Member",
			Default = true,
			Callback = function(p60)
				getgenv().FishCrewMember = p60
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Shark",
			Default = true,
			Callback = function(p61)
				getgenv().Shark = p61
			end
		})
		Players:AddParagraph({
			Title = "Boats"
		})
		Players:AddToggle("Toggle", {
			Title = "Pirate Brigade",
			Default = true,
			Callback = function(p62)
				getgenv().PirateBrigade = p62
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Pirate Grand Brigade",
			Default = true,
			Callback = function(p63)
				getgenv().PirateGrandBrigade = p63
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Fish Boat",
			Default = true,
			Callback = function(p64)
				getgenv().FishBoat = p64
			end
		})
		Players:AddSection("Skill")
		Players:AddToggle("Toggle", {
			Title = "AimBot Skill Enemie",
			Default = true,
			Callback = function(p65)
				getgenv().SeaAimBotSkill = p65
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Skill Z",
			Default = true,
			Callback = function(p66)
				getgenv().SeaSkillZ = p66
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Skill X",
			Default = true,
			Callback = function(p67)
				getgenv().SeaSkillX = p67
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Skill C",
			Default = true,
			Callback = function(p68)
				getgenv().SeaSkillC = p68
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Skill V",
			Default = true,
			Callback = function(p69)
				getgenv().SeaSkillV = p69
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Skill F",
			Callback = function(p70)
				getgenv().SeaSkillF = p70
			end
		})
		Players:AddSection("NPCs")
		Players:AddToggle("Toggle", {
			Title = "Teleport To Shark Hunter",
			Callback = function(p71)
				getgenv().NPCtween = p71
				task.spawn(function()
					while getgenv().NPCtween do
						task.wait()
						v40(CFrame.new(-16526, 108, 752))
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Teleport To Beast Hunter",
			Callback = function(p72)
				getgenv().NPCtween = p72
				task.spawn(function()
					while getgenv().NPCtween do
						task.wait()
						v40(CFrame.new(-16281, 73, 263))
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Teleport To Spy",
			Callback = function(p73)
				getgenv().NPCtween = p73
				task.spawn(function()
					while getgenv().NPCtween do
						task.wait()
						v40(CFrame.new(-16471, 528, 539))
					end
				end)
			end
		})
		Players:AddSection("Configs")
		Players:AddDropdown("Dropdown", {
			Title = "Tween Sea Level",
			Values = {
				"1",
				"2",
				"3",
				"4",
				"5",
				"6",
				"inf"
			},
			Default = 6,
			Callback = function(p74)
				getgenv().SeaLevelTP = p74
			end
		})
		Players:AddSlider("Slider", {
			Title = "Boat Tween Speed",
			Min = 100,
			Max = 300,
			Rounding = 10,
			Default = 250,
			Callback = function(p75)
				getgenv().SeaBoatSpeed = p75
			end
		})
	end

	if v22 and LocalPlayer.UserId == 2764978820 then
		v670 = UIAspectRatioConstraint:AddTab({
			Title = "Race V4",
			Icon = ""
		})
		v670:AddToggle("Toggle", {
			Title = "Auto Pull Lever",
			Callback = function(_) end
		})
		v670:AddToggle("Toggle", {
			Title = "Auto Stone Puzzle",
			Callback = function(_) end
		})
		v670:AddSection("Auto Mirage")
		v670:AddToggle("Toggle", {
			Title = "Auto Find Mirage",
			Callback = function(_) end
		})
		v670:AddToggle("Toggle", {
			Title = "Auto Gear Puzzle",
			Callback = function(_) end
		})
		v670:AddSection("Auto Race")
		v670:AddToggle("Toggle", {
			Title = "Auto Finish Trial",
			Callback = function(p76)
				getgenv().AutoFinishTrial = p76
				task.spawn(function()
					local Value = nil

					task.spawn(function()
						while getgenv().AutoFinishTrial do
							task.wait()
							Value = LocalPlayer.Data.Race.Value
						end
					end)

					while getgenv().AutoFinishTrial do
						task.wait()

						if Value and typeof(Value) == "string" then
							if Value == "Cyborg" then
								v40(CFrame.new(28654, 14898, -30))
							elseif Value == "Ghoul" then
								v46()
							elseif Value == "Human" then
								v46()
							elseif Value == "Mink" then
								for _, descendant in pairs(workspace:GetDescendants()) do
									if descendant.Name == "StartPoint" then
										v40(descendant.CFrame)
									end
								end
							elseif Value == "Skypiea" then
								pcall(function()
									for _, descendant in pairs(workspace.Map.SkyTrial.Model:GetDescendants()) do
										if descendant.Name == "snowisland_Cylinder.081" then
											v40(descendant.CFrame)
										end
									end
								end)
							end
						end
					end
				end)
			end
		})
	end

	Players = UIAspectRatioConstraint:AddTab({
		Title = "Quests/Items",
		Icon = "swords"
	})

	local v510 = UIAspectRatioConstraint:AddTab({
		Title = "Fruit/Raid",
		Icon = "cherry"
	})

	if Level.Value < 2551 then
		v668 = UIAspectRatioConstraint:AddTab({
			Title = "Stats",
			Icon = "signal"
		})

		local n12 = 1
		local u512 = nil
		local u513 = nil
		local u514 = nil
		local u515 = nil
		local u516 = nil

		local function v517()
			local CommF_2 = ReplicatedStorage:WaitForChild("Remotes", 9000000000):WaitForChild("CommF_", 9000000000)

			local function v519(p77)
				if LocalPlayer.Data.Points.Value < 1 then
					return
				end

				CommF_2:InvokeServer("AddPoint", p77, (math.clamp(n12, 1, LocalPlayer.Data.Points.Value)))
			end

			while getgenv().AutoStats do
				task.wait()

				if u512 then
					v519("Melee")
				end

				if u513 then
					v519("Defense")
				end

				if u514 then
					v519("Sword")
				end

				if u515 then
					v519("Gun")
				end

				if u516 then
					v519("Demon Fruit")
				end
			end
		end

		v668:AddToggle("Toggle", {
			Title = "Auto Stats",
			Callback = function(p78)
				getgenv().AutoStats = p78
				v517()
			end
		})
		v668:AddSlider("Slider", {
			Title = "Select Points",
			Min = 1,
			Max = 100,
			Rounding = 1,
			Default = 1,
			Callback = function(p79)
				n12 = p79
			end
		})
		v668:AddSection("Select Stats")
		v668:AddToggle("Toggle", {
			Title = "Melee",
			Callback = function(p80)
				u512 = p80
			end
		})
		v668:AddToggle("Toggle", {
			Title = "Defense",
			Callback = function(p81)
				u513 = p81
			end
		})
		v668:AddToggle("Toggle", {
			Title = "Sword",
			Callback = function(p82)
				u514 = p82
			end
		})
		v668:AddToggle("Toggle", {
			Title = "Gun",
			Callback = function(p83)
				u515 = p83
			end
		})
		v668:AddToggle("Toggle", {
			Title = "Demon Fruit",
			Callback = function(p84)
				u516 = p84
			end
		})
	end

	local v520 = UIAspectRatioConstraint:AddTab({
		Title = "Teleport",
		Icon = "locate"
	})
	local v521 = UIAspectRatioConstraint:AddTab({
		Title = "Visual",
		Icon = "user"
	})
	local v522 = UIAspectRatioConstraint:AddTab({
		Title = "Shop",
		Icon = "shopping-cart"
	})

	UIAspectRatioConstraint = UIAspectRatioConstraint:AddTab({
		Title = "Misc",
		Icon = "settings"
	})
	UICorner:AddDropdown("Dropdown", {
		Title = "Farm Tool",
		Values = { "Melee", "Sword", "Blox Fruit" },
		Default = 1,
		Callback = function(p85)
			getgenv().FarmTool = p85
		end
	})
	UICorner:AddSection("Farm")
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Level",
		Callback = function(p86)
			getgenv().AutoFarm_Level = p86
			v221()
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Nearest",
		Callback = function(p87)
			getgenv().AutoFarmNearest = p87
			v450()
		end
	})

	if v22 then
		UICorner:AddToggle("Toggle", {
			Title = "Auto Pirates Sea",
			Callback = function(p88)
				getgenv().AutoPiratesSea = p88
				v370()
			end
		})
	elseif v21 then
		UICorner:AddToggle("Toggle", {
			Title = "Auto Factory",
			Callback = function(p89)
				getgenv().AutoFactory = p89
				v376()
			end
		})
	end

	if v22 then
		UICorner:AddSection("Bone")
		UICorner:AddToggle("Toggle", {
			Title = "Auto Farm Bone",
			Callback = function(p90)
				getgenv().AutoFarmBone = p90
				v368()
			end
		})
		UICorner:AddToggle("Toggle", {
			Title = "Auto Hallow Scythe",
			Callback = function(p91)
				getgenv().AutoSoulReaper = p91
				v448()
			end
		})
		UICorner:AddToggle("Toggle", {
			Title = "Auto Trade Bone",
			Callback = function(p92)
				getgenv().AutoTradeBone = p92

				while getgenv().AutoTradeBone do
					task.wait()
					v26("Bones", "Buy", 1, 1)
				end
			end
		})
	elseif v21 then
		UICorner:AddSection("Ectoplasm")
		UICorner:AddToggle("Toggle", {
			Title = "Auto Farm Ectoplasm",
			Callback = function(p93)
				getgenv().AutoFarmEctoplasm = p93
				v359()
			end
		})
	end

	UICorner:AddSection("Chest")
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Chest <Tween>",
		Callback = function(p94)
			getgenv().AutoChestTween = p94
			v178()
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Chest <Bypass>",
		Callback = function(p95)
			getgenv().AutoChestBypass = p95
			v171()
		end
	})
	UICorner:AddSection("Bosses")
	UICorner:AddDropdown("Dropdown", {
		Title = "Boss List",
		Values = v20 and {
			"Greybeard",
			"The Saw",
			"Saber Expert",
			"The Gorilla King",
			"Bobby",
			"Yeti",
			"Vice Admiral",
			"Warden",
			"Chief Warden",
			"Swan",
			"Magma Admiral",
			"Fishman Lord",
			"Wysper",
			"Thunder God",
			"Cyborg"
		} or (v21 and {
			"Darkbeard",
			"Cursed Captain",
			"Order",
			"Don Swan",
			"Diamond",
			"Jeremy",
			"Fajita",
			"Smoke Admiral",
			"Awakened Ice Admiral",
			"Tide Keeper"
		} or (v22 and {
			"Dough King",
			"Cake Prince",
			"rip_indra True Form",
			"Soul Reaper",
			"Stone",
			"Island Empress",
			"Kilo Admiral",
			"Captain Elephant",
			"Beautiful Pirate",
			"Cake Queen",
			"Longma"
		} or {})),
		Callback = function(p96)
			getgenv().BossSelected = p96
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Boss Selected",
		Callback = function(p97)
			getgenv().AutoFarmBossSelected = p97
			v438()
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm All Boss",
		Callback = function(p98)
			getgenv().KillAllBosses = p98
			v427()
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Take Quest",
		Default = true,
		Callback = function(p99)
			getgenv().TakeQuestBoss = p99
		end
	})
	UICorner:AddButton({
		Title = "Server HOP",
		Callback = function()
			v108()
		end
	})
	UICorner:AddSection("Material")
	UICorner:AddDropdown("Dropdown", {
		Title = "Material List",
		Values = v20 and {
			"Angel Wings",
			"Leather + Scrap Metal",
			"Magma Ore",
			"Fish Tail"
		} or (v21 and {
			"Leather + Scrap Metal",
			"Magma Ore",
			"Mystic Droplet",
			"Radiactive Material",
			"Vampire Fang"
		} or (v22 and {
			"Leather + Scrap Metal",
			"Fish Tail",
			"Gunpowder",
			"Mini Tusk",
			"Conjured Cocoa",
			"Dragon Scale"
		} or {})),
		Callback = function(p100)
			getgenv().MaterialSelected = p100
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Material",
		Callback = function(p101)
			getgenv().AutoFarmMaterial = p101
			v361()
		end
	})
	UICorner:AddSection("Mastery")
	UICorner:AddSlider("Slider", {
		Title = "Select Health",
		Min = 10,
		Max = 100,
		Default = 25,
		Rounding = 1,
		Callback = function(p102)
			getgenv().HealthSkill = p102
		end
	})
	UICorner:AddDropdown("Dropdown", {
		Title = "Select Tool",
		Values = { "Blox Fruit" },
		Default = 1,
		Callback = function(p103)
			getgenv().ToolMastery = p103
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Auto Farm Mastery",
		Callback = function(p104)
			getgenv().AutoFarmMastery = p104
			v224()
		end
	})
	UICorner:AddSection("Skill")
	UICorner:AddToggle("Toggle", {
		Title = "AimBot Skill Enemie",
		Default = true,
		Callback = function(p105)
			getgenv().AimBotSkill = p105
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Skill Z",
		Default = true,
		Callback = function(p106)
			getgenv().SkillZ = p106
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Skill X",
		Default = true,
		Callback = function(p107)
			getgenv().SkillX = p107
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Skill C",
		Default = true,
		Callback = function(p108)
			getgenv().SkillC = p108
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Skill V",
		Default = true,
		Callback = function(p109)
			getgenv().SkillV = p109
		end
	})
	UICorner:AddToggle("Toggle", {
		Title = "Skill F",
		Callback = function(p110)
			getgenv().SkillF = p110
		end
	})
	v510:AddSection("Fruits")

	local t10 = {}

	v510:AddToggle("Toggle", {
		Title = "Auto Store Fruits",
		Callback = function(p111)
			getgenv().AutoStoreFruits = p111
			task.spawn(function()
				local CommF_2 = ReplicatedStorage:WaitForChild("Remotes", 9000000000):WaitForChild("CommF_", 9000000000)

				while getgenv().AutoStoreFruits do
					task.wait()

					local Backpack = LocalPlayer.Backpack
					local Character = LocalPlayer.Character

					if Character then
						for _, child in pairs(Character:GetChildren()) do
							if not table.find(t10, child.Name) and (child:IsA("Tool") and (child:FindFirstChild("Fruit") and CommF_2:InvokeServer("StoreFruit", v23(child.Name), child) ~= true)) then
								table.insert(t10, child.Name)
							end
						end
					end

					for _, child in pairs(Backpack:GetChildren()) do
						if not table.find(t10, child.Name) and (child:IsA("Tool") and (child:FindFirstChild("Fruit") and CommF_2:InvokeServer("StoreFruit", v23(child.Name), child) ~= true)) then
							table.insert(t10, child.Name)
						end
					end
				end
			end)
		end
	})
	v510:AddToggle("Toggle", {
		Title = "Teleport to Fruits",
		Callback = function(p112)
			getgenv().TeleportToFruit = p112
			task.spawn(function()
				while getgenv().TeleportToFruit do
					task.wait()

					if not v220("Fruit") then
						v40(v161().CFrame)
					end
				end
			end)
		end
	})
	v510:AddToggle("Toggle", {
		Title = "Auto random Fruit",
		Callback = function(p113)
			getgenv().AutoRandomFruit = p113
			task.spawn(function()
				while getgenv().AutoRandomFruit do
					task.wait(1)
					v26("Cousin", "Buy")
				end
			end)
		end
	})
	v510:AddSection("Raid")

	if v20 then
		v510:AddParagraph({
			Title = "Only on Sea 2 and 3"
		})
	elseif v21 or v22 then
		Raids_Chip = {}
		UICorner = require(ReplicatedStorage.Raids)
		table.foreach(UICorner.advancedRaids, function(_, p114)
			table.insert(Raids_Chip, p114)
		end)
		table.foreach(UICorner.raids, function(_, p115)
			table.insert(Raids_Chip, p115)
		end)
		v510:AddDropdown("Dropdown", {
			Title = "select the Raid",
			Values = Raids_Chip,
			Callback = function(p116)
				getgenv().SelectRaidChip = p116
			end
		})
		v510:AddToggle("Toggle", {
			Title = "Auto Farm Raid",
			Callback = function(p117)
				getgenv().AutoFarmRaid = p117
				task.spawn(function()
					local Locations = workspace:WaitForChild("_WorldOrigin", 9000000000):WaitForChild("Locations", 9000000000)

					local function v532(p118)
						local Character = LocalPlayer

						if Character then
							Character = LocalPlayer.Character
						end

						local v534

						if not Character then
							v720 = Locations
							v721, v722, v723 = pairs(v720:GetChildren())

							while true do
								v723, v534 = v721(v722, v723)

								if v723 == nil then
									break
								end

								if v534 and (v534.Name == p118 and (Character and (v534.Position - Character.Position).Magnitude < 3000)) then
									return v534
								end
							end

							return
						end

						Character = Character.PrimaryPart

						local v535 = Locations
						local v536, v537, v538 = pairs(v535:GetChildren())

						while true do
							v538, v534 = v536(v537, v538)

							if v538 == nil then
								break
							end

							if v534 and (v534.Name == p118 and (Character and (v534.Position - Character.Position).Magnitude < 3000)) then
								return v534
							end
						end
					end

					task.spawn(function()
						while getgenv().AutoFarmRaid do
							task.wait(0.5)

							if not v220("Raid") then
								v26("Awakener", "Check")
								v26("Awakener", "Awaken")
							end
						end
					end)
					task.spawn(function()
						while getgenv().AutoFarmRaid do
							task.wait()

							if not v220("Raid") and LocalPlayer.PlayerGui.Main.Timer.Visible then
								v158()

								local island1 = v532("Island 1")
								local island2 = v532("Island 2")
								local island3 = v532("Island 3")
								local island4 = v532("Island 4")
								local island5 = v532("Island 5")

								if island5 then
									v40(island5.CFrame + Vector3.new(0, 70, 0))
								elseif island4 then
									v40(island4.CFrame + Vector3.new(0, 70, 0))
								elseif island3 then
									v40(island3.CFrame + Vector3.new(0, 70, 0))
								elseif island2 then
									v40(island2.CFrame + Vector3.new(0, 70, 0))
								elseif island1 then
									v40(island1.CFrame + Vector3.new(0, 70, 0))
								end
							end
						end
					end)

					local v544 = v532

					while getgenv().AutoFarmRaid do
						task.wait()

						if not v220("Raid") and (not LocalPlayer.PlayerGui.Main.Timer.Visible and (v124("Special Microchip") and not (v544("Island 1") or (v544("Island 2") or (v544("Island 3") or (v544("Island 4") or v544("Island 5"))))))) then
							pcall(function()
								if v21 then
									fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)

									repeat
										task.wait()
									until v544("Island 1")

									task.wait(1)
								else
									if not v22 then
										return
									end

									fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)

									repeat
										task.wait()
									until v544("Island 1")

									task.wait(1)
								end
							end)
						end
					end
				end)
				getgenv().AutoKillAura = p117
				v54()
			end
		})
		v510:AddToggle("Toggle", {
			Title = "Auto Buy Chip",
			Callback = function(p119)
				getgenv().AutoBuyChip = p119
				task.spawn(function()
					while getgenv().AutoBuyChip do
						task.wait()

						if not v124("Special Microchip") then
							v26("RaidsNpc", "Select", getgenv().SelectRaidChip)
							task.wait(1)
						end
					end
				end)
			end
		})
	end

	if v20 then
		Players:AddSection("Second Sea")
		Players:AddToggle("Toggle", {
			Title = "Auto Second Sea",
			Callback = function(p120)
				getgenv().AutoSecondSea = p120
				v377()
			end
		})
		Players:AddSection("Saber")
		Players:AddToggle("Toggle", {
			Title = "Auto Unlock Saber < Level +200 >",
			Callback = function(p121)
				getgenv().AutoUnlockSaber = p121
				v343()
			end
		})
		Players:AddSection("God Boss")
		Players:AddToggle("Toggle", {
			Title = "Auto Pole V1",
			Callback = function(p122)
				getgenv().AutoEnelBossPole = p122
				v335()
			end
		})
		Players:AddSection("The Saw")
		Players:AddToggle("Toggle", {
			Title = "Auto Saw Sword",
			Callback = function(p123)
				getgenv().AutoSawBoss = p123
				v321()
			end
		})
	elseif v21 then
		Players:AddSection("Third Sea")
		Players:AddToggle("Toggle", {
			Title = "Auto Third Sea",
			Callback = function(p124)
				getgenv().AutoThirdSea = p124
				v383()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Kill Don Swan",
			Callback = function(p125)
				getgenv().AutoKillDonSwan = p125
				v411()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Don Swan Hop",
			Callback = function(p126)
				getgenv().AutoDonSwanHop = p126
			end
		})
		Players:AddSection("Bartilo Quest")
		Players:AddToggle("Toggle", {
			Title = "Auto Bartilo Quest",
			Callback = function(p127)
				getgenv().AutoBartiloQuest = p127
				v397()
			end
		})
		Players:AddSection("Rengoku")
		Players:AddToggle("Toggle", {
			Title = "Auto Rengoku",
			Callback = function(p128)
				getgenv().AutoRengoku = p128
				v470()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Rengoku Hop",
			Callback = function(p129)
				getgenv().AutoRengokuHop = p129
			end
		})
		Players:AddSection("Legendary Sword")
		Players:AddToggle("Toggle", {
			Title = "Auto Buy Legendary Sword",
			Callback = function(p130)
				getgenv().AutoLegendarySword = p130
				task.spawn(function()
					while getgenv().AutoLegendarySword do
						task.wait()
						v26("LegendarySwordDealer", "1")
						v26("LegendarySwordDealer", "2")
						v26("LegendarySwordDealer", "3")
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Buy True Triple Katana",
			Callback = function(p131)
				getgenv().AutoTTK = p131
				task.spawn(function()
					while getgenv().AutoTTK do
						task.wait()
						v26("MysteriousMan", "1")
						v26("MysteriousMan", "2")
					end
				end)
			end
		})
		Players:AddSection("Race")
		Players:AddToggle("Toggle", {
			Title = "Auto Evo Race V2",
			Callback = function(p132)
				getgenv().AutoRaceV2 = p132
				v462()
			end
		})
		Players:AddSection("Cursed Captain")
		Players:AddToggle("Toggle", {
			Title = "Auto Cursed Captain",
			Callback = function(p133)
				getgenv().AutoCursedCaptain = p133
				v413()
			end
		})
		Players:AddSection("Dark Beard")
		Players:AddToggle("Toggle", {
			Title = "Auto Dark Beard",
			Callback = function(p134)
				getgenv().AutoDarkbeard = p134
				v409()
			end
		})
		Players:AddSection("Law")
		Players:AddToggle("Toggle", {
			Title = "Auto Buy Law Chip",
			Callback = function(p135)
				getgenv().AutoBuyLawChip = p135
				task.spawn(function()
					while getgenv().AutoBuyLawChip do
						task.wait()

						if not (v116("Order") or v124("Microchip")) then
							v26("BlackbeardReward", "Microchip", "2")
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Start Law Raid",
			Callback = function(p136)
				getgenv().AutoStartLawRaid = p136
				task.spawn(function()
					while getgenv().AutoStartLawRaid do
						task.wait()

						if not v116("Order") and v124("Microchip") then
							pcall(function()
								fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
							end)
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Kill Law Boss",
			Callback = function(p137)
				getgenv().AutoKillLawBoss = p137
				v407()
			end
		})
	elseif v22 then
		Players:AddSection("Elite Hunter")

		local v545 = Players:AddParagraph({
			Title = "Elite Stats : Not Spawn"
		})
		local v546 = Players:AddParagraph({
			Title = "Elite Hunter progress : 0"
		})

		task.spawn(function()
			while task.wait() do
				if v116("Urban") or (v116("Deandre") or v116("Diablo")) then
					v545:Set("Elite Stats : Spawned")
				else
					v545:Set("Elite Stats : Not Spawn")
				end
			end
		end)

		if LocalPlayer.UserId ~= 2764978820 then
			task.spawn(function()
				while task.wait(1) do
					v546:Set("Elite Hunter progress : " .. v26("EliteHunter", "Progress"))
				end
			end)
		end

		Players:AddToggle("Toggle", {
			Title = "Auto Elite Hunter",
			Callback = function(p138)
				getgenv().AutoEliteHunter = p138
				v318()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Collect Yama < Need 30 >",
			Callback = function(p139)
				getgenv().AutoCollectYama = p139
				task.spawn(function()
					while getgenv().AutoCollectYama do
						task.wait()
						pcall(function()
							if v26("EliteHunter", "Progress") < 30 then
								return
							end

							fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
						end)
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Elite Hunter Hop",
			Callback = function(p140)
				getgenv().AutoEliteHunterHop = p140
			end
		})
		Players:AddSection("Tushita")

		local v547 = Players:AddParagraph({
			Title = "Rip Indra Stats : Not Spawn"
		})

		task.spawn(function()
			while task.wait(0.5) do
				if v116("rip_indra True Form") then
					v547:Set("Rip Indra Stats : Spawned")
				else
					v547:Set("Rip Indra Stats : Not Spawn")
				end
			end
		end)
		Players:AddToggle("Toggle", {
			Title = "Auto Tushita",
			Callback = function(p141)
				getgenv().AutoTushita = p141
				task.spawn(function()
					local Turtle = workspace:WaitForChild("Map", 9000000000):WaitForChild("Turtle", 9000000000)
					local QuestTorches = Turtle:WaitForChild("QuestTorches", 9000000000)
					local v550 = false
					local v551 = false
					local v552 = false
					local v553 = false
					local v554 = false

					while getgenv().AutoTushita do
						task.wait()

						if Turtle:FindFirstChild("TushitaGate") then
							if v116("rip_indra True Form") then
								if v124("Holy Torch") then
									local Torch1 = QuestTorches:FindFirstChild("Torch1")
									local Torch2 = QuestTorches:FindFirstChild("Torch2")
									local Torch3 = QuestTorches:FindFirstChild("Torch3")
									local Torch4 = QuestTorches:FindFirstChild("Torch4")
									local Torch5 = QuestTorches:FindFirstChild("Torch5")
									local PointLight = Torch1 and Torch1:FindFirstChild("Particles") and Torch1.Particles:FindFirstChild("PointLight")

									if PointLight then
										PointLight = not Torch1.Particles.PointLight.Enabled
									end

									local PointLight2 = Torch2 and Torch2:FindFirstChild("Particles") and Torch2.Particles:FindFirstChild("PointLight")

									if PointLight2 then
										PointLight2 = not Torch2.Particles.PointLight.Enabled
									end

									local PointLight3 = Torch3 and Torch3:FindFirstChild("Particles") and Torch3.Particles:FindFirstChild("PointLight")

									if PointLight3 then
										PointLight3 = not Torch3.Particles.PointLight.Enabled
									end

									local PointLight4 = Torch4 and Torch4:FindFirstChild("Particles") and Torch4.Particles:FindFirstChild("PointLight")

									if PointLight4 then
										PointLight4 = not Torch4.Particles.PointLight.Enabled
									end

									local PointLight5 = Torch5 and Torch5:FindFirstChild("Particles") and Torch5.Particles:FindFirstChild("PointLight")

									if PointLight5 then
										PointLight5 = not Torch5.Particles.PointLight.Enabled
									end

									if v554 or not PointLight then
										if v551 or not PointLight2 then
											if v552 or not PointLight3 then
												if v550 or not PointLight4 then
													if v553 or not PointLight5 then
														v553 = true
													else
														v40(Torch5.CFrame)
														v550 = true
													end
												else
													v40(Torch4.CFrame)
													v552 = true
												end
											else
												v40(Torch3.CFrame)
												v551 = true
											end
										else
											v40(Torch2.CFrame)
											v554 = true
										end
									else
										v40(Torch1.CFrame)
									end
								else
									v40(CFrame.new(5152, 142, 912))
								end
							elseif v124("God\'s Chalice") then
								v136("God\'s Chalice")
								v40(CFrame.new(-5561, 314, -2663))
							else
								local s7 = "EliteBossVerify"

								v189()

								if v191("Diablo") then
									s7 = "Diablo"
								elseif v191("Deandre") then
									s7 = "Deandre"
								elseif v191("Urban") then
									s7 = "Urban"
								else
									task.spawn(function()
										v26("EliteHunter")
									end)
								end

								local v566 = v139({ s7 })

								if v566 and v566:FindFirstChild("HumanoidRootPart") then
									v40(v566.HumanoidRootPart.CFrame + getgenv().FarmPos)
									pcall(function()
										v106()
										v122()
										v158()
									end)
								elseif not v116("Deandre") and (not v116("Diablo") and (not v116("Urban") and getgenv().AutoTushitaHop)) then
									v108()
								end
							end
						else
							local Longma = Enemies:FindFirstChild("Longma")

							if Longma and Longma:FindFirstChild("HumanoidRootPart") then
								v40(Longma.HumanoidRootPart.CFrame + getgenv().FarmPos)
								pcall(function()
									v106()
									v122()
									v158()
								end)
							else
								v40(CFrame.new(-10218, 333, -9444))
							end
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Tushita Hop",
			Callback = function(p142)
				getgenv().AutoTushitaHop = p142
			end
		})
		Players:AddSection("Cake Prince + Dough King")

		local v568 = Players:AddParagraph({
			Title = "Stats : 0"
		})

		if LocalPlayer.UserId ~= 2764978820 then
			task.spawn(function()
				while task.wait(1) do
					if v116("Dough King") then
						v568:Set("Stats : Spawned | Dough King")
					elseif v116("Cake Prince") then
						v568:Set("Stats : Spawned | Cake Prince")
					else
						local CakePrinceSpawner = v26("CakePrinceSpawner", true)

						v568:Set("Stats : " .. string.gsub(tostring(CakePrinceSpawner), "%D", ""))
					end
				end
			end)
		end

		Players:AddToggle("Toggle", {
			Title = "Auto Cake Prince",
			Callback = function(p143)
				getgenv().AutoCakePrince = p143
				v415()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Dough King",
			Callback = function(p144)
				getgenv().AutoDoughKing = p144
				v419()
			end
		})
		Players:AddSection("Rip Indra")
		Players:AddToggle("Toggle", {
			Title = "Auto Active Button Haki Color",
			Callback = function(p145)
				getgenv().RipIndraLegendaryHaki = p145
				task.spawn(function()
					while getgenv().RipIndraLegendaryHaki do
						task.wait()

						local Character = LocalPlayer and LocalPlayer.Character

						if Character then
							Character = LocalPlayer.Character.PrimaryPart
						end

						if (Character.Position - Vector3.new(-5415, 314, -2212)).Magnitude >= 5 then
							if (Character.Position - Vector3.new(-4972, 336, -3720)).Magnitude >= 5 then
								if (Character.Position - Vector3.new(-5420, 1089, -2667)).Magnitude < 5 then
									v26("activateColor", "Winter Sky")
								end
							else
								v26("activateColor", "Snow White")
							end
						else
							v26("activateColor", "Pure Red")
						end
					end
				end)
				task.spawn(function()
					while getgenv().RipIndraLegendaryHaki do
						task.wait()

						if not (getgenv().AutoFarm_Level or (getgenv().AutoFarmBone or getgenv().AutoCakePrince)) then
							if v215() then
								v40(v215().CFrame)
							elseif not (v215() or getgenv().AutoRipIndra) then
								v40(CFrame.new(-5119, 315, -2964))
							end
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Rip Indra",
			Callback = function(p146)
				getgenv().AutoRipIndra = p146
				v405()
			end
		})
		Players:AddSection("Musketeer Hat")
		Players:AddToggle("Toggle", {
			Title = "Auto Musketeer Hat",
			Callback = function(p147)
				getgenv().AutoMusketeerHat = p147
				v323()
			end
		})
		Players:AddButton({
			Title = "Server HOP",
			Callback = function()
				v108()
			end
		})
	end

	if v21 or v22 then
		Players:AddSection("Fighting Style")
		Players:AddToggle("Toggle", {
			Title = "Auto Death Step",
			Callback = function(p148)
				getgenv().AutoDeathStep = p148
				task.spawn(function()
					local function v571()
						local huge = math.huge
						local v573 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v575

						if not Character then
							v791 = Enemies
							v792, v793, v794 = pairs(v791:GetChildren())

							while true do
								v794, v575 = v792(v793, v794)

								if v794 == nil then
									break
								end

								if (v575.Name == "Reborn Skeleton" or (v575.Name == "Living Zombie" or (v575.Name == "Demonic Soul" or (v575.Name == "Posessed Mummy" or v575.Name == "Water Fighter")))) and (Character and (v575 and (v575:FindFirstChild("HumanoidRootPart") and (Character.Position - v575.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v575.HumanoidRootPart.Position).Magnitude
									v573 = v575
								end
							end

							return v573
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v576 = Enemies
						local v577, v578, v579 = pairs(v576:GetChildren())

						while true do
							v579, v575 = v577(v578, v579)

							if v579 == nil then
								break
							end

							if (v575.Name == "Reborn Skeleton" or (v575.Name == "Living Zombie" or (v575.Name == "Demonic Soul" or (v575.Name == "Posessed Mummy" or v575.Name == "Water Fighter")))) and (Character and (v575 and (v575:FindFirstChild("HumanoidRootPart") and (Character.Position - v575.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v575.HumanoidRootPart.Position).Magnitude
								v573 = v575
							end
						end

						return v573
					end

					local n13 = 0
					local v581 = false

					while getgenv().AutoDeathStep do
						task.wait()

						if v124("Black Leg") then
							n13 = v134("Black Leg")
						end

						if 400 <= n13 and v22 then
							v26("TravelDressrosa")
						end

						if v581 then
							v26("BuyDeathStep")
						end

						if v124("Death Step") then
							v136("Death Step")
						elseif n13 >= 400 then
							local AwakenedIceAdmiral = Enemies:FindFirstChild("Awakened Ice Admiral")

							if v124("Library Key") then
								v136("Library Key")
								v40(CFrame.new(6373, 293, -6839))
								v581 = true
							elseif AwakenedIceAdmiral and AwakenedIceAdmiral:FindFirstChild("HumanoidRootPart") then
								v40(AwakenedIceAdmiral.HumanoidRootPart.CFrame + getgenv().FarmPos)
								pcall(function()
									v106()
									v122()
									v158()
								end)
							else
								v40(CFrame.new(6473, 297, -6944))
							end
						elseif v124("Black Leg") or n13 >= 400 then
							if v124("Black Leg") and n13 < 400 then
								v136("Black Leg")

								local v583 = v571()

								if v583 and v583:FindFirstChild("HumanoidRootPart") then
									v40(v583.HumanoidRootPart.CFrame + getgenv().FarmPos)
									pcall(function()
										v106()
										v122()
										v196(v583)
									end)
								elseif v22 then
									v40(CFrame.new(-9513, 164, 5786))
								else
									v40(CFrame.new(-3350, 282, -10527))
								end
							end
						else
							v26("BuyBlackLeg")
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Electric Claw <BETA>",
			Callback = function(p149)
				getgenv().AutoElectricClaw = p149
				task.spawn(function()
					local function v584()
						local huge = math.huge
						local v586 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v588

						if not Character then
							v805 = Enemies
							v806, v807, v808 = pairs(v805:GetChildren())

							while true do
								v808, v588 = v806(v807, v808)

								if v808 == nil then
									break
								end

								if (v588.Name == "Reborn Skeleton" or (v588.Name == "Living Zombie" or (v588.Name == "Demonic Soul" or (v588.Name == "Posessed Mummy" or v588.Name == "Water Fighter")))) and (Character and (v588 and (v588:FindFirstChild("HumanoidRootPart") and (Character.Position - v588.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v588.HumanoidRootPart.Position).Magnitude
									v586 = v588
								end
							end

							return v586
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v589 = Enemies
						local v590, v591, v592 = pairs(v589:GetChildren())

						while true do
							v592, v588 = v590(v591, v592)

							if v592 == nil then
								break
							end

							if (v588.Name == "Reborn Skeleton" or (v588.Name == "Living Zombie" or (v588.Name == "Demonic Soul" or (v588.Name == "Posessed Mummy" or v588.Name == "Water Fighter")))) and (Character and (v588 and (v588:FindFirstChild("HumanoidRootPart") and (Character.Position - v588.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v588.HumanoidRootPart.Position).Magnitude
								v586 = v588
							end
						end

						return v586
					end

					local n14 = 0
					local n15 = 0

					while getgenv().AutoElectricClaw do
						task.wait()

						if v124("Electro") then
							n14 = v134("Electro")
						elseif v124("Electric Claw") then
							n15 = v134("Electric Claw")
						end

						if n14 < 400 then
							if v124("Electro") then
								v136("Electro")
							else
								v26("BuyElectro")
							end
						elseif n15 < 600 then
							if v124("Electric Claw") then
								v136("Electric Claw")
							else
								v26("BuyElectricClaw")
							end
						end

						local v595 = v584()

						if v595 and v595:FindFirstChild("HumanoidRootPart") then
							v40(v595.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v196(v595)
							end)
						elseif v22 then
							v40(CFrame.new(-9513, 164, 5786))
						else
							v40(CFrame.new(-3350, 282, -10527))
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Sharkman Karate",
			Callback = function(p150)
				getgenv().AutoSharkmanKarate = p150
				task.spawn(function()
					local n16 = 0
					local n17 = 0

					task.spawn(function()
						while getgenv().AutoSharkmanKarate do
							task.wait()
							n17 = v26("BuySharkmanKarate", true)
						end
					end)

					local v598 = n17

					while getgenv().AutoSharkmanKarate do
						task.wait()

						if v124("Fishman Karate") then
							n16 = v134("Fishman Karate")
						elseif v124("Sharkman Karate") then
							v134("Sharkman Karate")
						end

						if v598 == 1 then
							v26("BuySharkmanKarate")
						elseif v124("Sharkman Karate") then
							v136("Sharkman Karate")

							local WaterFighter = Enemies:FindFirstChild("Water Fighter")

							if WaterFighter and WaterFighter:FindFirstChild("HumanoidRootPart") then
								v40(WaterFighter.HumanoidRootPart.CFrame + getgenv().FarmPos)
								pcall(function()
									v106()
									v122()
									v196(WaterFighter, true)
								end)
							else
								v59({
									CFrame.new(-3339, 290, -10412),
									CFrame.new(-3518, 290, -10419),
									CFrame.new(-3536, 290, -10607),
									CFrame.new(-3345, 280, -10667)
								}, "Water Fighter")
							end
						elseif v124("Water Key") and 400 <= n16 then
							v26("BuySharkmanKarate", true)
						elseif v124("Water Key") or 400 > n16 then
							if v124("Fishman Karate") or n16 >= 400 then
								if v124("Fishman Karate") and n16 < 400 then
									v136("Fishman Karate")

									local WaterFighter = Enemies:FindFirstChild("Water Fighter")

									if WaterFighter and WaterFighter:FindFirstChild("HumanoidRootPart") then
										v40(WaterFighter.HumanoidRootPart.CFrame + getgenv().FarmPos)
										pcall(function()
											v106()
											v122()
											v196(WaterFighter, true)
										end)
									else
										v59({
											CFrame.new(-3339, 290, -10412),
											CFrame.new(-3518, 290, -10419),
											CFrame.new(-3536, 290, -10607),
											CFrame.new(-3345, 280, -10667)
										}, "Water Fighter")
									end
								end
							else
								v26("BuyFishmanKarate")
							end
						else
							local WaterFighter = Enemies:FindFirstChild("Water Fighter")

							if WaterFighter and WaterFighter:FindFirstChild("HumanoidRootPart") then
								v40(WaterFighter.HumanoidRootPart.CFrame + getgenv().FarmPos)
								pcall(function()
									v106()
									v122()
									v158()
									v196(WaterFighter, true)
								end)
							else
								v59({
									CFrame.new(-3339, 290, -10412),
									CFrame.new(-3518, 290, -10419),
									CFrame.new(-3536, 290, -10607),
									CFrame.new(-3345, 280, -10667)
								}, "Water Fighter")
							end
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Dragon Talon",
			Callback = function(p151)
				getgenv().AutoDragonTalon = p151
				task.spawn(function()
					local n18 = 0
					local u603 = false

					local function v604()
						local huge = math.huge
						local v606 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v608

						if not Character then
							v827 = Enemies
							v828, v829, v830 = pairs(v827:GetChildren())

							while true do
								v830, v608 = v828(v829, v830)

								if v830 == nil then
									break
								end

								if (v608.Name == "Reborn Skeleton" or (v608.Name == "Living Zombie" or (v608.Name == "Demonic Soul" or (v608.Name == "Posessed Mummy" or v608.Name == "Water Fighter")))) and (Character and (v608 and (v608:FindFirstChild("HumanoidRootPart") and (Character.Position - v608.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v608.HumanoidRootPart.Position).Magnitude
									v606 = v608
								end
							end

							return v606
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v609 = Enemies
						local v610, v611, v612 = pairs(v609:GetChildren())

						while true do
							v612, v608 = v610(v611, v612)

							if v612 == nil then
								break
							end

							if (v608.Name == "Reborn Skeleton" or (v608.Name == "Living Zombie" or (v608.Name == "Demonic Soul" or (v608.Name == "Posessed Mummy" or v608.Name == "Water Fighter")))) and (Character and (v608 and (v608:FindFirstChild("HumanoidRootPart") and (Character.Position - v608.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v608.HumanoidRootPart.Position).Magnitude
								v606 = v608
							end
						end

						return v606
					end

					task.spawn(function()
						while getgenv().AutoDragonTalon do
							task.wait()

							if v124("Fire Essence") then
								v26("BuyDragonTalon", true)
								u603 = true
							else
								v26("Bones", "Buy", 1, 1)
							end
						end
					end)

					local v613 = u603

					while getgenv().AutoDragonTalon do
						task.wait()

						if v124("Dragon Claw") then
							n18 = v134("Dragon Claw")
						end

						if 400 <= n18 and v21 then
							v26("TravelZou")
						end

						if v613 and 400 <= n18 then
							v26("BuyDragonTalon")
						elseif (v124("Dragon Claw") or n18 >= 400) and (v613 or v124("Dragon Claw")) then
							if v124("Dragon Claw") and n18 < 400 or not v613 and v124("Dragon Claw") then
								v136("Dragon Claw")

								local v614 = v604()

								if v614 and v614:FindFirstChild("HumanoidRootPart") then
									v40(v614.HumanoidRootPart.CFrame + getgenv().FarmPos)
									pcall(function()
										v106()
										v122()
										v196(v614)
									end)
								elseif v22 then
									v40(CFrame.new(-9513, 164, 5786))
								else
									v40(CFrame.new(-3350, 282, -10527))
								end
							end
						else
							v26("BlackbeardReward", "DragonClaw", "1")
							v26("BlackbeardReward", "DragonClaw", "2")
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Superhuman",
			Callback = function(p152)
				getgenv().AutoSuperhuman = p152
				task.spawn(function()
					local function v615()
						local huge = math.huge
						local v617 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v619

						if not Character then
							v839 = Enemies
							v840, v841, v842 = pairs(v839:GetChildren())

							while true do
								v842, v619 = v840(v841, v842)

								if v842 == nil then
									break
								end

								if (v619.Name == "Reborn Skeleton" or (v619.Name == "Living Zombie" or (v619.Name == "Demonic Soul" or (v619.Name == "Posessed Mummy" or v619.Name == "Water Fighter")))) and (Character and (v619 and (v619:FindFirstChild("HumanoidRootPart") and (Character.Position - v619.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v619.HumanoidRootPart.Position).Magnitude
									v617 = v619
								end
							end

							return v617
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v620 = Enemies
						local v621, v622, v623 = pairs(v620:GetChildren())

						while true do
							v623, v619 = v621(v622, v623)

							if v623 == nil then
								break
							end

							if (v619.Name == "Reborn Skeleton" or (v619.Name == "Living Zombie" or (v619.Name == "Demonic Soul" or (v619.Name == "Posessed Mummy" or v619.Name == "Water Fighter")))) and (Character and (v619 and (v619:FindFirstChild("HumanoidRootPart") and (Character.Position - v619.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v619.HumanoidRootPart.Position).Magnitude
								v617 = v619
							end
						end

						return v617
					end

					local n19 = 0
					local n20 = 0
					local n21 = 0
					local n22 = 0
					local n23 = 0

					while getgenv().AutoSuperhuman do
						task.wait()

						if v124("Black Leg") then
							n19 = v134("Black Leg")
						elseif v124("Electro") then
							n20 = v134("Electro")
						elseif v124("Fishman Karate") then
							n21 = v134("Fishman Karate")
						elseif v124("Dragon Claw") then
							n22 = v134("Dragon Claw")
						elseif v124("Superhuman") then
							n23 = v134("Superhuman")
						end

						if n19 < 300 then
							if v124("Black Leg") then
								v136("Black Leg")
							else
								v26("BuyBlackLeg")
							end
						elseif n20 < 300 then
							if v124("Electro") then
								v136("Electro")
							else
								v26("BuyElectro")
							end
						elseif n21 < 300 then
							if v124("Fishman Karate") then
								v136("Fishman Karate")
							else
								v26("BuyFishmanKarate")
							end
						elseif n22 < 300 then
							if v124("Dragon Claw") then
								v136("Dragon Claw")
							else
								v26("BlackbeardReward", "DragonClaw", "1")
								v26("BlackbeardReward", "DragonClaw", "2")
							end
						elseif n23 < 600 then
							if v124("Superhuman") then
								v136("Superhuman")
							else
								v26("BuySuperhuman")
							end
						end

						local v629 = v615()

						if v629 and v629:FindFirstChild("HumanoidRootPart") then
							v40(v629.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v196(v629)
							end)
						elseif v22 then
							v40(CFrame.new(-9513, 164, 5786))
						else
							v40(CFrame.new(-3350, 282, -10527))
						end
					end
				end)
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto God Human",
			Callback = function(p153)
				getgenv().AutoGodHuman = p153
				task.spawn(function()
					local function v630()
						local huge = math.huge
						local v632 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v634

						if not Character then
							v855 = Enemies
							v856, v857, v858 = pairs(v855:GetChildren())

							while true do
								v858, v634 = v856(v857, v858)

								if v858 == nil then
									break
								end

								if (v634.Name == "Reborn Skeleton" or (v634.Name == "Living Zombie" or (v634.Name == "Demonic Soul" or v634.Name == "Posessed Mummy"))) and (Character and (v634 and (v634:FindFirstChild("HumanoidRootPart") and (Character.Position - v634.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v634.HumanoidRootPart.Position).Magnitude
									v632 = v634
								end
							end

							return v632
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v635 = Enemies
						local v636, v637, v638 = pairs(v635:GetChildren())

						while true do
							v638, v634 = v636(v637, v638)

							if v638 == nil then
								break
							end

							if (v634.Name == "Reborn Skeleton" or (v634.Name == "Living Zombie" or (v634.Name == "Demonic Soul" or v634.Name == "Posessed Mummy"))) and (Character and (v634 and (v634:FindFirstChild("HumanoidRootPart") and (Character.Position - v634.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v634.HumanoidRootPart.Position).Magnitude
								v632 = v634
							end
						end

						return v632
					end

					local n24 = 0
					local n25 = 0
					local n26 = 0
					local n27 = 0
					local n28 = 0
					local n29 = 0
					local n30 = 0
					local n31 = 0
					local n32 = 0

					while getgenv().AutoGodHuman do
						task.wait()

						if v21 then
							v26("TravelZou")
						end

						if v124("Black Leg") then
							n28 = v134("Black Leg")
						elseif v124("Electro") then
							n29 = v134("Electro")
						elseif v124("Fishman Karate") then
							n30 = v134("Fishman Karate")
						elseif v124("Dragon Claw") then
							n31 = v134("Dragon Claw")
						elseif v124("Superhuman") then
							n32 = v134("Superhuman")
						elseif v124("Death Step") then
							n24 = v134("Death Step")
						elseif v124("Electric Claw") then
							n25 = v134("Electric Claw")
						elseif v124("Sharkman Karate") then
							n26 = v134("Sharkman Karate")
						elseif v124("Dragon Talon") then
							n27 = v134("Dragon Talon")
						elseif v124("Godhuman") then
							v134("Godhuman")
						end

						if n28 < 400 then
							if v124("Black Leg") then
								v136("Black Leg")
							else
								v170("BuyBlackLeg")
							end
						elseif n29 < 400 then
							if v124("Electro") then
								v136("Electro")
							else
								v170("BuyElectro")
							end
						elseif n30 < 400 then
							if v124("Fishman Karate") then
								v136("Fishman Karate")
							else
								v170("BuyFishmanKarate")
							end
						elseif n31 < 400 then
							if v124("Dragon Claw") then
								v136("Dragon Claw")
							else
								v26("BlackbeardReward", "DragonClaw", "1")
								v26("BlackbeardReward", "DragonClaw", "2")
							end
						elseif n32 < 400 then
							if v124("Superhuman") then
								v136("Superhuman")
							else
								v170("BuySuperhuman")
							end
						elseif n24 < 400 then
							if v124("Death Step") then
								v136("Death Step")
							else
								v170("BuyDeathStep")
							end
						elseif n25 < 400 then
							if v124("Electric Claw") then
								v136("Electric Claw")
							else
								v170("BuyElectricClaw")
							end
						elseif n26 < 400 then
							if v124("Sharkman Karate") then
								v136("Sharkman Karate")
							else
								v170("BuySharkmanKarate")
							end
						elseif n27 < 400 then
							if v124("Dragon Talon") then
								v136("Dragon Talon")
							else
								v170("BuyDragonTalon")
							end
						elseif v124("Godhuman") then
							v136("Godhuman")
						else
							v170("BuyGodhuman")
						end

						local v648 = v630()

						if v648 and v648:FindFirstChild("HumanoidRootPart") then
							v40(v648.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v196(v648)
							end)
						else
							v40(CFrame.new(-9513, 164, 5786))
						end
					end
				end)
			end
		})
	end

	if v22 then
		Players:AddSection("Auto Mastery All")
		Players:AddSlider("Slider", {
			Title = "Select Mastery",
			Min = 100,
			Max = 600,
			Default = 600,
			Rounding = 10,
			Callback = function(p154)
				getgenv().AutoMasteryValue = p154
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Mastery All Fighting Style",
			Callback = function(p155)
				getgenv().AutoMasteryFightingStyle = p155
				task.spawn(function()
					local function v649()
						local huge = math.huge
						local v651 = nil
						local Character = LocalPlayer and LocalPlayer.Character
						local v653

						if not Character then
							v876 = Enemies
							v877, v878, v879 = pairs(v876:GetChildren())

							while true do
								v879, v653 = v877(v878, v879)

								if v879 == nil then
									break
								end

								if (v653.Name == "Reborn Skeleton" or (v653.Name == "Living Zombie" or (v653.Name == "Demonic Soul" or v653.Name == "Posessed Mummy"))) and (Character and (v653 and (v653:FindFirstChild("HumanoidRootPart") and (Character.Position - v653.HumanoidRootPart.Position).Magnitude <= huge))) then
									huge = (Character.Position - v653.HumanoidRootPart.Position).Magnitude
									v651 = v653
								end
							end

							return v651
						end

						Character = LocalPlayer.Character.PrimaryPart

						local v654 = Enemies
						local v655, v656, v657 = pairs(v654:GetChildren())

						while true do
							v657, v653 = v655(v656, v657)

							if v657 == nil then
								break
							end

							if (v653.Name == "Reborn Skeleton" or (v653.Name == "Living Zombie" or (v653.Name == "Demonic Soul" or v653.Name == "Posessed Mummy"))) and (Character and (v653 and (v653:FindFirstChild("HumanoidRootPart") and (Character.Position - v653.HumanoidRootPart.Position).Magnitude <= huge))) then
								huge = (Character.Position - v653.HumanoidRootPart.Position).Magnitude
								v651 = v653
							end
						end

						return v651
					end

					local n33 = 0
					local n34 = 0
					local n35 = 0
					local n36 = 0
					local n37 = 0
					local n38 = 0
					local n39 = 0
					local n40 = 0
					local n41 = 0
					local n42 = 0
					local n43 = 0

					while getgenv().AutoMasteryFightingStyle do
						task.wait()

						local AutoMasteryValue = getgenv().AutoMasteryValue

						if v124("Black Leg") then
							n37 = v134("Black Leg")
						elseif v124("Electro") then
							n38 = v134("Electro")
						elseif v124("Fishman Karate") then
							n39 = v134("Fishman Karate")
						elseif v124("Dragon Claw") then
							n40 = v134("Dragon Claw")
						elseif v124("Superhuman") then
							n41 = v134("Superhuman")
						elseif v124("Death Step") then
							n42 = v134("Death Step")
						elseif v124("Electric Claw") then
							n43 = v134("Electric Claw")
						elseif v124("Sharkman Karate") then
							n33 = v134("Sharkman Karate")
						elseif v124("Dragon Talon") then
							n34 = v134("Dragon Talon")
						elseif v124("Godhuman") then
							n35 = v134("Godhuman")
						elseif v124("Sanguine Art") then
							n36 = v134("Sanguine Art")
						end

						if n37 < AutoMasteryValue then
							if v124("Black Leg") then
								v136("Black Leg")
							else
								v170("BuyBlackLeg")
							end
						elseif n38 < AutoMasteryValue then
							if v124("Electro") then
								v136("Electro")
							else
								v170("BuyElectro")
							end
						elseif n39 < AutoMasteryValue then
							if v124("Fishman Karate") then
								v136("Fishman Karate")
							else
								v170("BuyFishmanKarate")
							end
						elseif n40 < AutoMasteryValue then
							if v124("Dragon Claw") then
								v136("Dragon Claw")
							else
								v26("BlackbeardReward", "DragonClaw", "1")
								v26("BlackbeardReward", "DragonClaw", "2")
							end
						elseif n41 < AutoMasteryValue then
							if v124("Superhuman") then
								v136("Superhuman")
							else
								v170("BuySuperhuman")
							end
						elseif n42 < AutoMasteryValue then
							if v124("Death Step") then
								v136("Death Step")
							else
								v170("BuyDeathStep")
							end
						elseif n43 < AutoMasteryValue then
							if v124("Electric Claw") then
								v136("Electric Claw")
							else
								v170("BuyElectricClaw")
							end
						elseif n33 < AutoMasteryValue then
							if v124("Sharkman Karate") then
								v136("Sharkman Karate")
							else
								v170("BuySharkmanKarate")
							end
						elseif n34 < AutoMasteryValue then
							if v124("Dragon Talon") then
								v136("Dragon Talon")
							else
								v170("BuyDragonTalon")
							end
						elseif n35 < AutoMasteryValue then
							if v124("Godhuman") then
								v136("Godhuman")
							else
								v170("BuyGodhuman")
							end
						elseif n36 < AutoMasteryValue then
							if v124("Sanguine Art") then
								v136("Sanguine Art")
							else
								v170("BuySanguineArt")
							end
						end

						local v671 = v649()

						if v671 and v671:FindFirstChild("HumanoidRootPart") then
							v40(v671.HumanoidRootPart.CFrame + getgenv().FarmPos)
							pcall(function()
								v106()
								v122()
								v196(v671)
							end)
						else
							v40(CFrame.new(-9513, 164, 5786))
						end
					end
				end)
			end
		})
	end

	Players:AddSection("Haki Color")
	Players:AddToggle("Toggle", {
		Title = "Auto Buy Haki Color",
		Callback = function(p156)
			getgenv().AutoBuyHakiColor = p156
			task.spawn(function()
				while getgenv().AutoBuyHakiColor do
					task.wait(0.5)
					pcall(function()
						v26("ColorsDealer", "1")
						v26("ColorsDealer", "2")
					end)
				end
			end)
		end
	})

	if v22 then
		Players:AddToggle("Toggle", {
			Title = "Auto Rainbow Haki",
			Callback = function(p157)
				getgenv().AutoRainbowHaki = p157
				v337()
			end
		})
		Players:AddToggle("Toggle", {
			Title = "Auto Rainbow Haki HOP",
			Callback = function(p158)
				getgenv().RainbowHakiHop = p158
			end
		})
	end

	v520:AddSection("Teleport to Sea")
	v520:AddButton({
		Title = "Teleport to Sea 1",
		Callback = function()
			v26("TravelMain")
		end
	})
	v520:AddButton({
		Title = "Teleport to Sea 2",
		Callback = function()
			v26("TravelDressrosa")
		end
	})
	v520:AddButton({
		Title = "Teleport to Sea 3",
		Callback = function()
			v26("TravelZou")
		end
	})
	v520:AddSection("Islands")
	v520:AddDropdown("Dropdown", {
		Title = "Select Island",
		Values = v20 and {
			"WindMill",
			"Marine",
			"Middle Town",
			"Jungle",
			"Pirate Village",
			"Desert",
			"Snow Island",
			"MarineFord",
			"Colosseum",
			"Sky Island 1",
			"Sky Island 2",
			"Sky Island 3",
			"Prison",
			"Magma Village",
			"Under Water Island",
			"Fountain City"
		} or (v21 and {
			"The Cafe",
			"Frist Spot",
			"Dark Area",
			"Flamingo Mansion",
			"Flamingo Room",
			"Green Zone",
			"Zombie Island",
			"Two Snow Mountain",
			"Punk Hazard",
			"Cursed Ship",
			"Ice Castle",
			"Forgotten Island",
			"Ussop Island"
		} or (v22 and {
			"Mansion",
			"Port Town",
			"Great Tree",
			"Castle On The Sea",
			"Hydra Island",
			"Floating Turtle",
			"Haunted Castle",
			"Ice Cream Island",
			"Peanut Island",
			"Cake Island",
			"Candy Cane Island",
			"Tiki Outpost"
		} or {})),
		Callback = function(p159)
			getgenv().TeleportIslandSelect = p159
		end
	})
	v520:AddToggle("Toggle", {
		Title = "Teleport To Island",
		Callback = function(p160)
			getgenv().TeleportToIsland = p160
			task.spawn(function()
				while getgenv().TeleportToIsland do
					task.wait()

					local TeleportIslandSelect = getgenv().TeleportIslandSelect

					if v20 then
						if TeleportIslandSelect == "Middle Town" then
							v40(CFrame.new(-688, 15, 1585))
						elseif TeleportIslandSelect == "MarineFord" then
							v40(CFrame.new(-4810, 21, 4359))
						elseif TeleportIslandSelect == "Marine" then
							v40(CFrame.new(-2728, 25, 2056))
						elseif TeleportIslandSelect == "WindMill" then
							v40(CFrame.new(889, 17, 1434))
						elseif TeleportIslandSelect == "Desert" then
							v40(CFrame.new())
						elseif TeleportIslandSelect == "Snow Island" then
							v40(CFrame.new(1298, 87, -1344))
						elseif TeleportIslandSelect == "Pirate Village" then
							v40(CFrame.new(-1173, 45, 3837))
						elseif TeleportIslandSelect == "Jungle" then
							v40(CFrame.new(-1614, 37, 146))
						elseif TeleportIslandSelect == "Prison" then
							v40(CFrame.new(4870, 6, 736))
						elseif TeleportIslandSelect == "Under Water Island" then
							v40(CFrame.new(61164, 5, 1820))
						elseif TeleportIslandSelect == "Colosseum" then
							v40(CFrame.new(-1535, 7, -3014))
						elseif TeleportIslandSelect == "Magma Village" then
							v40(CFrame.new(-5290, 9, 8349))
						elseif TeleportIslandSelect == "Sky Island 1" then
							v40(CFrame.new(-4814, 718, -2551))
						elseif TeleportIslandSelect == "Sky Island 2" then
							v40(CFrame.new(-4652, 873, -1754))
						elseif TeleportIslandSelect == "Sky Island 3" then
							v40(CFrame.new(-7895, 5547, -380))
						end
					elseif v21 then
						if TeleportIslandSelect == "The Cafe" then
							v40(CFrame.new(-382, 73, 290))
						elseif TeleportIslandSelect == "Frist Spot" then
							v40(CFrame.new(-11, 29, 2771))
						elseif TeleportIslandSelect == "Dark Area" then
							v40(CFrame.new(3494, 13, -3259))
						elseif TeleportIslandSelect == "Flamingo Mansion" then
							v40(CFrame.new(-317, 331, 597))
						elseif TeleportIslandSelect == "Flamingo Room" then
							v40(CFrame.new(2285, 15, 905))
						elseif TeleportIslandSelect == "Green Zone" then
							v40(CFrame.new(-2258, 73, -2696))
						elseif TeleportIslandSelect == "Zombie Island" then
							v40(CFrame.new(-5552, 194, -776))
						elseif TeleportIslandSelect == "Two Snow Mountain" then
							v40(CFrame.new(752, 408, -5277))
						elseif TeleportIslandSelect == "Punk Hazard" then
							v40(CFrame.new(-5897, 18, -5096))
						elseif TeleportIslandSelect == "Cursed Ship" then
							v40(CFrame.new(919, 125, 32869))
						elseif TeleportIslandSelect == "Ice Castle" then
							v40(CFrame.new(5505, 40, -6178))
						elseif TeleportIslandSelect == "Forgotten Island" then
							v40(CFrame.new(-3050, 240, -10178))
						elseif TeleportIslandSelect == "Ussop Island" then
							v40(CFrame.new(4816, 8, 2863))
						end
					elseif v22 then
						if TeleportIslandSelect == "Mansion" then
							v40(CFrame.new(-12471, 374, -7551))
						elseif TeleportIslandSelect == "Port Town" then
							v40(CFrame.new(-334, 7, 5300))
						elseif TeleportIslandSelect == "Castle On The Sea" then
							v40(CFrame.new(-5073, 315, -3153))
						elseif TeleportIslandSelect == "Hydra Island" then
							v40(CFrame.new(5756, 610, -282))
						elseif TeleportIslandSelect == "Great Tree" then
							v40(CFrame.new(2681, 1682, -7190))
						elseif TeleportIslandSelect == "Floating Turtle" then
							v40(CFrame.new(-12528, 332, -8658))
						elseif TeleportIslandSelect == "Haunted Castle" then
							v40(CFrame.new(-9517, 142, 5528))
						elseif TeleportIslandSelect == "Ice Cream Island" then
							v40(CFrame.new(-902, 79, -10988))
						elseif TeleportIslandSelect == "Peanut Island" then
							v40(CFrame.new(-2062, 50, -10232))
						elseif TeleportIslandSelect == "Cake Island" then
							v40(CFrame.new(-1897, 14, -11576))
						elseif TeleportIslandSelect == "Candy Cane Island" then
							v40(CFrame.new(-1038, 10, -14076))
						elseif TeleportIslandSelect == "Tiki Outpost" then
							v40(CFrame.new(-16224, 9, 439))
						end
					end
				end
			end)
		end
	})

	if v22 then
		v520:AddSection("Race V4")
		v520:AddButton({
			Title = "Teleport To Temple of Time",
			function()
				for _ = 1, 5 do
					task.wait()
					LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(28286, 14897, 103))
				end
			end
		})
	end

	UIAspectRatioConstraint:AddSection("Configs")
	UIAspectRatioConstraint:AddSlider("Slider", {
		Title = "Farm Distance",
		Min = 5,
		Max = 50,
		Default = 20,
		Rounding = 1,
		Callback = function(p161)
			getgenv().FarmPos = Vector3.new(0, p161 or 15, p161 or 10)
			getgenv().FarmDistance = p161
		end
	})
	UIAspectRatioConstraint:AddSlider("Slider", {
		Title = "Tween Speed",
		Min = 50,
		Max = 300,
		Default = 170,
		Rounding = 5,
		Callback = function(p162)
			getgenv().TweenSpeed = p162
		end
	})
	UIAspectRatioConstraint:AddSlider("Slider", {
		Title = "Bring Mobs Distance",
		Min = 50,
		Max = 500,
		Default = 250,
		Rounding = 10,
		Callback = function(p163)
			getgenv().BringMobsDistance = p163 or 250
		end
	})
	UIAspectRatioConstraint:AddSlider("Slider", {
		Title = "Auto Click Delay",
		Min = 0.01,
		Max = 1,
		Default = 0.18,
		Rounding = 0.01,
		Callback = function(p164)
			getgenv().AutoClickDelay = p164
		end
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Fast Attack",
		Callback = function(p165)
			getgenv().FastAttack = p165
			task.spawn(v104)
		end,
		true
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Increase Attack Distance",
		Callback = function(p166)
			getgenv().AttackDistance = p166
			task.spawn(v103)
		end,
		true
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Auto Click",
		Callback = function(p167)
			getgenv().AutoClick = p167
		end,
		true
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Bring Mobs",
		Callback = function(p168)
			getgenv().BringMobs = p168
		end,
		true
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Auto Haki",
		Callback = function(p169)
			getgenv().AutoHaki = p169
		end,
		true
	})
	UIAspectRatioConstraint:AddSection("Codes")
	UIAspectRatioConstraint:AddButton({
		Title = "Redeem all Codes",
		Callback = function()
			for _, v in pairs({
				"NEWTROLL",
				"KITT_RESET",
				"Sub2Fer999",
				"Magicbus",
				"kittgaming",
				"SECRET_ADMIN",
				"EXP_5B",
				"CONTROL",
				"UPDATE11",
				"XMASEXP",
				"1BILLION",
				"ShutDownFix2",
				"UPD14",
				"STRAWHATMAINE",
				"TantaiGaming",
				"Colosseum",
				"Axiore",
				"Sub2Daigrock",
				"Sky Island 3",
				"Sub2OfficialNoobie",
				"SUB2NOOBMASTER123",
				"THEGREATACE",
				"Fountain City",
				"BIGNEWS",
				"FUDD10",
				"SUB2GAMERROBOT_EXP1",
				"UPD15",
				"2BILLION",
				"UPD16",
				"3BVISITS",
				"Starcodeheo",
				"Bluxxy",
				"DRAGONABUSE",
				"Sub2CaptainMaui",
				"DEVSCOOKING",
				"Enyu_is_Pro",
				"JCWK",
				"Starcodeheo",
				"Bluxxy",
				"fudd10_v2",
				"SUB2GAMERROBOT_EXP1",
				"Sub2NoobMaster123",
				"Sub2UncleKizaru",
				"Sub2Daigrock",
				"Axiore",
				"TantaiGaming",
				"StrawHatMaine"
			}) do
				task.spawn(function()
					ReplicatedStorage.Remotes.Redeem:InvokeServer(v)
				end)
			end
		end
	})
	UIAspectRatioConstraint:AddSection("Team")
	UIAspectRatioConstraint:AddButton({
		Title = "Join Pirates Team",
		function()
			v26("SetTeam", "Pirates")
		end
	})
	UIAspectRatioConstraint:AddButton({
		Title = "Join Marines Team",
		function()
			v26("SetTeam", "Marines")
		end
	})
	UIAspectRatioConstraint:AddSection("Menu")
	UIAspectRatioConstraint:AddButton({
		Title = "Devil Fruit Shop",
		Callback = function()
			v26("GetFruits")
			LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
		end
	})
	UIAspectRatioConstraint:AddButton({
		Title = "Titles",
		Callback = function()
			v26("getTitles")
			LocalPlayer.PlayerGui.Main.Titles.Visible = true
		end
	})
	UIAspectRatioConstraint:AddButton({
		Title = "Haki Color",
		Callback = function()
			LocalPlayer.PlayerGui.Main.Colors.Visible = true
		end
	})
	UIAspectRatioConstraint:AddSection("More FPS")
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Remove Damage",
		Callback = function(p170)
			ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = not p170
		end,
		true,
		"Misc/RemoveDamage"
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Remove Notifications",
		Callback = function(p171)
			LocalPlayer.PlayerGui.Notifications.Enabled = not p171
		end,
		"Misc/RemoveNotifications"
	})
	UIAspectRatioConstraint:AddSection("Others")
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Walk On Water",
		Default = true,
		Callback = function(p172)
			getgenv().WalkOnWater = p172
			task.spawn(function()
				local Map = workspace:WaitForChild("Map", 9000000000)

				while getgenv().WalkOnWater do
					task.wait(0.1)
					Map:WaitForChild("WaterBase-Plane", 9000000000).Size = Vector3.new(1000, 113, 1000)
				end

				Map:WaitForChild("WaterBase-Plane", 9000000000).Size = Vector3.new(1000, 80, 1000)
			end)
		end
	})
	UIAspectRatioConstraint:AddToggle("Toggle", {
		Title = "Anti AFK",
		Default = true,
		Callback = function(p173)
			getgenv().AntiAFK = p173
			task.spawn(function()
				while getgenv().AntiAFK do
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))
					task.wait(600)
				end
			end)
		end
	})
	v522:AddSection("Frags")
	v522:AddButton({
		Title = "Race Rerol",
		function()
			v26("BlackbeardReward", "Reroll", "1")
			v26("BlackbeardReward", "Reroll", "2")
		end
	})
	v522:AddButton({
		Title = "Reset Stats",
		function()
			v26("BlackbeardReward", "Refund", "1")
			v26("BlackbeardReward", "Refund", "2")
		end
	})
	v522:AddSection("Fighting Style")
	v522:AddButton({
		Title = "Buy Black Leg",
		function()
			v26("BuyBlackLeg")
		end
	})
	v522:AddButton({
		Title = "Buy Electro",
		function()
			v26("BuyElectro")
		end
	})
	v522:AddButton({
		Title = "Buy Fishman Karate",
		function()
			v26("BuyFishmanKarate")
		end
	})
	v522:AddButton({
		Title = "Buy Dragon Claw",
		function()
			v26("BlackbeardReward", "DragonClaw", "1")
			v26("BlackbeardReward", "DragonClaw", "2")
		end
	})
	v522:AddButton({
		Title = "Buy Superhuman",
		function()
			v26("BuySuperhuman")
		end
	})
	v522:AddButton({
		Title = "Buy Death Step",
		function()
			v26("BuyDeathStep")
		end
	})
	v522:AddButton({
		Title = "Buy Sharkman Karate",
		function()
			v26("BuySharkmanKarate")
		end
	})
	v522:AddButton({
		Title = "Buy Electric Claw",
		function()
			v26("BuyElectricClaw")
		end
	})
	v522:AddButton({
		Title = "Buy Dragon Talon",
		function()
			v26("BuyDragonTalon")
		end
	})
	v522:AddButton({
		Title = "Buy GodHuman",
		function()
			v26("BuyGodhuman")
		end
	})
	v522:AddButton({
		Title = "Buy Sanguine Art",
		function()
			v26("BuySanguineArt")
		end
	})
	v522:AddSection("Ability Teacher")
	v522:AddButton({
		Title = "Buy Geppo",
		function()
			v26("BuyHaki", "Geppo")
		end
	})
	v522:AddButton({
		Title = "Buy Buso",
		function()
			v26("BuyHaki", "Buso")
		end
	})
	v522:AddButton({
		Title = "Buy Soru",
		function()
			v26("BuyHaki", "Soru")
		end
	})
	v522:AddSection("Sword")
	v522:AddButton({
		Title = "Buy Katana",
		function()
			v26("BuyItem", "Katana")
		end
	})
	v522:AddButton({
		Title = "Buy Cutlass",
		function()
			v26("BuyItem", "Cutlass")
		end
	})
	v522:AddButton({
		Title = "Buy Dual Katana",
		function()
			v26("BuyItem", "Dual Katana")
		end
	})
	v522:AddButton({
		Title = "Buy Iron Mace",
		function()
			v26("BuyItem", "Iron Mace")
		end
	})
	v522:AddButton({
		Title = "Buy Triple Katana",
		function()
			v26("BuyItem", "Triple Katana")
		end
	})
	v522:AddButton({
		Title = "Buy Pipe",
		function()
			v26("BuyItem", "Pipe")
		end
	})
	v522:AddButton({
		Title = "Buy Dual-Headed Blade",
		function()
			v26("BuyItem", "Dual-Headed Blade")
		end
	})
	v522:AddButton({
		Title = "Buy Soul Cane",
		function()
			v26("BuyItem", "Soul Cane")
		end
	})
	v522:AddButton({
		Title = "Buy Bisento",
		function()
			v26("BuyItem", "Bisento")
		end
	})
	v522:AddSection("Gun")
	v522:AddButton({
		Title = "Buy Musket",
		function()
			v26("BuyItem", "Musket")
		end
	})
	v522:AddButton({
		Title = "Buy Slingshot",
		function()
			v26("BuyItem", "Slingshot")
		end
	})
	v522:AddButton({
		Title = "Buy Flintlock",
		function()
			v26("BuyItem", "Flintlock")
		end
	})
	v522:AddButton({
		Title = "Buy Refined Slingshot",
		function()
			v26("BuyItem", "Refined Slingshot")
		end
	})
	v522:AddButton({
		Title = "Buy Refined Flintlock",
		function()
			v26("BuyItem", "Refined Flintlock")
		end
	})
	v522:AddButton({
		Title = "Buy Cannon",
		function()
			v26("BuyItem", "Cannon")
		end
	})
	v522:AddButton({
		Title = "Buy Kabucha",
		function()
			v26("BlackbeardReward", "Slingshot", "1")
			v26("BlackbeardReward", "Slingshot", "2")
		end
	})
	v522:AddSection("Accessories")
	v522:AddButton({
		Title = "Buy Black Cape",
		function()
			v26("BuyItem", "Black Cape")
		end
	})
	v522:AddButton({
		Title = "Buy Swordsman Hat",
		function()
			v26("BuyItem", "Swordsman Hat")
		end
	})
	v522:AddButton({
		Title = "Buy Tomoe Ring",
		function()
			v26("BuyItem", "Tomoe Ring")
		end
	})
	v522:AddSection("Race")
	v522:AddButton({
		Title = "Ghoul Race",
		function()
			v26("Ectoplasm", "Change", 4)
		end
	})
	v522:AddButton({
		Title = "Cyborg Race",
		function()
			v26("CyborgTrainer", "Buy")
		end
	})

	local u676 = false
	local n44 = 15

	v521:AddSection("Notifications")
	v521:AddSlider("Slider", {
		Title = "Nofication Time",
		Max = 120,
		Min = 5,
		Rounding = 1,
		Default = 15,
		Callback = function(p174)
			n44 = p174
		end
	})
	v521:AddToggle("Toggle", {
		Title = "Fruit spawn",
		Callback = function(p175)
			u676 = p175
		end
	})
	v521:AddSection("ESP")

	if v21 then
		v521:AddToggle("Toggle", {
			Title = "ESP Flowers",
			Callback = function(p176)
				getgenv().EspFlowers = p176
				v81()
			end
		})
	end

	v521:AddToggle("Toggle", {
		Title = "ESP Players",
		Callback = function(p177)
			getgenv().EspPlayer = p177
			v76()
		end
	})
	v521:AddToggle("Toggle", {
		Title = "ESP Fruits",
		Callback = function(p178)
			getgenv().EspFruits = p178
			v86()
		end
	})
	v521:AddToggle("Toggle", {
		Title = "ESP Chests",
		Callback = function(p179)
			getgenv().EspChests = p179
			v98()
		end
	})
	v521:AddToggle("Toggle", {
		Title = "ESP Islands",
		Callback = function(p180)
			getgenv().EspIslands = p180
			v91()
		end
	})
end)
