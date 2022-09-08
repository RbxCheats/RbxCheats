-- PLG v3.2 made by Jmuse <3
-- Enjoy the un obf script you skids 
-- https://rbxcheats.github.io/RbxCheats/






-- Message bar message
LP = game:GetService("Players").LocalPlayer

hud = LP.PlayerGui.Home.hud
MsgPX = hud.AddedGui.tooltip:Clone()
MsgPX.TextLabel.Visible = true
MsgPX.Visible = true
MsgPX.Size = UDim2.new(0,445,0,34)
MsgPX.Parent = hud
MsgPX.Name = "MsgPX"

function StaminaMsg(Args,t)
	MsgPX.ImageLabel.ImageTransparency = 0.8
	MsgPX.BackgroundTransparency = 0.2
	MsgPX.TextLabel.TextTransparency = 0
	for i = 1,string.len(Args) do
		MsgPX.TextLabel.Text = string.sub(Args,1,i)
		wait(0.03)
	end
	if t ~= nil then
		wait(t)
		for i = 1,33 do wait()
			MsgPX.ImageLabel.ImageTransparency = 1/33*i+0.8
			MsgPX.BackgroundTransparency = 1/33*i+0.2
			MsgPX.TextLabel.TextTransparency = 1/33*i
		end
	end
end

-- Weapon ESP/Drops
_G.ESP_ENABLED = false

local function CreateESP(v)
	local WeaponESP = Instance.new("BillboardGui")
	local ESPName = Instance.new("TextLabel")

	WeaponESP.Name = "WeaponESP"
	WeaponESP.Parent = v
	WeaponESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	WeaponESP.Active = true
	WeaponESP.AlwaysOnTop = true
	WeaponESP.LightInfluence = 1.000
	WeaponESP.Size = UDim2.new(0, 200, 0, 50)
	WeaponESP.Enabled = _G.ESP_ENABLED

	ESPName.Name = "ESPName"
	ESPName.Parent = WeaponESP
	ESPName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ESPName.BackgroundTransparency = 1.000
	ESPName.Size = UDim2.new(0, 200, 0, 50)
	ESPName.Font = Enum.Font.ArialBold
	ESPName.Text = v.Name
	ESPName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ESPName.TextSize = 14.000
	ESPName.TextStrokeTransparency = 0.000
end

for i, v in pairs(workspace.Prison_ITEMS.single:GetChildren()) do
	if v.Name == "M9" or v.Name == "Key card" and not v:FindFirstChild("WeaponESP") then
		CreateESP(v)
	end
end

workspace.Prison_ITEMS.single.ChildAdded:Connect(
	function(v)
		if v.Name == "M9" or v.Name == "Key card" and not v:FindFirstChild("WeaponESP") then
			CreateESP(v)
		end
	end
)

spawn(
	function()
		while wait() do
			for i, v in pairs(workspace.Prison_ITEMS.single:GetDescendants()) do
				if v:IsA("BillboardGui") then
					v.Enabled = _G.ESP_ENABLED
				end
			end
		end
	end
)


-- Player ESP
local function CreatePlayerESP(plr, v, Name)
	local WeaponESP = Instance.new("BillboardGui")
	local ESPName = Instance.new("TextLabel")

	WeaponESP.Name = "PlayerESP"
	WeaponESP.Parent = v
	WeaponESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	WeaponESP.Active = true
	WeaponESP.AlwaysOnTop = true
	WeaponESP.LightInfluence = 1.000
	WeaponESP.Size = UDim2.new(0, 200, 0, 50)
	WeaponESP.Enabled = _G.PLAYER_ESP_ENABLED

	ESPName.Name = "ESPName"
	ESPName.Parent = WeaponESP
	ESPName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ESPName.BackgroundTransparency = 1.000
	ESPName.Size = UDim2.new(0, 200, 0, 50)
	ESPName.Font = Enum.Font.ArialBold
	ESPName.Text = Name
	ESPName.TextColor3 = plr.TeamColor.Color
	ESPName.TextSize = 14.000
	ESPName.TextStrokeTransparency = 0.000
end

local function Get_ESP_Instances()
	local Billboards = {}
	for i, v in pairs(game.Players:GetPlayers()) do
		if workspace:FindFirstChild(v.Name) and v.Character:FindFirstChild("Torso") then
			if v.Character.Torso:FindFirstChild("PlayerESP") then
				table.insert(Billboards, v.Character.Torso.PlayerESP)
			end
		end
	end
	return Billboards
end

spawn(
	function()
		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				if v.Character ~= nil and workspace:FindFirstChild(v.Name) then
					local Torso = v.Character:FindFirstChild("Torso")
					if not Torso:FindFirstChild("PlayerESP") then
						CreatePlayerESP(v, Torso, v.Name)
					end
				end
				v.CharacterAdded:Connect(
					function(char)
						repeat
							wait()
						until workspace:FindFirstChild(v.Name)
						local Torso = char:WaitForChild("Torso")
						if not Torso:FindFirstChild("PlayerESP") then
							CreatePlayerESP(v, char:WaitForChild("Torso"), char.Name)
						end
					end
				)
			end
		end

		game.Players.PlayerAdded:Connect(
			function(v)
				repeat
					wait()
				until workspace:FindFirstChild(v.Name)
				wait()
				if v.Character ~= nil and v.Character.Torso then
					local Torso = v.Character:FindFirstChild("Torso")
					if Torso:FindFirstChild("PlayerESP") == nil then
						CreatePlayerESP(v, Torso, v.Name)
					end
				end
				v.CharacterAdded:Connect(
					function(char)
						repeat
							wait()
						until workspace:FindFirstChild(char.Name)
						if char ~= nil then
							local Torso = char:WaitForChild("Torso")
							if not Torso:FindFirstChild("PlayerESP") then
								CreatePlayerESP(v, char:WaitForChild("Torso"), char.Name)
							end
						end
					end
				)
			end
		)

		while wait() do
			for i, v in pairs(Get_ESP_Instances()) do
				local Player = game.Players[v.Parent.Parent.Name]
				v.ESPName.TextColor3 = Player.TeamColor.Color
				v.Enabled = _G.PLAYER_ESP_ENABLED
			end
		end
	end
)

-- Text change things
local jmusepart
for _, jmuseisasexyman in pairs(game.Workspace:GetDescendants()) do
	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "OUT OF ORDER" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "(srsly this time)" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "Synapse X!!"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Bulletin Board" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "YARD" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "Sirmeme #1"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "ARMORY+" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "Buy Scorpion Admin!"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "nope" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "PLG v3.2"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "CAFETERIA" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "PLG v3.2"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "GUARD ROOM" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "PRISON AREA" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "Prevail X winning!"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "TRESPASSERS WILL BE ARRESTED" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "rbxcheats.github.io/RbxCheats/"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "RESTRICTED AREA" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "GOVERNMENT OFFICIALS ONLY" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Hilltop Grocery Store" then
		jmusepart = jmuseisasexyman
		jmusepart.Text = "SYNX"
	end
end





local PLGv32 = {
	PLGv32 = Instance.new("ScreenGui"),
	MainGUI = Instance.new("Frame"),
	Holder = Instance.new("Frame"),
	ButtonHolder = Instance.new("Frame"),
	Bottons = Instance.new("Frame"),
	UIListLayout = Instance.new("UIListLayout"),
	TextButton = Instance.new("TextButton"),
	TextButton_2 = Instance.new("TextButton"),
	TextButton_3 = Instance.new("TextButton"),
	TextButton_4 = Instance.new("TextButton"),
	TextButton_5 = Instance.new("TextButton"),
	TextButton_6 = Instance.new("TextButton"),
	aLocal = Instance.new("Frame"),
	Top = Instance.new("Frame"),
	UIListLayout_2 = Instance.new("UIListLayout"),
	GunsFrame = Instance.new("Frame"),
	TextLabel = Instance.new("TextLabel"),
	Frame = Instance.new("Frame"),
	UIListLayout_3 = Instance.new("UIListLayout"),
	M4A1 = Instance.new("TextButton"),
	Frame_2 = Instance.new("Frame"),
	TextLabel_2 = Instance.new("TextLabel"),
	AK47 = Instance.new("TextButton"),
	Frame_3 = Instance.new("Frame"),
	TextLabel_3 = Instance.new("TextLabel"),
	Shotgun = Instance.new("TextButton"),
	Frame_4 = Instance.new("Frame"),
	TextLabel_4 = Instance.new("TextLabel"),
	M9 = Instance.new("TextButton"),
	Frame_5 = Instance.new("Frame"),
	TextLabel_5 = Instance.new("TextLabel"),
	TeamsFrame = Instance.new("Frame"),
	TextLabel_6 = Instance.new("TextLabel"),
	Frame_6 = Instance.new("Frame"),
	UIListLayout_4 = Instance.new("UIListLayout"),
	Police = Instance.new("TextButton"),
	Frame_7 = Instance.new("Frame"),
	TextLabel_7 = Instance.new("TextLabel"),
	Inmate = Instance.new("TextButton"),
	Frame_8 = Instance.new("Frame"),
	TextLabel_8 = Instance.new("TextLabel"),
	Criminal = Instance.new("TextButton"),
	Frame_9 = Instance.new("Frame"),
	TextLabel_9 = Instance.new("TextLabel"),
	NA = Instance.new("TextButton"),
	Frame_10 = Instance.new("Frame"),
	TextLabel_10 = Instance.new("TextLabel"),
	Bottom = Instance.new("Frame"),
	UIListLayout_5 = Instance.new("UIListLayout"),
	OtherLocal = Instance.new("Frame"),
	TextLabel_11 = Instance.new("TextLabel"),
	Frame_11 = Instance.new("Frame"),
	UIListLayout_6 = Instance.new("UIListLayout"),
	Btools = Instance.new("TextButton"),
	Frame_12 = Instance.new("Frame"),
	TextLabel_12 = Instance.new("TextLabel"),
	PlrESP = Instance.new("TextButton"),
	Frame_13 = Instance.new("Frame"),
	TextLabel_13 = Instance.new("TextLabel"),
	DroppedESP = Instance.new("TextButton"),
	Frame_14 = Instance.new("Frame"),
	TextLabel_14 = Instance.new("TextLabel"),
	slider = Instance.new("TextButton"),
	grab = Instance.new("TextButton"),
	TextLabel_15 = Instance.new("TextLabel"),
	slider2 = Instance.new("TextButton"),
	grab2 = Instance.new("TextButton"),
	TextLabel_16 = Instance.new("TextLabel"),
	SkyboxFrame = Instance.new("Frame"),
	TextLabel_17 = Instance.new("TextLabel"),
	Frame_15 = Instance.new("Frame"),
	UIListLayout_7 = Instance.new("UIListLayout"),
	Doge = Instance.new("TextButton"),
	Frame_16 = Instance.new("Frame"),
	TextLabel_18 = Instance.new("TextLabel"),
	Office = Instance.new("TextButton"),
	Frame_17 = Instance.new("Frame"),
	TextLabel_19 = Instance.new("TextLabel"),
	Jungle = Instance.new("TextButton"),
	Frame_18 = Instance.new("Frame"),
	TextLabel_20 = Instance.new("TextLabel"),
	Vaporwave = Instance.new("TextButton"),
	Frame_19 = Instance.new("Frame"),
	TextLabel_21 = Instance.new("TextLabel"),
	AmongUs = Instance.new("TextButton"),
	Frame_20 = Instance.new("Frame"),
	TextLabel_22 = Instance.new("TextLabel"),
	Galaxy = Instance.new("TextButton"),
	Frame_21 = Instance.new("Frame"),
	TextLabel_23 = Instance.new("TextLabel"),
	Goku = Instance.new("TextButton"),
	Frame_22 = Instance.new("Frame"),
	TextLabel_24 = Instance.new("TextLabel"),
	Default = Instance.new("TextButton"),
	Frame_23 = Instance.new("Frame"),
	TextLabel_25 = Instance.new("TextLabel"),
	Rage = Instance.new("Frame"),
	Top_2 = Instance.new("Frame"),
	UIListLayout_8 = Instance.new("UIListLayout"),
	KillAuraFrame = Instance.new("Frame"),
	TextLabel_26 = Instance.new("TextLabel"),
	Frame_24 = Instance.new("Frame"),
	UIListLayout_9 = Instance.new("UIListLayout"),
	CopsKA = Instance.new("TextButton"),
	Frame_25 = Instance.new("Frame"),
	TextLabel_27 = Instance.new("TextLabel"),
	InmatesKA = Instance.new("TextButton"),
	Frame_26 = Instance.new("Frame"),
	TextLabel_28 = Instance.new("TextLabel"),
	CriminalsKA = Instance.new("TextButton"),
	Frame_27 = Instance.new("Frame"),
	TextLabel_29 = Instance.new("TextLabel"),
	HitboxFrame = Instance.new("Frame"),
	TextLabel_30 = Instance.new("TextLabel"),
	Frame_28 = Instance.new("Frame"),
	UIListLayout_10 = Instance.new("UIListLayout"),
	PoliceHB = Instance.new("TextButton"),
	Frame_29 = Instance.new("Frame"),
	TextLabel_31 = Instance.new("TextLabel"),
	InmateHB = Instance.new("TextButton"),
	Frame_30 = Instance.new("Frame"),
	TextLabel_32 = Instance.new("TextLabel"),
	CriminalHB = Instance.new("TextButton"),
	Frame_31 = Instance.new("Frame"),
	TextLabel_33 = Instance.new("TextLabel"),
	NAHB = Instance.new("TextButton"),
	Frame_32 = Instance.new("Frame"),
	TextLabel_34 = Instance.new("TextLabel"),
	
	
	RageBottom = Instance.new("Frame"),
	RageListLayout = Instance.new("UIListLayout"),
	RageFrame1 = Instance.new("Frame"),
	RageTitleBox = Instance.new("TextLabel"),
	AnotherRageFrame = Instance.new("Frame"),
	AnotherListRage = Instance.new("UIListLayout"),
	KillAll = Instance.new("TextButton"),
	RageFrame = Instance.new("Frame"),
	RageText = Instance.new("TextLabel"),
	
	aaaaaaaaa = Instance.new("Frame"),
	bbbbbbbbbb = Instance.new("TextLabel"),
	cccccccc = Instance.new("Frame"),
	dddddddd = Instance.new("UIListLayout"),
	eeeeeeeee = Instance.new("TextButton"),
	ffffffff = Instance.new("Frame"),
	gggggggg = Instance.new("TextLabel"),
	
	
	Misc = Instance.new("Frame"),
	Top_3 = Instance.new("Frame"),
	UIListLayout_11 = Instance.new("UIListLayout"),
	ModGunsFrame = Instance.new("Frame"),
	TextLabel_35 = Instance.new("TextLabel"),
	Frame_33 = Instance.new("Frame"),
	UIListLayout_12 = Instance.new("UIListLayout"),
	M4A1_2 = Instance.new("TextButton"),
	Frame_34 = Instance.new("Frame"),
	TextLabel_36 = Instance.new("TextLabel"),
	AK47_2 = Instance.new("TextButton"),
	Frame_35 = Instance.new("Frame"),
	TextLabel_37 = Instance.new("TextLabel"),
	Shotgun_2 = Instance.new("TextButton"),
	Frame_36 = Instance.new("Frame"),
	TextLabel_38 = Instance.new("TextLabel"),
	M9_2 = Instance.new("TextButton"),
	Frame_37 = Instance.new("Frame"),
	TextLabel_39 = Instance.new("TextLabel"),
	Map = Instance.new("Frame"),
	TextLabel_40 = Instance.new("TextLabel"),
	Frame_38 = Instance.new("Frame"),
	UIListLayout_13 = Instance.new("UIListLayout"),
	Doors = Instance.new("TextButton"),
	Frame_39 = Instance.new("Frame"),
	TextLabel_41 = Instance.new("TextLabel"),
	Fences = Instance.new("TextButton"),
	Frame_40 = Instance.new("Frame"),
	TextLabel_42 = Instance.new("TextLabel"),
	Bottom_2 = Instance.new("Frame"),
	UIListLayout_14 = Instance.new("UIListLayout"),
	OtherLocal_2 = Instance.new("Frame"),
	TextLabel_43 = Instance.new("TextLabel"),
	Frame_41 = Instance.new("Frame"),
	UIListLayout_15 = Instance.new("UIListLayout"),
	ArrestAll = Instance.new("TextButton"),
	Frame_42 = Instance.new("Frame"),
	TextLabel_44 = Instance.new("TextLabel"),
	CriminalAll = Instance.new("TextButton"),
	Frame_43 = Instance.new("Frame"),
	TextLabel_45 = Instance.new("TextLabel"),
	CrashAll = Instance.new("TextButton"),
	Frame_44 = Instance.new("Frame"),
	TextLabel_46 = Instance.new("TextLabel"),
	Invisible = Instance.new("TextButton"),
	Frame_45 = Instance.new("Frame"),
	TextLabel_47 = Instance.new("TextLabel"),
	Player = Instance.new("Frame"),
	TextLabel_48 = Instance.new("TextLabel"),
	Frame_46 = Instance.new("Frame"),
	UIListLayout_16 = Instance.new("UIListLayout"),
	ClickArrest = Instance.new("TextButton"),
	Frame_47 = Instance.new("Frame"),
	TextLabel_49 = Instance.new("TextLabel"),
	FindKeycard = Instance.new("TextButton"),
	Frame_48 = Instance.new("Frame"),
	TextLabel_50 = Instance.new("TextLabel"),
	FlyCar = Instance.new("TextButton"),
	Frame_49 = Instance.new("Frame"),
	TextLabel_51 = Instance.new("TextLabel"),
	InfStamina = Instance.new("TextButton"),
	Frame_50 = Instance.new("Frame"),
	TextLabel_52 = Instance.new("TextLabel"),
	AutoRespawn = Instance.new("TextButton"),
	Frame_51 = Instance.new("Frame"),
	TextLabel_53 = Instance.new("TextLabel"),
	Teleport = Instance.new("Frame"),
	Top_4 = Instance.new("Frame"),
	UIListLayout_17 = Instance.new("UIListLayout"),
	InsidePrison = Instance.new("Frame"),
	TextLabel_54 = Instance.new("TextLabel"),
	Frame_52 = Instance.new("Frame"),
	UIListLayout_18 = Instance.new("UIListLayout"),
	blank = Instance.new("TextButton"),
	Frame_53 = Instance.new("Frame"),
	TextLabel_55 = Instance.new("TextLabel"),
	blank_2 = Instance.new("TextButton"),
	Frame_54 = Instance.new("Frame"),
	TextLabel_56 = Instance.new("TextLabel"),
	blank_3 = Instance.new("TextButton"),
	Frame_55 = Instance.new("Frame"),
	TextLabel_57 = Instance.new("TextLabel"),
	blank_4 = Instance.new("TextButton"),
	Frame_56 = Instance.new("Frame"),
	TextLabel_58 = Instance.new("TextLabel"),
	blank_5 = Instance.new("TextButton"),
	Frame_57 = Instance.new("Frame"),
	TextLabel_59 = Instance.new("TextLabel"),
	blank_6 = Instance.new("TextButton"),
	Frame_58 = Instance.new("Frame"),
	TextLabel_60 = Instance.new("TextLabel"),
	OutsidePrison = Instance.new("Frame"),
	TextLabel_61 = Instance.new("TextLabel"),
	Frame_59 = Instance.new("Frame"),
	UIListLayout_19 = Instance.new("UIListLayout"),
	blank_7 = Instance.new("TextButton"),
	Frame_60 = Instance.new("Frame"),
	TextLabel_62 = Instance.new("TextLabel"),
	blank_8 = Instance.new("TextButton"),
	Frame_61 = Instance.new("Frame"),
	TextLabel_63 = Instance.new("TextLabel"),
	blank_9 = Instance.new("TextButton"),
	Frame_62 = Instance.new("Frame"),
	TextLabel_64 = Instance.new("TextLabel"),
	blank_10 = Instance.new("TextButton"),
	Frame_63 = Instance.new("Frame"),
	TextLabel_65 = Instance.new("TextLabel"),
	blank_11 = Instance.new("TextButton"),
	Frame_64 = Instance.new("Frame"),
	TextLabel_66 = Instance.new("TextLabel"),
	blank_12 = Instance.new("TextButton"),
	Frame_65 = Instance.new("Frame"),
	TextLabel_67 = Instance.new("TextLabel"),
	blank_13 = Instance.new("TextButton"),
	Frame_66 = Instance.new("Frame"),
	TextLabel_68 = Instance.new("TextLabel"),
	blank_14 = Instance.new("TextButton"),
	Frame_67 = Instance.new("Frame"),
	TextLabel_69 = Instance.new("TextLabel"),
	blank_15 = Instance.new("TextButton"),
	Frame_68 = Instance.new("Frame"),
	TextLabel_70 = Instance.new("TextLabel"),
	blank_16 = Instance.new("TextButton"),
	Frame_69 = Instance.new("Frame"),
	TextLabel_71 = Instance.new("TextLabel"),
	blank_17 = Instance.new("TextButton"),
	Frame_70 = Instance.new("Frame"),
	TextLabel_72 = Instance.new("TextLabel"),
	blank_18 = Instance.new("TextButton"),
	Frame_71 = Instance.new("Frame"),
	TextLabel_73 = Instance.new("TextLabel"),
	blank_19 = Instance.new("TextButton"),
	Frame_72 = Instance.new("Frame"),
	TextLabel_74 = Instance.new("TextLabel"),
	blank_20 = Instance.new("TextButton"),
	Frame_73 = Instance.new("Frame"),
	TextLabel_75 = Instance.new("TextLabel"),
	blank_21 = Instance.new("TextButton"),
	Frame_74 = Instance.new("Frame"),
	TextLabel_76 = Instance.new("TextLabel"),
	Bottom_3 = Instance.new("Frame"),
	UIListLayout_20 = Instance.new("UIListLayout"),
	OtherLocal_3 = Instance.new("Frame"),
	TextLabel_77 = Instance.new("TextLabel"),
	Frame_75 = Instance.new("Frame"),
	UIListLayout_21 = Instance.new("UIListLayout"),
	blank_22 = Instance.new("TextButton"),
	Frame_76 = Instance.new("Frame"),
	TextLabel_78 = Instance.new("TextLabel"),
	blank_23 = Instance.new("TextButton"),
	Frame_77 = Instance.new("Frame"),
	TextLabel_79 = Instance.new("TextLabel"),
	blank_24 = Instance.new("TextButton"),
	Frame_78 = Instance.new("Frame"),
	TextLabel_80 = Instance.new("TextLabel"),
	SkyboxFrame_2 = Instance.new("Frame"),
	TextLabel_81 = Instance.new("TextLabel"),
	Frame_79 = Instance.new("Frame"),
	UIListLayout_22 = Instance.new("UIListLayout"),
	Players = Instance.new("Frame"),
	Top_5 = Instance.new("Frame"),
	UIListLayout_23 = Instance.new("UIListLayout"),
	MainPlayers = Instance.new("Frame"),
	TextLabel_82 = Instance.new("TextLabel"),
	PlayerStuff = Instance.new("Frame"),
	Scroll = Instance.new("ScrollingFrame"),
	sampletextxd = Instance.new("TextButton"),
	UIListLayout_24 = Instance.new("UIListLayout"),
	PlayerButtons = Instance.new("Frame"),
	TextLabel_83 = Instance.new("TextLabel"),
	Frame_80 = Instance.new("Frame"),
	UIListLayout_25 = Instance.new("UIListLayout"),
	spectate = Instance.new("TextButton"),
	Frame_81 = Instance.new("Frame"),
	TextLabel_84 = Instance.new("TextLabel"),
	unspectate = Instance.new("TextButton"),
	Frame_82 = Instance.new("Frame"),
	TextLabel_85 = Instance.new("TextLabel"),
	tptoplayer = Instance.new("TextButton"),
	Frame_83 = Instance.new("Frame"),
	TextLabel_86 = Instance.new("TextLabel"),
	killplayer = Instance.new("TextButton"),
	Frame_84 = Instance.new("Frame"),
	TextLabel_87 = Instance.new("TextLabel"),
	Bottom_4 = Instance.new("Frame"),
	UIListLayout_26 = Instance.new("UIListLayout"),
	OtherLocal_4 = Instance.new("Frame"),
	Frame_85 = Instance.new("Frame"),
	UIListLayout_27 = Instance.new("UIListLayout"),
	SkyboxFrame_3 = Instance.new("Frame"),
	Frame_86 = Instance.new("Frame"),
	UIListLayout_28 = Instance.new("UIListLayout"),
	Info = Instance.new("Frame"),
	Frame_87 = Instance.new("Frame"),
	TextLabel_88 = Instance.new("TextLabel"),
	Frame_88 = Instance.new("Frame"),
	UIListLayout_29 = Instance.new("UIListLayout"),
	TextLabel_89 = Instance.new("TextLabel"),
	TextLabel_90 = Instance.new("TextLabel"),
	Frame_89 = Instance.new("Frame"),
	UIListLayout_30 = Instance.new("UIListLayout"),
	TextLabel_91 = Instance.new("TextLabel"),
	TextLabel_92 = Instance.new("TextLabel"),
	TextLabel_93 = Instance.new("TextLabel"),
	TextLabel_94 = Instance.new("TextLabel"),
	TextLabel_95 = Instance.new("TextLabel"),
	TextLabel_96 = Instance.new("TextLabel"),
	TextLabel_97 = Instance.new("TextLabel"),
}

--Properties:

PLGv32.PLGv32.Name = "PLGv32"
PLGv32.PLGv32.Parent = game.CoreGui

PLGv32.MainGUI.Name = "MainGUI"
PLGv32.MainGUI.Parent = PLGv32.PLGv32
PLGv32.MainGUI.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
PLGv32.MainGUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.MainGUI.Position = UDim2.new(0.373952329, 0, 0.218673229, 0)
PLGv32.MainGUI.Size = UDim2.new(0, 389, 0, 458)
PLGv32.MainGUI.Active = true
PLGv32.MainGUI.Draggable = true

PLGv32.Holder.Name = "Holder"
PLGv32.Holder.Parent = PLGv32.MainGUI
PLGv32.Holder.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Holder.Position = UDim2.new(0.0102827763, 0, 0.0589519665, 0)
PLGv32.Holder.Size = UDim2.new(0, 381, 0, 423)

PLGv32.ButtonHolder.Name = "ButtonHolder"
PLGv32.ButtonHolder.Parent = PLGv32.Holder
PLGv32.ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.ButtonHolder.BackgroundTransparency = 1.000
PLGv32.ButtonHolder.BorderSizePixel = 0
PLGv32.ButtonHolder.Size = UDim2.new(0, 372, 0, 24)

PLGv32.Bottons.Name = "Bottons"
PLGv32.Bottons.Parent = PLGv32.ButtonHolder
PLGv32.Bottons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Bottons.BackgroundTransparency = 1.000
PLGv32.Bottons.Size = UDim2.new(0, 381, 0, 23)

PLGv32.UIListLayout.Parent = PLGv32.Bottons
PLGv32.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
PLGv32.UIListLayout.Padding = UDim.new(0, 5)

PLGv32.TextButton.Parent = PLGv32.Bottons
PLGv32.TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton.BackgroundTransparency = 1.000
PLGv32.TextButton.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton.Font = Enum.Font.Code
PLGv32.TextButton.Text = "Local"
PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton.TextSize = 14.000
PLGv32.TextButton.MouseButton1Click:connect(function()

	PLGv32.TextButton.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)


	PLGv32.aLocal.Visible = true
	PLGv32.Rage.Visible = false
	PLGv32.Misc.Visible = false
	PLGv32.Teleport.Visible = false
	PLGv32.Players.Visible = false
	PLGv32.Info.Visible = false

end)

PLGv32.TextButton_2.Parent = PLGv32.Bottons
PLGv32.TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_2.BackgroundTransparency = 1.000
PLGv32.TextButton_2.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton_2.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton_2.Font = Enum.Font.Code
PLGv32.TextButton_2.Text = "Rage"
PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_2.TextSize = 14.000
PLGv32.TextButton_2.MouseButton1Click:connect(function()

	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)

	PLGv32.aLocal.Visible = false
	PLGv32.Rage.Visible = true
	PLGv32.Misc.Visible = false
	PLGv32.Teleport.Visible = false
	PLGv32.Players.Visible = false
	PLGv32.Info.Visible = false

end)

PLGv32.TextButton_3.Parent = PLGv32.Bottons
PLGv32.TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_3.BackgroundTransparency = 1.000
PLGv32.TextButton_3.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton_3.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton_3.Font = Enum.Font.Code
PLGv32.TextButton_3.Text = "Misc"
PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_3.TextSize = 14.000
PLGv32.TextButton_3.MouseButton1Click:connect(function()

	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)

	PLGv32.aLocal.Visible = false
	PLGv32.Rage.Visible = false
	PLGv32.Misc.Visible = true
	PLGv32.Teleport.Visible = false
	PLGv32.Players.Visible = false
	PLGv32.Info.Visible = false

end)

PLGv32.TextButton_4.Parent = PLGv32.Bottons
PLGv32.TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_4.BackgroundTransparency = 1.000
PLGv32.TextButton_4.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton_4.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton_4.Font = Enum.Font.Code
PLGv32.TextButton_4.Text = "TP List"
PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_4.TextSize = 14.000
PLGv32.TextButton_4.MouseButton1Click:connect(function()

	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)

	PLGv32.aLocal.Visible = false
	PLGv32.Rage.Visible = false
	PLGv32.Misc.Visible = false
	PLGv32.Teleport.Visible = true
	PLGv32.Players.Visible = false
	PLGv32.Info.Visible = false

end)

PLGv32.TextButton_5.Parent = PLGv32.Bottons
PLGv32.TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_5.BackgroundTransparency = 1.000
PLGv32.TextButton_5.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton_5.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton_5.Font = Enum.Font.Code
PLGv32.TextButton_5.Text = "Players"
PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_5.TextSize = 14.000
PLGv32.TextButton_5.MouseButton1Click:connect(function()

	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)

	PLGv32.aLocal.Visible = false
	PLGv32.Rage.Visible = false
	PLGv32.Misc.Visible = false
	PLGv32.Teleport.Visible = false
	PLGv32.Players.Visible = true
	PLGv32.Info.Visible = false

end)

PLGv32.TextButton_6.Parent = PLGv32.Bottons
PLGv32.TextButton_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_6.BackgroundTransparency = 1.000
PLGv32.TextButton_6.Position = UDim2.new(0.422572166, 0, 0.0625, 0)
PLGv32.TextButton_6.Size = UDim2.new(0, 59, 0, 23)
PLGv32.TextButton_6.Font = Enum.Font.Code
PLGv32.TextButton_6.Text = "Info"
PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextButton_6.TextSize = 14.000
PLGv32.TextButton_6.MouseButton1Click:connect(function()

	PLGv32.TextButton_6.TextColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLGv32.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)

	PLGv32.aLocal.Visible = false
	PLGv32.Rage.Visible = false
	PLGv32.Misc.Visible = false
	PLGv32.Teleport.Visible = false
	PLGv32.Players.Visible = false
	PLGv32.Info.Visible = true

end)

PLGv32.aLocal.Name = "aLocal"
PLGv32.aLocal.Parent = PLGv32.Holder
PLGv32.aLocal.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.aLocal.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.aLocal.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.aLocal.Size = UDim2.new(0, 370, 0, 393)
PLGv32.aLocal.Visible = false

PLGv32.Top.Name = "Top"
PLGv32.Top.Parent = PLGv32.aLocal
PLGv32.Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Top.BackgroundTransparency = 1.000
PLGv32.Top.BorderSizePixel = 0
PLGv32.Top.Position = UDim2.new(0, 0, 0.0127226459, 0)
PLGv32.Top.Size = UDim2.new(0, 370, 0, 22)

PLGv32.UIListLayout_2.Parent = PLGv32.Top
PLGv32.UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_2.Padding = UDim.new(0, 6)

PLGv32.GunsFrame.Name = "GunsFrame"
PLGv32.GunsFrame.Parent = PLGv32.Top
PLGv32.GunsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.GunsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.GunsFrame.Position = UDim2.new(0, 188, 0, 5)
PLGv32.GunsFrame.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel.Parent = PLGv32.GunsFrame
PLGv32.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel.BackgroundTransparency = 1.000
PLGv32.TextLabel.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel.Font = Enum.Font.Code
PLGv32.TextLabel.Text = "Give Guns"
PLGv32.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel.TextSize = 13.000
PLGv32.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame.Parent = PLGv32.GunsFrame
PLGv32.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame.BackgroundTransparency = 1.000
PLGv32.Frame.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_3.Parent = PLGv32.Frame
PLGv32.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_3.Padding = UDim.new(0, 2)

PLGv32.M4A1.Name = "M4A1"
PLGv32.M4A1.Parent = PLGv32.Frame
PLGv32.M4A1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.M4A1.BackgroundTransparency = 1.000
PLGv32.M4A1.BorderSizePixel = 0
PLGv32.M4A1.Size = UDim2.new(0, 161, 0, 20)
PLGv32.M4A1.Font = Enum.Font.SourceSans
PLGv32.M4A1.Text = ""
PLGv32.M4A1.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.M4A1.TextSize = 14.000
PLGv32.M4A1.MouseButton1Click:connect(function()

	PLGv32.Frame_2.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)

	local Weapon = {"M4A1"}
	for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == Weapon[1] then
			local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end

	wait(0.3)
	PLGv32.Frame_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_2.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_2.Parent = PLGv32.M4A1
PLGv32.Frame_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_2.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_2.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_2.Parent = PLGv32.M4A1
PLGv32.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_2.BackgroundTransparency = 1.000
PLGv32.TextLabel_2.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_2.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_2.Font = Enum.Font.Code
PLGv32.TextLabel_2.Text = "M4A1"
PLGv32.TextLabel_2.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_2.TextSize = 14.000
PLGv32.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.AK47.Name = "AK47"
PLGv32.AK47.Parent = PLGv32.Frame
PLGv32.AK47.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.AK47.BackgroundTransparency = 1.000
PLGv32.AK47.BorderSizePixel = 0
PLGv32.AK47.Size = UDim2.new(0, 161, 0, 20)
PLGv32.AK47.Font = Enum.Font.SourceSans
PLGv32.AK47.Text = ""
PLGv32.AK47.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.AK47.TextSize = 14.000
PLGv32.AK47.MouseButton1Click:connect(function()

	PLGv32.Frame_3.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_3.TextColor3 = Color3.fromRGB(255,255,255)

	local Weapon = {"AK-47"}
	for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == Weapon[1] then
			local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end

	wait(0.3)
	PLGv32.Frame_3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_3.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_3.Parent = PLGv32.AK47
PLGv32.Frame_3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_3.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_3.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_3.Parent = PLGv32.AK47
PLGv32.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_3.BackgroundTransparency = 1.000
PLGv32.TextLabel_3.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_3.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_3.Font = Enum.Font.Code
PLGv32.TextLabel_3.Text = "AK-47"
PLGv32.TextLabel_3.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_3.TextSize = 14.000
PLGv32.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Shotgun.Name = "Shotgun"
PLGv32.Shotgun.Parent = PLGv32.Frame
PLGv32.Shotgun.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Shotgun.BackgroundTransparency = 1.000
PLGv32.Shotgun.BorderSizePixel = 0
PLGv32.Shotgun.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Shotgun.Font = Enum.Font.SourceSans
PLGv32.Shotgun.Text = ""
PLGv32.Shotgun.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Shotgun.TextSize = 14.000
PLGv32.Shotgun.MouseButton1Click:connect(function()

	PLGv32.Frame_4.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_4.TextColor3 = Color3.fromRGB(255,255,255)

	local Weapon = {"Remington 870"}
	for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == Weapon[1] then
			local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end

	wait(0.3)
	PLGv32.Frame_4.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_4.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_4.Parent = PLGv32.Shotgun
PLGv32.Frame_4.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_4.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_4.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_4.Parent = PLGv32.Shotgun
PLGv32.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_4.BackgroundTransparency = 1.000
PLGv32.TextLabel_4.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_4.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_4.Font = Enum.Font.Code
PLGv32.TextLabel_4.Text = "Remington 870"
PLGv32.TextLabel_4.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_4.TextSize = 14.000
PLGv32.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.M9.Name = "M9"
PLGv32.M9.Parent = PLGv32.Frame
PLGv32.M9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.M9.BackgroundTransparency = 1.000
PLGv32.M9.BorderSizePixel = 0
PLGv32.M9.Size = UDim2.new(0, 161, 0, 20)
PLGv32.M9.Font = Enum.Font.SourceSans
PLGv32.M9.Text = ""
PLGv32.M9.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.M9.TextSize = 14.000
PLGv32.M9.MouseButton1Click:connect(function()

	PLGv32.Frame_5.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_5.TextColor3 = Color3.fromRGB(255,255,255)

	local Weapon = {"M9"}
	for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == Weapon[1] then
			local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end

	wait(0.3)
	PLGv32.Frame_5.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_5.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_5.Parent = PLGv32.M9
PLGv32.Frame_5.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_5.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_5.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_5.Parent = PLGv32.M9
PLGv32.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_5.BackgroundTransparency = 1.000
PLGv32.TextLabel_5.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_5.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_5.Font = Enum.Font.Code
PLGv32.TextLabel_5.Text = "M9"
PLGv32.TextLabel_5.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_5.TextSize = 14.000
PLGv32.TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TeamsFrame.Name = "TeamsFrame"
PLGv32.TeamsFrame.Parent = PLGv32.Top
PLGv32.TeamsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.TeamsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.TeamsFrame.Position = UDim2.new(0, 188, 0, 5)
PLGv32.TeamsFrame.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_6.Parent = PLGv32.TeamsFrame
PLGv32.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_6.BackgroundTransparency = 1.000
PLGv32.TextLabel_6.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_6.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_6.Font = Enum.Font.Code
PLGv32.TextLabel_6.Text = "Change Teams"
PLGv32.TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_6.TextSize = 13.000
PLGv32.TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_6.Parent = PLGv32.TeamsFrame
PLGv32.Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_6.BackgroundTransparency = 1.000
PLGv32.Frame_6.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_6.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_4.Parent = PLGv32.Frame_6
PLGv32.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_4.Padding = UDim.new(0, 2)

PLGv32.Police.Name = "Police"
PLGv32.Police.Parent = PLGv32.Frame_6
PLGv32.Police.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Police.BackgroundTransparency = 1.000
PLGv32.Police.BorderSizePixel = 0
PLGv32.Police.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Police.Font = Enum.Font.SourceSans
PLGv32.Police.Text = ""
PLGv32.Police.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Police.TextSize = 14.000
PLGv32.Police.MouseButton1Click:connect(function()

	PLGv32.Frame_7.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_7.TextColor3 = Color3.fromRGB(255,255,255)

	Workspace.Remote.TeamEvent:FireServer("Bright blue")

	wait(0.3)
	PLGv32.Frame_7.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_7.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_7.Parent = PLGv32.Police
PLGv32.Frame_7.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_7.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_7.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_7.Parent = PLGv32.Police
PLGv32.TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_7.BackgroundTransparency = 1.000
PLGv32.TextLabel_7.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_7.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_7.Font = Enum.Font.Code
PLGv32.TextLabel_7.Text = "Police"
PLGv32.TextLabel_7.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_7.TextSize = 14.000
PLGv32.TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Inmate.Name = "Inmate"
PLGv32.Inmate.Parent = PLGv32.Frame_6
PLGv32.Inmate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Inmate.BackgroundTransparency = 1.000
PLGv32.Inmate.BorderSizePixel = 0
PLGv32.Inmate.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Inmate.Font = Enum.Font.SourceSans
PLGv32.Inmate.Text = ""
PLGv32.Inmate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Inmate.TextSize = 14.000
PLGv32.Inmate.MouseButton1Click:connect(function()

	PLGv32.Frame_8.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_8.TextColor3 = Color3.fromRGB(255,255,255)

	Workspace.Remote.TeamEvent:FireServer("Bright orange")

	wait(0.3)
	PLGv32.Frame_8.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_8.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_8.Parent = PLGv32.Inmate
PLGv32.Frame_8.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_8.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_8.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_8.Parent = PLGv32.Inmate
PLGv32.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_8.BackgroundTransparency = 1.000
PLGv32.TextLabel_8.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_8.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_8.Font = Enum.Font.Code
PLGv32.TextLabel_8.Text = "Inmate"
PLGv32.TextLabel_8.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_8.TextSize = 14.000
PLGv32.TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Criminal.Name = "Criminal"
PLGv32.Criminal.Parent = PLGv32.Frame_6
PLGv32.Criminal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Criminal.BackgroundTransparency = 1.000
PLGv32.Criminal.BorderSizePixel = 0
PLGv32.Criminal.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Criminal.Font = Enum.Font.SourceSans
PLGv32.Criminal.Text = ""
PLGv32.Criminal.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Criminal.TextSize = 14.000
PLGv32.Criminal.MouseButton1Click:connect(function()

	PLGv32.Frame_9.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_9.TextColor3 = Color3.fromRGB(255,255,255)

	local Apart = Instance.new("Part")

	Apart.Name = "PlrsPos"
	Apart.Parent = workspace
	Apart.Anchored = true
	Apart.Archivable = true
	Apart.CFrame = CFrame.new(9e99, 9e99, 9e99)

	LCS = game.Workspace["Criminals Spawn"].SpawnLocation
	wait(0.3)
	PLGv32.Frame_9.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_9.TextColor3 = Color3.fromRGB(77, 77, 77)
	wait(0.2)

	Apart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	Apart.Transparency = 1
	Apart.Anchored = true
	Apart.CanCollide = false

	istptoplr = true
	wait(0.004)

	LCS = game.Workspace["Criminals Spawn"].SpawnLocation

	LCS.CanCollide = false
	LCS.Size = Vector3.new(51.05, 24.12, 54.76)
	LCS.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	LCS.Transparency = 1

	wait(2)

	istptoplr = false
	_G.killAura = false

	wait(0.04)

	if istptoplr == false then
		LCS.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		LCS.Size = Vector3.new(6, 0.2, 6)
		LCS.Transparency = 0
		istptoplr = false
	end

end)

PLGv32.Frame_9.Parent = PLGv32.Criminal
PLGv32.Frame_9.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_9.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_9.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_9.Parent = PLGv32.Criminal
PLGv32.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_9.BackgroundTransparency = 1.000
PLGv32.TextLabel_9.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_9.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_9.Font = Enum.Font.Code
PLGv32.TextLabel_9.Text = "Criminal"
PLGv32.TextLabel_9.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_9.TextSize = 14.000
PLGv32.TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.NA.Name = "NA"
PLGv32.NA.Parent = PLGv32.Frame_6
PLGv32.NA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.NA.BackgroundTransparency = 1.000
PLGv32.NA.BorderSizePixel = 0
PLGv32.NA.Size = UDim2.new(0, 161, 0, 20)
PLGv32.NA.Font = Enum.Font.SourceSans
PLGv32.NA.Text = ""
PLGv32.NA.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.NA.TextSize = 14.000
PLGv32.NA.MouseButton1Click:connect(function()

	PLGv32.Frame_10.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_10.TextColor3 = Color3.fromRGB(255,255,255)

	Workspace.Remote.TeamEvent:FireServer("Medium stone grey")

	wait(0.3)
	PLGv32.Frame_10.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_10.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_10.Parent = PLGv32.NA
PLGv32.Frame_10.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_10.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_10.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_10.Parent = PLGv32.NA
PLGv32.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_10.BackgroundTransparency = 1.000
PLGv32.TextLabel_10.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_10.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_10.Font = Enum.Font.Code
PLGv32.TextLabel_10.Text = "N/A"
PLGv32.TextLabel_10.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_10.TextSize = 14.000
PLGv32.TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Bottom.Name = "Bottom"
PLGv32.Bottom.Parent = PLGv32.aLocal
PLGv32.Bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Bottom.BackgroundTransparency = 1.000
PLGv32.Bottom.BorderSizePixel = 0
PLGv32.Bottom.Position = UDim2.new(0, 0, 0.437659025, 0)
PLGv32.Bottom.Size = UDim2.new(0, 370, 0, 100)

PLGv32.UIListLayout_5.Parent = PLGv32.Bottom
PLGv32.UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_5.Padding = UDim.new(0, 6)

PLGv32.OtherLocal.Name = "OtherLocal"
PLGv32.OtherLocal.Parent = PLGv32.Bottom
PLGv32.OtherLocal.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.OtherLocal.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.OtherLocal.Position = UDim2.new(0, 5, 0, 0)
PLGv32.OtherLocal.Size = UDim2.new(0, 177, 0, 147)

PLGv32.TextLabel_11.Parent = PLGv32.OtherLocal
PLGv32.TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_11.BackgroundTransparency = 1.000
PLGv32.TextLabel_11.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_11.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_11.Font = Enum.Font.Code
PLGv32.TextLabel_11.Text = "Other"
PLGv32.TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_11.TextSize = 13.000
PLGv32.TextLabel_11.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_11.Parent = PLGv32.OtherLocal
PLGv32.Frame_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_11.BackgroundTransparency = 1.000
PLGv32.Frame_11.Position = UDim2.new(0.0450001508, 0, 0.190476194, 0)
PLGv32.Frame_11.Size = UDim2.new(0, 161, 0, 97)

PLGv32.UIListLayout_6.Parent = PLGv32.Frame_11
PLGv32.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_6.Padding = UDim.new(0, 2)

PLGv32.Btools.Name = "Btools"
PLGv32.Btools.Parent = PLGv32.Frame_11
PLGv32.Btools.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Btools.BackgroundTransparency = 1.000
PLGv32.Btools.BorderSizePixel = 0
PLGv32.Btools.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Btools.Font = Enum.Font.SourceSans
PLGv32.Btools.Text = ""
PLGv32.Btools.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Btools.TextSize = 14.000
PLGv32.Btools.MouseButton1Click:connect(function()

	PLGv32.Frame_12.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_12.TextColor3 = Color3.fromRGB(255,255,255)

	wait(0.1)
	local tool1 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
	local tool2 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
	local tool3 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
	tool1.BinType = "Clone"
	tool2.BinType = "Hammer"
	tool3.BinType = "Grab"

	wait(0.3)
	PLGv32.Frame_12.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_12.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_12.Parent = PLGv32.Btools
PLGv32.Frame_12.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_12.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_12.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_12.Parent = PLGv32.Btools
PLGv32.TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_12.BackgroundTransparency = 1.000
PLGv32.TextLabel_12.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_12.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_12.Font = Enum.Font.Code
PLGv32.TextLabel_12.Text = "Btools"
PLGv32.TextLabel_12.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_12.TextSize = 14.000
PLGv32.TextLabel_12.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.PlrESP.Name = "PlrESP"
PLGv32.PlrESP.Parent = PLGv32.Frame_11
PLGv32.PlrESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.PlrESP.BackgroundTransparency = 1.000
PLGv32.PlrESP.BorderSizePixel = 0
PLGv32.PlrESP.Size = UDim2.new(0, 161, 0, 20)
PLGv32.PlrESP.Font = Enum.Font.SourceSans
PLGv32.PlrESP.Text = ""
PLGv32.PlrESP.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.PlrESP.TextSize = 14.000

plllayer = false
PLGv32.PlrESP.MouseButton1Click:connect(function()

	if not plllayer then
		plllayer = true
		PLGv32.Frame_13.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_13.TextColor3 = Color3.fromRGB(255,255,255)

		_G.PLAYER_ESP_ENABLED = true
	else
		plllayer = false
		PLGv32.Frame_13.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_13.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.PLAYER_ESP_ENABLED = false
	end

end)


PLGv32.Frame_13.Parent = PLGv32.PlrESP
PLGv32.Frame_13.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_13.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_13.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_13.Parent = PLGv32.PlrESP
PLGv32.TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_13.BackgroundTransparency = 1.000
PLGv32.TextLabel_13.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_13.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_13.Font = Enum.Font.Code
PLGv32.TextLabel_13.Text = "Player ESP"
PLGv32.TextLabel_13.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_13.TextSize = 14.000
PLGv32.TextLabel_13.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.DroppedESP.Name = "DroppedESP"
PLGv32.DroppedESP.Parent = PLGv32.Frame_11
PLGv32.DroppedESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.DroppedESP.BackgroundTransparency = 1.000
PLGv32.DroppedESP.BorderSizePixel = 0
PLGv32.DroppedESP.Size = UDim2.new(0, 161, 0, 20)
PLGv32.DroppedESP.Font = Enum.Font.SourceSans
PLGv32.DroppedESP.Text = ""
PLGv32.DroppedESP.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.DroppedESP.TextSize = 14.000

droppedguuns = false
PLGv32.DroppedESP.MouseButton1Click:connect(function()

	if not droppedguuns then
		droppedguuns = true
		PLGv32.Frame_14.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_14.TextColor3 = Color3.fromRGB(255,255,255)

		_G.ESP_ENABLED = true
	else
		droppedguuns = false
		PLGv32.Frame_14.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_14.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.ESP_ENABLED = false
	end

end)

PLGv32.Frame_14.Parent = PLGv32.DroppedESP
PLGv32.Frame_14.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_14.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_14.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_14.Parent = PLGv32.DroppedESP
PLGv32.TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_14.BackgroundTransparency = 1.000
PLGv32.TextLabel_14.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_14.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_14.Font = Enum.Font.Code
PLGv32.TextLabel_14.Text = "Items ESP"
PLGv32.TextLabel_14.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_14.TextSize = 14.000
PLGv32.TextLabel_14.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.slider.Name = "slider"
PLGv32.slider.Parent = PLGv32.Frame_11
PLGv32.slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.slider.Position = UDim2.new(-0.00621118024, 0, 0.196428567, 0)
PLGv32.slider.Size = UDim2.new(0, 162, 0, 20)
PLGv32.slider.AutoButtonColor = false
PLGv32.slider.Font = Enum.Font.SourceSans
PLGv32.slider.Text = ""
PLGv32.slider.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.slider.TextSize = 14.000
PLGv32.slider.Visible = false

PLGv32.grab.Name = "grab"
PLGv32.grab.Parent = PLGv32.slider
PLGv32.grab.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLGv32.grab.BorderSizePixel = 0
PLGv32.grab.Size = UDim2.new(0, 1, 0, 20)
PLGv32.grab.Font = Enum.Font.SourceSans
PLGv32.grab.Text = ""
PLGv32.grab.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.grab.TextSize = 14.000

PLGv32.TextLabel_15.Parent = PLGv32.slider
PLGv32.TextLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_15.BackgroundTransparency = 1.000
PLGv32.TextLabel_15.Size = UDim2.new(0, 162, 0, 20)
PLGv32.TextLabel_15.Font = Enum.Font.Code
PLGv32.TextLabel_15.Text = "WS: "
PLGv32.TextLabel_15.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_15.TextSize = 14.000

PLGv32.slider2.Name = "slider2"
PLGv32.slider2.Parent = PLGv32.Frame_11
PLGv32.slider2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.slider2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.slider2.Position = UDim2.new(-0.00621118024, 0, 0.196428567, 0)
PLGv32.slider2.Size = UDim2.new(0, 162, 0, 20)
PLGv32.slider2.AutoButtonColor = false
PLGv32.slider2.Font = Enum.Font.SourceSans
PLGv32.slider2.Text = ""
PLGv32.slider2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.slider2.TextSize = 14.000
PLGv32.slider2.Visible = false

PLGv32.grab2.Name = "grab2"
PLGv32.grab2.Parent = PLGv32.slider2
PLGv32.grab2.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLGv32.grab2.BorderSizePixel = 0
PLGv32.grab2.Size = UDim2.new(0, 1, 0, 20)
PLGv32.grab2.Font = Enum.Font.SourceSans
PLGv32.grab2.Text = ""
PLGv32.grab2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.grab2.TextSize = 14.000

PLGv32.TextLabel_16.Parent = PLGv32.slider2
PLGv32.TextLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_16.BackgroundTransparency = 1.000
PLGv32.TextLabel_16.Size = UDim2.new(0, 162, 0, 20)
PLGv32.TextLabel_16.Font = Enum.Font.Code
PLGv32.TextLabel_16.Text = "JP: "
PLGv32.TextLabel_16.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_16.TextSize = 14.000

PLGv32.SkyboxFrame.Name = "SkyboxFrame"
PLGv32.SkyboxFrame.Parent = PLGv32.Bottom
PLGv32.SkyboxFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.SkyboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.SkyboxFrame.Position = UDim2.new(0, 188, 0, 0)
PLGv32.SkyboxFrame.Size = UDim2.new(0, 177, 0, 215)

PLGv32.TextLabel_17.Parent = PLGv32.SkyboxFrame
PLGv32.TextLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_17.BackgroundTransparency = 1.000
PLGv32.TextLabel_17.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_17.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_17.Font = Enum.Font.Code
PLGv32.TextLabel_17.Text = "Change Skybox"
PLGv32.TextLabel_17.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_17.TextSize = 13.000
PLGv32.TextLabel_17.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_15.Parent = PLGv32.SkyboxFrame
PLGv32.Frame_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_15.BackgroundTransparency = 1.000
PLGv32.Frame_15.Position = UDim2.new(0.0451977402, 0, 0.130232558, 0)
PLGv32.Frame_15.Size = UDim2.new(0, 161, 0, 110)

PLGv32.UIListLayout_7.Parent = PLGv32.Frame_15
PLGv32.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_7.Padding = UDim.new(0, 2)

PLGv32.Doge.Name = "Doge"
PLGv32.Doge.Parent = PLGv32.Frame_15
PLGv32.Doge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Doge.BackgroundTransparency = 1.000
PLGv32.Doge.BorderSizePixel = 0
PLGv32.Doge.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Doge.Font = Enum.Font.SourceSans
PLGv32.Doge.Text = ""
PLGv32.Doge.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Doge.TextSize = 14.000
PLGv32.Doge.MouseButton1Click:connect(function()

	PLGv32.Frame_16.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_18.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky

	skych.SkyboxBk = "http://www.roblox.com/asset/?id=133442689"
	skych.SkyboxDn = "http://www.roblox.com/asset/?id=133442689"
	skych.SkyboxFt = "http://www.roblox.com/asset/?id=133442689"
	skych.SkyboxLf = "http://www.roblox.com/asset/?id=133442689"
	skych.SkyboxRt = "http://www.roblox.com/asset/?id=133442689"
	skych.SkyboxUp = "http://www.roblox.com/asset/?id=133442689"

	wait(0.3)
	PLGv32.Frame_16.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_18.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_16.Parent = PLGv32.Doge
PLGv32.Frame_16.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_16.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_16.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_16.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_18.Parent = PLGv32.Doge
PLGv32.TextLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_18.BackgroundTransparency = 1.000
PLGv32.TextLabel_18.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_18.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_18.Font = Enum.Font.Code
PLGv32.TextLabel_18.Text = "Doge"
PLGv32.TextLabel_18.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_18.TextSize = 14.000
PLGv32.TextLabel_18.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Office.Name = "Office"
PLGv32.Office.Parent = PLGv32.Frame_15
PLGv32.Office.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Office.BackgroundTransparency = 1.000
PLGv32.Office.BorderSizePixel = 0
PLGv32.Office.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Office.Font = Enum.Font.SourceSans
PLGv32.Office.Text = ""
PLGv32.Office.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Office.TextSize = 14.000
PLGv32.Office.MouseButton1Click:connect(function()

	PLGv32.Frame_17.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_19.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky

	skych.SkyboxBk = "rbxassetid://658623433"
	skych.SkyboxDn = "rbxassetid://316342560"
	skych.SkyboxFt = "rbxassetid://658625205"
	skych.SkyboxLf = "rbxassetid://658627155"
	skych.SkyboxRt = "rbxassetid://658628504"
	skych.SkyboxUp = "rbxassetid://658632701"

	wait(0.3)
	PLGv32.Frame_17.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_19.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_17.Parent = PLGv32.Office
PLGv32.Frame_17.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_17.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_17.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_17.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_19.Parent = PLGv32.Office
PLGv32.TextLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_19.BackgroundTransparency = 1.000
PLGv32.TextLabel_19.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_19.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_19.Font = Enum.Font.Code
PLGv32.TextLabel_19.Text = "Office"
PLGv32.TextLabel_19.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_19.TextSize = 14.000
PLGv32.TextLabel_19.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Jungle.Name = "Jungle"
PLGv32.Jungle.Parent = PLGv32.Frame_15
PLGv32.Jungle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Jungle.BackgroundTransparency = 1.000
PLGv32.Jungle.BorderSizePixel = 0
PLGv32.Jungle.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Jungle.Font = Enum.Font.SourceSans
PLGv32.Jungle.Text = ""
PLGv32.Jungle.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Jungle.TextSize = 14.000
PLGv32.Jungle.MouseButton1Click:connect(function()

	PLGv32.Frame_18.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_20.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky

	skych.SkyboxBk = "http://www.roblox.com/asset/?id=214399891"
	skych.SkyboxDn = "http://www.roblox.com/asset/?id=214399887"
	skych.SkyboxFt = "http://www.roblox.com/asset/?id=214399894"
	skych.SkyboxLf = "http://www.roblox.com/asset/?id=214405668"
	skych.SkyboxRt = "http://www.roblox.com/asset/?id=214399899"
	skych.SkyboxUp = "http://www.roblox.com/asset/?id=214399889"

	wait(0.3)
	PLGv32.Frame_18.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_20.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_18.Parent = PLGv32.Jungle
PLGv32.Frame_18.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_18.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_18.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_18.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_20.Parent = PLGv32.Jungle
PLGv32.TextLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_20.BackgroundTransparency = 1.000
PLGv32.TextLabel_20.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_20.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_20.Font = Enum.Font.Code
PLGv32.TextLabel_20.Text = "Jungle"
PLGv32.TextLabel_20.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_20.TextSize = 14.000
PLGv32.TextLabel_20.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Vaporwave.Name = "Vaporwave"
PLGv32.Vaporwave.Parent = PLGv32.Frame_15
PLGv32.Vaporwave.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Vaporwave.BackgroundTransparency = 1.000
PLGv32.Vaporwave.BorderSizePixel = 0
PLGv32.Vaporwave.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Vaporwave.Font = Enum.Font.SourceSans
PLGv32.Vaporwave.Text = ""
PLGv32.Vaporwave.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Vaporwave.TextSize = 14.000
PLGv32.Vaporwave.MouseButton1Click:connect(function()

	PLGv32.Frame_19.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_21.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky
	skych.SkyboxBk = "http://www.roblox.com/asset/?id=4503182638"
	skych.SkyboxDn = "http://www.roblox.com/asset/?id=4503183124"
	skych.SkyboxFt = "http://www.roblox.com/asset/?id=4503182357"
	skych.SkyboxLf = "http://www.roblox.com/asset/?id=4503183368"
	skych.SkyboxRt = "http://www.roblox.com/asset/?id=4503182828"
	skych.SkyboxUp = "http://www.roblox.com/asset/?id=4503181951"

	wait(0.3)
	PLGv32.Frame_19.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_21.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_19.Parent = PLGv32.Vaporwave
PLGv32.Frame_19.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_19.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_19.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_19.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_21.Parent = PLGv32.Vaporwave
PLGv32.TextLabel_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_21.BackgroundTransparency = 1.000
PLGv32.TextLabel_21.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_21.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_21.Font = Enum.Font.Code
PLGv32.TextLabel_21.Text = "Vaporwave"
PLGv32.TextLabel_21.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_21.TextSize = 14.000
PLGv32.TextLabel_21.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.AmongUs.Name = "AmongUs"
PLGv32.AmongUs.Parent = PLGv32.Frame_15
PLGv32.AmongUs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.AmongUs.BackgroundTransparency = 1.000
PLGv32.AmongUs.BorderSizePixel = 0
PLGv32.AmongUs.Size = UDim2.new(0, 161, 0, 20)
PLGv32.AmongUs.Font = Enum.Font.SourceSans
PLGv32.AmongUs.Text = ""
PLGv32.AmongUs.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.AmongUs.TextSize = 14.000
PLGv32.AmongUs.MouseButton1Click:connect(function()

	PLGv32.Frame_20.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_22.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky
	skych.SkyboxBk = "rbxassetid://5752463190"
	skych.SkyboxDn = "rbxassetid://5872485020"
	skych.SkyboxFt = "rbxassetid://5752463190"
	skych.SkyboxLf = "rbxassetid://5752463190"
	skych.SkyboxRt = "rbxassetid://5752463190"
	skych.SkyboxUp = "rbxassetid://5752463190"

	wait(0.3)
	PLGv32.Frame_20.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_22.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_20.Parent = PLGv32.AmongUs
PLGv32.Frame_20.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_20.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_20.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_20.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_22.Parent = PLGv32.AmongUs
PLGv32.TextLabel_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_22.BackgroundTransparency = 1.000
PLGv32.TextLabel_22.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_22.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_22.Font = Enum.Font.Code
PLGv32.TextLabel_22.Text = "Among Us"
PLGv32.TextLabel_22.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_22.TextSize = 14.000
PLGv32.TextLabel_22.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Galaxy.Name = "Galaxy"
PLGv32.Galaxy.Parent = PLGv32.Frame_15
PLGv32.Galaxy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Galaxy.BackgroundTransparency = 1.000
PLGv32.Galaxy.BorderSizePixel = 0
PLGv32.Galaxy.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Galaxy.Font = Enum.Font.SourceSans
PLGv32.Galaxy.Text = ""
PLGv32.Galaxy.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Galaxy.TextSize = 14.000
PLGv32.Galaxy.MouseButton1Click:connect(function()

	PLGv32.Frame_21.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_23.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky
	skych.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
	skych.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
	skych.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
	skych.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
	skych.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
	skych.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"

	wait(0.3)
	PLGv32.Frame_21.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_23.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_21.Parent = PLGv32.Galaxy
PLGv32.Frame_21.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_21.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_21.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_21.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_23.Parent = PLGv32.Galaxy
PLGv32.TextLabel_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_23.BackgroundTransparency = 1.000
PLGv32.TextLabel_23.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_23.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_23.Font = Enum.Font.Code
PLGv32.TextLabel_23.Text = "Galaxy"
PLGv32.TextLabel_23.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_23.TextSize = 14.000
PLGv32.TextLabel_23.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Goku.Name = "Goku"
PLGv32.Goku.Parent = PLGv32.Frame_15
PLGv32.Goku.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Goku.BackgroundTransparency = 1.000
PLGv32.Goku.BorderSizePixel = 0
PLGv32.Goku.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Goku.Font = Enum.Font.SourceSans
PLGv32.Goku.Text = ""
PLGv32.Goku.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Goku.TextSize = 14.000
PLGv32.Goku.MouseButton1Click:connect(function()

	PLGv32.Frame_22.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_24.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky
	skych.SkyboxBk = "rbxassetid://6089679116"
	skych.SkyboxDn = "rbxassetid://6089679116"
	skych.SkyboxFt = "rbxassetid://6089679116"
	skych.SkyboxLf = "rbxassetid://6089679116"
	skych.SkyboxRt = "rbxassetid://6089679116"
	skych.SkyboxUp = "rbxassetid://6089679116"

	wait(0.3)
	PLGv32.Frame_22.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_24.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_22.Parent = PLGv32.Goku
PLGv32.Frame_22.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_22.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_22.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_22.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_24.Parent = PLGv32.Goku
PLGv32.TextLabel_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_24.BackgroundTransparency = 1.000
PLGv32.TextLabel_24.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_24.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_24.Font = Enum.Font.Code
PLGv32.TextLabel_24.Text = "Goku"
PLGv32.TextLabel_24.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_24.TextSize = 14.000
PLGv32.TextLabel_24.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Default.Name = "Default"
PLGv32.Default.Parent = PLGv32.Frame_15
PLGv32.Default.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Default.BackgroundTransparency = 1.000
PLGv32.Default.BorderSizePixel = 0
PLGv32.Default.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Default.Font = Enum.Font.SourceSans
PLGv32.Default.Text = ""
PLGv32.Default.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Default.TextSize = 14.000
PLGv32.Default.MouseButton1Click:connect(function()

	PLGv32.Frame_23.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_25.TextColor3 = Color3.fromRGB(255,255,255)

	skych = game:service("Lighting").Sky

	skych.SkyboxBk = "rbxassetid://150553096"
	skych.SkyboxDn = "rbxassetid://150553062"
	skych.SkyboxFt = "rbxassetid://150553119"
	skych.SkyboxLf = "rbxassetid://150553049"
	skych.SkyboxRt = "rbxassetid://150553079"
	skych.SkyboxUp = "rbxassetid://150553131"

	wait(0.3)
	PLGv32.Frame_23.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_25.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_23.Parent = PLGv32.Default
PLGv32.Frame_23.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_23.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_23.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_23.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_25.Parent = PLGv32.Default
PLGv32.TextLabel_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_25.BackgroundTransparency = 1.000
PLGv32.TextLabel_25.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_25.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_25.Font = Enum.Font.Code
PLGv32.TextLabel_25.Text = "Default"
PLGv32.TextLabel_25.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_25.TextSize = 14.000
PLGv32.TextLabel_25.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Rage.Name = "Rage"
PLGv32.Rage.Parent = PLGv32.Holder
PLGv32.Rage.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.Rage.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Rage.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.Rage.Size = UDim2.new(0, 370, 0, 393)
PLGv32.Rage.Visible = false

PLGv32.Top_2.Name = "Top"
PLGv32.Top_2.Parent = PLGv32.Rage
PLGv32.Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Top_2.BackgroundTransparency = 1.000
PLGv32.Top_2.BorderSizePixel = 0
PLGv32.Top_2.Position = UDim2.new(0, 0, 0.0127226459, 0)
PLGv32.Top_2.Size = UDim2.new(0, 370, 0, 22)

PLGv32.UIListLayout_8.Parent = PLGv32.Top_2
PLGv32.UIListLayout_8.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_8.Padding = UDim.new(0, 6)

PLGv32.KillAuraFrame.Name = "KillAuraFrame"
PLGv32.KillAuraFrame.Parent = PLGv32.Top_2
PLGv32.KillAuraFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.KillAuraFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.KillAuraFrame.Position = UDim2.new(0, 188, 0, 5)
PLGv32.KillAuraFrame.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_26.Parent = PLGv32.KillAuraFrame
PLGv32.TextLabel_26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_26.BackgroundTransparency = 1.000
PLGv32.TextLabel_26.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_26.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_26.Font = Enum.Font.Code
PLGv32.TextLabel_26.Text = "Kill Aura Toggles"
PLGv32.TextLabel_26.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_26.TextSize = 13.000
PLGv32.TextLabel_26.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_24.Parent = PLGv32.KillAuraFrame
PLGv32.Frame_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_24.BackgroundTransparency = 1.000
PLGv32.Frame_24.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_24.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_9.Parent = PLGv32.Frame_24
PLGv32.UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_9.Padding = UDim.new(0, 2)

PLGv32.CopsKA.Name = "CopsKA"
PLGv32.CopsKA.Parent = PLGv32.Frame_24
PLGv32.CopsKA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.CopsKA.BackgroundTransparency = 1.000
PLGv32.CopsKA.BorderSizePixel = 0
PLGv32.CopsKA.Size = UDim2.new(0, 161, 0, 20)
PLGv32.CopsKA.Font = Enum.Font.SourceSans
PLGv32.CopsKA.Text = ""
PLGv32.CopsKA.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.CopsKA.TextSize = 14.000

copska = false
PLGv32.CopsKA.MouseButton1Click:connect(function()

	if not copska then
		copska = true

		PLGv32.Frame_25.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_27.TextColor3 = Color3.fromRGB(255,255,255)

		_G.GuardKillAura = true --Or false

		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		while _G.GuardKillAura == true do
			for i, v in pairs(Players:GetPlayers()) do
				if v ~= LocalPlayer then
					if v.TeamColor.Name == "Bright blue" then
						local Event = game:GetService("ReplicatedStorage").meleeEvent
						Event:FireServer(v)
					end
				end
			end
			wait()
		end
	else
		copska = false

		PLGv32.Frame_25.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_27.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.GuardKillAura = false
	end

end)


PLGv32.Frame_25.Parent = PLGv32.CopsKA
PLGv32.Frame_25.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_25.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_25.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_25.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_27.Parent = PLGv32.CopsKA
PLGv32.TextLabel_27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_27.BackgroundTransparency = 1.000
PLGv32.TextLabel_27.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_27.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_27.Font = Enum.Font.Code
PLGv32.TextLabel_27.Text = "Police"
PLGv32.TextLabel_27.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_27.TextSize = 14.000
PLGv32.TextLabel_27.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.InmatesKA.Name = "InmatesKA"
PLGv32.InmatesKA.Parent = PLGv32.Frame_24
PLGv32.InmatesKA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.InmatesKA.BackgroundTransparency = 1.000
PLGv32.InmatesKA.BorderSizePixel = 0
PLGv32.InmatesKA.Size = UDim2.new(0, 161, 0, 20)
PLGv32.InmatesKA.Font = Enum.Font.SourceSans
PLGv32.InmatesKA.Text = ""
PLGv32.InmatesKA.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.InmatesKA.TextSize = 14.000

inmateka = false
PLGv32.InmatesKA.MouseButton1Click:connect(function()

	if not inmateka then
		inmateka = true
		PLGv32.Frame_26.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_28.TextColor3 = Color3.fromRGB(255,255,255)

		_G.InmateKillAura = true --Or false

		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		while _G.InmateKillAura == true do
			for i, v in pairs(Players:GetPlayers()) do
				if v ~= LocalPlayer then
					if v.TeamColor.Name == "Bright orange" then
						local Event = game:GetService("ReplicatedStorage").meleeEvent
						Event:FireServer(v)
					end
				end
			end
			wait()
		end
	else
		inmateka = false
		PLGv32.Frame_26.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_28.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.InmateKillAura = false
	end

end)

PLGv32.Frame_26.Parent = PLGv32.InmatesKA
PLGv32.Frame_26.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_26.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_26.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_26.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_28.Parent = PLGv32.InmatesKA
PLGv32.TextLabel_28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_28.BackgroundTransparency = 1.000
PLGv32.TextLabel_28.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_28.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_28.Font = Enum.Font.Code
PLGv32.TextLabel_28.Text = "Inmates"
PLGv32.TextLabel_28.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_28.TextSize = 14.000
PLGv32.TextLabel_28.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.CriminalsKA.Name = "CriminalsKA"
PLGv32.CriminalsKA.Parent = PLGv32.Frame_24
PLGv32.CriminalsKA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.CriminalsKA.BackgroundTransparency = 1.000
PLGv32.CriminalsKA.BorderSizePixel = 0
PLGv32.CriminalsKA.Size = UDim2.new(0, 161, 0, 20)
PLGv32.CriminalsKA.Font = Enum.Font.SourceSans
PLGv32.CriminalsKA.Text = ""
PLGv32.CriminalsKA.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.CriminalsKA.TextSize = 14.000

crimeka = false
PLGv32.CriminalsKA.MouseButton1Click:connect(function()

	if not crimeka then
		crimeka = true
		PLGv32.Frame_27.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_29.TextColor3 = Color3.fromRGB(255,255,255)

		_G.CriminalKillAura = true --Or false

		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		while _G.CriminalKillAura == true do
			for i, v in pairs(Players:GetPlayers()) do
				if v ~= LocalPlayer then
					if v.TeamColor.Name == "Really red" then
						local Event = game:GetService("ReplicatedStorage").meleeEvent
						Event:FireServer(v)
					end
				end
			end
			wait()
		end
	else
		crimeka = false
		PLGv32.Frame_27.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_29.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.CriminalKillAura = false
	end

end)

PLGv32.Frame_27.Parent = PLGv32.CriminalsKA
PLGv32.Frame_27.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_27.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_27.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_27.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_29.Parent = PLGv32.CriminalsKA
PLGv32.TextLabel_29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_29.BackgroundTransparency = 1.000
PLGv32.TextLabel_29.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_29.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_29.Font = Enum.Font.Code
PLGv32.TextLabel_29.Text = "Criminals"
PLGv32.TextLabel_29.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_29.TextSize = 14.000
PLGv32.TextLabel_29.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.HitboxFrame.Name = "HitboxFrame"
PLGv32.HitboxFrame.Parent = PLGv32.Top_2
PLGv32.HitboxFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.HitboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.HitboxFrame.Position = UDim2.new(0, 188, 0, 5)
PLGv32.HitboxFrame.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_30.Parent = PLGv32.HitboxFrame
PLGv32.TextLabel_30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_30.BackgroundTransparency = 1.000
PLGv32.TextLabel_30.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_30.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_30.Font = Enum.Font.Code
PLGv32.TextLabel_30.Text = "Hitbox Changer"
PLGv32.TextLabel_30.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_30.TextSize = 13.000
PLGv32.TextLabel_30.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_28.Parent = PLGv32.HitboxFrame
PLGv32.Frame_28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_28.BackgroundTransparency = 1.000
PLGv32.Frame_28.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_28.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_10.Parent = PLGv32.Frame_28
PLGv32.UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_10.Padding = UDim.new(0, 2)

PLGv32.PoliceHB.Name = "PoliceHB"
PLGv32.PoliceHB.Parent = PLGv32.Frame_28
PLGv32.PoliceHB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.PoliceHB.BackgroundTransparency = 1.000
PLGv32.PoliceHB.BorderSizePixel = 0
PLGv32.PoliceHB.Size = UDim2.new(0, 161, 0, 20)
PLGv32.PoliceHB.Font = Enum.Font.SourceSans
PLGv32.PoliceHB.Text = ""
PLGv32.PoliceHB.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.PoliceHB.TextSize = 14.000

guardperson = false
PLGv32.PoliceHB.MouseButton1Click:connect(function()

	if not guardperson then
		guardperson = true
		PLGv32.Frame_29.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_31.TextColor3 = Color3.fromRGB(255,255,255)

		_G.HeadSize = 10
		_G.Disabledd = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Disabledd then
				for i, v in pairs(game.Teams["Guards"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size =
									Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
								v.Character.HumanoidRootPart.Transparency = 0.7
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
								v.Character.HumanoidRootPart.Material = "Neon"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	else
		guardperson = false
		PLGv32.Frame_29.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_31.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.Disabledd = false
		_G.Offf = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Offf then
				for i, v in pairs(game.Teams["Guards"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
								v.Character.HumanoidRootPart.Transparency = 1
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
								v.Character.HumanoidRootPart.Material = "Plastic"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	end

end)

PLGv32.Frame_29.Parent = PLGv32.PoliceHB
PLGv32.Frame_29.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_29.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_29.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_29.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_31.Parent = PLGv32.PoliceHB
PLGv32.TextLabel_31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_31.BackgroundTransparency = 1.000
PLGv32.TextLabel_31.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_31.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_31.Font = Enum.Font.Code
PLGv32.TextLabel_31.Text = "Police"
PLGv32.TextLabel_31.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_31.TextSize = 14.000
PLGv32.TextLabel_31.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.InmateHB.Name = "InmateHB"
PLGv32.InmateHB.Parent = PLGv32.Frame_28
PLGv32.InmateHB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.InmateHB.BackgroundTransparency = 1.000
PLGv32.InmateHB.BorderSizePixel = 0
PLGv32.InmateHB.Size = UDim2.new(0, 161, 0, 20)
PLGv32.InmateHB.Font = Enum.Font.SourceSans
PLGv32.InmateHB.Text = ""
PLGv32.InmateHB.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.InmateHB.TextSize = 14.000

inmateperson = false
PLGv32.InmateHB.MouseButton1Click:connect(function()

	if not inmateperson then
		inmateperson = true
		PLGv32.Frame_30.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_32.TextColor3 = Color3.fromRGB(255,255,255)

		_G.HeadSize = 10
		_G.Disabled = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Disabled then
				for i, v in pairs(game.Teams["Inmates"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size =
									Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
								v.Character.HumanoidRootPart.Transparency = 0.7
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright orange")
								v.Character.HumanoidRootPart.Material = "Neon"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	else
		inmateperson = false
		PLGv32.Frame_30.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_32.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.Disabled = false
		_G.Off = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Off then
				for i, v in pairs(game.Teams["Inmates"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
								v.Character.HumanoidRootPart.Transparency = 1
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
								v.Character.HumanoidRootPart.Material = "Plastic"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	end

end)

PLGv32.Frame_30.Parent = PLGv32.InmateHB
PLGv32.Frame_30.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_30.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_30.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_30.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_32.Parent = PLGv32.InmateHB
PLGv32.TextLabel_32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_32.BackgroundTransparency = 1.000
PLGv32.TextLabel_32.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_32.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_32.Font = Enum.Font.Code
PLGv32.TextLabel_32.Text = "Inmates"
PLGv32.TextLabel_32.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_32.TextSize = 14.000
PLGv32.TextLabel_32.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.CriminalHB.Name = "CriminalHB"
PLGv32.CriminalHB.Parent = PLGv32.Frame_28
PLGv32.CriminalHB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.CriminalHB.BackgroundTransparency = 1.000
PLGv32.CriminalHB.BorderSizePixel = 0
PLGv32.CriminalHB.Size = UDim2.new(0, 161, 0, 20)
PLGv32.CriminalHB.Font = Enum.Font.SourceSans
PLGv32.CriminalHB.Text = ""
PLGv32.CriminalHB.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.CriminalHB.TextSize = 14.000

crimeperson = false
PLGv32.CriminalHB.MouseButton1Click:connect(function()

	if not crimeperson then
		crimeperson = true
		PLGv32.Frame_31.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_33.TextColor3 = Color3.fromRGB(255,255,255)

		_G.HeadSize = 10
		_G.Disabledd12 = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Disabledd12 then
				for i, v in pairs(game.Teams["Criminals"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size =
									Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
								v.Character.HumanoidRootPart.Transparency = 0.7
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
								v.Character.HumanoidRootPart.Material = "Neon"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	else
		crimeperson = false
		PLGv32.Frame_31.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_33.TextColor3 = Color3.fromRGB(77, 77, 77)

		_G.Disabledd12 = false
		_G.Offf12 = true

		game:GetService("RunService").RenderStepped:connect(
		function()
			if _G.Offf12 then
				for i, v in pairs(game.Teams["Criminals"]:GetPlayers()) do
					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
						pcall(
							function()
								v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
								v.Character.HumanoidRootPart.Transparency = 1
								v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
								v.Character.HumanoidRootPart.Material = "Plastic"
								v.Character.HumanoidRootPart.CanCollide = false
							end
						)
					end
				end
			end
		end
		)
	end

end)

PLGv32.Frame_31.Parent = PLGv32.CriminalHB
PLGv32.Frame_31.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_31.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_31.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_31.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_33.Parent = PLGv32.CriminalHB
PLGv32.TextLabel_33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_33.BackgroundTransparency = 1.000
PLGv32.TextLabel_33.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_33.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_33.Font = Enum.Font.Code
PLGv32.TextLabel_33.Text = "Criminals"
PLGv32.TextLabel_33.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_33.TextSize = 14.000
PLGv32.TextLabel_33.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.NAHB.Name = "NAHB"
PLGv32.NAHB.Parent = PLGv32.Frame_28
PLGv32.NAHB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.NAHB.BackgroundTransparency = 1.000
PLGv32.NAHB.BorderSizePixel = 0
PLGv32.NAHB.Size = UDim2.new(0, 161, 0, 20)
PLGv32.NAHB.Font = Enum.Font.SourceSans
PLGv32.NAHB.Text = ""
PLGv32.NAHB.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.NAHB.TextSize = 14.000
PLGv32.NAHB.Visible = false

PLGv32.Frame_32.Parent = PLGv32.NAHB
PLGv32.Frame_32.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_32.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_32.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_32.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_34.Parent = PLGv32.NAHB
PLGv32.TextLabel_34.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_34.BackgroundTransparency = 1.000
PLGv32.TextLabel_34.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_34.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_34.Font = Enum.Font.Code
PLGv32.TextLabel_34.Text = "N/A"
PLGv32.TextLabel_34.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_34.TextSize = 14.000
PLGv32.TextLabel_34.TextXAlignment = Enum.TextXAlignment.Left


PLGv32.RageBottom.Name = "BottomRage" -- Bottom
PLGv32.RageBottom.Parent = PLGv32.Rage
PLGv32.RageBottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.RageBottom.BackgroundTransparency = 1.000
PLGv32.RageBottom.BorderSizePixel = 0
PLGv32.RageBottom.Position = UDim2.new(0, 0, 0.437659025, 0)
PLGv32.RageBottom.Size = UDim2.new(0, 370, 0, 100)

PLGv32.RageListLayout.Parent = PLGv32.RageBottom -- List layout
PLGv32.RageListLayout.FillDirection = Enum.FillDirection.Horizontal
PLGv32.RageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.RageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.RageListLayout.Padding = UDim.new(0, 6)

PLGv32.RageFrame1.Name = "KillAllFrame" -- Frame
PLGv32.RageFrame1.Parent = PLGv32.RageBottom
PLGv32.RageFrame1.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.RageFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.RageFrame1.Position = UDim2.new(0, 5, 0, 0)
PLGv32.RageFrame1.Size = UDim2.new(0, 177, 0, 118)

PLGv32.RageTitleBox.Parent = PLGv32.RageFrame1
PLGv32.RageTitleBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.RageTitleBox.BackgroundTransparency = 1.000
PLGv32.RageTitleBox.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.RageTitleBox.Size = UDim2.new(0, 170, 0, 20)
PLGv32.RageTitleBox.Font = Enum.Font.Code
PLGv32.RageTitleBox.Text = "Rage Thing"
PLGv32.RageTitleBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.RageTitleBox.TextSize = 13.000
PLGv32.RageTitleBox.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.AnotherRageFrame.Parent = PLGv32.RageFrame1
PLGv32.AnotherRageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.AnotherRageFrame.BackgroundTransparency = 1.000
PLGv32.AnotherRageFrame.Position = UDim2.new(0.0451977402, 0, 0.220338985, 0)
PLGv32.AnotherRageFrame.Size = UDim2.new(0, 161, 0, 95)

PLGv32.AnotherListRage.Parent = PLGv32.AnotherRageFrame
PLGv32.AnotherListRage.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.AnotherListRage.Padding = UDim.new(0, 2)

PLGv32.KillAll.Name = "KillAll"
PLGv32.KillAll.Parent = PLGv32.AnotherRageFrame
PLGv32.KillAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.KillAll.BackgroundTransparency = 1.000
PLGv32.KillAll.BorderSizePixel = 0
PLGv32.KillAll.Size = UDim2.new(0, 161, 0, 20)
PLGv32.KillAll.Font = Enum.Font.SourceSans
PLGv32.KillAll.Text = ""
PLGv32.KillAll.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.KillAll.TextSize = 14.000
PLGv32.KillAll.MouseButton1Click:connect(function()

	PLGv32.RageFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.RageText.TextColor3 = Color3.fromRGB(255,255,255)

			e = 0
		tr = workspace.Remote.TeamEvent
		ir = workspace.Remote.ItemHandler
		re = game:GetService("ReplicatedStorage").ReloadEvent
		me = game.Players.LocalPlayer

		ir:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		tr:FireServer('Medium stone grey')
		wait(1)
			gun = me.Backpack["Remington 870"]
			args = {{},gun}
			for i,v in next, game.Players:GetPlayers() do
				if v.Character ~= nil then
					if v.Character:FindFirstChild('Head') then
						tab = {
							["RayObject"] = Ray.new(),
							["Distance"] = 0,
							["Cframe"] = CFrame.new(),
							["Hit"] = v.Character.Head
						}
						table.insert(args[1],tab)
						table.insert(args[1],tab)
						table.insert(args[1],tab)
						table.insert(args[1],tab)
						table.insert(args[1],tab)
					end
				end
			end
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(args))
			e = e + 1
			wait(.1)
			if e == 6 then
				re:FireServer(gun)
				e = 0
				wait(4)
			end

	PLGv32.RageFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.RageText.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.RageFrame.Parent = PLGv32.KillAll
PLGv32.RageFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.RageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.RageFrame.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.RageFrame.Size = UDim2.new(0, 15, 0, 15)

PLGv32.RageText.Parent = PLGv32.KillAll
PLGv32.RageText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.RageText.BackgroundTransparency = 1.000
PLGv32.RageText.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.RageText.Size = UDim2.new(0, 137, 0, 20)
PLGv32.RageText.Font = Enum.Font.Code
PLGv32.RageText.Text = "Kill All"
PLGv32.RageText.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.RageText.TextSize = 14.000
PLGv32.RageText.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.aaaaaaaaa.Name = "eeeeeeeeeFrame" -- Frame
PLGv32.aaaaaaaaa.Parent = PLGv32.RageBottom
PLGv32.aaaaaaaaa.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.aaaaaaaaa.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.aaaaaaaaa.Position = UDim2.new(0, 5, 0, 0)
PLGv32.aaaaaaaaa.Size = UDim2.new(0, 177, 0, 118)
PLGv32.aaaaaaaaa.BackgroundTransparency = 1.000

PLGv32.bbbbbbbbbb.Parent = PLGv32.aaaaaaaaa
PLGv32.bbbbbbbbbb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.bbbbbbbbbb.BackgroundTransparency = 1.000
PLGv32.bbbbbbbbbb.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.bbbbbbbbbb.Size = UDim2.new(0, 170, 0, 20)
PLGv32.bbbbbbbbbb.Font = Enum.Font.Code
PLGv32.bbbbbbbbbb.Text = ""
PLGv32.bbbbbbbbbb.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.bbbbbbbbbb.TextSize = 13.000
PLGv32.bbbbbbbbbb.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.cccccccc.Parent = PLGv32.aaaaaaaaa
PLGv32.cccccccc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.cccccccc.BackgroundTransparency = 1.000
PLGv32.cccccccc.Position = UDim2.new(0.0451977402, 0, 0.220338985, 0)
PLGv32.cccccccc.Size = UDim2.new(0, 161, 0, 95)

PLGv32.dddddddd.Parent = PLGv32.cccccccc
PLGv32.dddddddd.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.dddddddd.Padding = UDim.new(0, 2)

PLGv32.eeeeeeeee.Name = "eeeeeeeee"
PLGv32.eeeeeeeee.Parent = PLGv32.cccccccc
PLGv32.eeeeeeeee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.eeeeeeeee.BackgroundTransparency = 1.000
PLGv32.eeeeeeeee.BorderSizePixel = 0
PLGv32.eeeeeeeee.Size = UDim2.new(0, 161, 0, 20)
PLGv32.eeeeeeeee.Font = Enum.Font.SourceSans
PLGv32.eeeeeeeee.Text = ""
PLGv32.eeeeeeeee.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.eeeeeeeee.TextSize = 14.000
PLGv32.eeeeeeeee.MouseButton1Click:connect(function()
	-- Nothing
end)

PLGv32.ffffffff.Parent = PLGv32.eeeeeeeee
PLGv32.ffffffff.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.ffffffff.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.ffffffff.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.ffffffff.Size = UDim2.new(0, 15, 0, 15)
PLGv32.ffffffff.BackgroundTransparency = 1.000

PLGv32.gggggggg.Parent = PLGv32.eeeeeeeee
PLGv32.gggggggg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.gggggggg.BackgroundTransparency = 1.000
PLGv32.gggggggg.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.gggggggg.Size = UDim2.new(0, 137, 0, 20)
PLGv32.gggggggg.Font = Enum.Font.Code
PLGv32.gggggggg.Text = ""
PLGv32.gggggggg.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.gggggggg.TextSize = 14.000
PLGv32.gggggggg.TextXAlignment = Enum.TextXAlignment.Left


PLGv32.Misc.Name = "Misc"
PLGv32.Misc.Parent = PLGv32.Holder
PLGv32.Misc.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.Misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Misc.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.Misc.Size = UDim2.new(0, 370, 0, 393)
PLGv32.Misc.Visible = false

PLGv32.Top_3.Name = "Top"
PLGv32.Top_3.Parent = PLGv32.Misc
PLGv32.Top_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Top_3.BackgroundTransparency = 1.000
PLGv32.Top_3.BorderSizePixel = 0
PLGv32.Top_3.Position = UDim2.new(0, 0, 0.0127226459, 0)
PLGv32.Top_3.Size = UDim2.new(0, 370, 0, 22)

PLGv32.UIListLayout_11.Parent = PLGv32.Top_3
PLGv32.UIListLayout_11.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_11.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_11.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_11.Padding = UDim.new(0, 6)

PLGv32.ModGunsFrame.Name = "ModGunsFrame"
PLGv32.ModGunsFrame.Parent = PLGv32.Top_3
PLGv32.ModGunsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.ModGunsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.ModGunsFrame.Position = UDim2.new(0, 188, 0, 5)
PLGv32.ModGunsFrame.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_35.Parent = PLGv32.ModGunsFrame
PLGv32.TextLabel_35.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_35.BackgroundTransparency = 1.000
PLGv32.TextLabel_35.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_35.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_35.Font = Enum.Font.Code
PLGv32.TextLabel_35.Text = "Mod Guns"
PLGv32.TextLabel_35.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_35.TextSize = 13.000
PLGv32.TextLabel_35.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_33.Parent = PLGv32.ModGunsFrame
PLGv32.Frame_33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_33.BackgroundTransparency = 1.000
PLGv32.Frame_33.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_33.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_12.Parent = PLGv32.Frame_33
PLGv32.UIListLayout_12.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_12.Padding = UDim.new(0, 2)

PLGv32.M4A1_2.Name = "M4A1"
PLGv32.M4A1_2.Parent = PLGv32.Frame_33
PLGv32.M4A1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.M4A1_2.BackgroundTransparency = 1.000
PLGv32.M4A1_2.BorderSizePixel = 0
PLGv32.M4A1_2.Size = UDim2.new(0, 161, 0, 20)
PLGv32.M4A1_2.Font = Enum.Font.SourceSans
PLGv32.M4A1_2.Text = ""
PLGv32.M4A1_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.M4A1_2.TextSize = 14.000
PLGv32.M4A1_2.MouseButton1Click:connect(function()

	PLGv32.Frame_34.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_36.TextColor3 = Color3.fromRGB(255,255,255)

	S = game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1").GunStates
	if getgenv().Shadow_Loaded then
		setidentity(2)
		rs = require(S)
		setidentity(7)
	else
		rs = require(S)
	end
	for i, v in next, rs do
		rs.Bullets = 10
		rs.Range = 999
		rs.AutoFire = true
		rs.FireRate = 0.1
	end

	wait(0.3)
	PLGv32.Frame_34.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_36.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_34.Parent = PLGv32.M4A1_2
PLGv32.Frame_34.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_34.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_34.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_34.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_36.Parent = PLGv32.M4A1_2
PLGv32.TextLabel_36.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_36.BackgroundTransparency = 1.000
PLGv32.TextLabel_36.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_36.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_36.Font = Enum.Font.Code
PLGv32.TextLabel_36.Text = "M4A1"
PLGv32.TextLabel_36.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_36.TextSize = 14.000
PLGv32.TextLabel_36.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.AK47_2.Name = "AK47"
PLGv32.AK47_2.Parent = PLGv32.Frame_33
PLGv32.AK47_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.AK47_2.BackgroundTransparency = 1.000
PLGv32.AK47_2.BorderSizePixel = 0
PLGv32.AK47_2.Size = UDim2.new(0, 161, 0, 20)
PLGv32.AK47_2.Font = Enum.Font.SourceSans
PLGv32.AK47_2.Text = ""
PLGv32.AK47_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.AK47_2.TextSize = 14.000
PLGv32.AK47_2.MouseButton1Click:connect(function()

	PLGv32.Frame_35.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_37.TextColor3 = Color3.fromRGB(255,255,255)

	S = game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47").GunStates
	if getgenv().Shadow_Loaded then
		setidentity(2)
		rs = require(S)
		setidentity(7)
	else
		rs = require(S)
	end
	for i, v in next, rs do
		rs.Bullets = 10
		rs.Range = 999
		rs.AutoFire = true
		rs.FireRate = 0.1
	end

	wait(0.3)
	PLGv32.Frame_35.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_37.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_35.Parent = PLGv32.AK47_2
PLGv32.Frame_35.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_35.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_35.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_35.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_37.Parent = PLGv32.AK47_2
PLGv32.TextLabel_37.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_37.BackgroundTransparency = 1.000
PLGv32.TextLabel_37.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_37.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_37.Font = Enum.Font.Code
PLGv32.TextLabel_37.Text = "AK-47"
PLGv32.TextLabel_37.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_37.TextSize = 14.000
PLGv32.TextLabel_37.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Shotgun_2.Name = "Shotgun"
PLGv32.Shotgun_2.Parent = PLGv32.Frame_33
PLGv32.Shotgun_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Shotgun_2.BackgroundTransparency = 1.000
PLGv32.Shotgun_2.BorderSizePixel = 0
PLGv32.Shotgun_2.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Shotgun_2.Font = Enum.Font.SourceSans
PLGv32.Shotgun_2.Text = ""
PLGv32.Shotgun_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Shotgun_2.TextSize = 14.000
PLGv32.Shotgun_2.MouseButton1Click:connect(function()

	PLGv32.Frame_36.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_38.TextColor3 = Color3.fromRGB(255,255,255)

	S = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870").GunStates
	if getgenv().Shadow_Loaded then
		setidentity(2)
		rs = require(S)
		setidentity(7)
	else
		rs = require(S)
	end
	for i, v in next, rs do
		rs.Bullets = 50
		rs.AutoFire = true
		rs.Range = 999
		rs.AutoFire = true
		rs.FireRate = 0.1
	end

	wait(0.3)
	PLGv32.Frame_36.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_38.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_36.Parent = PLGv32.Shotgun_2
PLGv32.Frame_36.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_36.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_36.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_36.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_38.Parent = PLGv32.Shotgun_2
PLGv32.TextLabel_38.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_38.BackgroundTransparency = 1.000
PLGv32.TextLabel_38.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_38.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_38.Font = Enum.Font.Code
PLGv32.TextLabel_38.Text = "Remington 870"
PLGv32.TextLabel_38.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_38.TextSize = 14.000
PLGv32.TextLabel_38.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.M9_2.Name = "M9"
PLGv32.M9_2.Parent = PLGv32.Frame_33
PLGv32.M9_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.M9_2.BackgroundTransparency = 1.000
PLGv32.M9_2.BorderSizePixel = 0
PLGv32.M9_2.Size = UDim2.new(0, 161, 0, 20)
PLGv32.M9_2.Font = Enum.Font.SourceSans
PLGv32.M9_2.Text = ""
PLGv32.M9_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.M9_2.TextSize = 14.000
PLGv32.M9_2.MouseButton1Click:connect(function()

	PLGv32.Frame_37.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_39.TextColor3 = Color3.fromRGB(255,255,255)

	S = game.Players.LocalPlayer.Backpack:FindFirstChild("M9").GunStates
	if getgenv().Shadow_Loaded then
		setidentity(2)
		rs = require(S)
		setidentity(7)
	else
		rs = require(S)
	end
	for i, v in next, rs do
		rs.Bullets = 10
		rs.Range = 999
		rs.AutoFire = true
		rs.FireRate = 0.1
	end

	wait(0.3)
	PLGv32.Frame_37.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_39.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_37.Parent = PLGv32.M9_2
PLGv32.Frame_37.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_37.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_37.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_37.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_39.Parent = PLGv32.M9_2
PLGv32.TextLabel_39.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_39.BackgroundTransparency = 1.000
PLGv32.TextLabel_39.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_39.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_39.Font = Enum.Font.Code
PLGv32.TextLabel_39.Text = "M9"
PLGv32.TextLabel_39.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_39.TextSize = 14.000
PLGv32.TextLabel_39.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Map.Name = "Map"
PLGv32.Map.Parent = PLGv32.Top_3
PLGv32.Map.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.Map.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Map.Position = UDim2.new(0, 188, 0, 5)
PLGv32.Map.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_40.Parent = PLGv32.Map
PLGv32.TextLabel_40.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_40.BackgroundTransparency = 1.000
PLGv32.TextLabel_40.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_40.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_40.Font = Enum.Font.Code
PLGv32.TextLabel_40.Text = "Map Mods"
PLGv32.TextLabel_40.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_40.TextSize = 13.000
PLGv32.TextLabel_40.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_38.Parent = PLGv32.Map
PLGv32.Frame_38.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_38.BackgroundTransparency = 1.000
PLGv32.Frame_38.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_38.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_13.Parent = PLGv32.Frame_38
PLGv32.UIListLayout_13.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_13.Padding = UDim.new(0, 2)

PLGv32.Doors.Name = "Doors"
PLGv32.Doors.Parent = PLGv32.Frame_38
PLGv32.Doors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Doors.BackgroundTransparency = 1.000
PLGv32.Doors.BorderSizePixel = 0
PLGv32.Doors.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Doors.Font = Enum.Font.SourceSans
PLGv32.Doors.Text = ""
PLGv32.Doors.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Doors.TextSize = 14.000

doortoggle = false
PLGv32.Doors.MouseButton1Click:Connect(function()
	if not doortoggle then doortoggle = true
		PLGv32.Frame_39.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_41.TextColor3 = Color3.fromRGB(255,255,255)

		game.workspace.Doors.Parent = game.lighting

	else doortoggle = false 
		PLGv32.Frame_39.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_41.TextColor3 = Color3.fromRGB(77, 77, 77)

		game.lighting.Doors.Parent = game.workspace

	end
end)

PLGv32.Frame_39.Parent = PLGv32.Doors
PLGv32.Frame_39.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_39.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_39.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_39.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_41.Parent = PLGv32.Doors
PLGv32.TextLabel_41.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_41.BackgroundTransparency = 1.000
PLGv32.TextLabel_41.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_41.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_41.Font = Enum.Font.Code
PLGv32.TextLabel_41.Text = "Toggle Doors"
PLGv32.TextLabel_41.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_41.TextSize = 14.000
PLGv32.TextLabel_41.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Fences.Name = "Fences"
PLGv32.Fences.Parent = PLGv32.Frame_38
PLGv32.Fences.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Fences.BackgroundTransparency = 1.000
PLGv32.Fences.BorderSizePixel = 0
PLGv32.Fences.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Fences.Font = Enum.Font.SourceSans
PLGv32.Fences.Text = ""
PLGv32.Fences.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Fences.TextSize = 14.000

fencestoggle = false
PLGv32.Fences.MouseButton1Click:Connect(function()
	if not fencestoggle then fencestoggle = true
		PLGv32.Frame_40.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_42.TextColor3 = Color3.fromRGB(255,255,255)

		game.workspace.Prison_Fences.Parent = game.lighting

	else fencestoggle = false 
		PLGv32.Frame_40.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_42.TextColor3 = Color3.fromRGB(77, 77, 77)

		game.lighting.Prison_Fences.Parent = game.workspace

	end
end)

PLGv32.Frame_40.Parent = PLGv32.Fences
PLGv32.Frame_40.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_40.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_40.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_40.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_42.Parent = PLGv32.Fences
PLGv32.TextLabel_42.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_42.BackgroundTransparency = 1.000
PLGv32.TextLabel_42.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_42.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_42.Font = Enum.Font.Code
PLGv32.TextLabel_42.Text = "Toggle Fences"
PLGv32.TextLabel_42.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_42.TextSize = 14.000
PLGv32.TextLabel_42.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Bottom_2.Name = "Bottom"
PLGv32.Bottom_2.Parent = PLGv32.Misc
PLGv32.Bottom_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Bottom_2.BackgroundTransparency = 1.000
PLGv32.Bottom_2.BorderSizePixel = 0
PLGv32.Bottom_2.Position = UDim2.new(0, 0, 0.437659025, 0)
PLGv32.Bottom_2.Size = UDim2.new(0, 370, 0, 100)

PLGv32.UIListLayout_14.Parent = PLGv32.Bottom_2
PLGv32.UIListLayout_14.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_14.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_14.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_14.Padding = UDim.new(0, 6)

PLGv32.OtherLocal_2.Name = "OtherLocal"
PLGv32.OtherLocal_2.Parent = PLGv32.Bottom_2
PLGv32.OtherLocal_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.OtherLocal_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.OtherLocal_2.Position = UDim2.new(0, 5, 0, 0)
PLGv32.OtherLocal_2.Size = UDim2.new(0, 177, 0, 118)

PLGv32.TextLabel_43.Parent = PLGv32.OtherLocal_2
PLGv32.TextLabel_43.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_43.BackgroundTransparency = 1.000
PLGv32.TextLabel_43.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_43.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_43.Font = Enum.Font.Code
PLGv32.TextLabel_43.Text = "Server"
PLGv32.TextLabel_43.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_43.TextSize = 13.000
PLGv32.TextLabel_43.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_41.Parent = PLGv32.OtherLocal_2
PLGv32.Frame_41.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_41.BackgroundTransparency = 1.000
PLGv32.Frame_41.Position = UDim2.new(0.0451977402, 0, 0.220338985, 0)
PLGv32.Frame_41.Size = UDim2.new(0, 161, 0, 95)

PLGv32.UIListLayout_15.Parent = PLGv32.Frame_41
PLGv32.UIListLayout_15.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_15.Padding = UDim.new(0, 2)

PLGv32.ArrestAll.Name = "ArrestAll"
PLGv32.ArrestAll.Parent = PLGv32.Frame_41
PLGv32.ArrestAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.ArrestAll.BackgroundTransparency = 1.000
PLGv32.ArrestAll.BorderSizePixel = 0
PLGv32.ArrestAll.Size = UDim2.new(0, 161, 0, 20)
PLGv32.ArrestAll.Font = Enum.Font.SourceSans
PLGv32.ArrestAll.Text = ""
PLGv32.ArrestAll.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.ArrestAll.TextSize = 14.000
PLGv32.ArrestAll.MouseButton1Click:connect(function()

	PLGv32.Frame_42.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_44.TextColor3 = Color3.fromRGB(255,255,255)

	local Player = game.Players.LocalPlayer
	local cpos = Player.Character.HumanoidRootPart.CFrame
	for i, v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 10
			repeat
				wait()
				i = i - 1
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
			until i == 0
		end
	end

	PLGv32.Frame_42.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_44.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_42.Parent = PLGv32.ArrestAll
PLGv32.Frame_42.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_42.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_42.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_42.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_44.Parent = PLGv32.ArrestAll
PLGv32.TextLabel_44.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_44.BackgroundTransparency = 1.000
PLGv32.TextLabel_44.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_44.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_44.Font = Enum.Font.Code
PLGv32.TextLabel_44.Text = "Arrest All"
PLGv32.TextLabel_44.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_44.TextSize = 14.000
PLGv32.TextLabel_44.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.CriminalAll.Name = "CriminalAll"
PLGv32.CriminalAll.Parent = PLGv32.Frame_41
PLGv32.CriminalAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.CriminalAll.BackgroundTransparency = 1.000
PLGv32.CriminalAll.BorderSizePixel = 0
PLGv32.CriminalAll.Size = UDim2.new(0, 161, 0, 20)
PLGv32.CriminalAll.Font = Enum.Font.SourceSans
PLGv32.CriminalAll.Text = ""
PLGv32.CriminalAll.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.CriminalAll.TextSize = 14.000
PLGv32.CriminalAll.Visible = false

PLGv32.Frame_43.Parent = PLGv32.CriminalAll
PLGv32.Frame_43.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_43.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_43.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_43.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_45.Parent = PLGv32.CriminalAll
PLGv32.TextLabel_45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_45.BackgroundTransparency = 1.000
PLGv32.TextLabel_45.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_45.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_45.Font = Enum.Font.Code
PLGv32.TextLabel_45.Text = "Criminal All"
PLGv32.TextLabel_45.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_45.TextSize = 14.000
PLGv32.TextLabel_45.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.CrashAll.Name = "CrashAll"
PLGv32.CrashAll.Parent = PLGv32.Frame_41
PLGv32.CrashAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.CrashAll.BackgroundTransparency = 1.000
PLGv32.CrashAll.BorderSizePixel = 0
PLGv32.CrashAll.Size = UDim2.new(0, 161, 0, 20)
PLGv32.CrashAll.Font = Enum.Font.SourceSans
PLGv32.CrashAll.Text = ""
PLGv32.CrashAll.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.CrashAll.TextSize = 14.000
PLGv32.CrashAll.MouseButton1Click:connect(function()

	PLGv32.Frame_44.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_46.TextColor3 = Color3.fromRGB(255,255,255)

	StaminaMsg("02 Lag...",2)

	-- 02hacks LAg

	function LagFunc(Args)
		if game.Players:FindFirstChild(Args) and game.Workspace:FindFirstChild(Args) and game.Workspace[Args]:FindFirstChild("Head") then
			LAgT = {}
			for i = 1,2500 do
				table.insert(LAgT,{
					["RayObject"] = Ray.new(game.Players[Args].Character.Head.Position * Vector3.new(1,1,-2), game.Players[Args].Character.Head.Position * Vector3.new(1,1,2)),
					["Distance"] = 10000, 
					["Cframe"] = game.Players[Args].Character.Head.CFrame, 
					["Hit"] = game.Players[Args].Character.Head
				})
			end
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
			for i = 1,100 do 
				game.ReplicatedStorage.ShootEvent:FireServer(LAgT, game.Players.LocalPlayer.Backpack.M9)
			end
		end
	end
	warn("PLG v3.2 lag started...Made by 02hacks")
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			LagFunc(v.Name)
		end
	end
	wait(5)

	wait(0.3)
	PLGv32.Frame_44.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_46.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_44.Parent = PLGv32.CrashAll
PLGv32.Frame_44.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_44.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_44.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_44.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_46.Parent = PLGv32.CrashAll
PLGv32.TextLabel_46.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_46.BackgroundTransparency = 1.000
PLGv32.TextLabel_46.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_46.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_46.Font = Enum.Font.Code
PLGv32.TextLabel_46.Text = "Lag Server"
PLGv32.TextLabel_46.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_46.TextSize = 14.000
PLGv32.TextLabel_46.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Invisible.Name = "Invisible"
PLGv32.Invisible.Parent = PLGv32.Frame_41
PLGv32.Invisible.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Invisible.BackgroundTransparency = 1.000
PLGv32.Invisible.BorderSizePixel = 0
PLGv32.Invisible.Size = UDim2.new(0, 161, 0, 20)
PLGv32.Invisible.Font = Enum.Font.SourceSans
PLGv32.Invisible.Text = ""
PLGv32.Invisible.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Invisible.TextSize = 14.000
PLGv32.Invisible.MouseButton1Click:connect(function()

	PLGv32.Frame_45.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_47.TextColor3 = Color3.fromRGB(255,255,255)

	local player = game.Players.LocalPlayer
	position = player.Character.HumanoidRootPart.Position
	wait(0.1)
	player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
	wait(0.1)
	humanoidrootpart = player.Character.HumanoidRootPart:clone()
	wait(0.1)
	player.Character.HumanoidRootPart:Destroy()
	humanoidrootpart.Parent = player.Character
	player.Character:MoveTo(position)
	wait()
	-- Remove this if you want to see yourself (others still won't see you)
	game.Players.LocalPlayer.Character.Torso.Transparency = 1
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
	game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
	game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
	game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
	game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
	game.Players.LocalPlayer.Character.Head.face:Remove()

	wait(0.3)
	PLGv32.Frame_45.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_47.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_45.Parent = PLGv32.Invisible
PLGv32.Frame_45.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_45.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_45.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_45.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_47.Parent = PLGv32.Invisible
PLGv32.TextLabel_47.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_47.BackgroundTransparency = 1.000
PLGv32.TextLabel_47.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_47.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_47.Font = Enum.Font.Code
PLGv32.TextLabel_47.Text = "Invisible"
PLGv32.TextLabel_47.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_47.TextSize = 14.000
PLGv32.TextLabel_47.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Player.Name = "Player"
PLGv32.Player.Parent = PLGv32.Bottom_2
PLGv32.Player.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.Player.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Player.Position = UDim2.new(0, 188, 0, 0)
PLGv32.Player.Size = UDim2.new(0, 177, 0, 175)

PLGv32.TextLabel_48.Parent = PLGv32.Player
PLGv32.TextLabel_48.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_48.BackgroundTransparency = 1.000
PLGv32.TextLabel_48.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_48.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_48.Font = Enum.Font.Code
PLGv32.TextLabel_48.Text = "Local Player"
PLGv32.TextLabel_48.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_48.TextSize = 13.000
PLGv32.TextLabel_48.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_46.Parent = PLGv32.Player
PLGv32.Frame_46.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_46.BackgroundTransparency = 1.000
PLGv32.Frame_46.Position = UDim2.new(0.0451977402, 0, 0.148571432, 0)
PLGv32.Frame_46.Size = UDim2.new(0, 161, 0, 106)

PLGv32.UIListLayout_16.Parent = PLGv32.Frame_46
PLGv32.UIListLayout_16.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_16.Padding = UDim.new(0, 2)

PLGv32.ClickArrest.Name = "ClickArrest"
PLGv32.ClickArrest.Parent = PLGv32.Frame_46
PLGv32.ClickArrest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.ClickArrest.BackgroundTransparency = 1.000
PLGv32.ClickArrest.BorderSizePixel = 0
PLGv32.ClickArrest.Size = UDim2.new(0, 161, 0, 20)
PLGv32.ClickArrest.Font = Enum.Font.SourceSans
PLGv32.ClickArrest.Text = ""
PLGv32.ClickArrest.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.ClickArrest.TextSize = 14.000
PLGv32.ClickArrest.MouseButton1Click:connect(function()

	PLGv32.Frame_47.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_49.TextColor3 = Color3.fromRGB(255,255,255)

	local mouse = game.Players.LocalPlayer:GetMouse()
	local arrestEvent = game.Workspace.Remote.arrest
	mouse.Button1Down:connect(
		function()
			local obj = mouse.Target
			local response = arrestEvent:InvokeServer(obj)
		end)

end)

PLGv32.Frame_47.Parent = PLGv32.ClickArrest
PLGv32.Frame_47.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_47.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_47.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_47.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_49.Parent = PLGv32.ClickArrest
PLGv32.TextLabel_49.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_49.BackgroundTransparency = 1.000
PLGv32.TextLabel_49.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_49.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_49.Font = Enum.Font.Code
PLGv32.TextLabel_49.Text = "Click Arrest"
PLGv32.TextLabel_49.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_49.TextSize = 14.000
PLGv32.TextLabel_49.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.FindKeycard.Name = "FindKeycard"
PLGv32.FindKeycard.Parent = PLGv32.Frame_46
PLGv32.FindKeycard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.FindKeycard.BackgroundTransparency = 1.000
PLGv32.FindKeycard.BorderSizePixel = 0
PLGv32.FindKeycard.Size = UDim2.new(0, 161, 0, 20)
PLGv32.FindKeycard.Font = Enum.Font.SourceSans
PLGv32.FindKeycard.Text = ""
PLGv32.FindKeycard.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.FindKeycard.TextSize = 14.000
PLGv32.FindKeycard.MouseButton1Click:connect(function()

	PLGv32.Frame_48.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_50.TextColor3 = Color3.fromRGB(255,255,255)

	local Key = Workspace.Prison_ITEMS.single:WaitForChild("Key card")
	
	PLGv32.Frame_48.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_50.TextColor3 = Color3.fromRGB(77, 77, 77)
	game.Workspace.Remote.ItemHandler:InvokeServer(Key.ITEMPICKUP)

end)

PLGv32.Frame_48.Parent = PLGv32.FindKeycard
PLGv32.Frame_48.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_48.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_48.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_48.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_50.Parent = PLGv32.FindKeycard
PLGv32.TextLabel_50.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_50.BackgroundTransparency = 1.000
PLGv32.TextLabel_50.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_50.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_50.Font = Enum.Font.Code
PLGv32.TextLabel_50.Text = "Find Keycard"
PLGv32.TextLabel_50.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_50.TextSize = 14.000
PLGv32.TextLabel_50.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.FlyCar.Name = "FlyCar"
PLGv32.FlyCar.Parent = PLGv32.Frame_46
PLGv32.FlyCar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.FlyCar.BackgroundTransparency = 1.000
PLGv32.FlyCar.BorderSizePixel = 0
PLGv32.FlyCar.Size = UDim2.new(0, 161, 0, 20)
PLGv32.FlyCar.Font = Enum.Font.SourceSans
PLGv32.FlyCar.Text = ""
PLGv32.FlyCar.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.FlyCar.TextSize = 14.000
PLGv32.FlyCar.MouseButton1Click:connect(function()

	PLGv32.Frame_49.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_51.TextColor3 = Color3.fromRGB(255,255,255)

	local hint = Instance.new("Hint", game.Players.LocalPlayer.PlayerGui)
	hint.Text = "Press [Z] for toggle"
	hint.Name = game.JobId

	wait(0.3)
	PLGv32.Frame_49.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_51.TextColor3 = Color3.fromRGB(77, 77, 77)

	repeat
		wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and
		game.Players.LocalPlayer.Character:findFirstChild("Torso") and
		game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()
	repeat
		wait()
	until mouse
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 500
	local speed = 0

	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat
			wait()
			plr.Character.Humanoid.PlatformStand = false
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed + 125.0 + (speed / maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed - 250
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
			else
				bv.velocity = Vector3.new(0, 0.1, 0)
			end
			bg.cframe =
				game.Workspace.CurrentCamera.CoordinateFrame *
				CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(
		function(key)
			if key:lower() == "z" then
				if flying then
					flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end
	)
	mouse.KeyUp:connect(
		function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
			wait(5)
			hint:Destroy()
		end
	)
	Fly()

end)

PLGv32.Frame_49.Parent = PLGv32.FlyCar
PLGv32.Frame_49.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_49.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_49.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_49.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_51.Parent = PLGv32.FlyCar
PLGv32.TextLabel_51.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_51.BackgroundTransparency = 1.000
PLGv32.TextLabel_51.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_51.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_51.Font = Enum.Font.Code
PLGv32.TextLabel_51.Text = "Fly Car"
PLGv32.TextLabel_51.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_51.TextSize = 14.000
PLGv32.TextLabel_51.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.InfStamina.Name = "InfStamina"
PLGv32.InfStamina.Parent = PLGv32.Frame_46
PLGv32.InfStamina.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.InfStamina.BackgroundTransparency = 1.000
PLGv32.InfStamina.BorderSizePixel = 0
PLGv32.InfStamina.Size = UDim2.new(0, 161, 0, 20)
PLGv32.InfStamina.Font = Enum.Font.SourceSans
PLGv32.InfStamina.Text = ""
PLGv32.InfStamina.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.InfStamina.TextSize = 14.000

game.Players.LocalPlayer.CharacterAdded:connect(
	function()
		wait(0.5)
		if game.Players.LocalPlayer.Character:FindFirstChild("ClientInputHandler") and stam == true then
			InfPunch(math.huge)
		end
	end
)

function InfPunch(Args)
	for i,v in next, getreg() do -- InfStamina Created 09.07.22
    if type(v) == 'function' then
        local t = debug.getupvalues(v) --a1
        for i2,v2 in next, t do
            if typeof(t[7]) == "function" and i2 == 4 and typeof(v2) == "number" then
                debug.setupvalue(v,i2,Args)
                --warn(v2,table.foreach(t,print))
                --print("inf stamina success")
            end
        end
    end
end
end
stam = false
PLGv32.InfStamina.MouseButton1Click:connect(function()

	if stam == false then
		stam = true
		PLGv32.Frame_50.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_52.TextColor3 = Color3.fromRGB(255,255,255)
		InfPunch(math.huge)
	else
		stam = false
		PLGv32.Frame_50.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_52.TextColor3 = Color3.fromRGB(77, 77, 77)
		InfPunch(12)
	end

end)


PLGv32.Frame_50.Parent = PLGv32.InfStamina
PLGv32.Frame_50.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_50.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_50.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_50.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_52.Parent = PLGv32.InfStamina
PLGv32.TextLabel_52.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_52.BackgroundTransparency = 1.000
PLGv32.TextLabel_52.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_52.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_52.Font = Enum.Font.Code
PLGv32.TextLabel_52.Text = "Inf Stamina"
PLGv32.TextLabel_52.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_52.TextSize = 14.000
PLGv32.TextLabel_52.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.AutoRespawn.Name = "AutoRespawn"
PLGv32.AutoRespawn.Parent = PLGv32.Frame_46
PLGv32.AutoRespawn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.AutoRespawn.BackgroundTransparency = 1.000
PLGv32.AutoRespawn.BorderSizePixel = 0
PLGv32.AutoRespawn.Size = UDim2.new(0, 161, 0, 20)
PLGv32.AutoRespawn.Font = Enum.Font.SourceSans
PLGv32.AutoRespawn.Text = ""
PLGv32.AutoRespawn.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.AutoRespawn.TextSize = 14.000

autorr = false
PLGv32.AutoRespawn.MouseButton1Click:connect(function()

	if not autorr then
		autorr = true
		PLGv32.Frame_51.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		PLGv32.TextLabel_53.TextColor3 = Color3.fromRGB(255,255,255)

		local blah = (game.Players.LocalPlayer.Name)

		_G.Looop = true

		while _G.Looop == true do
			wait(0.1)
			if game:GetService("Workspace")[blah].Humanoid.Health == 0 then
				saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				local A_1 = "LocalPlayer"

				local Event = game:GetService("Workspace").Remote.loadchar
				Event:InvokeServer(A_1)

				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
			end
		end
	else
		autorr = false
		PLGv32.Frame_51.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		PLGv32.TextLabel_53.TextColor3 = Color3.fromRGB(77, 77, 77)

		local blah = (game.Players.LocalPlayer.Name)

		_G.Looop = false

		while _G.Looop == true do
			wait(0.1)
			if game:GetService("Workspace")[blah].Humanoid.Health == 0 then
				saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				local A_1 = "LocalPlayer"

				local Event = game:GetService("Workspace").Remote.loadchar
				Event:InvokeServer(A_1)

				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
			end
		end
	end

end)

PLGv32.Frame_51.Parent = PLGv32.AutoRespawn
PLGv32.Frame_51.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_51.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_51.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_51.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_53.Parent = PLGv32.AutoRespawn
PLGv32.TextLabel_53.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_53.BackgroundTransparency = 1.000
PLGv32.TextLabel_53.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_53.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_53.Font = Enum.Font.Code
PLGv32.TextLabel_53.Text = "Auto Respawn"
PLGv32.TextLabel_53.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_53.TextSize = 14.000
PLGv32.TextLabel_53.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Teleport.Name = "Teleport"
PLGv32.Teleport.Parent = PLGv32.Holder
PLGv32.Teleport.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.Teleport.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Teleport.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.Teleport.Size = UDim2.new(0, 370, 0, 393)
PLGv32.Teleport.Visible = false

PLGv32.Top_4.Name = "Top"
PLGv32.Top_4.Parent = PLGv32.Teleport
PLGv32.Top_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Top_4.BackgroundTransparency = 1.000
PLGv32.Top_4.BorderSizePixel = 0
PLGv32.Top_4.Position = UDim2.new(0, 0, 0.0127226459, 0)
PLGv32.Top_4.Size = UDim2.new(0, 370, 0, 22)

PLGv32.UIListLayout_17.Parent = PLGv32.Top_4
PLGv32.UIListLayout_17.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_17.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_17.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_17.Padding = UDim.new(0, 6)

PLGv32.InsidePrison.Name = "InsidePrison"
PLGv32.InsidePrison.Parent = PLGv32.Top_4
PLGv32.InsidePrison.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.InsidePrison.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.InsidePrison.Position = UDim2.new(0, 188, 0, 5)
PLGv32.InsidePrison.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_54.Parent = PLGv32.InsidePrison
PLGv32.TextLabel_54.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_54.BackgroundTransparency = 1.000
PLGv32.TextLabel_54.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_54.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_54.Font = Enum.Font.Code
PLGv32.TextLabel_54.Text = "Inside Prison"
PLGv32.TextLabel_54.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_54.TextSize = 13.000
PLGv32.TextLabel_54.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_52.Parent = PLGv32.InsidePrison
PLGv32.Frame_52.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_52.BackgroundTransparency = 1.000
PLGv32.Frame_52.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_52.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_18.Parent = PLGv32.Frame_52
PLGv32.UIListLayout_18.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_18.Padding = UDim.new(0, 2)

PLGv32.blank.Name = "blank"
PLGv32.blank.Parent = PLGv32.Frame_52
PLGv32.blank.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank.BackgroundTransparency = 1.000
PLGv32.blank.BorderSizePixel = 0
PLGv32.blank.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank.Font = Enum.Font.SourceSans
PLGv32.blank.Text = ""
PLGv32.blank.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank.TextSize = 14.000
PLGv32.blank.MouseButton1Click:connect(function()

	PLGv32.Frame_53.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_55.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822.223694, 99.9900055, 2259.9043)

	wait(0.3)
	PLGv32.Frame_53.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_55.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_53.Parent = PLGv32.blank
PLGv32.Frame_53.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_53.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_53.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_53.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_55.Parent = PLGv32.blank
PLGv32.TextLabel_55.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_55.BackgroundTransparency = 1.000
PLGv32.TextLabel_55.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_55.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_55.Font = Enum.Font.Code
PLGv32.TextLabel_55.Text = "Police Room"
PLGv32.TextLabel_55.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_55.TextSize = 14.000
PLGv32.TextLabel_55.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_2.Name = "blank"
PLGv32.blank_2.Parent = PLGv32.Frame_52
PLGv32.blank_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_2.BackgroundTransparency = 1.000
PLGv32.blank_2.BorderSizePixel = 0
PLGv32.blank_2.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_2.Font = Enum.Font.SourceSans
PLGv32.blank_2.Text = ""
PLGv32.blank_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_2.TextSize = 14.000
PLGv32.blank_2.MouseButton1Click:connect(function()

	PLGv32.Frame_54.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_56.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(932.826294, 102.78994, 2429.68237)

	wait(0.3)
	PLGv32.Frame_54.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_56.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_54.Parent = PLGv32.blank_2
PLGv32.Frame_54.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_54.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_54.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_54.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_56.Parent = PLGv32.blank_2
PLGv32.TextLabel_56.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_56.BackgroundTransparency = 1.000
PLGv32.TextLabel_56.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_56.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_56.Font = Enum.Font.Code
PLGv32.TextLabel_56.Text = "Cells"
PLGv32.TextLabel_56.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_56.TextSize = 14.000
PLGv32.TextLabel_56.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_3.Name = "blank"
PLGv32.blank_3.Parent = PLGv32.Frame_52
PLGv32.blank_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_3.BackgroundTransparency = 1.000
PLGv32.blank_3.BorderSizePixel = 0
PLGv32.blank_3.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_3.Font = Enum.Font.SourceSans
PLGv32.blank_3.Text = ""
PLGv32.blank_3.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_3.TextSize = 14.000
PLGv32.blank_3.MouseButton1Click:connect(function()

	PLGv32.Frame_55.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_57.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(950.114014, 103.49472, 2288.35254)

	wait(0.3)
	PLGv32.Frame_55.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_57.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_55.Parent = PLGv32.blank_3
PLGv32.Frame_55.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_55.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_55.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_55.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_57.Parent = PLGv32.blank_3
PLGv32.TextLabel_57.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_57.BackgroundTransparency = 1.000
PLGv32.TextLabel_57.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_57.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_57.Font = Enum.Font.Code
PLGv32.TextLabel_57.Text = "Lunch Room"
PLGv32.TextLabel_57.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_57.TextSize = 14.000
PLGv32.TextLabel_57.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_4.Name = "blank"
PLGv32.blank_4.Parent = PLGv32.Frame_52
PLGv32.blank_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_4.BackgroundTransparency = 1.000
PLGv32.blank_4.BorderSizePixel = 0
PLGv32.blank_4.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_4.Font = Enum.Font.SourceSans
PLGv32.blank_4.Text = ""
PLGv32.blank_4.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_4.TextSize = 14.000
PLGv32.blank_4.MouseButton1Click:connect(function()

	PLGv32.Frame_56.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_58.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(892.443176, 102.389969, 2226.58667)

	wait(0.3)
	PLGv32.Frame_56.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_58.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_56.Parent = PLGv32.blank_4
PLGv32.Frame_56.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_56.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_56.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_56.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_58.Parent = PLGv32.blank_4
PLGv32.TextLabel_58.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_58.BackgroundTransparency = 1.000
PLGv32.TextLabel_58.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_58.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_58.Font = Enum.Font.Code
PLGv32.TextLabel_58.Text = "Kitchen"
PLGv32.TextLabel_58.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_58.TextSize = 14.000
PLGv32.TextLabel_58.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_5.Name = "blank"
PLGv32.blank_5.Parent = PLGv32.Frame_52
PLGv32.blank_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_5.BackgroundTransparency = 1.000
PLGv32.blank_5.BorderSizePixel = 0
PLGv32.blank_5.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_5.Font = Enum.Font.SourceSans
PLGv32.blank_5.Text = ""
PLGv32.blank_5.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_5.TextSize = 14.000
PLGv32.blank_5.MouseButton1Click:connect(function()

	PLGv32.Frame_57.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_59.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(842.458069, 99.9900055, 2360.79688)

	wait(0.3)
	PLGv32.Frame_57.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_59.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_57.Parent = PLGv32.blank_5
PLGv32.Frame_57.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_57.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_57.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_57.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_59.Parent = PLGv32.blank_5
PLGv32.TextLabel_59.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_59.BackgroundTransparency = 1.000
PLGv32.TextLabel_59.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_59.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_59.Font = Enum.Font.Code
PLGv32.TextLabel_59.Text = "Hallway"
PLGv32.TextLabel_59.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_59.TextSize = 14.000
PLGv32.TextLabel_59.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_6.Name = "blank"
PLGv32.blank_6.Parent = PLGv32.Frame_52
PLGv32.blank_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_6.BackgroundTransparency = 1.000
PLGv32.blank_6.BorderSizePixel = 0
PLGv32.blank_6.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_6.Font = Enum.Font.SourceSans
PLGv32.blank_6.Text = ""
PLGv32.blank_6.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_6.TextSize = 14.000
PLGv32.blank_6.MouseButton1Click:connect(function()

	PLGv32.Frame_58.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_60.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(881.885498, 121.990089, 2231.18066)

	wait(0.3)
	PLGv32.Frame_58.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_60.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_58.Parent = PLGv32.blank_6
PLGv32.Frame_58.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_58.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_58.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_58.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_60.Parent = PLGv32.blank_6
PLGv32.TextLabel_60.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_60.BackgroundTransparency = 1.000
PLGv32.TextLabel_60.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_60.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_60.Font = Enum.Font.Code
PLGv32.TextLabel_60.Text = "Secret Room"
PLGv32.TextLabel_60.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_60.TextSize = 14.000
PLGv32.TextLabel_60.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.OutsidePrison.Name = "OutsidePrison"
PLGv32.OutsidePrison.Parent = PLGv32.Top_4
PLGv32.OutsidePrison.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.OutsidePrison.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.OutsidePrison.Position = UDim2.new(0, 188, 0, 0)
PLGv32.OutsidePrison.Size = UDim2.new(0, 177, 0, 382)

PLGv32.TextLabel_61.Parent = PLGv32.OutsidePrison
PLGv32.TextLabel_61.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_61.BackgroundTransparency = 1.000
PLGv32.TextLabel_61.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_61.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_61.Font = Enum.Font.Code
PLGv32.TextLabel_61.Text = "Outside Prison"
PLGv32.TextLabel_61.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_61.TextSize = 13.000
PLGv32.TextLabel_61.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_59.Parent = PLGv32.OutsidePrison
PLGv32.Frame_59.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_59.BackgroundTransparency = 1.000
PLGv32.Frame_59.Position = UDim2.new(0.0451977402, 0, 0.068062827, 0)
PLGv32.Frame_59.Size = UDim2.new(0, 161, 0, 139)

PLGv32.UIListLayout_19.Parent = PLGv32.Frame_59
PLGv32.UIListLayout_19.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_19.Padding = UDim.new(0, 2)

PLGv32.blank_7.Name = "blank"
PLGv32.blank_7.Parent = PLGv32.Frame_59
PLGv32.blank_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_7.BackgroundTransparency = 1.000
PLGv32.blank_7.BorderSizePixel = 0
PLGv32.blank_7.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_7.Font = Enum.Font.SourceSans
PLGv32.blank_7.Text = ""
PLGv32.blank_7.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_7.TextSize = 14.000
PLGv32.blank_7.MouseButton1Click:connect(function()

	PLGv32.Frame_60.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_62.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-910.16156, 103.23278, 2050.0564)

	wait(0.3)
	PLGv32.Frame_60.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_62.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_60.Parent = PLGv32.blank_7
PLGv32.Frame_60.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_60.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_60.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_60.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_62.Parent = PLGv32.blank_7
PLGv32.TextLabel_62.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_62.BackgroundTransparency = 1.000
PLGv32.TextLabel_62.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_62.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_62.Font = Enum.Font.Code
PLGv32.TextLabel_62.Text = "Criminal Base"
PLGv32.TextLabel_62.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_62.TextSize = 14.000
PLGv32.TextLabel_62.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_8.Name = "blank"
PLGv32.blank_8.Parent = PLGv32.Frame_59
PLGv32.blank_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_8.BackgroundTransparency = 1.000
PLGv32.blank_8.BorderSizePixel = 0
PLGv32.blank_8.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_8.Font = Enum.Font.SourceSans
PLGv32.blank_8.Text = ""
PLGv32.blank_8.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_8.TextSize = 14.000
PLGv32.blank_8.MouseButton1Click:connect(function()

	PLGv32.Frame_61.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_63.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250.98996, 72.5167236, 2377.94873)

	wait(0.3)
	PLGv32.Frame_61.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_63.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_61.Parent = PLGv32.blank_8
PLGv32.Frame_61.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_61.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_61.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_61.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_63.Parent = PLGv32.blank_8
PLGv32.TextLabel_63.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_63.BackgroundTransparency = 1.000
PLGv32.TextLabel_63.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_63.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_63.Font = Enum.Font.Code
PLGv32.TextLabel_63.Text = "Cargo"
PLGv32.TextLabel_63.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_63.TextSize = 14.000
PLGv32.TextLabel_63.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_9.Name = "blank"
PLGv32.blank_9.Parent = PLGv32.Frame_59
PLGv32.blank_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_9.BackgroundTransparency = 1.000
PLGv32.blank_9.BorderSizePixel = 0
PLGv32.blank_9.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_9.Font = Enum.Font.SourceSans
PLGv32.blank_9.Text = ""
PLGv32.blank_9.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_9.TextSize = 14.000
PLGv32.blank_9.MouseButton1Click:connect(function()

	PLGv32.Frame_62.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_64.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-372.943481, 54.2000923, 1728.36792)

	wait(0.3)
	PLGv32.Frame_62.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_64.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_62.Parent = PLGv32.blank_9
PLGv32.Frame_62.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_62.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_62.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_62.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_64.Parent = PLGv32.blank_9
PLGv32.TextLabel_64.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_64.BackgroundTransparency = 1.000
PLGv32.TextLabel_64.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_64.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_64.Font = Enum.Font.Code
PLGv32.TextLabel_64.Text = "Bus Stop"
PLGv32.TextLabel_64.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_64.TextSize = 14.000
PLGv32.TextLabel_64.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_10.Name = "blank"
PLGv32.blank_10.Parent = PLGv32.Frame_59
PLGv32.blank_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_10.BackgroundTransparency = 1.000
PLGv32.blank_10.BorderSizePixel = 0
PLGv32.blank_10.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_10.Font = Enum.Font.SourceSans
PLGv32.blank_10.Text = ""
PLGv32.blank_10.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_10.TextSize = 14.000
PLGv32.blank_10.MouseButton1Click:connect(function()

	PLGv32.Frame_63.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_65.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(432.576721, 11.8254128, 1093.12512)

	wait(0.3)
	PLGv32.Frame_63.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_65.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_63.Parent = PLGv32.blank_10
PLGv32.Frame_63.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_63.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_63.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_63.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_65.Parent = PLGv32.blank_10
PLGv32.TextLabel_65.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_65.BackgroundTransparency = 1.000
PLGv32.TextLabel_65.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_65.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_65.Font = Enum.Font.Code
PLGv32.TextLabel_65.Text = "Shooting Range"
PLGv32.TextLabel_65.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_65.TextSize = 14.000
PLGv32.TextLabel_65.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_11.Name = "blank"
PLGv32.blank_11.Parent = PLGv32.Frame_59
PLGv32.blank_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_11.BackgroundTransparency = 1.000
PLGv32.blank_11.BorderSizePixel = 0
PLGv32.blank_11.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_11.Font = Enum.Font.SourceSans
PLGv32.blank_11.Text = ""
PLGv32.blank_11.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_11.TextSize = 14.000
PLGv32.blank_11.MouseButton1Click:connect(function()

	PLGv32.Frame_64.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_66.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.0841417, 11.0993338, 1294.15894)

	wait(0.3)
	PLGv32.Frame_64.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_66.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_64.Parent = PLGv32.blank_11
PLGv32.Frame_64.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_64.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_64.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_64.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_66.Parent = PLGv32.blank_11
PLGv32.TextLabel_66.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_66.BackgroundTransparency = 1.000
PLGv32.TextLabel_66.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_66.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_66.Font = Enum.Font.Code
PLGv32.TextLabel_66.Text = "Under Highway"
PLGv32.TextLabel_66.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_66.TextSize = 14.000
PLGv32.TextLabel_66.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_12.Name = "blank"
PLGv32.blank_12.Parent = PLGv32.Frame_59
PLGv32.blank_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_12.BackgroundTransparency = 1.000
PLGv32.blank_12.BorderSizePixel = 0
PLGv32.blank_12.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_12.Font = Enum.Font.SourceSans
PLGv32.blank_12.Text = ""
PLGv32.blank_12.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_12.TextSize = 14.000
PLGv32.blank_12.MouseButton1Click:connect(function()

	PLGv32.Frame_65.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_67.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-417.322815, 54.2000923, 1748.70935)

	wait(0.3)
	PLGv32.Frame_65.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_67.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_65.Parent = PLGv32.blank_12
PLGv32.Frame_65.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_65.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_65.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_65.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_67.Parent = PLGv32.blank_12
PLGv32.TextLabel_67.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_67.BackgroundTransparency = 1.000
PLGv32.TextLabel_67.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_67.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_67.Font = Enum.Font.Code
PLGv32.TextLabel_67.Text = "Store"
PLGv32.TextLabel_67.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_67.TextSize = 14.000
PLGv32.TextLabel_67.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_13.Name = "blank"
PLGv32.blank_13.Parent = PLGv32.Frame_59
PLGv32.blank_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_13.BackgroundTransparency = 1.000
PLGv32.blank_13.BorderSizePixel = 0
PLGv32.blank_13.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_13.Font = Enum.Font.SourceSans
PLGv32.blank_13.Text = ""
PLGv32.blank_13.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_13.TextSize = 14.000
PLGv32.blank_13.MouseButton1Click:connect(function()

	PLGv32.Frame_66.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_68.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-519.523193, 54.3937874, 1656.15479)

	wait(0.3)
	PLGv32.Frame_66.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_68.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_66.Parent = PLGv32.blank_13
PLGv32.Frame_66.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_66.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_66.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_66.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_68.Parent = PLGv32.blank_13
PLGv32.TextLabel_68.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_68.BackgroundTransparency = 1.000
PLGv32.TextLabel_68.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_68.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_68.Font = Enum.Font.Code
PLGv32.TextLabel_68.Text = "Gas Station"
PLGv32.TextLabel_68.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_68.TextSize = 14.000
PLGv32.TextLabel_68.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_14.Name = "blank"
PLGv32.blank_14.Parent = PLGv32.Frame_59
PLGv32.blank_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_14.BackgroundTransparency = 1.000
PLGv32.blank_14.BorderSizePixel = 0
PLGv32.blank_14.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_14.Font = Enum.Font.SourceSans
PLGv32.blank_14.Text = ""
PLGv32.blank_14.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_14.TextSize = 14.000
PLGv32.blank_14.MouseButton1Click:connect(function()

	PLGv32.Frame_67.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_69.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-324.115814, 118.838844, 2001.27185)

	wait(0.3)
	PLGv32.Frame_67.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_69.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_67.Parent = PLGv32.blank_14
PLGv32.Frame_67.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_67.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_67.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_67.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_69.Parent = PLGv32.blank_14
PLGv32.TextLabel_69.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_69.BackgroundTransparency = 1.000
PLGv32.TextLabel_69.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_69.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_69.Font = Enum.Font.Code
PLGv32.TextLabel_69.Text = "Top Of Building"
PLGv32.TextLabel_69.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_69.TextSize = 14.000
PLGv32.TextLabel_69.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_15.Name = "blank"
PLGv32.blank_15.Parent = PLGv32.Frame_59
PLGv32.blank_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_15.BackgroundTransparency = 1.000
PLGv32.blank_15.BorderSizePixel = 0
PLGv32.blank_15.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_15.Font = Enum.Font.SourceSans
PLGv32.blank_15.Text = ""
PLGv32.blank_15.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_15.TextSize = 14.000
PLGv32.blank_15.MouseButton1Click:connect(function()

	PLGv32.Frame_68.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_70.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-226.697067, 67.4020691, 2431.72607)

	wait(0.3)
	PLGv32.Frame_68.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_70.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_68.Parent = PLGv32.blank_15
PLGv32.Frame_68.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_68.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_68.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_68.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_70.Parent = PLGv32.blank_15
PLGv32.TextLabel_70.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_70.BackgroundTransparency = 1.000
PLGv32.TextLabel_70.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_70.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_70.Font = Enum.Font.Code
PLGv32.TextLabel_70.Text = "House #1"
PLGv32.TextLabel_70.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_70.TextSize = 14.000
PLGv32.TextLabel_70.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_16.Name = "blank"
PLGv32.blank_16.Parent = PLGv32.Frame_59
PLGv32.blank_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_16.BackgroundTransparency = 1.000
PLGv32.blank_16.BorderSizePixel = 0
PLGv32.blank_16.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_16.Font = Enum.Font.SourceSans
PLGv32.blank_16.Text = ""
PLGv32.blank_16.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_16.TextSize = 14.000
PLGv32.blank_16.MouseButton1Click:connect(function()

	PLGv32.Frame_69.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_71.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-297.049377, 67.4020691, 2429.7627)

	wait(0.3)
	PLGv32.Frame_69.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_71.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_69.Parent = PLGv32.blank_16
PLGv32.Frame_69.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_69.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_69.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_69.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_71.Parent = PLGv32.blank_16
PLGv32.TextLabel_71.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_71.BackgroundTransparency = 1.000
PLGv32.TextLabel_71.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_71.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_71.Font = Enum.Font.Code
PLGv32.TextLabel_71.Text = "House #2"
PLGv32.TextLabel_71.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_71.TextSize = 14.000
PLGv32.TextLabel_71.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_17.Name = "blank"
PLGv32.blank_17.Parent = PLGv32.Frame_59
PLGv32.blank_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_17.BackgroundTransparency = 1.000
PLGv32.blank_17.BorderSizePixel = 0
PLGv32.blank_17.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_17.Font = Enum.Font.SourceSans
PLGv32.blank_17.Text = ""
PLGv32.blank_17.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_17.TextSize = 14.000
PLGv32.blank_17.MouseButton1Click:connect(function()

	PLGv32.Frame_70.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_72.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-369.891724, 67.4020691, 2431.59595)

	wait(0.3)
	PLGv32.Frame_70.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_72.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_70.Parent = PLGv32.blank_17
PLGv32.Frame_70.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_70.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_70.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_70.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_72.Parent = PLGv32.blank_17
PLGv32.TextLabel_72.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_72.BackgroundTransparency = 1.000
PLGv32.TextLabel_72.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_72.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_72.Font = Enum.Font.Code
PLGv32.TextLabel_72.Text = "House #3"
PLGv32.TextLabel_72.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_72.TextSize = 14.000
PLGv32.TextLabel_72.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_18.Name = "blank"
PLGv32.blank_18.Parent = PLGv32.Frame_59
PLGv32.blank_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_18.BackgroundTransparency = 1.000
PLGv32.blank_18.BorderSizePixel = 0
PLGv32.blank_18.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_18.Font = Enum.Font.SourceSans
PLGv32.blank_18.Text = ""
PLGv32.blank_18.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_18.TextSize = 14.000
PLGv32.blank_18.Visible = false

PLGv32.Frame_71.Parent = PLGv32.blank_18
PLGv32.Frame_71.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_71.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_71.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_71.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_73.Parent = PLGv32.blank_18
PLGv32.TextLabel_73.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_73.BackgroundTransparency = 1.000
PLGv32.TextLabel_73.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_73.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_73.Font = Enum.Font.Code
PLGv32.TextLabel_73.Text = "blank"
PLGv32.TextLabel_73.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_73.TextSize = 14.000
PLGv32.TextLabel_73.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_19.Name = "blank"
PLGv32.blank_19.Parent = PLGv32.Frame_59
PLGv32.blank_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_19.BackgroundTransparency = 1.000
PLGv32.blank_19.BorderSizePixel = 0
PLGv32.blank_19.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_19.Font = Enum.Font.SourceSans
PLGv32.blank_19.Text = ""
PLGv32.blank_19.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_19.TextSize = 14.000
PLGv32.blank_19.Visible = false

PLGv32.Frame_72.Parent = PLGv32.blank_19
PLGv32.Frame_72.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_72.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_72.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_72.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_74.Parent = PLGv32.blank_19
PLGv32.TextLabel_74.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_74.BackgroundTransparency = 1.000
PLGv32.TextLabel_74.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_74.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_74.Font = Enum.Font.Code
PLGv32.TextLabel_74.Text = "blank"
PLGv32.TextLabel_74.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_74.TextSize = 14.000
PLGv32.TextLabel_74.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_20.Name = "blank"
PLGv32.blank_20.Parent = PLGv32.Frame_59
PLGv32.blank_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_20.BackgroundTransparency = 1.000
PLGv32.blank_20.BorderSizePixel = 0
PLGv32.blank_20.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_20.Font = Enum.Font.SourceSans
PLGv32.blank_20.Text = ""
PLGv32.blank_20.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_20.TextSize = 14.000
PLGv32.blank_20.Visible = false

PLGv32.Frame_73.Parent = PLGv32.blank_20
PLGv32.Frame_73.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_73.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_73.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_73.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_75.Parent = PLGv32.blank_20
PLGv32.TextLabel_75.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_75.BackgroundTransparency = 1.000
PLGv32.TextLabel_75.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_75.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_75.Font = Enum.Font.Code
PLGv32.TextLabel_75.Text = "blank"
PLGv32.TextLabel_75.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_75.TextSize = 14.000
PLGv32.TextLabel_75.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_21.Name = "blank"
PLGv32.blank_21.Parent = PLGv32.Frame_59
PLGv32.blank_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_21.BackgroundTransparency = 1.000
PLGv32.blank_21.BorderSizePixel = 0
PLGv32.blank_21.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_21.Font = Enum.Font.SourceSans
PLGv32.blank_21.Text = ""
PLGv32.blank_21.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_21.TextSize = 14.000
PLGv32.blank_21.Visible = false

PLGv32.Frame_74.Parent = PLGv32.blank_21
PLGv32.Frame_74.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_74.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_74.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_74.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_76.Parent = PLGv32.blank_21
PLGv32.TextLabel_76.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_76.BackgroundTransparency = 1.000
PLGv32.TextLabel_76.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_76.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_76.Font = Enum.Font.Code
PLGv32.TextLabel_76.Text = "blank"
PLGv32.TextLabel_76.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_76.TextSize = 14.000
PLGv32.TextLabel_76.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Bottom_3.Name = "Bottom"
PLGv32.Bottom_3.Parent = PLGv32.Teleport
PLGv32.Bottom_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Bottom_3.BackgroundTransparency = 1.000
PLGv32.Bottom_3.BorderSizePixel = 0
PLGv32.Bottom_3.Position = UDim2.new(0, 0, 0.437659025, 0)
PLGv32.Bottom_3.Size = UDim2.new(0, 370, 0, 100)

PLGv32.UIListLayout_20.Parent = PLGv32.Bottom_3
PLGv32.UIListLayout_20.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_20.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_20.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_20.Padding = UDim.new(0, 6)

PLGv32.OtherLocal_3.Name = "OtherLocal"
PLGv32.OtherLocal_3.Parent = PLGv32.Bottom_3
PLGv32.OtherLocal_3.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.OtherLocal_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.OtherLocal_3.Position = UDim2.new(0, 5, 0, 0)
PLGv32.OtherLocal_3.Size = UDim2.new(0, 177, 0, 118)

PLGv32.TextLabel_77.Parent = PLGv32.OtherLocal_3
PLGv32.TextLabel_77.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_77.BackgroundTransparency = 1.000
PLGv32.TextLabel_77.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_77.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_77.Font = Enum.Font.Code
PLGv32.TextLabel_77.Text = "Outside Map"
PLGv32.TextLabel_77.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_77.TextSize = 13.000
PLGv32.TextLabel_77.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_75.Parent = PLGv32.OtherLocal_3
PLGv32.Frame_75.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_75.BackgroundTransparency = 1.000
PLGv32.Frame_75.Position = UDim2.new(0.0451977402, 0, 0.254237294, 0)
PLGv32.Frame_75.Size = UDim2.new(0, 161, 0, 91)

PLGv32.UIListLayout_21.Parent = PLGv32.Frame_75
PLGv32.UIListLayout_21.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_21.Padding = UDim.new(0, 2)

PLGv32.blank_22.Name = "blank"
PLGv32.blank_22.Parent = PLGv32.Frame_75
PLGv32.blank_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_22.BackgroundTransparency = 1.000
PLGv32.blank_22.BorderSizePixel = 0
PLGv32.blank_22.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_22.Font = Enum.Font.SourceSans
PLGv32.blank_22.Text = ""
PLGv32.blank_22.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_22.TextSize = 14.000
PLGv32.blank_22.MouseButton1Click:connect(function()

	PLGv32.Frame_76.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_78.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(874.956421, 27.7899876, 2349.45288)

	wait(0.3)
	PLGv32.Frame_76.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_78.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_76.Parent = PLGv32.blank_22
PLGv32.Frame_76.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_76.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_76.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_76.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_78.Parent = PLGv32.blank_22
PLGv32.TextLabel_78.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_78.BackgroundTransparency = 1.000
PLGv32.TextLabel_78.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_78.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_78.Font = Enum.Font.Code
PLGv32.TextLabel_78.Text = "N/A Spawn"
PLGv32.TextLabel_78.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_78.TextSize = 14.000
PLGv32.TextLabel_78.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_23.Name = "blank"
PLGv32.blank_23.Parent = PLGv32.Frame_75
PLGv32.blank_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_23.BackgroundTransparency = 1.000
PLGv32.blank_23.BorderSizePixel = 0
PLGv32.blank_23.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_23.Font = Enum.Font.SourceSans
PLGv32.blank_23.Text = ""
PLGv32.blank_23.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_23.TextSize = 14.000
PLGv32.blank_23.MouseButton1Click:connect(function()

	PLGv32.Frame_77.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_79.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(533.587585, 361.151245, 3418.60254)

	wait(0.3)
	PLGv32.Frame_77.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_79.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_77.Parent = PLGv32.blank_23
PLGv32.Frame_77.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_77.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_77.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_77.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_79.Parent = PLGv32.blank_23
PLGv32.TextLabel_79.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_79.BackgroundTransparency = 1.000
PLGv32.TextLabel_79.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_79.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_79.Font = Enum.Font.Code
PLGv32.TextLabel_79.Text = "Mountains"
PLGv32.TextLabel_79.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_79.TextSize = 14.000
PLGv32.TextLabel_79.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.blank_24.Name = "blank"
PLGv32.blank_24.Parent = PLGv32.Frame_75
PLGv32.blank_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.blank_24.BackgroundTransparency = 1.000
PLGv32.blank_24.BorderSizePixel = 0
PLGv32.blank_24.Size = UDim2.new(0, 161, 0, 20)
PLGv32.blank_24.Font = Enum.Font.SourceSans
PLGv32.blank_24.Text = ""
PLGv32.blank_24.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.blank_24.TextSize = 14.000
PLGv32.blank_24.MouseButton1Click:connect(function()

	PLGv32.Frame_78.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_80.TextColor3 = Color3.fromRGB(255,255,255)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(548.679749, 11.4254904, 968.224426)

	wait(0.3)
	PLGv32.Frame_78.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_80.TextColor3 = Color3.fromRGB(77, 77, 77)

end)

PLGv32.Frame_78.Parent = PLGv32.blank_24
PLGv32.Frame_78.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_78.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_78.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_78.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_80.Parent = PLGv32.blank_24
PLGv32.TextLabel_80.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_80.BackgroundTransparency = 1.000
PLGv32.TextLabel_80.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_80.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_80.Font = Enum.Font.Code
PLGv32.TextLabel_80.Text = "Under Mountains"
PLGv32.TextLabel_80.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_80.TextSize = 14.000
PLGv32.TextLabel_80.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.SkyboxFrame_2.Name = "SkyboxFrame"
PLGv32.SkyboxFrame_2.Parent = PLGv32.Bottom_3
PLGv32.SkyboxFrame_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.SkyboxFrame_2.BackgroundTransparency = 1.000
PLGv32.SkyboxFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.SkyboxFrame_2.Position = UDim2.new(0, 188, 0, 0)
PLGv32.SkyboxFrame_2.Size = UDim2.new(0, 177, 0, 215)

PLGv32.TextLabel_81.Parent = PLGv32.SkyboxFrame_2
PLGv32.TextLabel_81.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_81.BackgroundTransparency = 1.000
PLGv32.TextLabel_81.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_81.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_81.Font = Enum.Font.Code
PLGv32.TextLabel_81.Text = ""
PLGv32.TextLabel_81.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_81.TextSize = 13.000
PLGv32.TextLabel_81.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_79.Parent = PLGv32.SkyboxFrame_2
PLGv32.Frame_79.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_79.BackgroundTransparency = 1.000
PLGv32.Frame_79.Position = UDim2.new(0.0451977402, 0, 0.130232558, 0)
PLGv32.Frame_79.Size = UDim2.new(0, 161, 0, 110)

PLGv32.UIListLayout_22.Parent = PLGv32.Frame_79
PLGv32.UIListLayout_22.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_22.Padding = UDim.new(0, 2)

PLGv32.Players.Name = "Players"
PLGv32.Players.Parent = PLGv32.Holder
PLGv32.Players.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.Players.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Players.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.Players.Size = UDim2.new(0, 370, 0, 393)
PLGv32.Players.Visible = false

PLGv32.Top_5.Name = "Top"
PLGv32.Top_5.Parent = PLGv32.Players
PLGv32.Top_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Top_5.BackgroundTransparency = 1.000
PLGv32.Top_5.BorderSizePixel = 0
PLGv32.Top_5.Position = UDim2.new(0, 0, 0.0127226459, 0)
PLGv32.Top_5.Size = UDim2.new(0, 370, 0, 22)

PLGv32.UIListLayout_23.Parent = PLGv32.Top_5
PLGv32.UIListLayout_23.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_23.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_23.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_23.Padding = UDim.new(0, 6)

PLGv32.MainPlayers.Name = "MainPlayers"
PLGv32.MainPlayers.Parent = PLGv32.Top_5
PLGv32.MainPlayers.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.MainPlayers.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.MainPlayers.Position = UDim2.new(0, 5, 0, 0)
PLGv32.MainPlayers.Size = UDim2.new(0, 177, 0, 382)

PLGv32.TextLabel_82.Parent = PLGv32.MainPlayers
PLGv32.TextLabel_82.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_82.BackgroundTransparency = 1.000
PLGv32.TextLabel_82.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_82.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_82.Font = Enum.Font.Code
PLGv32.TextLabel_82.Text = "Players"
PLGv32.TextLabel_82.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_82.TextSize = 13.000
PLGv32.TextLabel_82.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.PlayerStuff.Name = "PlayerStuff"
PLGv32.PlayerStuff.Parent = PLGv32.MainPlayers
PLGv32.PlayerStuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.PlayerStuff.BackgroundTransparency = 1.000
PLGv32.PlayerStuff.Position = UDim2.new(0.0451977402, 0, 0.068062827, 0)
PLGv32.PlayerStuff.Size = UDim2.new(0, 161, 0, 139)

PLGv32.Scroll.Name = "Scroll"
PLGv32.Scroll.Parent = PLGv32.PlayerStuff
PLGv32.Scroll.Active = true
PLGv32.Scroll.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.Scroll.BorderSizePixel = 0
PLGv32.Scroll.Position = UDim2.new(-0.0496894419, 0, 0, 0)
PLGv32.Scroll.Size = UDim2.new(0, 177, 0, 348)
PLGv32.Scroll.BottomImage = ""
PLGv32.Scroll.ScrollBarThickness = 3
PLGv32.Scroll.TopImage = ""

PLGv32.sampletextxd.Name = "sampletextxd"
PLGv32.sampletextxd.Parent = PLGv32.Scroll
PLGv32.sampletextxd.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.sampletextxd.BorderSizePixel = 0
PLGv32.sampletextxd.Position = UDim2.new(0.102484472, 0, 0, 0)
PLGv32.sampletextxd.Size = UDim2.new(0, 144, 0, 20)
PLGv32.sampletextxd.AutoButtonColor = false
PLGv32.sampletextxd.Font = Enum.Font.Code
PLGv32.sampletextxd.Text = "OnlyTwentyCharacters"
PLGv32.sampletextxd.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.sampletextxd.TextSize = 14.000

PLGv32.UIListLayout_24.Parent = PLGv32.Scroll
PLGv32.UIListLayout_24.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_24.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_24.Padding = UDim.new(0, 3)

PLGv32.PlayerButtons.Name = "PlayerButtons"
PLGv32.PlayerButtons.Parent = PLGv32.Top_5
PLGv32.PlayerButtons.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.PlayerButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.PlayerButtons.Position = UDim2.new(0, 188, 0, 5)
PLGv32.PlayerButtons.Size = UDim2.new(0, 177, 0, 161)

PLGv32.TextLabel_83.Parent = PLGv32.PlayerButtons
PLGv32.TextLabel_83.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_83.BackgroundTransparency = 1.000
PLGv32.TextLabel_83.Position = UDim2.new(0.0395480208, 0, 0, 0)
PLGv32.TextLabel_83.Size = UDim2.new(0, 170, 0, 20)
PLGv32.TextLabel_83.Font = Enum.Font.Code
PLGv32.TextLabel_83.Text = "Player Options"
PLGv32.TextLabel_83.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_83.TextSize = 13.000
PLGv32.TextLabel_83.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_80.Parent = PLGv32.PlayerButtons
PLGv32.Frame_80.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_80.BackgroundTransparency = 1.000
PLGv32.Frame_80.Position = UDim2.new(0.0451977402, 0, 0.161490679, 0)
PLGv32.Frame_80.Size = UDim2.new(0, 161, 0, 104)

PLGv32.UIListLayout_25.Parent = PLGv32.Frame_80
PLGv32.UIListLayout_25.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_25.Padding = UDim.new(0, 2)

PLGv32.spectate.Name = "spectate"
PLGv32.spectate.Parent = PLGv32.Frame_80
PLGv32.spectate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.spectate.BackgroundTransparency = 1.000
PLGv32.spectate.BorderSizePixel = 0
PLGv32.spectate.Size = UDim2.new(0, 161, 0, 20)
PLGv32.spectate.Font = Enum.Font.SourceSans
PLGv32.spectate.Text = ""
PLGv32.spectate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.spectate.TextSize = 14.000

PLGv32.Frame_81.Parent = PLGv32.spectate
PLGv32.Frame_81.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_81.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_81.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_81.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_84.Parent = PLGv32.spectate
PLGv32.TextLabel_84.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_84.BackgroundTransparency = 1.000
PLGv32.TextLabel_84.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_84.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_84.Font = Enum.Font.Code
PLGv32.TextLabel_84.Text = "Spectate"
PLGv32.TextLabel_84.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_84.TextSize = 14.000
PLGv32.TextLabel_84.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.unspectate.Name = "unspectate"
PLGv32.unspectate.Parent = PLGv32.Frame_80
PLGv32.unspectate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.unspectate.BackgroundTransparency = 1.000
PLGv32.unspectate.BorderSizePixel = 0
PLGv32.unspectate.Size = UDim2.new(0, 161, 0, 20)
PLGv32.unspectate.Font = Enum.Font.SourceSans
PLGv32.unspectate.Text = ""
PLGv32.unspectate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.unspectate.TextSize = 14.000

PLGv32.Frame_82.Parent = PLGv32.unspectate
PLGv32.Frame_82.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_82.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_82.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_82.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_85.Parent = PLGv32.unspectate
PLGv32.TextLabel_85.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_85.BackgroundTransparency = 1.000
PLGv32.TextLabel_85.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_85.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_85.Font = Enum.Font.Code
PLGv32.TextLabel_85.Text = "Unspectate"
PLGv32.TextLabel_85.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_85.TextSize = 14.000
PLGv32.TextLabel_85.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.tptoplayer.Name = "tptoplayer"
PLGv32.tptoplayer.Parent = PLGv32.Frame_80
PLGv32.tptoplayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.tptoplayer.BackgroundTransparency = 1.000
PLGv32.tptoplayer.BorderSizePixel = 0
PLGv32.tptoplayer.Size = UDim2.new(0, 161, 0, 20)
PLGv32.tptoplayer.Font = Enum.Font.SourceSans
PLGv32.tptoplayer.Text = ""
PLGv32.tptoplayer.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.tptoplayer.TextSize = 14.000

PLGv32.Frame_83.Parent = PLGv32.tptoplayer
PLGv32.Frame_83.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_83.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_83.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_83.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_86.Parent = PLGv32.tptoplayer
PLGv32.TextLabel_86.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_86.BackgroundTransparency = 1.000
PLGv32.TextLabel_86.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_86.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_86.Font = Enum.Font.Code
PLGv32.TextLabel_86.Text = "Teleport To Player"
PLGv32.TextLabel_86.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_86.TextSize = 14.000
PLGv32.TextLabel_86.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.killplayer.Name = "killplayer"
PLGv32.killplayer.Parent = PLGv32.Frame_80
PLGv32.killplayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.killplayer.BackgroundTransparency = 1.000
PLGv32.killplayer.BorderSizePixel = 0
PLGv32.killplayer.Size = UDim2.new(0, 161, 0, 20)
PLGv32.killplayer.Font = Enum.Font.SourceSans
PLGv32.killplayer.Text = ""
PLGv32.killplayer.TextColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.killplayer.TextSize = 14.000

PLGv32.Frame_84.Parent = PLGv32.killplayer
PLGv32.Frame_84.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PLGv32.Frame_84.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_84.Position = UDim2.new(-0.00621118024, 0, 0.100000001, 0)
PLGv32.Frame_84.Size = UDim2.new(0, 15, 0, 15)

PLGv32.TextLabel_87.Parent = PLGv32.killplayer
PLGv32.TextLabel_87.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_87.BackgroundTransparency = 1.000
PLGv32.TextLabel_87.Position = UDim2.new(0.146987438, 0, 0, 0)
PLGv32.TextLabel_87.Size = UDim2.new(0, 137, 0, 20)
PLGv32.TextLabel_87.Font = Enum.Font.Code
PLGv32.TextLabel_87.Text = "Kill Player"
PLGv32.TextLabel_87.TextColor3 = Color3.fromRGB(77, 77, 77)
PLGv32.TextLabel_87.TextSize = 14.000
PLGv32.TextLabel_87.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Bottom_4.Name = "Bottom"
PLGv32.Bottom_4.Parent = PLGv32.Players
PLGv32.Bottom_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Bottom_4.BackgroundTransparency = 1.000
PLGv32.Bottom_4.BorderSizePixel = 0
PLGv32.Bottom_4.Position = UDim2.new(0, 0, 0.437659025, 0)
PLGv32.Bottom_4.Size = UDim2.new(0, 370, 0, 100)

PLGv32.UIListLayout_26.Parent = PLGv32.Bottom_4
PLGv32.UIListLayout_26.FillDirection = Enum.FillDirection.Horizontal
PLGv32.UIListLayout_26.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLGv32.UIListLayout_26.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_26.Padding = UDim.new(0, 6)

PLGv32.OtherLocal_4.Name = "OtherLocal"
PLGv32.OtherLocal_4.Parent = PLGv32.Bottom_4
PLGv32.OtherLocal_4.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.OtherLocal_4.BackgroundTransparency = 1.000
PLGv32.OtherLocal_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.OtherLocal_4.Position = UDim2.new(0, 5, 0, 0)
PLGv32.OtherLocal_4.Size = UDim2.new(0, 177, 0, 118)

PLGv32.Frame_85.Parent = PLGv32.OtherLocal_4
PLGv32.Frame_85.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_85.BackgroundTransparency = 1.000
PLGv32.Frame_85.Position = UDim2.new(0.0450000018, 0, 0.237000003, 0)
PLGv32.Frame_85.Size = UDim2.new(0, 161, 0, 91)

PLGv32.UIListLayout_27.Parent = PLGv32.Frame_85
PLGv32.UIListLayout_27.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_27.Padding = UDim.new(0, 2)

PLGv32.SkyboxFrame_3.Name = "SkyboxFrame"
PLGv32.SkyboxFrame_3.Parent = PLGv32.Bottom_4
PLGv32.SkyboxFrame_3.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.SkyboxFrame_3.BackgroundTransparency = 1.000
PLGv32.SkyboxFrame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.SkyboxFrame_3.Position = UDim2.new(0, 188, 0, 0)
PLGv32.SkyboxFrame_3.Size = UDim2.new(0, 177, 0, 215)

PLGv32.Frame_86.Parent = PLGv32.SkyboxFrame_3
PLGv32.Frame_86.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_86.BackgroundTransparency = 1.000
PLGv32.Frame_86.Position = UDim2.new(0.0451977402, 0, 0.130232558, 0)
PLGv32.Frame_86.Size = UDim2.new(0, 161, 0, 110)

PLGv32.UIListLayout_28.Parent = PLGv32.Frame_86
PLGv32.UIListLayout_28.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_28.Padding = UDim.new(0, 2)

PLGv32.Info.Name = "Info"
PLGv32.Info.Parent = PLGv32.Holder
PLGv32.Info.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
PLGv32.Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Info.Position = UDim2.new(0.0126903467, 0, 0.0580926277, 0)
PLGv32.Info.Size = UDim2.new(0, 370, 0, 393)

PLGv32.Frame_87.Parent = PLGv32.Info
PLGv32.Frame_87.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PLGv32.Frame_87.BorderColor3 = Color3.fromRGB(0, 0, 0)
PLGv32.Frame_87.Position = UDim2.new(0.0135135138, 0, 0.0127226459, 0)
PLGv32.Frame_87.Size = UDim2.new(0, 360, 0, 218)

PLGv32.TextLabel_88.Parent = PLGv32.Frame_87
PLGv32.TextLabel_88.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_88.BackgroundTransparency = 1.000
PLGv32.TextLabel_88.Position = UDim2.new(0.0194444451, 0, 0, 0)
PLGv32.TextLabel_88.Size = UDim2.new(0, 177, 0, 20)
PLGv32.TextLabel_88.Font = Enum.Font.Code
PLGv32.TextLabel_88.Text = "Info"
PLGv32.TextLabel_88.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_88.TextSize = 13.000
PLGv32.TextLabel_88.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_88.Parent = PLGv32.Frame_87
PLGv32.Frame_88.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_88.BackgroundTransparency = 1.000
PLGv32.Frame_88.Position = UDim2.new(0.0194444451, 0, 0.128440365, 0)
PLGv32.Frame_88.Size = UDim2.new(0, 100, 0, 31)

PLGv32.UIListLayout_29.Parent = PLGv32.Frame_88
PLGv32.UIListLayout_29.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_29.Padding = UDim.new(0, 5)

PLGv32.TextLabel_89.Parent = PLGv32.Frame_88
PLGv32.TextLabel_89.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_89.BackgroundTransparency = 1.000
PLGv32.TextLabel_89.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_89.Font = Enum.Font.Code
PLGv32.TextLabel_89.Text = "- GUI made by: Jmuse"
PLGv32.TextLabel_89.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_89.TextSize = 14.000
PLGv32.TextLabel_89.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_90.Parent = PLGv32.Frame_88
PLGv32.TextLabel_90.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_90.BackgroundTransparency = 1.000
PLGv32.TextLabel_90.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_90.Font = Enum.Font.Code
PLGv32.TextLabel_90.Text = "- Script devs:"
PLGv32.TextLabel_90.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_90.TextSize = 14.000
PLGv32.TextLabel_90.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.Frame_89.Parent = PLGv32.TextLabel_90
PLGv32.Frame_89.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.Frame_89.BackgroundTransparency = 1.000
PLGv32.Frame_89.Position = UDim2.new(0.411082953, 0, 1.54433191, 0)
PLGv32.Frame_89.Size = UDim2.new(0, 50, 0, 51)

PLGv32.UIListLayout_30.Parent = PLGv32.Frame_89
PLGv32.UIListLayout_30.SortOrder = Enum.SortOrder.LayoutOrder
PLGv32.UIListLayout_30.Padding = UDim.new(0, 3)

PLGv32.TextLabel_91.Parent = PLGv32.Frame_89
PLGv32.TextLabel_91.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_91.BackgroundTransparency = 1.000
PLGv32.TextLabel_91.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_91.Font = Enum.Font.Code
PLGv32.TextLabel_91.Text = "Jake11Price"
PLGv32.TextLabel_91.TextColor3 = Color3.fromRGB(148, 148, 148)
PLGv32.TextLabel_91.TextSize = 14.000
PLGv32.TextLabel_91.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_92.Parent = PLGv32.Frame_89
PLGv32.TextLabel_92.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_92.BackgroundTransparency = 1.000
PLGv32.TextLabel_92.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_92.Font = Enum.Font.Code
PLGv32.TextLabel_92.Text = "Exodots"
PLGv32.TextLabel_92.TextColor3 = Color3.fromRGB(148, 148, 148)
PLGv32.TextLabel_92.TextSize = 14.000
PLGv32.TextLabel_92.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_93.Parent = PLGv32.Frame_89
PLGv32.TextLabel_93.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_93.BackgroundTransparency = 1.000
PLGv32.TextLabel_93.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_93.Font = Enum.Font.Code
PLGv32.TextLabel_93.Text = "Scam666"
PLGv32.TextLabel_93.TextColor3 = Color3.fromRGB(148, 148, 148)
PLGv32.TextLabel_93.TextSize = 14.000
PLGv32.TextLabel_93.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_94.Parent = PLGv32.Frame_89
PLGv32.TextLabel_94.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_94.BackgroundTransparency = 1.000
PLGv32.TextLabel_94.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_94.Font = Enum.Font.Code
PLGv32.TextLabel_94.Text = "Azul"
PLGv32.TextLabel_94.TextColor3 = Color3.fromRGB(148, 148, 148)
PLGv32.TextLabel_94.TextSize = 14.000
PLGv32.TextLabel_94.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_95.Parent = PLGv32.Frame_89
PLGv32.TextLabel_95.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_95.BackgroundTransparency = 1.000
PLGv32.TextLabel_95.Size = UDim2.new(0, 60, 0, 15)
PLGv32.TextLabel_95.Font = Enum.Font.Code
PLGv32.TextLabel_95.Text = "Reversed"
PLGv32.TextLabel_95.TextColor3 = Color3.fromRGB(148, 148, 148)
PLGv32.TextLabel_95.TextSize = 14.000
PLGv32.TextLabel_95.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_96.Parent = PLGv32.Frame_88
PLGv32.TextLabel_96.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_96.BackgroundTransparency = 1.000
PLGv32.TextLabel_96.Position = UDim2.new(0, 0, 1.29032254, 0)
PLGv32.TextLabel_96.Size = UDim2.new(0, 60, 0, 210)
PLGv32.TextLabel_96.Font = Enum.Font.Code
PLGv32.TextLabel_96.Text = "- Open GUI with \"G\""
PLGv32.TextLabel_96.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_96.TextSize = 14.000
PLGv32.TextLabel_96.TextXAlignment = Enum.TextXAlignment.Left

PLGv32.TextLabel_97.Parent = PLGv32.MainGUI
PLGv32.TextLabel_97.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_97.BackgroundTransparency = 1.000
PLGv32.TextLabel_97.BorderColor3 = Color3.fromRGB(27, 42, 53)
PLGv32.TextLabel_97.Position = UDim2.new(0.0150000565, 0, 0, 0)
PLGv32.TextLabel_97.Size = UDim2.new(0, 192, 0, 27)
PLGv32.TextLabel_97.Font = Enum.Font.Code
PLGv32.TextLabel_97.Text = "PLG v3.2"
PLGv32.TextLabel_97.TextColor3 = Color3.fromRGB(255, 255, 255)
PLGv32.TextLabel_97.TextSize = 16.000
PLGv32.TextLabel_97.TextXAlignment = Enum.TextXAlignment.Left


-- Player List

PLGv32.sampletextxd.Visible = false
PLGv32.sampletextxd.Active = false
PLGv32.sampletextxd.BorderSizePixel = 0

function updatescroll()
    PLGv32.Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    local btncount = -3
    for i, v in pairs(PLGv32.Scroll:GetChildren()) do
        if v:IsA("TextButton") then
            if v.Name == "TextButton" then
            elseif v.Name == game.Players.LocalPlayer.Name then
            else
                btncount = btncount + 23
            end
        end
    end
    PLGv32.Scroll.CanvasSize = UDim2.new(0, 0, 0, btncount)
end

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        local btn = PLGv32.sampletextxd:Clone()
        btn.Parent = PLGv32.Scroll
        btn.Name = v.Name
        btn.Visible = true
        btn.Text = v.Name
        btn.MouseButton1Click:Connect(
            function()
                if not btn.Active then
                    for a, b in pairs(PLGv32.Scroll:GetChildren()) do
                        if b:IsA("TextButton") then
                            b.Active = false
                            b.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                        end
                    end
                    btn.Active = true
                    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                else
                    btn.Active = false
                    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                end
            end
        )
        updatescroll()
    end
end

game.Players.PlayerAdded:Connect(
    function(v)
        local btn = PLGv32.sampletextxd:Clone()
        btn.Parent = PLGv32.Scroll
        btn.Name = v.Name
        btn.Visible = true
        btn.Text = v.Name
        btn.MouseButton1Click:Connect(
            function()
                if not btn.Active then
                    for a, b in pairs(PLGv32.Scroll:GetChildren()) do
                        if b:IsA("TextButton") then
                            b.Active = false
                            b.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                        end
                    end
                    btn.Active = true
                    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                else
                    btn.Active = false
                    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                end
            end
        )
        updatescroll()
    end
)

game.Players.PlayerRemoving:Connect(
    function(v)
        for a, b in pairs(PLGv32.Scroll:GetChildren()) do
            if b:IsA("TextButton") then
                if b.Name == v.Name then
                    b:Destroy()
                end
            end
        end
        updatescroll()
    end
)

game.Players.PlayerRemoving:Connect(
    function(v)
        for a, b in pairs(PLGv32.Scroll:GetChildren()) do
            if b:IsA("TextButton") then
                if b.Name == v.Name then
                    b:Destroy()
                end
            end
        end
        updatescroll()
    end
)


PLGv32.tptoplayer.MouseButton1Click:Connect(
    function()
	
	PLGv32.Frame_83.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_86.TextColor3 = Color3.fromRGB(255,255,255)
	
        for i, v in pairs(PLGv32.Scroll:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Active then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        game.Players[v.Text].Character.HumanoidRootPart.CFrame
                end
            end
        end
	wait(0.3)
	PLGv32.Frame_83.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_86.TextColor3 = Color3.fromRGB(77, 77, 77)
		
    end
)

PLGv32.spectate.MouseButton1Click:Connect(
    function()
	
	PLGv32.Frame_81.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_84.TextColor3 = Color3.fromRGB(255,255,255)

		for i, v in pairs(PLGv32.Scroll:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Active then
                    persontospec = v.Text
                end
            end
        end

	wait(0.3)
	PLGv32.Frame_81.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_84.TextColor3 = Color3.fromRGB(77, 77, 77)
    end
)

PLGv32.unspectate.MouseButton1Click:Connect(
    function()
	
	PLGv32.Frame_82.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_85.TextColor3 = Color3.fromRGB(255,255,255)

		persontospec = game.Players.LocalPlayer.Name

	wait(0.3)
	PLGv32.Frame_82.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_85.TextColor3 = Color3.fromRGB(77, 77, 77)
    end
)

PLGv32.killplayer.MouseButton1Down:connect(
    function()
	
	PLGv32.Frame_84.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	PLGv32.TextLabel_87.TextColor3 = Color3.fromRGB(255,255,255)

		local prsn
        for i, v in pairs(PLGv32.Scroll:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Active then
                    prsn = v.Text
                end
            end
        end

        local A_1 = {
            [1] = {
                ["RayObject"] = Ray.new(
                    Vector3.new(827.412415, 101.489777, 2296.84326),
                    Vector3.new(277.738678, 6.89340925, 287.773712)
                ),
                ["Distance"] = 4.7204174995422,
                ["Cframe"] = CFrame.new(
                    832.049377,
                    101.392006,
                    2300.97168,
                    0.843892097,
                    -0.0554918349,
                    0.533635378,
                    0,
                    0.994636595,
                    0.103430569,
                    -0.536512911,
                    -0.0872842371,
                    0.839366019
                ),
                ["Hit"] = game.Workspace[prsn].Head
            },
            [2] = {
                ["RayObject"] = Ray.new(
                    Vector3.new(827.412415, 101.489777, 2296.84326),
                    Vector3.new(303.047546, 21.3568707, 260.203888)
                ),
                ["Distance"] = 4.8114862442017,
                ["Cframe"] = CFrame.new(
                    832.390259,
                    101.550629,
                    2300.74097,
                    0.738044441,
                    -0.112958886,
                    0.665229917,
                    7.45057971e-09,
                    0.985887885,
                    0.16740793,
                    -0.674752235,
                    -0.123554483,
                    0.727628946
                ),
                ["Hit"] = game.Workspace[prsn].Head
            },
            [3] = {
                ["RayObject"] = Ray.new(
                    Vector3.new(827.412415, 101.489777, 2296.84326),
                    Vector3.new(296.800507, 7.00420141, 268.067932)
                ),
                ["Distance"] = 4.444625377655,
                ["Cframe"] = CFrame.new(
                    832.185486,
                    101.391617,
                    2300.70264,
                    0.775115669,
                    -0.0692948848,
                    0.628007889,
                    7.45057971e-09,
                    0.993967533,
                    0.109675139,
                    -0.631819367,
                    -0.0850109085,
                    0.770439863
                ),
                ["Hit"] = game.Workspace[prsn].Head
            },
            [4] = {
                ["RayObject"] = Ray.new(
                    Vector3.new(827.412415, 101.489777, 2296.84326),
                    Vector3.new(284.930573, 11.9850616, 280.483368)
                ),
                ["Distance"] = 4.6211166381836,
                ["Cframe"] = CFrame.new(
                    832.10083,
                    101.445007,
                    2300.86963,
                    0.820150614,
                    -0.0735745132,
                    0.567397356,
                    0,
                    0.991697431,
                    0.128593579,
                    -0.572147667,
                    -0.105466105,
                    0.81334126
                ),
                ["Hit"] = game.Workspace[prsn].Head
            },
            [5] = {
                ["RayObject"] = Ray.new(
                    Vector3.new(827.412415, 101.489777, 2296.84326),
                    Vector3.new(294.625824, 2.15741801, 270.538269)
                ),
                ["Distance"] = 4.4639973640442,
                ["Cframe"] = CFrame.new(
                    832.169434,
                    101.341301,
                    2300.73438,
                    0.784266233,
                    -0.0537625961,
                    0.618090749,
                    -3.7252903e-09,
                    0.99623847,
                    0.086654529,
                    -0.620424569,
                    -0.0679602176,
                    0.781316102
                ),
                ["Hit"] = game.Workspace[prsn].Head
            }
        }

        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        game.Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
        local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
        game.ReplicatedStorage.ShootEvent:FireServer(A_1, A_2)
        workspace.Remote.TeamEvent:FireServer("Bright orange")
        local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
        game.ReplicatedStorage.ShootEvent:FireServer(A_1, A_2)

	wait(0.3)
	PLGv32.Frame_84.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	PLGv32.TextLabel_87.TextColor3 = Color3.fromRGB(77, 77, 77)
    end
)

local spectateloop =
    coroutine.create(
    function()
        while wait(0.1) do
            pcall(
                function()
                    game.Workspace.CurrentCamera.CameraSubject = game.Players[persontospec].Character.Humanoid
                end
            )
        end
    end
)
coroutine.resume(spectateloop)







game.Players.LocalPlayer:GetMouse().KeyDown:connect(
function(key)
	if key:lower() == "g" then
		if PLGv32.MainGUI.Visible == false then
			PLGv32.MainGUI.Visible = true
		else
			PLGv32.MainGUI.Visible = false
		end
	end
end
)

StaminaMsg("PLG v3.2 has loaded :)",2)
