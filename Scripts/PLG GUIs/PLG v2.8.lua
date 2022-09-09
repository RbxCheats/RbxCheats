local jmusepart
for _,jmuseisasexyman in pairs (game.Workspace:GetDescendants()) do 
    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "OUT OF ORDER" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "Furries Are Gross!"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "(srsly this time)" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "#KillFurries"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Bulletin Board" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = game.Players.LocalPlayer.Name.. " is cool!"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "YARD" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "Sub To SirMeme"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "ARMORY+" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "Youtube: Jmuse"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "###### #### ####?" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "The world would be a better place if every furry killed themselves"
    end

	if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "nope" then 
        jmusepart=jmuseisasexyman;
		jmusepart.Text = "PLG v2.8"
    end
end

wait(0.5)

-- Instances:
local CheckMyNetWorth = Instance.new("ScreenGui")
local Message = Instance.new("Frame")
local MessageTitle = Instance.new("TextLabel")
local MessageFrame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabelooooof = Instance.new("TextLabel")
local MainGUI = Instance.new("Frame")
local omgbruh = Instance.new("TextLabel")
local Info = Instance.new("Frame")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
local TextLabel_10 = Instance.new("TextLabel")
local TextLabel_11 = Instance.new("TextLabel")
local TpList = Instance.new("Frame")
local TP = Instance.new("Frame")
local yard = Instance.new("TextButton")
local prisoncells = Instance.new("TextButton")
local cb = Instance.new("TextButton")
local policeroom = Instance.new("TextButton")
local TpTitle = Instance.new("TextLabel")
local Local = Instance.new("Frame")
local OtherFrame = Instance.new("Frame")
local OtherWarning = Instance.new("TextLabel")
local jump = Instance.new("TextButton")
local btools = Instance.new("TextButton")
local jumpheight = Instance.new("TextBox")
local speed = Instance.new("TextButton")
local setspeed = Instance.new("TextBox")
local OtherTitle = Instance.new("TextLabel")
local TeamsFrame = Instance.new("Frame")
local Crime = Instance.new("TextButton")
local Police = Instance.new("TextButton")
local NA = Instance.new("TextButton")
local Inmate = Instance.new("TextButton")
local TeamsTitle = Instance.new("TextLabel")
local GunsFrame = Instance.new("Frame")
local sh = Instance.new("TextButton")
local ak = Instance.new("TextButton")
local m9 = Instance.new("TextButton")
local m4 = Instance.new("TextButton")
local GunsTitle = Instance.new("TextLabel")
local Misc = Instance.new("Frame")
local OtherMiscFrame = Instance.new("Frame")
local invis = Instance.new("TextButton")
local crimall = Instance.new("TextButton")
local ModWarning = Instance.new("TextLabel")
local yellowname = Instance.new("TextButton")
local keycard = Instance.new("TextButton")
local ModWarning_2 = Instance.new("TextLabel")
local arrestall = Instance.new("TextButton")
local taseall = Instance.new("TextButton")
local respawn = Instance.new("TextButton")
local OtherModTitle = Instance.new("TextLabel")
local CheckBoxes = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local guardhitbox = Instance.new("TextButton")
local TextLabel_12 = Instance.new("TextLabel")
local inmatehitbox = Instance.new("TextButton")
local TextLabel_13 = Instance.new("TextLabel")
local criminalhitbox = Instance.new("TextButton")
local TextLabel_14 = Instance.new("TextLabel")
local MiscFrame = Instance.new("Frame")
local car = Instance.new("TextButton")
local doors = Instance.new("TextButton")
local clickarrest = Instance.new("TextButton")
local fences = Instance.new("TextButton")
local TeamsTitle_2 = Instance.new("TextLabel")
local ModFrame = Instance.new("Frame")
local m9mod = Instance.new("TextButton")
local akmod = Instance.new("TextButton")
local shmod = Instance.new("TextButton")
local m4mod = Instance.new("TextButton")
local ModTitle = Instance.new("TextLabel")
local Rage = Instance.new("Frame")
local RageFrame = Instance.new("Frame")
local killaura = Instance.new("TextButton")
local killall = Instance.new("TextButton")
local RageTitle = Instance.new("TextLabel")
local Bar = Instance.new("Frame")
local info = Instance.new("TextButton")
local infotop = Instance.new("Frame")
local tplist = Instance.new("TextButton")
local tplisttop = Instance.new("Frame")
local misc = Instance.new("TextButton")
local misctop = Instance.new("Frame")
local rage = Instance.new("TextButton")
local ragetop = Instance.new("Frame")
local _1local = Instance.new("TextButton")
local localtop = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local PlayerList = Instance.new("Frame")
local PlayerListMain = Instance.new("Frame")
local PlayerListTitle = Instance.new("TextLabel")
local players = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local PlayerListTitle_2 = Instance.new("TextLabel")
local unspectate = Instance.new("TextButton")
local spectate = Instance.new("TextButton")
local kill = Instance.new("TextButton")
local tptoplayer = Instance.new("TextButton")
--Properties:
CheckMyNetWorth.Name = "CheckMyNetWorth"
CheckMyNetWorth.Parent = game.CoreGui

Message.Name = "Message"
Message.Parent = CheckMyNetWorth
Message.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Message.BorderColor3 = Color3.new(0, 0, 0)
Message.BorderSizePixel = 2
Message.Position = UDim2.new(0.461262941, 0, 0.373464406, 0)
Message.Size = UDim2.new(0, 273, 0, 295)
Message.Active = true
Message.Draggable = true

MessageTitle.Name = "MessageTitle"
MessageTitle.Parent = Message
MessageTitle.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
MessageTitle.BorderColor3 = Color3.new(0.105882, 0.105882, 0.105882)
MessageTitle.BorderSizePixel = 0
MessageTitle.Position = UDim2.new(0.131868139, 0, 0, 0)
MessageTitle.Size = UDim2.new(0, 200, 0, 17)
MessageTitle.Font = Enum.Font.SourceSansBold
MessageTitle.Text = "Quick Message"
MessageTitle.TextColor3 = Color3.new(1, 1, 1)
MessageTitle.TextSize = 14
MessageTitle.TextStrokeTransparency = 0

MessageFrame.Name = "MessageFrame"
MessageFrame.Parent = Message
MessageFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
MessageFrame.BorderColor3 = Color3.new(0, 0, 0)
MessageFrame.Position = UDim2.new(0.0476190485, 0, 0.0779661015, 0)
MessageFrame.Size = UDim2.new(0, 247, 0, 262)

TextButton.Parent = MessageFrame
TextButton.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
TextButton.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
TextButton.Position = UDim2.new(0.0931174085, 0, 0.568702281, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Continue To GUI"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 14
TextButton.TextStrokeTransparency = 0
TextButton.MouseButton1Click:connect(function()
	game.CoreGui.CheckMyNetWorth.Message:Remove()
end)

TextLabel.Parent = MessageFrame
TextLabel.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0931174085, 0, 0.930534363, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 9)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "-Jmuse"
TextLabel.TextColor3 = Color3.new(1, 0.576471, 0)
TextLabel.TextSize = 13
TextLabel.TextStrokeTransparency = 0

TextLabel_2.Parent = MessageFrame
TextLabel_2.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_2.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0931174085, 0, 0.830534339, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 9)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "Have Fun!"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 13
TextLabel_2.TextStrokeTransparency = 0

TextLabel_3.Parent = MessageFrame
TextLabel_3.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_3.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.0931174085, 0, 0.345038176, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 9)
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = "Buy Synapse X: https://x.synapse.to/"
TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextSize = 13
TextLabel_3.TextStrokeTransparency = 0

TextLabel_4.Parent = MessageFrame
TextLabel_4.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_4.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.0931174085, 0, 0.245038182, 0)
TextLabel_4.Size = UDim2.new(0, 200, 0, 9)
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = "Open/Close GUI With \"F\""
TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
TextLabel_4.TextSize = 13
TextLabel_4.TextStrokeTransparency = 0

TextLabelooooof.Name = "TextLabelooooof"
TextLabelooooof.Parent = MessageFrame
TextLabelooooof.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabelooooof.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabelooooof.BorderSizePixel = 0
TextLabelooooof.Position = UDim2.new(0.0931174085, 0, 0.145038173, 0)
TextLabelooooof.Size = UDim2.new(0, 200, 0, 9)
TextLabelooooof.Font = Enum.Font.SourceSansBold
TextLabelooooof.Text = "This GUI Will Not Work Best With Free Executors"
TextLabelooooof.TextColor3 = Color3.new(1, 1, 1)
TextLabelooooof.TextSize = 13
TextLabelooooof.TextStrokeTransparency = 0

MainGUI.Name = "MainGUI"
MainGUI.Parent = CheckMyNetWorth
MainGUI.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
MainGUI.BorderColor3 = Color3.new(0, 0, 0)
MainGUI.BorderSizePixel = 2
MainGUI.Position = UDim2.new(0.0270686541, 0, 0.318181872, 0)
MainGUI.Size = UDim2.new(0, 459, 0, 432)
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true

omgbruh.Name = "omgbruh"
omgbruh.Parent = MainGUI
omgbruh.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
omgbruh.BorderColor3 = Color3.new(0.105882, 0.105882, 0.105882)
omgbruh.BorderSizePixel = 0
omgbruh.Position = UDim2.new(0.401706785, 0, 0.474537045, 0)
omgbruh.Size = UDim2.new(0, 91, 0, 22)
omgbruh.Visible = false
omgbruh.Font = Enum.Font.SourceSansBold
omgbruh.Text = "https://discord.me/rbxcheats"
omgbruh.TextColor3 = Color3.new(1, 1, 1)
omgbruh.TextSize = 14
omgbruh.TextStrokeTransparency = 0

Info.Name = "Info"
Info.Parent = MainGUI
Info.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
Info.BorderColor3 = Color3.new(0, 0, 0)
Info.Position = UDim2.new(0.0276797097, 0, 0.145833328, 0)
Info.Size = UDim2.new(0, 432, 0, 359)
Info.Visible = true

TextLabel_5.Parent = Info
TextLabel_5.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_5.Position = UDim2.new(0.109383903, 0, 0.338161528, 0)
TextLabel_5.Size = UDim2.new(0, 323, 0, 32)
TextLabel_5.Font = Enum.Font.SourceSansBold
TextLabel_5.Text = "Everytime a player dies and you're spectating them just press \"Spectate\" again so the camera is not stuck in place."
TextLabel_5.TextColor3 = Color3.new(1, 1, 1)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14
TextLabel_5.TextStrokeTransparency = 0
TextLabel_5.TextWrapped = true

TextLabel_6.Parent = Info
TextLabel_6.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_6.BackgroundTransparency = 1
TextLabel_6.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_6.Position = UDim2.new(0.109383881, 0, 0.215254769, 0)
TextLabel_6.Size = UDim2.new(0, 323, 0, 14)
TextLabel_6.Font = Enum.Font.SourceSansBold
TextLabel_6.Text = "Fly Car Script By: Exodots"
TextLabel_6.TextColor3 = Color3.new(1, 1, 1)
TextLabel_6.TextSize = 14
TextLabel_6.TextStrokeTransparency = 0

TextLabel_7.Parent = Info
TextLabel_7.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_7.BackgroundTransparency = 1
TextLabel_7.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_7.Position = UDim2.new(0.109383881, 0, 0.175254777, 0)
TextLabel_7.Size = UDim2.new(0, 323, 0, 14)
TextLabel_7.Font = Enum.Font.SourceSansBold
TextLabel_7.Text = "Most Scripts Made By: Jake11Price"
TextLabel_7.TextColor3 = Color3.new(1, 1, 1)
TextLabel_7.TextSize = 14
TextLabel_7.TextStrokeTransparency = 0

TextLabel_8.Parent = Info
TextLabel_8.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_8.BackgroundTransparency = 1
TextLabel_8.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_8.Position = UDim2.new(0.109383881, 0, 0.095254764, 0)
TextLabel_8.Size = UDim2.new(0, 323, 0, 14)
TextLabel_8.Font = Enum.Font.SourceSansBold
TextLabel_8.Text = "Youtube: Jmuse"
TextLabel_8.TextColor3 = Color3.new(1, 1, 1)
TextLabel_8.TextSize = 14
TextLabel_8.TextStrokeTransparency = 0

TextLabel_9.Parent = Info
TextLabel_9.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_9.BackgroundTransparency = 1
TextLabel_9.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_9.Position = UDim2.new(0.109383881, 0, 0.0552547686, 0)
TextLabel_9.Size = UDim2.new(0, 323, 0, 14)
TextLabel_9.Font = Enum.Font.SourceSansBold
TextLabel_9.Text = "GUI Made By: Jmuse#3982"
TextLabel_9.TextColor3 = Color3.new(1, 1, 1)
TextLabel_9.TextSize = 14
TextLabel_9.TextStrokeTransparency = 0

TextLabel_10.Parent = Info
TextLabel_10.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_10.BackgroundTransparency = 1
TextLabel_10.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_10.Position = UDim2.new(0.109383881, 0, 0.264614105, 0)
TextLabel_10.Size = UDim2.new(0, 323, 0, 14)
TextLabel_10.Font = Enum.Font.SourceSansBold
TextLabel_10.Text = "Player List Script By: 02hacks"
TextLabel_10.TextColor3 = Color3.new(1, 1, 1)
TextLabel_10.TextSize = 14
TextLabel_10.TextStrokeTransparency = 0

TextLabel_11.Parent = Info
TextLabel_11.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_11.BackgroundTransparency = 1
TextLabel_11.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextLabel_11.Position = UDim2.new(0.109383881, 0, 0.455254734, 0)
TextLabel_11.Size = UDim2.new(0, 323, 0, 14)
TextLabel_11.Font = Enum.Font.SourceSansBold
TextLabel_11.Text = "v2.8"
TextLabel_11.TextColor3 = Color3.new(1, 0.576471, 0)
TextLabel_11.TextSize = 14
TextLabel_11.TextStrokeTransparency = 0

TpList.Name = "TpList"
TpList.Parent = MainGUI
TpList.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TpList.BorderColor3 = Color3.new(0, 0, 0)
TpList.Position = UDim2.new(0.0276797097, 0, 0.145833328, 0)
TpList.Size = UDim2.new(0, 432, 0, 359)
TpList.Visible = false

TP.Name = "TP"
TP.Parent = TpList
TP.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TP.BorderColor3 = Color3.new(0, 0, 0)
TP.Position = UDim2.new(0.0379999988, 0, 0.063000001, 0)
TP.Size = UDim2.new(0, 197, 0, 98)

yard.Name = "yard"
yard.Parent = TP
yard.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
yard.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
yard.Position = UDim2.new(0.52700001, 0, 0.541000009, 0)
yard.Size = UDim2.new(0, 71, 0, 24)
yard.Font = Enum.Font.SourceSansBold
yard.Text = "Yard"
yard.TextColor3 = Color3.new(1, 1, 1)
yard.TextSize = 14
yard.TextStrokeTransparency = 0
yard.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
end)

prisoncells.Name = "prisoncells"
prisoncells.Parent = TP
prisoncells.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
prisoncells.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
prisoncells.Position = UDim2.new(0.52700001, 0, 0.210999995, 0)
prisoncells.Size = UDim2.new(0, 71, 0, 24)
prisoncells.Font = Enum.Font.SourceSansBold
prisoncells.Text = "Prison Cells"
prisoncells.TextColor3 = Color3.new(1, 1, 1)
prisoncells.TextSize = 14
prisoncells.TextStrokeTransparency = 0
prisoncells.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
end)

cb.Name = "cb"
cb.Parent = TP
cb.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
cb.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
cb.Position = UDim2.new(0.108999997, 0, 0.541000009, 0)
cb.Size = UDim2.new(0, 71, 0, 24)
cb.Font = Enum.Font.SourceSansBold
cb.Text = "Crime Base"
cb.TextColor3 = Color3.new(1, 1, 1)
cb.TextSize = 14
cb.TextStrokeTransparency = 0
cb.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.704, 91.632, 2056.925)
end)

policeroom.Name = "policeroom"
policeroom.Parent = TP
policeroom.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
policeroom.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
policeroom.Position = UDim2.new(0.109999999, 0, 0.210999995, 0)
policeroom.Size = UDim2.new(0, 71, 0, 24)
policeroom.Font = Enum.Font.SourceSansBold
policeroom.Text = "Police Room"
policeroom.TextColor3 = Color3.new(1, 1, 1)
policeroom.TextSize = 14
policeroom.TextStrokeTransparency = 0
policeroom.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836, 99, 2271)
end)

TpTitle.Name = "TpTitle"
TpTitle.Parent = TP
TpTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TpTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TpTitle.Position = UDim2.new(0.0625814945, 0, -0.0862018168, 0)
TpTitle.Size = UDim2.new(0, 38, 0, 17)
TpTitle.Font = Enum.Font.SourceSansBold
TpTitle.Text = "TP"
TpTitle.TextColor3 = Color3.new(1, 1, 1)
TpTitle.TextSize = 14
TpTitle.TextStrokeTransparency = 0

Local.Name = "Local"
Local.Parent = MainGUI
Local.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
Local.BorderColor3 = Color3.new(0, 0, 0)
Local.Position = UDim2.new(0.0276797097, 0, 0.145833328, 0)
Local.Size = UDim2.new(0, 432, 0, 359)
Local.Visible = false

OtherFrame.Name = "OtherFrame"
OtherFrame.Parent = Local
OtherFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherFrame.BorderColor3 = Color3.new(0, 0, 0)
OtherFrame.Position = UDim2.new(0.0376955643, 0, 0.370315254, 0)
OtherFrame.Size = UDim2.new(0, 401, 0, 206)

OtherWarning.Name = "OtherWarning"
OtherWarning.Parent = OtherFrame
OtherWarning.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherWarning.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherWarning.Position = UDim2.new(0.201592878, 0, 0.861751139, 0)
OtherWarning.Size = UDim2.new(0, 267, 0, 12)
OtherWarning.Font = Enum.Font.SourceSansBold
OtherWarning.Text = "If You Close This GUI Jump Height Will Be Reset"
OtherWarning.TextColor3 = Color3.new(1, 1, 1)
OtherWarning.TextSize = 14
OtherWarning.TextStrokeTransparency = 0

jump.Name = "jump"
jump.Parent = OtherFrame
jump.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
jump.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
jump.Position = UDim2.new(0.573260784, 0, 0.298017323, 0)
jump.Size = UDim2.new(0, 151, 0, 24)
jump.Font = Enum.Font.SourceSansBold
jump.Text = "Set Jump"
jump.TextColor3 = Color3.new(1, 1, 1)
jump.TextSize = 14
jump.TextStrokeTransparency = 0
jump.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpheight.Text
end)

btools.Name = "btools"
btools.Parent = OtherFrame
btools.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
btools.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
btools.Position = UDim2.new(0.0441623591, 0, 0.448017299, 0)
btools.Size = UDim2.new(0, 363, 0, 24)
btools.Font = Enum.Font.SourceSansBold
btools.Text = "Give Btools"
btools.TextColor3 = Color3.new(1, 1, 1)
btools.TextSize = 14
btools.TextStrokeTransparency = 0
btools.MouseButton1Click:connect(function()
	wait(0.1)
local tool1 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
local tool2 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
local tool3 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
tool1.BinType = "Clone"
tool2.BinType = "Hammer"
tool3.BinType = "Grab"
end)

jumpheight.Name = "jumpheight"
jumpheight.Parent = OtherFrame
jumpheight.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
jumpheight.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
jumpheight.Position = UDim2.new(0.0441623591, 0, 0.296235025, 0)
jumpheight.Size = UDim2.new(0, 199, 0, 24)
jumpheight.Font = Enum.Font.SourceSansBold
jumpheight.Text = ""
jumpheight.TextColor3 = Color3.new(1, 1, 1)
jumpheight.TextSize = 14
jumpheight.TextStrokeTransparency = 0

speed.Name = "speed"
speed.Parent = OtherFrame
speed.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
speed.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
speed.Position = UDim2.new(0.573260784, 0, 0.148017317, 0)
speed.Size = UDim2.new(0, 151, 0, 24)
speed.Font = Enum.Font.SourceSansBold
speed.Text = "Set Speed"
speed.TextColor3 = Color3.new(1, 1, 1)
speed.TextSize = 14
speed.TextStrokeTransparency = 0
speed.MouseButton1Click:connect(function()
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = setspeed.Text
end)

setspeed.Name = "setspeed"
setspeed.Parent = OtherFrame
setspeed.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
setspeed.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
setspeed.Position = UDim2.new(0.0441623591, 0, 0.146235049, 0)
setspeed.Size = UDim2.new(0, 199, 0, 24)
setspeed.Font = Enum.Font.SourceSansBold
setspeed.Text = ""
setspeed.TextColor3 = Color3.new(1, 1, 1)
setspeed.TextSize = 14
setspeed.TextStrokeTransparency = 0

OtherTitle.Name = "OtherTitle"
OtherTitle.Parent = OtherFrame
OtherTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherTitle.Position = UDim2.new(0.0265704151, 0, -0.0493354648, 0)
OtherTitle.Size = UDim2.new(0, 38, 0, 17)
OtherTitle.Font = Enum.Font.SourceSansBold
OtherTitle.Text = "Other"
OtherTitle.TextColor3 = Color3.new(1, 1, 1)
OtherTitle.TextSize = 14
OtherTitle.TextStrokeTransparency = 0

TeamsFrame.Name = "TeamsFrame"
TeamsFrame.Parent = Local
TeamsFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TeamsFrame.BorderColor3 = Color3.new(0, 0, 0)
TeamsFrame.Position = UDim2.new(0.509715855, 0, 0.0626649335, 0)
TeamsFrame.Size = UDim2.new(0, 197, 0, 98)

Crime.Name = "Crime"
Crime.Parent = TeamsFrame
Crime.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Crime.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Crime.Position = UDim2.new(0.109228425, 0, 0.540816307, 0)
Crime.Size = UDim2.new(0, 71, 0, 24)
Crime.Font = Enum.Font.SourceSansBold
Crime.Text = "Criminal"
Crime.TextColor3 = Color3.new(1, 1, 1)
Crime.TextSize = 14
Crime.TextStrokeTransparency = 0
Crime.MouseButton1Click:connect(function()
		local Apart = Instance.new("Part")

Apart.Name = "PlrsPos"
Apart.Parent = workspace
Apart.Anchored = true
Apart.Archivable = true
Apart.CFrame = CFrame.new(9e99, 9e99, 9e99)

LCS = game.Workspace["Criminals Spawn"].SpawnLocation
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

Police.Name = "Police"
Police.Parent = TeamsFrame
Police.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Police.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Police.Position = UDim2.new(0.10920801, 0, 0.210816324, 0)
Police.Size = UDim2.new(0, 71, 0, 24)
Police.Font = Enum.Font.SourceSansBold
Police.Text = "Police"
Police.TextColor3 = Color3.new(1, 1, 1)
Police.TextSize = 14
Police.TextStrokeTransparency = 0
Police.MouseButton1Click:connect(function()
	Workspace.Remote.TeamEvent:FireServer("Bright blue")
end)

NA.Name = "NA"
NA.Parent = TeamsFrame
NA.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
NA.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
NA.Position = UDim2.new(0.529228449, 0, 0.540816307, 0)
NA.Size = UDim2.new(0, 71, 0, 24)
NA.Font = Enum.Font.SourceSansBold
NA.Text = "N/A"
NA.TextColor3 = Color3.new(1, 1, 1)
NA.TextSize = 14
NA.TextStrokeTransparency = 0
NA.MouseButton1Click:connect(function()
	Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
end)

Inmate.Name = "Inmate"
Inmate.Parent = TeamsFrame
Inmate.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Inmate.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
Inmate.Position = UDim2.new(0.529228449, 0, 0.210816324, 0)
Inmate.Size = UDim2.new(0, 71, 0, 24)
Inmate.Font = Enum.Font.SourceSansBold
Inmate.Text = "Inmate"
Inmate.TextColor3 = Color3.new(1, 1, 1)
Inmate.TextSize = 14
Inmate.TextStrokeTransparency = 0
Inmate.MouseButton1Click:connect(function()
	Workspace.Remote.TeamEvent:FireServer("Bright orange")
end)

TeamsTitle.Name = "TeamsTitle"
TeamsTitle.Parent = TeamsFrame
TeamsTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TeamsTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TeamsTitle.Position = UDim2.new(0.0625814945, 0, -0.0862018168, 0)
TeamsTitle.Size = UDim2.new(0, 38, 0, 17)
TeamsTitle.Font = Enum.Font.SourceSansBold
TeamsTitle.Text = "Teams"
TeamsTitle.TextColor3 = Color3.new(1, 1, 1)
TeamsTitle.TextSize = 14
TeamsTitle.TextStrokeTransparency = 0

GunsFrame.Name = "GunsFrame"
GunsFrame.Parent = Local
GunsFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
GunsFrame.BorderColor3 = Color3.new(0, 0, 0)
GunsFrame.Position = UDim2.new(0.0376955792, 0, 0.0626649335, 0)
GunsFrame.Size = UDim2.new(0, 197, 0, 98)

sh.Name = "sh"
sh.Parent = GunsFrame
sh.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
sh.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
sh.Position = UDim2.new(0.109228425, 0, 0.540816307, 0)
sh.Size = UDim2.new(0, 71, 0, 24)
sh.Font = Enum.Font.SourceSansBold
sh.Text = "Shotgun"
sh.TextColor3 = Color3.new(1, 1, 1)
sh.TextSize = 14
sh.TextStrokeTransparency = 0
sh.MouseButton1Click:connect(function()
 local Weapon = {"Remington 870"}
for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
if v.Name == Weapon[1] then
local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
end
end
end)

ak.Name = "ak"
ak.Parent = GunsFrame
ak.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
ak.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
ak.Position = UDim2.new(0.527431369, 0, 0.210816324, 0)
ak.Size = UDim2.new(0, 71, 0, 24)
ak.Font = Enum.Font.SourceSansBold
ak.Text = "AK-47"
ak.TextColor3 = Color3.new(1, 1, 1)
ak.TextSize = 14
ak.TextStrokeTransparency = 0
ak.MouseButton1Click:connect(function()
	local Weapon = {"AK-47"}
for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
if v.Name == Weapon[1] then
local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
end
end
end)

m9.Name = "m9"
m9.Parent = GunsFrame
m9.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m9.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m9.Position = UDim2.new(0.527228475, 0, 0.540816307, 0)
m9.Size = UDim2.new(0, 71, 0, 24)
m9.Font = Enum.Font.SourceSansBold
m9.Text = "M9"
m9.TextColor3 = Color3.new(1, 1, 1)
m9.TextSize = 14
m9.TextStrokeTransparency = 0
m9.MouseButton1Click:connect(function()
   local Weapon = {"M9"}
for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
if v.Name == Weapon[1] then
local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
end
end
end)

m4.Name = "m4"
m4.Parent = GunsFrame
m4.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m4.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m4.Position = UDim2.new(0.109600931, 0, 0.211262286, 0)
m4.Size = UDim2.new(0, 71, 0, 24)
m4.Font = Enum.Font.SourceSansBold
m4.Text = "M4A1"
m4.TextColor3 = Color3.new(1, 1, 1)
m4.TextSize = 14
m4.TextStrokeTransparency = 0
m4.MouseButton1Click:connect(function()
	  local Weapon = {"M4A1"}
for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
if v.Name == Weapon[1] then
local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
end
end
end)

GunsTitle.Name = "GunsTitle"
GunsTitle.Parent = GunsFrame
GunsTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
GunsTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
GunsTitle.Position = UDim2.new(0.062581487, 0, -0.0862018839, 0)
GunsTitle.Size = UDim2.new(0, 63, 0, 17)
GunsTitle.Font = Enum.Font.SourceSansBold
GunsTitle.Text = "Give Guns"
GunsTitle.TextColor3 = Color3.new(1, 1, 1)
GunsTitle.TextSize = 14
GunsTitle.TextStrokeTransparency = 0

Misc.Name = "Misc"
Misc.Parent = MainGUI
Misc.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
Misc.BorderColor3 = Color3.new(0, 0, 0)
Misc.Position = UDim2.new(0.0276797097, 0, 0.145833328, 0)
Misc.Size = UDim2.new(0, 432, 0, 359)
Misc.Visible = false

OtherMiscFrame.Name = "OtherMiscFrame"
OtherMiscFrame.Parent = Misc
OtherMiscFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherMiscFrame.BorderColor3 = Color3.new(0, 0, 0)
OtherMiscFrame.Position = UDim2.new(0.0379999988, 0, 0.370000005, 0)
OtherMiscFrame.Size = UDim2.new(0, 401, 0, 206)

invis.Name = "invis"
invis.Parent = OtherMiscFrame
invis.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
invis.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
invis.Position = UDim2.new(0.609743178, 0, 0.321951449, 0)
invis.Size = UDim2.new(0, 71, 0, 24)
invis.Font = Enum.Font.SourceSansBold
invis.Text = "Invisible"
invis.TextColor3 = Color3.new(1, 1, 1)
invis.TextSize = 14
invis.TextStrokeTransparency = 0
invis.MouseButton1Click:connect(function()
	local player = game.Players.LocalPlayer
position     = player.Character.HumanoidRootPart.Position
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
game.Players.LocalPlayer.Character.Head.Transparency  = 1
game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
game.Players.LocalPlayer.Character.Head.face:Remove()
end)

crimall.Name = "crimall"
crimall.Parent = OtherMiscFrame
crimall.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
crimall.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
crimall.Position = UDim2.new(0.40974319, 0, 0.321951449, 0)
crimall.Size = UDim2.new(0, 71, 0, 24)
crimall.Font = Enum.Font.SourceSansBold
crimall.Text = "Crime All"
crimall.TextColor3 = Color3.new(1, 1, 1)
crimall.TextSize = 14
crimall.TextStrokeTransparency = 0
crimall.MouseButton1Click:connect(function()
	local Player = game.Players.LocalPlayer
if Player.Character.Humanoid.Sit == true then 
Player.Character.Humanoid.Sit = false
end
local cpos = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Teams.Guards:GetPlayers()) do
if v and v.Character then
if v.Name ~= Player.Name then
if v.Name ~= "jake11pric" then
    repeat
    i = i-1
Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) 

wait(0.01)
if Player.Character.Humanoid.Sit == true then 
Player.Character.Humanoid.Sit = false
end
local A_1 =
{
[1] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
["Distance"] = 3.2524313926697,
["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
["Hit"] = v.Character.Head
},
  [2] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
["Distance"] = 3.2699294090271,
["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
["Hit"] = v.Character.Head
},
[3] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
["Distance"] = 3.1665518283844,
["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
["Hit"] = v.Character.Head
},
[4] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
["Distance"] = 3.3218522071838,
["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
["Hit"] = v.Character.Head
},
[5] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
["Distance"] = 3.222757101059,
["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
["Hit"] = v.Character.Head
}
}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
				  if Player.Character.Humanoid.Sit == true then 
					  Player.Character.Humanoid.Sit = false
				  end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
				if Player.Character.Humanoid.Sit == true then 
				Player.Character.Humanoid.Sit = false
				end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			    until i == 0
      end
end

	Player.Character.HumanoidRootPart.CFrame = cpos
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
		    end
end
end
	wait(0.1)
if Player.Character.Humanoid.Sit == true then 
Player.Character.Humanoid.Sit = false
end
local Player = game.Players.LocalPlayer
local cpos = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Teams.Inmates:GetPlayers()) do
if v and v.Character then
if v.Name ~= Player.Name then
if v.Name ~= "jake11pric" then
    repeat
    i = i-1
Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) 

wait(0.01)
if Player.Character.Humanoid.Sit == true then 
Player.Character.Humanoid.Sit = false
end
local A_1 =
{
[1] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
["Distance"] = 3.2524313926697,
["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
["Hit"] = v.Character.Head
},
  [2] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
["Distance"] = 3.2699294090271,
["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
["Hit"] = v.Character.Head
},
[3] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
["Distance"] = 3.1665518283844,
["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
["Hit"] = v.Character.Head
},
[4] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
["Distance"] = 3.3218522071838,
["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
["Hit"] = v.Character.Head
},
[5] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
["Distance"] = 3.222757101059,
["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
["Hit"] = v.Character.Head
}
}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
				   	if Player.Character.Humanoid.Sit == true then 
					Player.Character.Humanoid.Sit = false
				  end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
				   	if Player.Character.Humanoid.Sit == true then 
					Player.Character.Humanoid.Sit = false
				  end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			    until i == 0
      end
end

	Player.Character.HumanoidRootPart.CFrame = cpos
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
		    end
       end
end
wait(0.1)
if Player.Character.Humanoid.Sit == true then 
Player.Character.Humanoid.Sit = false
end
local Player = game.Players.LocalPlayer
local cpos = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Teams.Neutral:GetPlayers()) do
if v.Name ~= Player.Name then
    repeat
    i = i-1
Workspace.Remote.TeamEvent:FireServer("Bright orange")
game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) 

wait(0.01)
local A_1 =
{
[1] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
["Distance"] = 3.2524313926697,
["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
["Hit"] = v.Character.Head
},
  [2] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
["Distance"] = 3.2699294090271,
["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
["Hit"] = v.Character.Head
},
[3] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
["Distance"] = 3.1665518283844,
["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
["Hit"] = v.Character.Head
},
[4] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
["Distance"] = 3.3218522071838,
["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
["Hit"] = v.Character.Head
},
[5] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
["Distance"] = 3.222757101059,
["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
["Hit"] = v.Character.Head
}
}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
					if Player.Character.Humanoid.Sit == true then 
					  Player.Character.Humanoid.Sit = false
				  end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
				   	if Player.Character.Humanoid.Sit == true then 
					  Player.Character.Humanoid.Sit = false
				  end
				       Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		    end
			    until i == 0
      end
end

	Player.Character.HumanoidRootPart.CFrame = cpos
local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
		    end
end)

ModWarning.Name = "ModWarning"
ModWarning.Parent = OtherMiscFrame
ModWarning.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModWarning.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModWarning.Position = UDim2.new(0.015781926, 0, 0.732327044, 0)
ModWarning.Size = UDim2.new(0, 385, 0, 17)
ModWarning.Font = Enum.Font.SourceSansBold
ModWarning.Text = "Find keycard looks for dropped keycards so it might take a while"
ModWarning.TextColor3 = Color3.new(1, 1, 1)
ModWarning.TextSize = 14
ModWarning.TextStrokeTransparency = 0
ModWarning.TextWrapped = true

yellowname.Name = "yellowname"
yellowname.Parent = OtherMiscFrame
yellowname.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
yellowname.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
yellowname.Position = UDim2.new(0.705503762, 0, 0.164805815, 0)
yellowname.Size = UDim2.new(0, 71, 0, 24)
yellowname.Font = Enum.Font.SourceSansBold
yellowname.Text = "Color Name"
yellowname.TextColor3 = Color3.new(1, 1, 1)
yellowname.TextSize = 14
yellowname.TextStrokeTransparency = 0
yellowname.MouseButton1Down:connect(function()
saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local tbl_main = 
{
      game:GetService("Players").LocalPlayer, 
      "Bright yellow"
}
game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(tbl_main))
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
end)

keycard.Name = "keycard"
keycard.Parent = OtherMiscFrame
keycard.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
keycard.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
keycard.Position = UDim2.new(0.209743157, 0, 0.321951449, 0)
keycard.Size = UDim2.new(0, 71, 0, 24)
keycard.Font = Enum.Font.SourceSansBold
keycard.Text = "Find Keycard"
keycard.TextColor3 = Color3.new(1, 1, 1)
keycard.TextSize = 14
keycard.TextStrokeTransparency = 0
keycard.MouseButton1Down:connect(function()
	local Remote = game.Workspace.Remote['ItemHandler']
 
local Arguments = {
        [1] = Workspace.Prison_ITEMS.single:WaitForChild("Key card").ITEMPICKUP
}
 
Remote:InvokeServer(unpack(Arguments))
end)

ModWarning_2.Name = "ModWarning"
ModWarning_2.Parent = OtherMiscFrame
ModWarning_2.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModWarning_2.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModWarning_2.Position = UDim2.new(0.0822670162, 0, 0.819511533, 0)
ModWarning_2.Size = UDim2.new(0, 334, 0, 17)
ModWarning_2.Font = Enum.Font.SourceSansBold
ModWarning_2.Text = "You Must Be A Cop With A Taser In Your Inv For Tase All To Work"
ModWarning_2.TextColor3 = Color3.new(1, 1, 1)
ModWarning_2.TextSize = 14
ModWarning_2.TextStrokeTransparency = 0

arrestall.Name = "arrestall"
arrestall.Parent = OtherMiscFrame
arrestall.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
arrestall.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
arrestall.Position = UDim2.new(0.504892766, 0, 0.165708736, 0)
arrestall.Size = UDim2.new(0, 71, 0, 24)
arrestall.Font = Enum.Font.SourceSansBold
arrestall.Text = "Arrest All"
arrestall.TextColor3 = Color3.new(1, 1, 1)
arrestall.TextSize = 14
arrestall.TextStrokeTransparency = 0
arrestall.MouseButton1Down:connect(function()
	local Player = game.Players.LocalPlayer
local cpos = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
if v.Name ~= Player.Name then
local i = 10
    repeat
    wait()
    i = i-1
    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
    until i == 0
end
end
end)

taseall.Name = "taseall"
taseall.Parent = OtherMiscFrame
taseall.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
taseall.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
taseall.Position = UDim2.new(0.304892778, 0, 0.165708736, 0)
taseall.Size = UDim2.new(0, 71, 0, 24)
taseall.Font = Enum.Font.SourceSansBold
taseall.Text = "Tase All"
taseall.TextColor3 = Color3.new(1, 1, 1)
taseall.TextSize = 14
taseall.TextStrokeTransparency = 0
taseall.MouseButton1Down:connect(function()
	workspace.Remote.TeamEvent:FireServer("Bright blue")

function kill(a)
local A_1 = 
{
	[1] = 
{
	["RayObject"] = Ray.new(Vector3.new(829.838562, 101.489998, 2331.25635), Vector3.new(-30.6540909, -5.42795324, 95.0308533)), 
	["Distance"] = 15.355997085571, 
	["Cframe"] = CFrame.new(826.616699, 100.8508, 2340.11279, 0.964640439, -0.00993416365, -0.263382077, 9.31322575e-10, 0.999289393, -0.0376908854, 0.263569355, 0.0363581516, 0.963954985), 
	["Hit"] = a.Character.Torso
}
}
local A_2 = game.Players.LocalPlayer.Backpack["Taser"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
end

for i,v in pairs(game.Players:GetChildren())do
if v.Name ~= game.Players.LocalPlayer.Name then
kill(v)
end
end
end)

respawn.Name = "respawn"
respawn.Parent = OtherMiscFrame
respawn.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
respawn.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
respawn.Position = UDim2.new(0.104892761, 0, 0.165708736, 0)
respawn.Size = UDim2.new(0, 71, 0, 24)
respawn.Font = Enum.Font.SourceSansBold
respawn.Text = "Fast Respawn"
respawn.TextColor3 = Color3.new(1, 1, 1)
respawn.TextScaled = true
respawn.TextSize = 14
respawn.TextStrokeTransparency = 0
respawn.TextWrapped = true
respawn.MouseButton1Down:connect(function()
local blah = (game.Players.LocalPlayer.Name)
	saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		local A_1 = "LocalPlayer"
    local Event = game:GetService("Workspace").Remote.loadchar
Event:InvokeServer(A_1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Position Loaded";
    Text = "Success";
})
end)

OtherModTitle.Name = "OtherModTitle"
OtherModTitle.Parent = OtherMiscFrame
OtherModTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherModTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
OtherModTitle.Position = UDim2.new(0.0265703835, 0, -0.049335517, 0)
OtherModTitle.Size = UDim2.new(0, 64, 0, 17)
OtherModTitle.Font = Enum.Font.SourceSansBold
OtherModTitle.Text = "More Misc"
OtherModTitle.TextColor3 = Color3.new(1, 1, 1)
OtherModTitle.TextSize = 14
OtherModTitle.TextStrokeTransparency = 0

CheckBoxes.Name = "CheckBoxes"
CheckBoxes.Parent = OtherMiscFrame
CheckBoxes.BackgroundColor3 = Color3.new(1, 1, 1)
CheckBoxes.BackgroundTransparency = 1
CheckBoxes.Position = UDim2.new(0.106622405, 0, 0.446553349, 0)
CheckBoxes.Size = UDim2.new(0, 311, 0, 32)

UIListLayout.Parent = CheckBoxes
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0.300000012, 0)

guardhitbox.Name = "guardhitbox"
guardhitbox.Parent = CheckBoxes
guardhitbox.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
guardhitbox.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
guardhitbox.Position = UDim2.new(0, 0, 0.53125, 0)
guardhitbox.Size = UDim2.new(0, 18, 0, 15)
guardhitbox.Font = Enum.Font.SourceSansBold
guardhitbox.Text = ""
guardhitbox.TextColor3 = Color3.new(1, 1, 1)
guardhitbox.TextScaled = true
guardhitbox.TextSize = 14
guardhitbox.TextStrokeTransparency = 0
guardhitbox.TextWrapped = true

TextLabel_12.Parent = guardhitbox
TextLabel_12.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_12.BackgroundTransparency = 1
TextLabel_12.Position = UDim2.new(2.16666675, 0, -0.0333333351, 0)
TextLabel_12.Size = UDim2.new(0, 51, 0, 15)
TextLabel_12.Font = Enum.Font.SourceSansBold
TextLabel_12.Text = "Guard Hitbox"
TextLabel_12.TextColor3 = Color3.new(1, 1, 1)
TextLabel_12.TextSize = 14
TextLabel_12.TextStrokeTransparency = 0

inmatehitbox.Name = "inmatehitbox"
inmatehitbox.Parent = CheckBoxes
inmatehitbox.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
inmatehitbox.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
inmatehitbox.Position = UDim2.new(0, 0, 0.53125, 0)
inmatehitbox.Size = UDim2.new(0, 18, 0, 15)
inmatehitbox.Font = Enum.Font.SourceSansBold
inmatehitbox.Text = ""
inmatehitbox.TextColor3 = Color3.new(1, 1, 1)
inmatehitbox.TextScaled = true
inmatehitbox.TextSize = 14
inmatehitbox.TextStrokeTransparency = 0
inmatehitbox.TextWrapped = true

TextLabel_13.Parent = inmatehitbox
TextLabel_13.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_13.BackgroundTransparency = 1
TextLabel_13.Position = UDim2.new(2.16666675, 0, -0.0333333351, 0)
TextLabel_13.Size = UDim2.new(0, 51, 0, 15)
TextLabel_13.Font = Enum.Font.SourceSansBold
TextLabel_13.Text = "Inmate Hitbox"
TextLabel_13.TextColor3 = Color3.new(1, 1, 1)
TextLabel_13.TextSize = 14
TextLabel_13.TextStrokeTransparency = 0

criminalhitbox.Name = "criminalhitbox"
criminalhitbox.Parent = CheckBoxes
criminalhitbox.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
criminalhitbox.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
criminalhitbox.Position = UDim2.new(0, 0, 0.53125, 0)
criminalhitbox.Size = UDim2.new(0, 18, 0, 15)
criminalhitbox.Font = Enum.Font.SourceSansBold
criminalhitbox.Text = ""
criminalhitbox.TextColor3 = Color3.new(1, 1, 1)
criminalhitbox.TextScaled = true
criminalhitbox.TextSize = 14
criminalhitbox.TextStrokeTransparency = 0
criminalhitbox.TextWrapped = true

TextLabel_14.Parent = criminalhitbox
TextLabel_14.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_14.BackgroundTransparency = 1
TextLabel_14.Position = UDim2.new(2.16666675, 0, -0.0333333351, 0)
TextLabel_14.Size = UDim2.new(0, 51, 0, 15)
TextLabel_14.Font = Enum.Font.SourceSansBold
TextLabel_14.Text = "Criminal Hitbox"
TextLabel_14.TextColor3 = Color3.new(1, 1, 1)
TextLabel_14.TextSize = 14
TextLabel_14.TextStrokeTransparency = 0

MiscFrame.Name = "MiscFrame"
MiscFrame.Parent = Misc
MiscFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
MiscFrame.BorderColor3 = Color3.new(0, 0, 0)
MiscFrame.Position = UDim2.new(0.50999999, 0, 0.063000001, 0)
MiscFrame.Size = UDim2.new(0, 197, 0, 98)

car.Name = "car"
car.Parent = MiscFrame
car.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
car.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
car.Position = UDim2.new(0.108999997, 0, 0.541000009, 0)
car.Size = UDim2.new(0, 71, 0, 24)
car.Font = Enum.Font.SourceSansBold
car.Text = "Fly Car"
car.TextColor3 = Color3.new(1, 1, 1)
car.TextSize = 14
car.TextStrokeTransparency = 0
car.TextWrapped = true
car.MouseButton1Down:connect(function()
	 local hint = Instance.new("Hint",game.Players.LocalPlayer.PlayerGui)
   hint.Text = "Press Z To Toggle"
   hint.Name = game.JobId
repeat wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
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
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = false
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+125.0+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-250
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "z" then
if flying then flying = false
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
end)
mouse.KeyUp:connect(function(key)
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
end)
Fly()
end)

doors.Name = "doors"
doors.Parent = MiscFrame
doors.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
doors.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
doors.Position = UDim2.new(0.108999997, 0, 0.210999995, 0)
doors.Size = UDim2.new(0, 71, 0, 24)
doors.Font = Enum.Font.SourceSansBold
doors.Text = "Remove Doors"
doors.TextColor3 = Color3.new(1, 1, 1)
doors.TextScaled = true
doors.TextSize = 14
doors.TextStrokeTransparency = 0
doors.TextWrapped = true
doors.MouseButton1Down:connect(function()
	game.Workspace.Doors:Destroy()
end)

clickarrest.Name = "clickarrest"
clickarrest.Parent = MiscFrame
clickarrest.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
clickarrest.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
clickarrest.Position = UDim2.new(0.528999984, 0, 0.541000009, 0)
clickarrest.Size = UDim2.new(0, 71, 0, 24)
clickarrest.Font = Enum.Font.SourceSansBold
clickarrest.Text = "Click Arrest"
clickarrest.TextColor3 = Color3.new(1, 1, 1)
clickarrest.TextSize = 14
clickarrest.TextStrokeTransparency = 0
clickarrest.MouseButton1Down:connect(function()
	local mouse = game.Players.LocalPlayer:GetMouse()
   local arrestEvent = game.Workspace.Remote.arrest
   mouse.Button1Down:connect(function()
   local obj = mouse.Target
   local response = arrestEvent:InvokeServer(obj)
   end)
end)

fences.Name = "fences"
fences.Parent = MiscFrame
fences.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
fences.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
fences.Position = UDim2.new(0.528999984, 0, 0.210999995, 0)
fences.Size = UDim2.new(0, 71, 0, 24)
fences.Font = Enum.Font.SourceSansBold
fences.Text = "Remove Fences"
fences.TextColor3 = Color3.new(1, 1, 1)
fences.TextScaled = true
fences.TextSize = 14
fences.TextStrokeTransparency = 0
fences.TextWrapped = true
fences.MouseButton1Down:connect(function()
	game.Workspace.Prison_Fences:Destroy()
end)

TeamsTitle_2.Name = "TeamsTitle"
TeamsTitle_2.Parent = MiscFrame
TeamsTitle_2.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TeamsTitle_2.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TeamsTitle_2.Position = UDim2.new(0.0625814945, 0, -0.0862018168, 0)
TeamsTitle_2.Size = UDim2.new(0, 38, 0, 17)
TeamsTitle_2.Font = Enum.Font.SourceSansBold
TeamsTitle_2.Text = "Misc"
TeamsTitle_2.TextColor3 = Color3.new(1, 1, 1)
TeamsTitle_2.TextSize = 14
TeamsTitle_2.TextStrokeTransparency = 0

ModFrame.Name = "ModFrame"
ModFrame.Parent = Misc
ModFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModFrame.BorderColor3 = Color3.new(0, 0, 0)
ModFrame.Position = UDim2.new(0.0379999988, 0, 0.063000001, 0)
ModFrame.Size = UDim2.new(0, 197, 0, 98)

m9mod.Name = "m9mod"
m9mod.Parent = ModFrame
m9mod.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m9mod.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m9mod.Position = UDim2.new(0.52700001, 0, 0.541000009, 0)
m9mod.Size = UDim2.new(0, 71, 0, 24)
m9mod.Font = Enum.Font.SourceSansBold
m9mod.Text = "M9"
m9mod.TextColor3 = Color3.new(1, 1, 1)
m9mod.TextSize = 14
m9mod.TextStrokeTransparency = 0
m9mod.MouseButton1Click:connect(function()
	S = game.Players.LocalPlayer.Backpack["M9"].GunStates
rs = require(S)
for i,v in next, rs do 
    rs.Spread = 0
    rs.FireRate = 0
    rs.CurrentAmmo = math.huge
    rs.Bullets = 30
    rs.AutoFire = true
end
end)

akmod.Name = "akmod"
akmod.Parent = ModFrame
akmod.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
akmod.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
akmod.Position = UDim2.new(0.52700001, 0, 0.210999995, 0)
akmod.Size = UDim2.new(0, 71, 0, 24)
akmod.Font = Enum.Font.SourceSansBold
akmod.Text = "AK-47"
akmod.TextColor3 = Color3.new(1, 1, 1)
akmod.TextSize = 14
akmod.TextStrokeTransparency = 0
akmod.MouseButton1Click:connect(function()
S = game.Players.LocalPlayer.Backpack["AK-47"].GunStates
rs = require(S)
for i,v in next, rs do 
    rs.Spread = 0
    rs.FireRate = 0
    rs.CurrentAmmo = math.huge
    rs.Bullets = 30
    rs.AutoFire = true
end
end)

shmod.Name = "shmod"
shmod.Parent = ModFrame
shmod.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
shmod.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
shmod.Position = UDim2.new(0.108999997, 0, 0.541000009, 0)
shmod.Size = UDim2.new(0, 71, 0, 24)
shmod.Font = Enum.Font.SourceSansBold
shmod.Text = "Shotgun"
shmod.TextColor3 = Color3.new(1, 1, 1)
shmod.TextSize = 14
shmod.TextStrokeTransparency = 0
shmod.MouseButton1Click:connect(function()
	S = game.Players.LocalPlayer.Backpack["Remington 870"].GunStates
rs = require(S)
for i,v in next, rs do 
	rs.Spread = 0
    rs.FireRate = 0
    rs.CurrentAmmo = math.huge
    rs.Bullets = 30
    rs.AutoFire = true
end
end)

m4mod.Name = "m4mod"
m4mod.Parent = ModFrame
m4mod.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m4mod.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
m4mod.Position = UDim2.new(0.109999999, 0, 0.210999995, 0)
m4mod.Size = UDim2.new(0, 71, 0, 24)
m4mod.Font = Enum.Font.SourceSansBold
m4mod.Text = "M4A1"
m4mod.TextColor3 = Color3.new(1, 1, 1)
m4mod.TextSize = 14
m4mod.TextStrokeTransparency = 0
m4mod.MouseButton1Click:connect(function()
S = game.Players.LocalPlayer.Backpack["M4A1"].GunStates
rs = require(S)
for i,v in next, rs do 
    rs.Spread = 0
    rs.FireRate = 0
    rs.CurrentAmmo = math.huge
    rs.Bullets = 30
    rs.AutoFire = true
end
end)

ModTitle.Name = "ModTitle"
ModTitle.Parent = ModFrame
ModTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ModTitle.Position = UDim2.new(0.062581487, 0, -0.0862018839, 0)
ModTitle.Size = UDim2.new(0, 63, 0, 17)
ModTitle.Font = Enum.Font.SourceSansBold
ModTitle.Text = "Mod Guns"
ModTitle.TextColor3 = Color3.new(1, 1, 1)
ModTitle.TextSize = 14
ModTitle.TextStrokeTransparency = 0

Rage.Name = "Rage"
Rage.Parent = MainGUI
Rage.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
Rage.BorderColor3 = Color3.new(0, 0, 0)
Rage.Position = UDim2.new(0.0276797097, 0, 0.145833328, 0)
Rage.Size = UDim2.new(0, 432, 0, 359)
Rage.Visible = false

RageFrame.Name = "RageFrame"
RageFrame.Parent = Rage
RageFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
RageFrame.BorderColor3 = Color3.new(0, 0, 0)
RageFrame.Position = UDim2.new(0.0376955792, 0, 0.0626649335, 0)
RageFrame.Size = UDim2.new(0, 197, 0, 98)

killaura.Name = "killaura"
killaura.Parent = RageFrame
killaura.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
killaura.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
killaura.Position = UDim2.new(0.527431369, 0, 0.210816324, 0)
killaura.Size = UDim2.new(0, 71, 0, 24)
killaura.Font = Enum.Font.SourceSansBold
killaura.Text = "Kill Aura"
killaura.TextColor3 = Color3.new(1, 1, 1)
killaura.TextSize = 14
killaura.TextStrokeTransparency = 0
killaura.MouseButton1Click:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Info:";
Text = "Press E To Kill People Near You!";
})

	plr = game:service'Players'.LocalPlayer
char = plr.Character
mouse = plr:GetMouse()
on = false

mouse.KeyDown:connect(function(key)
  if key == "e" then
      on = true
  end
end)

mouse.KeyUp:connect(function(key)
  if key == "e" then
      on = false
  end
end)

while wait(0.1) do
  for i, b in pairs(game.Players:GetChildren()) do
      if b.Name ~= plr.Name and not b:IsFriendsWith(plr.UserId) and on then
          for i = 1, 10 do
              game.ReplicatedStorage.meleeEvent:FireServer(b)
          end
      end
  end
end


while true do
 wait(0.01)
 for i,v in pairs (game.Players:GetChildren()) do
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
   game.ReplicatedStorage.meleeEvent:FireServer(v.Name)
   wait(.8)
 end
end
end)

killall.Name = "killall"
killall.Parent = RageFrame
killall.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
killall.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
killall.Position = UDim2.new(0.109600931, 0, 0.211262286, 0)
killall.Size = UDim2.new(0, 71, 0, 24)
killall.Font = Enum.Font.SourceSansBold
killall.Text = "Kill All"
killall.TextColor3 = Color3.new(1, 1, 1)
killall.TextSize = 14
killall.TextStrokeTransparency = 0
killall.MouseButton1Click:connect(function()
	workspace.Remote.TeamEvent:FireServer("Medium stone grey")
 
game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
 
wait(0.5)
function kill(a)
local A_1 =
{
[1] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
["Distance"] = 3.2524313926697,
["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
["Hit"] = a.Character.Head
},
  [2] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
["Distance"] = 3.2699294090271,
["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
["Hit"] = a.Character.Head
},
[3] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
["Distance"] = 3.1665518283844,
["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
["Hit"] = a.Character.Head
},
[4] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
["Distance"] = 3.3218522071838,
["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
["Hit"] = a.Character.Head
},
[5] =
{
["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
["Distance"] = 3.222757101059,
["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
["Hit"] = a.Character.Head
}
}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
end
 
for i,v in pairs(game.Players:GetChildren())do
if v.Name ~= game.Players.LocalPlayer.Name then
kill(v)
end
end
wait(1)
workspace.Remote.TeamEvent:FireServer("Bright orange")
end)

RageTitle.Name = "RageTitle"
RageTitle.Parent = RageFrame
RageTitle.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
RageTitle.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
RageTitle.Position = UDim2.new(0.062581487, 0, -0.0862018839, 0)
RageTitle.Size = UDim2.new(0, 37, 0, 17)
RageTitle.Font = Enum.Font.SourceSansBold
RageTitle.Text = "Rage"
RageTitle.TextColor3 = Color3.new(1, 1, 1)
RageTitle.TextSize = 14
RageTitle.TextStrokeTransparency = 0

Bar.Name = "Bar"
Bar.Parent = MainGUI
Bar.BackgroundColor3 = Color3.new(0.211765, 0.211765, 0.211765)
Bar.BorderColor3 = Color3.new(0, 0, 0)
Bar.Position = UDim2.new(0.0276797097, 0, 0.0648148134, 0)
Bar.Size = UDim2.new(0, 432, 0, 34)

info.Name = "info"
info.Parent = Bar
info.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
info.BorderSizePixel = 0
info.Position = UDim2.new(0.513972521, 0, 0, 0)
info.Size = UDim2.new(0, 56, 0, 34)
info.Font = Enum.Font.SourceSansBold
info.Text = "Info"
info.TextColor3 = Color3.new(1, 1, 1)
info.TextSize = 14
info.TextStrokeTransparency = 0
info.MouseButton1Click:connect(function()
	Local.Visible = false
	Rage.Visible = false
	Misc.Visible = false
	TpList.Visible = false
	Info.Visible = true
	
	_1local.localtop.Visible = false
	rage.ragetop.Visible = false
	misc.misctop.Visible = false
	tplist.tplisttop.Visible = false
	info.infotop.Visible = true
end)

infotop.Name = "infotop"
infotop.Parent = info
infotop.BackgroundColor3 = Color3.new(1, 0.576471, 0)
infotop.BorderSizePixel = 0
infotop.Size = UDim2.new(0, 55, 0, 1)

tplist.Name = "tplist"
tplist.Parent = Bar
tplist.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
tplist.BorderSizePixel = 0
tplist.Position = UDim2.new(0.384900749, 0, 0, 0)
tplist.Size = UDim2.new(0, 56, 0, 34)
tplist.Font = Enum.Font.SourceSansBold
tplist.Text = "TP List"
tplist.TextColor3 = Color3.new(1, 1, 1)
tplist.TextSize = 14
tplist.TextStrokeTransparency = 0
tplist.MouseButton1Click:connect(function()
	Local.Visible = false
	Rage.Visible = false
	Misc.Visible = false
	TpList.Visible = true
	Info.Visible = false
	
	_1local.localtop.Visible = false
	rage.ragetop.Visible = false
	misc.misctop.Visible = false
	tplist.tplisttop.Visible = true
	info.infotop.Visible = false
end)

tplisttop.Name = "tplisttop"
tplisttop.Parent = tplist
tplisttop.BackgroundColor3 = Color3.new(1, 0.576471, 0)
tplisttop.BorderSizePixel = 0
tplisttop.Size = UDim2.new(0, 55, 0, 1)
tplisttop.Visible = false

misc.Name = "misc"
misc.Parent = Bar
misc.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
misc.BorderSizePixel = 0
misc.Position = UDim2.new(0.255828887, 0, 0, 0)
misc.Size = UDim2.new(0, 56, 0, 34)
misc.Font = Enum.Font.SourceSansBold
misc.Text = "Misc"
misc.TextColor3 = Color3.new(1, 1, 1)
misc.TextSize = 14
misc.TextStrokeTransparency = 0
misc.MouseButton1Click:connect(function()
	Local.Visible = false
	Rage.Visible = false
	Misc.Visible = true
	TpList.Visible = false
	Info.Visible = false
	
	_1local.localtop.Visible = false
	rage.ragetop.Visible = false
	misc.misctop.Visible = true
	tplist.tplisttop.Visible = false
	info.infotop.Visible = false
end)

misctop.Name = "misctop"
misctop.Parent = misc
misctop.BackgroundColor3 = Color3.new(1, 0.576471, 0)
misctop.BorderSizePixel = 0
misctop.Size = UDim2.new(0, 55, 0, 1)
misctop.Visible = false

rage.Name = "rage"
rage.Parent = Bar
rage.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
rage.BorderSizePixel = 0
rage.Position = UDim2.new(0.129071847, 0, 0, 0)
rage.Size = UDim2.new(0, 56, 0, 34)
rage.Font = Enum.Font.SourceSansBold
rage.Text = "Rage"
rage.TextColor3 = Color3.new(1, 1, 1)
rage.TextSize = 14
rage.TextStrokeTransparency = 0
rage.MouseButton1Click:connect(function()
	Local.Visible = false
	Rage.Visible = true
	Misc.Visible = false
	TpList.Visible = false
	Info.Visible = false
	
	_1local.localtop.Visible = false
	rage.ragetop.Visible = true
	misc.misctop.Visible = false
	tplist.tplisttop.Visible = false
	info.infotop.Visible = false
end)

ragetop.Name = "ragetop"
ragetop.Parent = rage
ragetop.BackgroundColor3 = Color3.new(1, 0.576471, 0)
ragetop.BorderSizePixel = 0
ragetop.Size = UDim2.new(0, 55, 0, 1)
ragetop.Visible = false

_1local.Name = "1local"
_1local.Parent = Bar
_1local.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
_1local.BorderSizePixel = 0
_1local.Size = UDim2.new(0, 56, 0, 34)
_1local.Font = Enum.Font.SourceSansBold
_1local.Text = "Local"
_1local.TextColor3 = Color3.new(1, 1, 1)
_1local.TextSize = 14
_1local.TextStrokeTransparency = 0
_1local.MouseButton1Click:connect(function()
	Local.Visible = true
	Rage.Visible = false
	Misc.Visible = false
	TpList.Visible = false
	Info.Visible = false
	
	_1local.localtop.Visible = true
	rage.ragetop.Visible = false
	misc.misctop.Visible = false
	tplist.tplisttop.Visible = false
	info.infotop.Visible = false
end)

localtop.Name = "localtop"
localtop.Parent = _1local
localtop.BackgroundColor3 = Color3.new(1, 0.576471, 0)
localtop.BorderSizePixel = 0
localtop.Size = UDim2.new(0, 55, 0, 1)
localtop.Visible = false

Title.Name = "Title"
Title.Parent = MainGUI
Title.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Title.BorderColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.383458614, 0, 0, 0)
Title.Size = UDim2.new(0, 91, 0, 22)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Prison Life GUI v2.8"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextStrokeTransparency = 0

PlayerList.Name = "PlayerList"
PlayerList.Parent = CheckMyNetWorth
PlayerList.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
PlayerList.BorderColor3 = Color3.new(0, 0, 0)
PlayerList.BorderSizePixel = 2
PlayerList.Position = UDim2.new(0.708288908, 0, 0.401719928, 0)
PlayerList.Size = UDim2.new(0, 329, 0, 395)
PlayerList.Visible = false
PlayerList.Active = true
PlayerList.Draggable = true

PlayerListMain.Name = "PlayerListMain"
PlayerListMain.Parent = PlayerList
PlayerListMain.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
PlayerListMain.BorderColor3 = Color3.new(0, 0, 0)
PlayerListMain.Position = UDim2.new(0.0425531901, 0, 0.0781717002, 0)
PlayerListMain.Size = UDim2.new(0, 301, 0, 349)

PlayerListTitle.Name = "PlayerListTitle"
PlayerListTitle.Parent = PlayerList
PlayerListTitle.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
PlayerListTitle.BorderColor3 = Color3.new(0.105882, 0.105882, 0.105882)
PlayerListTitle.BorderSizePixel = 0
PlayerListTitle.Position = UDim2.new(0.194528878, 0, 0, 0)
PlayerListTitle.Size = UDim2.new(0, 200, 0, 28)
PlayerListTitle.Font = Enum.Font.SourceSansBold
PlayerListTitle.Text = "Player List"
PlayerListTitle.TextColor3 = Color3.new(1, 1, 1)
PlayerListTitle.TextSize = 14
PlayerListTitle.TextStrokeTransparency = 0

players.Name = "players"
players.Parent = PlayerList
players.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
players.BorderColor3 = Color3.new(0, 0, 0)
players.Position = UDim2.new(0.115501523, 0, 0.135098428, 0)
players.Size = UDim2.new(0, 251, 0, 259)

ScrollingFrame.Parent = players
ScrollingFrame.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ScrollingFrame.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0717131495, 0, 0.057915058, 0)
ScrollingFrame.Size = UDim2.new(0, 217, 0, 229)

PlayerListTitle_2.Name = "PlayerListTitle"
PlayerListTitle_2.Parent = PlayerList
PlayerListTitle_2.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
PlayerListTitle_2.BorderColor3 = Color3.new(0.164706, 0.164706, 0.164706)
PlayerListTitle_2.BorderSizePixel = 0
PlayerListTitle_2.Position = UDim2.new(0.164133742, 0, 0.108144261, 0)
PlayerListTitle_2.Size = UDim2.new(0, 73, 0, 20)
PlayerListTitle_2.Font = Enum.Font.SourceSansBold
PlayerListTitle_2.Text = "Player List"
PlayerListTitle_2.TextColor3 = Color3.new(1, 1, 1)
PlayerListTitle_2.TextSize = 14
PlayerListTitle_2.TextStrokeTransparency = 0

unspectate.Name = "unspectate"
unspectate.Parent = PlayerList
unspectate.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
unspectate.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
unspectate.Position = UDim2.new(0.387005866, 0, 0.813144565, 0)
unspectate.Size = UDim2.new(0, 71, 0, 24)
unspectate.Font = Enum.Font.SourceSansBold
unspectate.Text = "Un Spectate"
unspectate.TextColor3 = Color3.new(1, 1, 1)
unspectate.TextSize = 14
unspectate.TextStrokeTransparency = 0

spectate.Name = "spectate"
spectate.Parent = PlayerList
spectate.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
spectate.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
spectate.Position = UDim2.new(0.14749217, 0, 0.813144565, 0)
spectate.Size = UDim2.new(0, 71, 0, 24)
spectate.Font = Enum.Font.SourceSansBold
spectate.Text = "Spectate"
spectate.TextColor3 = Color3.new(1, 1, 1)
spectate.TextSize = 14
spectate.TextStrokeTransparency = 0

kill.Name = "kill"
kill.Parent = PlayerList
kill.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
kill.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
kill.Position = UDim2.new(0.627434611, 0, 0.813341737, 0)
kill.Size = UDim2.new(0, 71, 0, 24)
kill.Font = Enum.Font.SourceSansBold
kill.Text = "Kill Player"
kill.TextColor3 = Color3.new(1, 1, 1)
kill.TextSize = 14
kill.TextStrokeTransparency = 0

tptoplayer.Name = "tptoplayer"
tptoplayer.Parent = PlayerList
tptoplayer.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
tptoplayer.BorderColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
tptoplayer.Position = UDim2.new(0.147492111, 0, 0.888879776, 0)
tptoplayer.Size = UDim2.new(0, 228, 0, 24)
tptoplayer.Font = Enum.Font.SourceSansBold
tptoplayer.Text = "Tp To Player "
tptoplayer.TextColor3 = Color3.new(1, 1, 1)
tptoplayer.TextSize = 14
tptoplayer.TextStrokeTransparency = 0
tptoplayer.MouseButton1Click:connect(function()
	local tp_namedplayer = Select.Text
    local tp_player = game:GetService("Players")[tp_namedplayer]
    local PLR = game:GetService("Players").LocalPlayer
    local p = Select.Text
   
    if tp_player then
        for i = 1,1 do
        wait(.08)
        PLR.Character.HumanoidRootPart.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, -1)
        end
    end
end)
-- Scripts:
y = 0.025
LP = game.Players.LocalPlayer

Select = Instance.new("TextLabel", game.Workspace)
Select.Name = math.random()

function Create(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
        inst[i] = v
    end
    return inst
end

function Generator()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= LP.Name then local Label = v.Name
			wait(math.random(1,5)/125)
			local bar = Create("TextButton", {Parent=ScrollingFrame,Name=Label,Position=UDim2.new(0.10599,0,0+y,0),Font=Enum.Font.SourceSansBold,Text=Label,TextColor3=Color3.new(1,1,1),TextSize=14,TextStrokeTransparency=0,Size=UDim2.new(0,171,0,23),BorderSizePixel=0,BackgroundColor3=Color3.new(0.1647,0.1647,0.1647)})
			bar.MouseButton1Down:connect(function()
				Select.Text = Label
				bar.BackgroundColor3 = Color3.new(229/255,128/255,27/255)
			end)
			y=y+0.040625
		end
	end
end

kill.MouseButton1Down:connect(function()
	local A_1 = {
			[1] = {
				["RayObject"] = Ray.new(Vector3.new(827.412415, 101.489777, 2296.84326), Vector3.new(277.738678, 6.89340925, 287.773712)), 
				["Distance"] = 4.7204174995422, 
				["Cframe"] = CFrame.new(832.049377, 101.392006, 2300.97168, 0.843892097, -0.0554918349, 0.533635378, 0, 0.994636595, 0.103430569, -0.536512911, -0.0872842371, 0.839366019), 
				["Hit"] = game.Workspace[Select.Text].Head
		}, 
			[2] = {
				["RayObject"] = Ray.new(Vector3.new(827.412415, 101.489777, 2296.84326), Vector3.new(303.047546, 21.3568707, 260.203888)), 
				["Distance"] = 4.8114862442017, 
				["Cframe"] = CFrame.new(832.390259, 101.550629, 2300.74097, 0.738044441, -0.112958886, 0.665229917, 7.45057971e-09, 0.985887885, 0.16740793, -0.674752235, -0.123554483, 0.727628946), 
				["Hit"] = game.Workspace[Select.Text].Head
		}, 
			[3] = {
				["RayObject"] = Ray.new(Vector3.new(827.412415, 101.489777, 2296.84326), Vector3.new(296.800507, 7.00420141, 268.067932)), 
				["Distance"] = 4.444625377655, 
				["Cframe"] = CFrame.new(832.185486, 101.391617, 2300.70264, 0.775115669, -0.0692948848, 0.628007889, 7.45057971e-09, 0.993967533, 0.109675139, -0.631819367, -0.0850109085, 0.770439863), 
				["Hit"] = game.Workspace[Select.Text].Head
		}, 
			[4] = {
				["RayObject"] = Ray.new(Vector3.new(827.412415, 101.489777, 2296.84326), Vector3.new(284.930573, 11.9850616, 280.483368)), 
				["Distance"] = 4.6211166381836, 
				["Cframe"] = CFrame.new(832.10083, 101.445007, 2300.86963, 0.820150614, -0.0735745132, 0.567397356, 0, 0.991697431, 0.128593579, -0.572147667, -0.105466105, 0.81334126), 
				["Hit"] = game.Workspace[Select.Text].Head
		}, 
			[5] = {
				["RayObject"] = Ray.new(Vector3.new(827.412415, 101.489777, 2296.84326), Vector3.new(294.625824, 2.15741801, 270.538269)), 
				["Distance"] = 4.4639973640442, 
				["Cframe"] = CFrame.new(832.169434, 101.341301, 2300.73438, 0.784266233, -0.0537625961, 0.618090749, -3.7252903e-09, 0.99623847, 0.086654529, -0.620424569, -0.0679602176, 0.781316102), 
				["Hit"] = game.Workspace[Select.Text].Head
		}
	}

	game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
	Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
	local A_2 = LP.Backpack["Remington 870"]
	game.ReplicatedStorage.ShootEvent:FireServer(A_1, A_2)
	workspace.Remote.TeamEvent:FireServer("Bright orange")
end)

Select:GetPropertyChangedSignal("Text"):connect(function()
	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name ~= Select then
			v.BackgroundColor3 = Color3.new(0.1647,0.1647,0.1647)
		end
	end
end)

spectate.MouseButton1Down:connect(function()
	if game.Workspace:FindFirstChild(Select.Text) then
		game.Workspace.CurrentCamera.CameraSubject = game.Players[Select.Text].Character.Humanoid
	end
end)

unspectate.MouseButton1Down:connect(function()
	if game.Workspace:FindFirstChild(LP.Name) then
		game.Workspace.CurrentCamera.CameraSubject = LP.Character.Humanoid
	end
end)

function RefreshFunc()
	ScrollingFrame:ClearAllChildren()
	y = 0.025
	Generator()
end

game.Players.PlayerRemoving:Connect(function()
	RefreshFunc()
end)

game.Players.PlayerAdded:Connect(function()
	RefreshFunc()
end)

Generator()
-- Scripts:
function SCRIPT_ITDV83_FAKESCRIPT() -- Message.LocalScript 
	local script = Instance.new('LocalScript')
	script.Parent = Message
	while true do
		script.Parent.MessageFrame.TextLabelooooof.TextColor3 = Color3.new(255,255,255)
		wait(0.2)
		script.Parent.MessageFrame.TextLabelooooof.TextColor3 = Color3.new(255,0,0)
	wait(1)
	end

end
coroutine.resume(coroutine.create(SCRIPT_ITDV83_FAKESCRIPT))
function SCRIPT_NABK87_FAKESCRIPT() -- CheckMyNetWorth.LocalScript 
	local script = Instance.new('LocalScript')
	script.Parent = CheckMyNetWorth
	local script = Instance.new('LocalScript')
		script.Parent = CheckMyNetWorth
		local script = Instance.new('LocalScript')
			script.Parent = CheckMyNetWorth
			local script = Instance.new('LocalScript')
				script.Parent = CheckMyNetWorth
				game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
				if key:lower() == "f" then
				    if MainGUI.Visible == false then
				        MainGUI.Visible = true
				    else
				        MainGUI.Visible = false
				    end
				if PlayerList.Visible == false then
				        PlayerList.Visible = true
				    else
				        PlayerList.Visible = false
				    end
				end
				end)

end
coroutine.resume(coroutine.create(SCRIPT_NABK87_FAKESCRIPT))







guardperson = false
guardhitbox.MouseButton1Click:Connect(function()
	if not guardperson then guardperson = true
		guardhitbox.BackgroundColor3 = Color3.fromRGB(255, 147, 0)
		
		_G.HeadSize = 10
_G.Disabledd = true
_G.Resett = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabledd then
for i,v in pairs(game.Teams["Guards"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
if _G.Resett then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end
end
end
end)
		
	else guardperson = false
		guardhitbox.BackgroundColor3 = Color3.fromRGB(30,30,30)
		
_G.Disabledd = false
_G.Resett = true
_G.Offf = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Offf then
for i,v in pairs(game.Teams["Guards"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Plastic"
v.Character.HumanoidRootPart.CanCollide = false
if _G.Resett then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end)
end
end
end
end)
				
	end
end)









inmateperson = false
inmatehitbox.MouseButton1Click:Connect(function()
	if not inmateperson then inmateperson = true
		inmatehitbox.BackgroundColor3 = Color3.fromRGB(255, 147, 0)
		
_G.HeadSize = 10
_G.Disabled = true
_G.Reset = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in pairs(game.Teams["Inmates"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright orange")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
if _G.Reset then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end
end
end
end)
		
	else inmateperson = false 
		inmatehitbox.BackgroundColor3 = Color3.fromRGB(30,30,30)
		
_G.Disabled = false
_G.Reset = true
_G.Off = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Off then
for i,v in pairs(game.Teams["Inmates"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
v.Character.HumanoidRootPart.Material = "Plastic"
v.Character.HumanoidRootPart.CanCollide = false
if _G.Reset then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end)
end
end
end
end)
				
	end
end)




crimeperson = false
criminalhitbox.MouseButton1Click:Connect(function()
	if not crimeperson then crimeperson = true
		criminalhitbox.BackgroundColor3 = Color3.fromRGB(255, 147, 0)
		
_G.HeadSize = 10
_G.Disabledd12 = true
_G.Resett12 = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabledd12 then
for i,v in pairs(game.Teams["Criminals"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
if _G.Resett12 then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end
end
end
end)
		
	else crimeperson = false
		criminalhitbox.BackgroundColor3 = Color3.fromRGB(30,30,30)
		
_G.Disabledd12 = false
_G.Resett12 = true
_G.Offf12 = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Offf12 then
for i,v in pairs(game.Teams["Criminals"]:GetPlayers()) do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Plastic"
v.Character.HumanoidRootPart.CanCollide = false
if _G.Resett12 then
if v.Character.Humanoid.Health == 0 then 
v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
end
end
end)
end
end
end
end)
				
	end
end)



local lightpart for i,v in pairs (game:GetService("Workspace").Warehouses.Warehouse1:GetDescendants()) do if v:IsA("PointLight") then lightpart = v.Parent end end

print(lightpart.Color)

lightpart.PointLight.Color = Color3.fromRGB(255,132,0)
lightpart.PointLight.Range = 12
lightpart.PointLight.Brightness = 100


for i,v in pairs(game.Workspace.Prison_spawn.Cells:GetChildren()) do
		v.Transparency = 0.7
	end

for i,v in pairs(game.Workspace.Prison_spawn.Cafeteria:GetChildren()) do
		v.Transparency = 0.7
	end

for i,v in pairs(game.Workspace.Prison_spawn.Courtyard:GetChildren()) do
		v.Transparency = 0.7
	end

for i,v in pairs(game.Workspace.Prison_spawn.Nexus:GetChildren()) do
		v.Transparency = 0.7
	end


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

StaminaMsg("This version will not work as intended, use the latest version of PLG", 7)