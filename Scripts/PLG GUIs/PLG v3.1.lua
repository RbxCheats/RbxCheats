-- Jmuses PLG v3.1
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
 --
 --

--[[ Put this on the toggles or something ]] -- _G.ESP_ENABLED = true --// You can also set this to false to hide the ESP

--[[ Put this at the start of the script ]] _G.PLAYER_ESP_ENABLED = false

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

--[[ Put this in toggles ]]
-- _G.PLAYER_ESP_ENABLED = false --// Depends on whether you wanna hide the esp or show it

-- GUI Made By: Jmuse#3982

-- Loop

local Players = game.Players
local Player = Players.LocalPlayer
local Teams = game.Teams
local Team
local pauseTeamChange = false
local ignore = {
    Player.Name,
    "JmuseYT",
    "jake11price",
    "iiWhitePersonn",
    "AntiAntiCheat"
}

local targetTeams = {
    Guards = false,
    Inmates = false,
    Criminals = false
}

for i, v in pairs(ignore) do
    ignore[v] = true
end

function getGun()
    local b, char = Player:FindFirstChild("Backpack"), workspace:FindFirstChild(Player.Name)
    if b and char then
        if char:FindFirstChild("Remington 870") then
            return char:FindFirstChild("Remington 870")
        elseif b:FindFirstChild("Remington 870") then
            return b:FindFirstChild("Remington 870")
        else
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        end
    end
    return getGun()
end

function getPlayers(team)
    local team = Teams:FindFirstChild(team)
    if team then
        return team:GetPlayers()
    end
end

function kill(player)
    local char = workspace:FindFirstChild(player)
    if char then
        local head = char:FindFirstChild("Head")
        if head then
            game.ReplicatedStorage.ShootEvent:FireServer(
                {
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())},
                    {Hit = head, RayObject = Ray.new(Vector3.new(), Vector3.new())}
                },
                getGun()
            )
        end
    end
end

function switchTeams(team)
    if Team == nil then
        Team = Player.Team
    end
    if pauseTeamChange then
        return
    end
    if Player.Team == team then
        workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end
end

function killTeam(team)
    if not getPlayers(team) then
        return
    end
    switchTeams(Teams:FindFirstChild(team))
    for i, v in pairs(getPlayers(team)) do
        if not ignore[v.Name] then
            kill(v.Name)
        end
    end
end

function resetTeam()
    local Success, Error =
        pcall(
        function()
            if Team and Team.Name == "Inmates" or Team.Name == "Neutral" or Team.Name == "Guards" then
                workspace.Remote.TeamEvent:FireServer(tostring(Team.TeamColor))
            end
        end
    )
    Team = nil
end

function toggleTeam(team)
    local Success, Error =
        pcall(
        function()
            if targetTeams[team] ~= nil then
                targetTeams[team] = not targetTeams[team]
            end
            if not (targetTeams.Criminals and targetTeams.Guards and targetTeams.Inmates) then
                resetTeam()
            end
        end
    )
end

function loopKill()
    while wait(0.5) do
        for team, active in pairs(targetTeams) do
            if active then
                killTeam(team)
            end
        end
    end
end

function onDied()
    if Player.Team == Teams.Neutral then
        workspace.Remote.TeamEvent:FireServer("Bright orange")
        pauseTeamChange = true
    end
end

Player.Character.Humanoid.Died:Connect(onDied)
Player.CharacterAdded:Connect(
    function(new_char)
        if pauseTeamChange then
            workspace.Remote.TeamEvent:FireServer("Medium stone grey")
        end
        pauseTeamChange = false
        new_char:WaitForChild("Humanoid").Died:Connect(onDied)
    end
)
spawn(loopKill)
getgenv().toggleTeam = toggleTeam

-- Loop End

local jmusepart
for _, jmuseisasexyman in pairs(game.Workspace:GetDescendants()) do
    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "OUT OF ORDER" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Furries Are Gross!"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "(srsly this time)" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "#KillFurries"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Bulletin Board" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = game.Players.LocalPlayer.Name .. " is cool!"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "YARD" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Sub To SirMeme"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "ARMORY+" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Youtube: Jmuse"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "nope" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "PLG v3.1"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "CAFETERIA" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "PLG v3.1"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "GUARD ROOM" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "POG"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "PRISON AREA" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Cool Dude Area"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "TRESPASSERS WILL BE ARRESTED" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Only cool people can be in this area!"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "RESTRICTED AREA" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Prison life GUI v3.1"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "GOVERNMENT OFFICIALS ONLY" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Made by: Jmuse#3982"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Hilltop Grocery Store" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Skid Store"
    end

    if jmuseisasexyman:IsA("TextLabel") and jmuseisasexyman.Text == "Click to spawn car" then
        jmusepart = jmuseisasexyman
        jmusepart.Text = "Click to spawn skid car"
        jmusepart.TextColor3 = Color3.fromRGB(0, 255, 0)
    end
end

wait(0.5)

local PLG = {
    PLG = Instance.new("ScreenGui"),
    All = Instance.new("Frame"),
    Main = Instance.new("Frame"),
    ABackground = Instance.new("ImageLabel"),
    ButtonHolder = Instance.new("Frame"),
    LocalBtn = Instance.new("TextButton"),
    b1 = Instance.new("Frame"),
    UIListLayout = Instance.new("UIListLayout"),
    RageBtn = Instance.new("TextButton"),
    b2 = Instance.new("Frame"),
    MiscBtn = Instance.new("TextButton"),
    b3 = Instance.new("Frame"),
    TpListBtn = Instance.new("TextButton"),
    b4 = Instance.new("Frame"),
    PlayersBtn = Instance.new("TextButton"),
    b5 = Instance.new("Frame"),
    ThemeBtn = Instance.new("TextButton"),
    b6 = Instance.new("Frame"),
    ExtraBtn = Instance.new("TextButton"),
    b7 = Instance.new("Frame"),
    InfoBtn = Instance.new("TextButton"),
    b8 = Instance.new("Frame"),
    KindaSeeit = Instance.new("Frame"),
    ThemeFrame = Instance.new("Frame"),
    BlankFrame = Instance.new("Frame"),
    TitlePart = Instance.new("Frame"),
    TextLabel = Instance.new("TextLabel"),
    Things = Instance.new("Frame"),
    UIListLayout_2 = Instance.new("UIListLayout"),
    red = Instance.new("TextButton"),
    TextLabel_2 = Instance.new("TextLabel"),
    green = Instance.new("TextButton"),
    TextLabel_3 = Instance.new("TextLabel"),
    blue = Instance.new("TextButton"),
    TextLabel_4 = Instance.new("TextLabel"),
    default = Instance.new("TextButton"),
    TextLabel_5 = Instance.new("TextLabel"),
    BlankFrame_2 = Instance.new("Frame"),
    TitlePart_2 = Instance.new("Frame"),
    TextLabel_6 = Instance.new("TextLabel"),
    Things_2 = Instance.new("Frame"),
    UIListLayout_3 = Instance.new("UIListLayout"),
    ID = Instance.new("TextBox"),
    Sb = Instance.new("TextButton"),
    TextLabel_7 = Instance.new("TextLabel"),
    BlankFrame_3 = Instance.new("Frame"),
    TitlePart_3 = Instance.new("Frame"),
    TextLabel_8 = Instance.new("TextLabel"),
    Things_3 = Instance.new("Frame"),
    UIListLayout_4 = Instance.new("UIListLayout"),
    Blank = Instance.new("TextButton"),
    TextLabel_9 = Instance.new("TextLabel"),
    Blank_2 = Instance.new("TextButton"),
    TextLabel_10 = Instance.new("TextLabel"),
    Blank_3 = Instance.new("TextButton"),
    TextLabel_11 = Instance.new("TextLabel"),
    Blank_4 = Instance.new("TextButton"),
    TextLabel_12 = Instance.new("TextLabel"),
    Blank_5 = Instance.new("TextButton"),
    TextLabel_13 = Instance.new("TextLabel"),
    BlankFrame_4 = Instance.new("Frame"),
    TitlePart_4 = Instance.new("Frame"),
    TextLabel_14 = Instance.new("TextLabel"),
    Things_4 = Instance.new("Frame"),
    UIListLayout_5 = Instance.new("UIListLayout"),
    Blank_6 = Instance.new("TextButton"),
    TextLabel_15 = Instance.new("TextLabel"),
    Blank_7 = Instance.new("TextButton"),
    TextLabel_16 = Instance.new("TextLabel"),
    Blank_8 = Instance.new("TextButton"),
    TextLabel_17 = Instance.new("TextLabel"),
    Blank_9 = Instance.new("TextButton"),
    TextLabel_18 = Instance.new("TextLabel"),
    Blank_10 = Instance.new("TextButton"),
    TextLabel_19 = Instance.new("TextLabel"),
    Tab = Instance.new("ImageLabel"),
    Title = Instance.new("TextLabel"),
    JoeMama = Instance.new("UIGradient"),
    aLocalFrame = Instance.new("Frame"),
    GunsFrame = Instance.new("Frame"),
    TitlePart_5 = Instance.new("Frame"),
    TextLabel_20 = Instance.new("TextLabel"),
    Things_5 = Instance.new("Frame"),
    UIListLayout_6 = Instance.new("UIListLayout"),
    m4 = Instance.new("TextButton"),
    TextLabel_21 = Instance.new("TextLabel"),
    ak = Instance.new("TextButton"),
    TextLabel_22 = Instance.new("TextLabel"),
    rem = Instance.new("TextButton"),
    TextLabel_23 = Instance.new("TextLabel"),
    m9 = Instance.new("TextButton"),
    TextLabel_24 = Instance.new("TextLabel"),
    SkyFrame = Instance.new("Frame"),
    TitlePart_6 = Instance.new("Frame"),
    TextLabel_25 = Instance.new("TextLabel"),
    Things_6 = Instance.new("Frame"),
    UIListLayout_7 = Instance.new("UIListLayout"),
    doge = Instance.new("TextButton"),
    TextLabel_26 = Instance.new("TextLabel"),
    office = Instance.new("TextButton"),
    TextLabel_27 = Instance.new("TextLabel"),
    jungle = Instance.new("TextButton"),
    TextLabel_28 = Instance.new("TextLabel"),
    default_2 = Instance.new("TextButton"),
    TextLabel_29 = Instance.new("TextLabel"),
    OtherFrame = Instance.new("Frame"),
    TitlePart_7 = Instance.new("Frame"),
    TextLabel_30 = Instance.new("TextLabel"),
    Things_7 = Instance.new("Frame"),
    UIListLayout_8 = Instance.new("UIListLayout"),
    Speed = Instance.new("TextButton"),
    SpeedS = Instance.new("TextBox"),
    Jump = Instance.new("TextButton"),
    JumpS = Instance.new("TextBox"),
    Btools = Instance.new("TextButton"),
    TextLabel_31 = Instance.new("TextLabel"),
    TeamsFrame = Instance.new("Frame"),
    TitlePart_8 = Instance.new("Frame"),
    TextLabel_32 = Instance.new("TextLabel"),
    Things_8 = Instance.new("Frame"),
    UIListLayout_9 = Instance.new("UIListLayout"),
    police = Instance.new("TextButton"),
    TextLabel_33 = Instance.new("TextLabel"),
    inmate = Instance.new("TextButton"),
    TextLabel_34 = Instance.new("TextLabel"),
    criminals = Instance.new("TextButton"),
    TextLabel_35 = Instance.new("TextLabel"),
    neutral = Instance.new("TextButton"),
    TextLabel_36 = Instance.new("TextLabel"),
    PlayerList = Instance.new("Frame"),
    PlayersFrame = Instance.new("Frame"),
    TitlePart_9 = Instance.new("Frame"),
    TextLabel_37 = Instance.new("TextLabel"),
    Things_9 = Instance.new("Frame"),
    PlayersBruhBruh = Instance.new("ScrollingFrame"),
    PlayerList_2 = Instance.new("UIListLayout"),
    sampletextxd = Instance.new("TextButton"),
    PLGUsers = Instance.new("Frame"),
    TitlePart_10 = Instance.new("Frame"),
    TextLabel_38 = Instance.new("TextLabel"),
    Things_10 = Instance.new("Frame"),
    UIListLayout_10 = Instance.new("UIListLayout"),
    PlayerOptions = Instance.new("Frame"),
    TitlePart_11 = Instance.new("Frame"),
    TextLabel_39 = Instance.new("TextLabel"),
    Things_11 = Instance.new("Frame"),
    UIListLayout_11 = Instance.new("UIListLayout"),
    spectate = Instance.new("TextButton"),
    TextLabel_40 = Instance.new("TextLabel"),
    unspectate = Instance.new("TextButton"),
    TextLabel_41 = Instance.new("TextLabel"),
    tptoplayer = Instance.new("TextButton"),
    TextLabel_42 = Instance.new("TextLabel"),
    kill = Instance.new("TextButton"),
    TextLabel_43 = Instance.new("TextLabel"),
    loopkillplayer = Instance.new("TextButton"),
    gangster = Instance.new("TextLabel"),
    RageFrame = Instance.new("Frame"),
    RageF = Instance.new("Frame"),
    TitlePart_12 = Instance.new("Frame"),
    TextLabel_44 = Instance.new("TextLabel"),
    Things_12 = Instance.new("Frame"),
    UIListLayout_12 = Instance.new("UIListLayout"),
    killall = Instance.new("TextButton"),
    TextLabel_45 = Instance.new("TextLabel"),
    killaura = Instance.new("TextButton"),
    TextLabel_46 = Instance.new("TextLabel"),
    Hitbox = Instance.new("Frame"),
    TitlePart_13 = Instance.new("Frame"),
    TextLabel_47 = Instance.new("TextLabel"),
    Things_13 = Instance.new("Frame"),
    UIListLayout_13 = Instance.new("UIListLayout"),
    guardbox = Instance.new("TextButton"),
    TextLabel_48 = Instance.new("TextLabel"),
    inmatebox = Instance.new("TextButton"),
    TextLabel_49 = Instance.new("TextLabel"),
    crimbox = Instance.new("TextButton"),
    TextLabel_50 = Instance.new("TextLabel"),
    neutralbox = Instance.new("TextButton"),
    TextLabel_51 = Instance.new("TextLabel"),
    KillAllToggle = Instance.new("Frame"),
    TitlePart_14 = Instance.new("Frame"),
    TextLabel_52 = Instance.new("TextLabel"),
    Things_14 = Instance.new("Frame"),
    UIListLayout_14 = Instance.new("UIListLayout"),
    ktcops = Instance.new("TextButton"),
    TextLabel_53 = Instance.new("TextLabel"),
    ktinmates = Instance.new("TextButton"),
    TextLabel_54 = Instance.new("TextLabel"),
    ktcriminals = Instance.new("TextButton"),
    TextLabel_55 = Instance.new("TextLabel"),
    ktneutral = Instance.new("TextButton"),
    TextLabel_56 = Instance.new("TextLabel"),
    KillAuraToggles = Instance.new("Frame"),
    TitlePart_15 = Instance.new("Frame"),
    TextLabel_57 = Instance.new("TextLabel"),
    Things_15 = Instance.new("Frame"),
    UIListLayout_15 = Instance.new("UIListLayout"),
    kacops = Instance.new("TextButton"),
    TextLabel_58 = Instance.new("TextLabel"),
    kainmates = Instance.new("TextButton"),
    TextLabel_59 = Instance.new("TextLabel"),
    kacriminals = Instance.new("TextButton"),
    TextLabel_60 = Instance.new("TextLabel"),
    MiscFrame = Instance.new("Frame"),
    ModGunsFrame = Instance.new("Frame"),
    TitlePart_16 = Instance.new("Frame"),
    TextLabel_61 = Instance.new("TextLabel"),
    Things_16 = Instance.new("Frame"),
    UIListLayout_16 = Instance.new("UIListLayout"),
    modm4 = Instance.new("TextButton"),
    TextLabel_62 = Instance.new("TextLabel"),
    modak = Instance.new("TextButton"),
    TextLabel_63 = Instance.new("TextLabel"),
    modrem = Instance.new("TextButton"),
    TextLabel_64 = Instance.new("TextLabel"),
    modm9 = Instance.new("TextButton"),
    TextLabel_65 = Instance.new("TextLabel"),
    modtaser = Instance.new("TextButton"),
    TextLabel_66 = Instance.new("TextLabel"),
    MoreMisc = Instance.new("Frame"),
    TitlePart_17 = Instance.new("Frame"),
    TextLabel_67 = Instance.new("TextLabel"),
    Things_17 = Instance.new("Frame"),
    UIListLayout_17 = Instance.new("UIListLayout"),
    crimeall = Instance.new("TextButton"),
    TextLabel_68 = Instance.new("TextLabel"),
    invis = Instance.new("TextButton"),
    TextLabel_69 = Instance.new("TextLabel"),
    spawnguns = Instance.new("TextButton"),
    TextLabel_70 = Instance.new("TextLabel"),
    infs = Instance.new("TextButton"),
    TextLabel_71 = Instance.new("TextLabel"),
    fastrespawn = Instance.new("TextButton"),
    TextLabel_72 = Instance.new("TextLabel"),
    OtherMiscFrame = Instance.new("Frame"),
    TitlePart_18 = Instance.new("Frame"),
    TextLabel_73 = Instance.new("TextLabel"),
    Things_18 = Instance.new("Frame"),
    UIListLayout_18 = Instance.new("UIListLayout"),
    fr = Instance.new("TextButton"),
    TextLabel_74 = Instance.new("TextLabel"),
    ta = Instance.new("TextButton"),
    TextLabel_75 = Instance.new("TextLabel"),
    aall = Instance.new("TextButton"),
    TextLabel_76 = Instance.new("TextLabel"),
    cn = Instance.new("TextButton"),
    TextLabel_77 = Instance.new("TextLabel"),
    fk = Instance.new("TextButton"),
    TextLabel_78 = Instance.new("TextLabel"),
    MiscFrameThingIdk = Instance.new("Frame"),
    TitlePart_19 = Instance.new("Frame"),
    TextLabel_79 = Instance.new("TextLabel"),
    Things_19 = Instance.new("Frame"),
    UIListLayout_19 = Instance.new("UIListLayout"),
    rd = Instance.new("TextButton"),
    TextLabel_80 = Instance.new("TextLabel"),
    rf = Instance.new("TextButton"),
    TextLabel_81 = Instance.new("TextLabel"),
    ca = Instance.new("TextButton"),
    TextLabel_82 = Instance.new("TextLabel"),
    fc = Instance.new("TextButton"),
    TextLabel_83 = Instance.new("TextLabel"),
    bb = Instance.new("TextButton"),
    TextLabel_84 = Instance.new("TextLabel"),
    TextLabel_85 = Instance.new("TextLabel"),
    TpList = Instance.new("Frame"),
    MainTeleports = Instance.new("Frame"),
    TitlePart_20 = Instance.new("Frame"),
    TextLabel_86 = Instance.new("TextLabel"),
    Things_20 = Instance.new("Frame"),
    UIListLayout_20 = Instance.new("UIListLayout"),
    policeroom = Instance.new("TextButton"),
    TextLabel_87 = Instance.new("TextLabel"),
    prisoncell = Instance.new("TextButton"),
    TextLabel_88 = Instance.new("TextLabel"),
    crimebase = Instance.new("TextButton"),
    TextLabel_89 = Instance.new("TextLabel"),
    yard = Instance.new("TextButton"),
    TextLabel_90 = Instance.new("TextLabel"),
    EvenMoreTeleports = Instance.new("Frame"),
    TitlePart_21 = Instance.new("Frame"),
    TextLabel_91 = Instance.new("TextLabel"),
    Things_21 = Instance.new("Frame"),
    UIListLayout_21 = Instance.new("UIListLayout"),
    sr = Instance.new("TextButton"),
    TextLabel_92 = Instance.new("TextLabel"),
    sroom = Instance.new("TextButton"),
    TextLabel_93 = Instance.new("TextLabel"),
    um = Instance.new("TextButton"),
    TextLabel_94 = Instance.new("TextLabel"),
    sewer = Instance.new("TextButton"),
    TextLabel_95 = Instance.new("TextLabel"),
    pv = Instance.new("TextButton"),
    TextLabel_96 = Instance.new("TextLabel"),
    MoreTeleports = Instance.new("Frame"),
    TitlePart_22 = Instance.new("Frame"),
    TextLabel_97 = Instance.new("TextLabel"),
    Things_22 = Instance.new("Frame"),
    UIListLayout_22 = Instance.new("UIListLayout"),
    top = Instance.new("TextButton"),
    TextLabel_98 = Instance.new("TextLabel"),
    tower = Instance.new("TextButton"),
    TextLabel_99 = Instance.new("TextLabel"),
    gas = Instance.new("TextButton"),
    TextLabel_100 = Instance.new("TextLabel"),
    lunch = Instance.new("TextButton"),
    TextLabel_101 = Instance.new("TextLabel"),
    SkyFrame_2 = Instance.new("Frame"),
    TitlePart_23 = Instance.new("Frame"),
    TextLabel_102 = Instance.new("TextLabel"),
    Things_23 = Instance.new("Frame"),
    UIListLayout_23 = Instance.new("UIListLayout"),
    doge_2 = Instance.new("TextButton"),
    TextLabel_103 = Instance.new("TextLabel"),
    office_2 = Instance.new("TextButton"),
    TextLabel_104 = Instance.new("TextLabel"),
    jungle_2 = Instance.new("TextButton"),
    TextLabel_105 = Instance.new("TextLabel"),
    default_3 = Instance.new("TextButton"),
    TextLabel_106 = Instance.new("TextLabel"),
    ExtraFrame = Instance.new("Frame"),
    LocalExtra = Instance.new("Frame"),
    TitlePart_24 = Instance.new("Frame"),
    TextLabel_107 = Instance.new("TextLabel"),
    Things_24 = Instance.new("Frame"),
    UIListLayout_24 = Instance.new("UIListLayout"),
    red_2 = Instance.new("TextButton"),
    TextLabel_108 = Instance.new("TextLabel"),
    green_2 = Instance.new("TextButton"),
    TextLabel_109 = Instance.new("TextLabel"),
    blue_2 = Instance.new("TextButton"),
    TextLabel_110 = Instance.new("TextLabel"),
    pink = Instance.new("TextButton"),
    TextLabel_111 = Instance.new("TextLabel"),
    purple = Instance.new("TextButton"),
    TextLabel_112 = Instance.new("TextLabel"),
    yellow = Instance.new("TextButton"),
    TextLabel_113 = Instance.new("TextLabel"),
    orange = Instance.new("TextButton"),
    TextLabel_114 = Instance.new("TextLabel"),
    ExtraGuns = Instance.new("Frame"),
    TitlePart_25 = Instance.new("Frame"),
    TextLabel_115 = Instance.new("TextLabel"),
    Things_25 = Instance.new("Frame"),
    UIListLayout_25 = Instance.new("UIListLayout"),
    blank = Instance.new("TextButton"),
    TextLabel_116 = Instance.new("TextLabel"),
    blank_2 = Instance.new("TextButton"),
    TextLabel_117 = Instance.new("TextLabel"),
    blank_3 = Instance.new("TextButton"),
    TextLabel_118 = Instance.new("TextLabel"),
    blank_4 = Instance.new("TextButton"),
    TextLabel_119 = Instance.new("TextLabel"),
    blank_5 = Instance.new("TextButton"),
    TextLabel_120 = Instance.new("TextLabel"),
    ExtraESP = Instance.new("Frame"),
    TitleParthufdjkh = Instance.new("Frame"),
    kfkfkfkfkfkfkfkfkfkk = Instance.new("TextLabel"),
    Thingsdhfkjhj = Instance.new("Frame"),
    UIListLayoutjdjdjdjjd = Instance.new("UIListLayout"),
    droppedguns = Instance.new("TextButton"),
    osdfsdfh = Instance.new("TextLabel"),
    playeresp = Instance.new("TextButton"),
    osdfsdfhhh = Instance.new("TextLabel"),
    InfoFrame = Instance.new("Frame"),
    BlankFrame_5 = Instance.new("Frame"),
    TitlePart_26 = Instance.new("Frame"),
    TextLabel_121 = Instance.new("TextLabel"),
    Things_26 = Instance.new("Frame"),
    UIListLayout_26 = Instance.new("UIListLayout"),
    TextLabel_122 = Instance.new("TextLabel"),
    TextLabel_123 = Instance.new("TextLabel"),
    TextLabel_124 = Instance.new("TextLabel"),
    TextLabel_125 = Instance.new("TextLabel"),
    TextLabel_126 = Instance.new("TextLabel"),
    Moreinfo = Instance.new("Frame"),
    TitlePart_27 = Instance.new("Frame"),
    TextLabel_127 = Instance.new("TextLabel"),
    Things_27 = Instance.new("Frame"),
    UIListLayout_27 = Instance.new("UIListLayout"),
    TextLabel_128 = Instance.new("TextLabel"),
    PlayerInfo = Instance.new("Frame"),
    TitlePart_29 = Instance.new("Frame"),
    TextLabel_130 = Instance.new("TextLabel"),
    Things_29 = Instance.new("Frame"),
    UIListLayout_29 = Instance.new("UIListLayout"),
    TextLabel_131 = Instance.new("TextLabel"),
    TextLabel_132 = Instance.new("TextLabel"),
    TextLabel_133 = Instance.new("TextLabel"),
    TextLabel_134 = Instance.new("TextLabel"),
    ServerInfo = Instance.new("Frame"),
    TitlePart_30 = Instance.new("Frame"),
    TextLabel_135 = Instance.new("TextLabel"),
    Things_30 = Instance.new("Frame"),
    UIListLayout_30 = Instance.new("UIListLayout"),
    TextLabel_136 = Instance.new("TextLabel")
}

--Properties:

PLG.PLG.Name = "PLG"
PLG.PLG.Parent = game.CoreGui
PLG.PLG.DisplayOrder = 999
PLG.PLG.ResetOnSpawn = false

PLG.All.Name = "All"
PLG.All.Parent = PLG.PLG
PLG.All.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.All.BackgroundTransparency = 1.000
PLG.All.Position = UDim2.new(0.206185564, 0, 0.114250615, 0)
PLG.All.Size = UDim2.new(0, 895, 0, 572)
PLG.All.Active = true
PLG.All.Draggable = true

PLG.Main.Name = "Main"
PLG.Main.Parent = PLG.All
PLG.Main.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
PLG.Main.BorderSizePixel = 0
PLG.Main.Position = UDim2.new(0.00816138927, 0, 0.0744907409, 0)
PLG.Main.Size = UDim2.new(0, 879, 0, 492)

PLG.ABackground.Name = "ABackground"
PLG.ABackground.Parent = PLG.Main
PLG.ABackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.ABackground.BackgroundTransparency = 1.000
PLG.ABackground.BorderSizePixel = 0
PLG.ABackground.Position = UDim2.new(0, 0, 0.113821141, 0)
PLG.ABackground.Size = UDim2.new(0, 879, 0, 436)

PLG.ButtonHolder.Name = "ButtonHolder"
PLG.ButtonHolder.Parent = PLG.Main
PLG.ButtonHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ButtonHolder.BorderSizePixel = 0
PLG.ButtonHolder.Position = UDim2.new(0, 0, 0.050460197, 0)
PLG.ButtonHolder.Size = UDim2.new(0, 879, 0, 29)

PLG.LocalBtn.Name = "LocalBtn"
PLG.LocalBtn.Parent = PLG.ButtonHolder
PLG.LocalBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.LocalBtn.BorderSizePixel = 0
PLG.LocalBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.LocalBtn.AutoButtonColor = false
PLG.LocalBtn.Font = Enum.Font.ArialBold
PLG.LocalBtn.Text = "Local"
PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.LocalBtn.TextSize = 14.000
PLG.LocalBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = true
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b1.Name = "b1"
PLG.b1.Parent = PLG.LocalBtn
PLG.b1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b1.BorderSizePixel = 0
PLG.b1.Position = UDim2.new(0, 0, 1, 0)
PLG.b1.Size = UDim2.new(0, 101, 0, 1)

PLG.UIListLayout.Parent = PLG.ButtonHolder
PLG.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
PLG.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLG.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout.Padding = UDim.new(0.00999999978, 0)

PLG.RageBtn.Name = "RageBtn"
PLG.RageBtn.Parent = PLG.ButtonHolder
PLG.RageBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.RageBtn.BorderSizePixel = 0
PLG.RageBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.RageBtn.AutoButtonColor = false
PLG.RageBtn.Font = Enum.Font.ArialBold
PLG.RageBtn.Text = "Rage"
PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.RageBtn.TextSize = 14.000
PLG.RageBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = true
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b2.Name = "b2"
PLG.b2.Parent = PLG.RageBtn
PLG.b2.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b2.BorderSizePixel = 0
PLG.b2.Position = UDim2.new(0, 0, 1, 0)
PLG.b2.Size = UDim2.new(0, 101, 0, 1)

PLG.MiscBtn.Name = "MiscBtn"
PLG.MiscBtn.Parent = PLG.ButtonHolder
PLG.MiscBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.MiscBtn.BorderSizePixel = 0
PLG.MiscBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.MiscBtn.AutoButtonColor = false
PLG.MiscBtn.Font = Enum.Font.ArialBold
PLG.MiscBtn.Text = "Misc"
PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.MiscBtn.TextSize = 14.000
PLG.MiscBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = true
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b3.Name = "b3"
PLG.b3.Parent = PLG.MiscBtn
PLG.b3.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b3.BorderSizePixel = 0
PLG.b3.Position = UDim2.new(0, 0, 1, 0)
PLG.b3.Size = UDim2.new(0, 101, 0, 1)

PLG.TpListBtn.Name = "TpListBtn"
PLG.TpListBtn.Parent = PLG.ButtonHolder
PLG.TpListBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.TpListBtn.BorderSizePixel = 0
PLG.TpListBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.TpListBtn.AutoButtonColor = false
PLG.TpListBtn.Font = Enum.Font.ArialBold
PLG.TpListBtn.Text = "Tp List"
PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.TpListBtn.TextSize = 14.000
PLG.TpListBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = true
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b4.Name = "b4"
PLG.b4.Parent = PLG.TpListBtn
PLG.b4.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b4.BorderSizePixel = 0
PLG.b4.Position = UDim2.new(0, 0, 1, 0)
PLG.b4.Size = UDim2.new(0, 101, 0, 1)

PLG.PlayersBtn.Name = "PlayersBtn"
PLG.PlayersBtn.Parent = PLG.ButtonHolder
PLG.PlayersBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.PlayersBtn.BorderSizePixel = 0
PLG.PlayersBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.PlayersBtn.AutoButtonColor = false
PLG.PlayersBtn.Font = Enum.Font.ArialBold
PLG.PlayersBtn.Text = "Players"
PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.PlayersBtn.TextSize = 14.000
PLG.PlayersBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = true
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b5.Name = "b5"
PLG.b5.Parent = PLG.PlayersBtn
PLG.b5.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b5.BorderSizePixel = 0
PLG.b5.Position = UDim2.new(0, 0, 1, 0)
PLG.b5.Size = UDim2.new(0, 101, 0, 1)

PLG.ThemeBtn.Name = "ThemeBtn"
PLG.ThemeBtn.Parent = PLG.ButtonHolder
PLG.ThemeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ThemeBtn.BorderSizePixel = 0
PLG.ThemeBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.ThemeBtn.AutoButtonColor = false
PLG.ThemeBtn.Font = Enum.Font.ArialBold
PLG.ThemeBtn.Text = "Theme"
PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.ThemeBtn.TextSize = 14.000
PLG.ThemeBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = true
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b6.Name = "b6"
PLG.b6.Parent = PLG.ThemeBtn
PLG.b6.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b6.BorderSizePixel = 0
PLG.b6.Position = UDim2.new(0, 0, 1, 0)
PLG.b6.Size = UDim2.new(0, 101, 0, 1)

PLG.ExtraBtn.Name = "ExtraBtn"
PLG.ExtraBtn.Parent = PLG.ButtonHolder
PLG.ExtraBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ExtraBtn.BorderSizePixel = 0
PLG.ExtraBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.ExtraBtn.AutoButtonColor = false
PLG.ExtraBtn.Font = Enum.Font.ArialBold
PLG.ExtraBtn.Text = "Extra"
PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.ExtraBtn.TextSize = 14.000
PLG.ExtraBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = true
        PLG.InfoFrame.Visible = false

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
)

PLG.b7.Name = "b7"
PLG.b7.Parent = PLG.ExtraBtn
PLG.b7.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b7.BorderSizePixel = 0
PLG.b7.Position = UDim2.new(0, 0, 1, 0)
PLG.b7.Size = UDim2.new(0, 101, 0, 1)

PLG.InfoBtn.Name = "InfoBtn"
PLG.InfoBtn.Parent = PLG.ButtonHolder
PLG.InfoBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.InfoBtn.BorderSizePixel = 0
PLG.InfoBtn.Size = UDim2.new(0, 101, 0, 29)
PLG.InfoBtn.AutoButtonColor = false
PLG.InfoBtn.Font = Enum.Font.ArialBold
PLG.InfoBtn.Text = "Info"
PLG.InfoBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
PLG.InfoBtn.TextSize = 14.000
PLG.InfoBtn.MouseButton1Click:connect(
    function()
        PLG.aLocalFrame.Visible = false
        PLG.RageFrame.Visible = false
        PLG.MiscFrame.Visible = false
        PLG.TpList.Visible = false
        PLG.PlayerList.Visible = false
        PLG.ThemeFrame.Visible = false
        PLG.ExtraFrame.Visible = false
        PLG.InfoFrame.Visible = true

        PLG.LocalBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.RageBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.MiscBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.TpListBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.PlayersBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ThemeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.ExtraBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        PLG.InfoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
)

PLG.b8.Name = "b8"
PLG.b8.Parent = PLG.InfoBtn
PLG.b8.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
PLG.b8.BorderSizePixel = 0
PLG.b8.Position = UDim2.new(0, 0, 1, 0)
PLG.b8.Size = UDim2.new(0, 101, 0, 1)

PLG.KindaSeeit.Name = "KindaSeeit"
PLG.KindaSeeit.Parent = PLG.Main
PLG.KindaSeeit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PLG.KindaSeeit.BackgroundTransparency = 0.600
PLG.KindaSeeit.BorderSizePixel = 0
PLG.KindaSeeit.Position = UDim2.new(0, 0, -0.0450000018, 0)
PLG.KindaSeeit.Size = UDim2.new(0, 879, 0, 22)

PLG.ThemeFrame.Name = "ThemeFrame"
PLG.ThemeFrame.Parent = PLG.Main
PLG.ThemeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.ThemeFrame.BackgroundTransparency = 1.000
PLG.ThemeFrame.BorderSizePixel = 0
PLG.ThemeFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.ThemeFrame.Size = UDim2.new(0, 648, 0, 330)
PLG.ThemeFrame.Visible = false

PLG.BlankFrame.Name = "BlankFrame"
PLG.BlankFrame.Parent = PLG.ThemeFrame
PLG.BlankFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.BlankFrame.BackgroundTransparency = 0.350
PLG.BlankFrame.BorderSizePixel = 0
PLG.BlankFrame.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.BlankFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart.Name = "TitlePart"
PLG.TitlePart.Parent = PLG.BlankFrame
PLG.TitlePart.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart.BackgroundTransparency = 0.350
PLG.TitlePart.BorderSizePixel = 0
PLG.TitlePart.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel.Parent = PLG.TitlePart
PLG.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel.BackgroundTransparency = 1.000
PLG.TextLabel.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel.Font = Enum.Font.ArialBold
PLG.TextLabel.Text = "Theme Color"
PLG.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel.TextScaled = true
PLG.TextLabel.TextSize = 14.000
PLG.TextLabel.TextWrapped = true
PLG.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things.Name = "Things"
PLG.Things.Parent = PLG.BlankFrame
PLG.Things.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things.BackgroundTransparency = 1.000
PLG.Things.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_2.Parent = PLG.Things
PLG.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_2.Padding = UDim.new(0.0700000003, 0)

PLG.red.Name = "red"
PLG.red.Parent = PLG.Things
PLG.red.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.red.BorderSizePixel = 0
PLG.red.Size = UDim2.new(0, 21, 0, 21)
PLG.red.Font = Enum.Font.SourceSans
PLG.red.Text = "Bruh"
PLG.red.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.red.TextSize = 14.000
PLG.red.TextTransparency = 1.000
PLG.red.MouseButton1Click:connect(
    function()
        Red = Color3.new(255, 0, 0)

        PLG.b1.BackgroundColor3 = Red
        PLG.b2.BackgroundColor3 = Red
        PLG.b3.BackgroundColor3 = Red
        PLG.b4.BackgroundColor3 = Red
        PLG.b5.BackgroundColor3 = Red
        PLG.b6.BackgroundColor3 = Red
        PLG.b7.BackgroundColor3 = Red
        PLG.b8.BackgroundColor3 = Red

        PLG.JoeMama.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
        }
    end
)

PLG.TextLabel_2.Parent = PLG.red
PLG.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_2.BackgroundTransparency = 1.000
PLG.TextLabel_2.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_2.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_2.Font = Enum.Font.ArialBold
PLG.TextLabel_2.Text = "Red"
PLG.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_2.TextSize = 14.000
PLG.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

PLG.green.Name = "green"
PLG.green.Parent = PLG.Things
PLG.green.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.green.BorderSizePixel = 0
PLG.green.Size = UDim2.new(0, 21, 0, 21)
PLG.green.Font = Enum.Font.SourceSans
PLG.green.Text = "Bruh"
PLG.green.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.green.TextSize = 14.000
PLG.green.TextTransparency = 1.000
PLG.green.MouseButton1Click:connect(
    function()
        Green = Color3.new(0, 255, 0)

        PLG.b1.BackgroundColor3 = Green
        PLG.b2.BackgroundColor3 = Green
        PLG.b3.BackgroundColor3 = Green
        PLG.b4.BackgroundColor3 = Green
        PLG.b5.BackgroundColor3 = Green
        PLG.b6.BackgroundColor3 = Green
        PLG.b7.BackgroundColor3 = Green
        PLG.b8.BackgroundColor3 = Green

        PLG.JoeMama.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
        }
    end
)

PLG.TextLabel_3.Parent = PLG.green
PLG.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_3.BackgroundTransparency = 1.000
PLG.TextLabel_3.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_3.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_3.Font = Enum.Font.ArialBold
PLG.TextLabel_3.Text = "Green"
PLG.TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_3.TextSize = 14.000
PLG.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

PLG.blue.Name = "blue"
PLG.blue.Parent = PLG.Things
PLG.blue.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blue.BorderSizePixel = 0
PLG.blue.Size = UDim2.new(0, 21, 0, 21)
PLG.blue.Font = Enum.Font.SourceSans
PLG.blue.Text = "Bruh"
PLG.blue.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blue.TextSize = 14.000
PLG.blue.TextTransparency = 1.000
PLG.blue.MouseButton1Click:connect(
    function()
        Blue = Color3.new(0, 0, 255)

        PLG.b1.BackgroundColor3 = Blue
        PLG.b2.BackgroundColor3 = Blue
        PLG.b3.BackgroundColor3 = Blue
        PLG.b4.BackgroundColor3 = Blue
        PLG.b5.BackgroundColor3 = Blue
        PLG.b6.BackgroundColor3 = Blue
        PLG.b7.BackgroundColor3 = Blue
        PLG.b8.BackgroundColor3 = Blue

        PLG.JoeMama.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))
        }
    end
)

PLG.TextLabel_4.Parent = PLG.blue
PLG.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_4.BackgroundTransparency = 1.000
PLG.TextLabel_4.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_4.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_4.Font = Enum.Font.ArialBold
PLG.TextLabel_4.Text = "Blue"
PLG.TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_4.TextSize = 14.000
PLG.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

PLG.default.Name = "default"
PLG.default.Parent = PLG.Things
PLG.default.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.default.BorderSizePixel = 0
PLG.default.Size = UDim2.new(0, 21, 0, 21)
PLG.default.Font = Enum.Font.SourceSans
PLG.default.Text = "Bruh"
PLG.default.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.default.TextSize = 14.000
PLG.default.TextTransparency = 1.000
PLG.default.MouseButton1Click:connect(
    function()
        Default = Color3.new(0, 170 / 255, 255 / 255)

        PLG.b1.BackgroundColor3 = Default
        PLG.b2.BackgroundColor3 = Default
        PLG.b3.BackgroundColor3 = Default
        PLG.b4.BackgroundColor3 = Default
        PLG.b5.BackgroundColor3 = Default
        PLG.b6.BackgroundColor3 = Default
        PLG.b7.BackgroundColor3 = Default
        PLG.b8.BackgroundColor3 = Default

        PLG.JoeMama.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 170, 255)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 170, 255))
        }
    end
)

PLG.TextLabel_5.Parent = PLG.default
PLG.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_5.BackgroundTransparency = 1.000
PLG.TextLabel_5.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_5.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_5.Font = Enum.Font.ArialBold
PLG.TextLabel_5.Text = "Default"
PLG.TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_5.TextSize = 14.000
PLG.TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

PLG.BlankFrame_2.Name = "BlankFrame"
PLG.BlankFrame_2.Parent = PLG.ThemeFrame
PLG.BlankFrame_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.BlankFrame_2.BackgroundTransparency = 0.350
PLG.BlankFrame_2.BorderSizePixel = 0
PLG.BlankFrame_2.Position = UDim2.new(0.68364197, 0, 0.0333333351, 0)
PLG.BlankFrame_2.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_2.Name = "TitlePart"
PLG.TitlePart_2.Parent = PLG.BlankFrame_2
PLG.TitlePart_2.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_2.BackgroundTransparency = 0.350
PLG.TitlePart_2.BorderSizePixel = 0
PLG.TitlePart_2.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_2.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_6.Parent = PLG.TitlePart_2
PLG.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_6.BackgroundTransparency = 1.000
PLG.TextLabel_6.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_6.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_6.Font = Enum.Font.ArialBold
PLG.TextLabel_6.Text = "Theme Background"
PLG.TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_6.TextScaled = true
PLG.TextLabel_6.TextSize = 14.000
PLG.TextLabel_6.TextWrapped = true
PLG.TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_2.Name = "Things"
PLG.Things_2.Parent = PLG.BlankFrame_2
PLG.Things_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_2.BackgroundTransparency = 1.000
PLG.Things_2.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_2.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_3.Parent = PLG.Things_2
PLG.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_3.Padding = UDim.new(0.0700000003, 0)

PLG.ID.Name = "ID"
PLG.ID.Parent = PLG.Things_2
PLG.ID.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ID.BorderSizePixel = 0
PLG.ID.Position = UDim2.new(0, 0, 0.27000007, 0)
PLG.ID.Size = UDim2.new(0, 200, 0, 22)
PLG.ID.Font = Enum.Font.ArialBold
PLG.ID.Text = "[Decal ID]"
PLG.ID.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.ID.TextSize = 14.000

PLG.Sb.Name = "Sb"
PLG.Sb.Parent = PLG.Things_2
PLG.Sb.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Sb.BorderSizePixel = 0
PLG.Sb.Size = UDim2.new(0, 21, 0, 21)
PLG.Sb.Font = Enum.Font.SourceSans
PLG.Sb.Text = "Bruh"
PLG.Sb.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Sb.TextSize = 14.000
PLG.Sb.TextTransparency = 1.000
PLG.Sb.MouseButton1Click:connect(
    function()
        PLG.ABackground.Image = "http://www.roblox.com/asset/?id=" .. tostring(PLG.ID.Text)
    end
)

PLG.TextLabel_7.Parent = PLG.Sb
PLG.TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_7.BackgroundTransparency = 1.000
PLG.TextLabel_7.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_7.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_7.Font = Enum.Font.ArialBold
PLG.TextLabel_7.Text = "Set Background"
PLG.TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_7.TextSize = 14.000
PLG.TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left

PLG.BlankFrame_3.Name = "BlankFrame"
PLG.BlankFrame_3.Parent = PLG.ThemeFrame
PLG.BlankFrame_3.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.BlankFrame_3.BackgroundTransparency = 0.350
PLG.BlankFrame_3.BorderSizePixel = 0
PLG.BlankFrame_3.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.BlankFrame_3.Size = UDim2.new(0, 412, 0, 155)
PLG.BlankFrame_3.Visible = false

PLG.TitlePart_3.Name = "TitlePart"
PLG.TitlePart_3.Parent = PLG.BlankFrame_3
PLG.TitlePart_3.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_3.BackgroundTransparency = 0.350
PLG.TitlePart_3.BorderSizePixel = 0
PLG.TitlePart_3.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_3.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_8.Parent = PLG.TitlePart_3
PLG.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_8.BackgroundTransparency = 1.000
PLG.TextLabel_8.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_8.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_8.Font = Enum.Font.ArialBold
PLG.TextLabel_8.Text = "Blank"
PLG.TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_8.TextScaled = true
PLG.TextLabel_8.TextSize = 14.000
PLG.TextLabel_8.TextWrapped = true
PLG.TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_3.Name = "Things"
PLG.Things_3.Parent = PLG.BlankFrame_3
PLG.Things_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_3.BackgroundTransparency = 1.000
PLG.Things_3.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_3.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_4.Parent = PLG.Things_3
PLG.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_4.Padding = UDim.new(0.0700000003, 0)

PLG.Blank.Name = "Blank"
PLG.Blank.Parent = PLG.Things_3
PLG.Blank.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank.BorderSizePixel = 0
PLG.Blank.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank.Font = Enum.Font.SourceSans
PLG.Blank.Text = "Bruh"
PLG.Blank.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank.TextSize = 14.000
PLG.Blank.TextTransparency = 1.000

PLG.TextLabel_9.Parent = PLG.Blank
PLG.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_9.BackgroundTransparency = 1.000
PLG.TextLabel_9.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_9.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_9.Font = Enum.Font.ArialBold
PLG.TextLabel_9.Text = "Blank"
PLG.TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_9.TextSize = 14.000
PLG.TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_2.Name = "Blank"
PLG.Blank_2.Parent = PLG.Things_3
PLG.Blank_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_2.BorderSizePixel = 0
PLG.Blank_2.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_2.Font = Enum.Font.SourceSans
PLG.Blank_2.Text = "Bruh"
PLG.Blank_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_2.TextSize = 14.000
PLG.Blank_2.TextTransparency = 1.000

PLG.TextLabel_10.Parent = PLG.Blank_2
PLG.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_10.BackgroundTransparency = 1.000
PLG.TextLabel_10.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_10.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_10.Font = Enum.Font.ArialBold
PLG.TextLabel_10.Text = "Blank"
PLG.TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_10.TextSize = 14.000
PLG.TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_3.Name = "Blank"
PLG.Blank_3.Parent = PLG.Things_3
PLG.Blank_3.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_3.BorderSizePixel = 0
PLG.Blank_3.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_3.Font = Enum.Font.SourceSans
PLG.Blank_3.Text = "Bruh"
PLG.Blank_3.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_3.TextSize = 14.000
PLG.Blank_3.TextTransparency = 1.000

PLG.TextLabel_11.Parent = PLG.Blank_3
PLG.TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_11.BackgroundTransparency = 1.000
PLG.TextLabel_11.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_11.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_11.Font = Enum.Font.ArialBold
PLG.TextLabel_11.Text = "Blank"
PLG.TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_11.TextSize = 14.000
PLG.TextLabel_11.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_4.Name = "Blank"
PLG.Blank_4.Parent = PLG.Things_3
PLG.Blank_4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_4.BorderSizePixel = 0
PLG.Blank_4.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_4.Font = Enum.Font.SourceSans
PLG.Blank_4.Text = "Bruh"
PLG.Blank_4.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_4.TextSize = 14.000
PLG.Blank_4.TextTransparency = 1.000

PLG.TextLabel_12.Parent = PLG.Blank_4
PLG.TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_12.BackgroundTransparency = 1.000
PLG.TextLabel_12.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_12.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_12.Font = Enum.Font.ArialBold
PLG.TextLabel_12.Text = "Blank"
PLG.TextLabel_12.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_12.TextSize = 14.000
PLG.TextLabel_12.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_5.Name = "Blank"
PLG.Blank_5.Parent = PLG.Things_3
PLG.Blank_5.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_5.BorderSizePixel = 0
PLG.Blank_5.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_5.Font = Enum.Font.SourceSans
PLG.Blank_5.Text = "Bruh"
PLG.Blank_5.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_5.TextSize = 14.000
PLG.Blank_5.TextTransparency = 1.000

PLG.TextLabel_13.Parent = PLG.Blank_5
PLG.TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_13.BackgroundTransparency = 1.000
PLG.TextLabel_13.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_13.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_13.Font = Enum.Font.ArialBold
PLG.TextLabel_13.Text = "Blank"
PLG.TextLabel_13.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_13.TextSize = 14.000
PLG.TextLabel_13.TextXAlignment = Enum.TextXAlignment.Left

PLG.BlankFrame_4.Name = "BlankFrame"
PLG.BlankFrame_4.Parent = PLG.ThemeFrame
PLG.BlankFrame_4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.BlankFrame_4.BackgroundTransparency = 0.350
PLG.BlankFrame_4.BorderSizePixel = 0
PLG.BlankFrame_4.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.BlankFrame_4.Size = UDim2.new(0, 412, 0, 155)
PLG.BlankFrame_4.Visible = false

PLG.TitlePart_4.Name = "TitlePart"
PLG.TitlePart_4.Parent = PLG.BlankFrame_4
PLG.TitlePart_4.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_4.BackgroundTransparency = 0.350
PLG.TitlePart_4.BorderSizePixel = 0
PLG.TitlePart_4.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_4.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_14.Parent = PLG.TitlePart_4
PLG.TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_14.BackgroundTransparency = 1.000
PLG.TextLabel_14.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_14.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_14.Font = Enum.Font.ArialBold
PLG.TextLabel_14.Text = "Blank"
PLG.TextLabel_14.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_14.TextScaled = true
PLG.TextLabel_14.TextSize = 14.000
PLG.TextLabel_14.TextWrapped = true
PLG.TextLabel_14.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_4.Name = "Things"
PLG.Things_4.Parent = PLG.BlankFrame_4
PLG.Things_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_4.BackgroundTransparency = 1.000
PLG.Things_4.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_4.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_5.Parent = PLG.Things_4
PLG.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_5.Padding = UDim.new(0.0700000003, 0)

PLG.Blank_6.Name = "Blank"
PLG.Blank_6.Parent = PLG.Things_4
PLG.Blank_6.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_6.BorderSizePixel = 0
PLG.Blank_6.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_6.Font = Enum.Font.SourceSans
PLG.Blank_6.Text = "Bruh"
PLG.Blank_6.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_6.TextSize = 14.000
PLG.Blank_6.TextTransparency = 1.000

PLG.TextLabel_15.Parent = PLG.Blank_6
PLG.TextLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_15.BackgroundTransparency = 1.000
PLG.TextLabel_15.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_15.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_15.Font = Enum.Font.ArialBold
PLG.TextLabel_15.Text = "Blank"
PLG.TextLabel_15.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_15.TextSize = 14.000
PLG.TextLabel_15.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_7.Name = "Blank"
PLG.Blank_7.Parent = PLG.Things_4
PLG.Blank_7.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_7.BorderSizePixel = 0
PLG.Blank_7.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_7.Font = Enum.Font.SourceSans
PLG.Blank_7.Text = "Bruh"
PLG.Blank_7.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_7.TextSize = 14.000
PLG.Blank_7.TextTransparency = 1.000

PLG.TextLabel_16.Parent = PLG.Blank_7
PLG.TextLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_16.BackgroundTransparency = 1.000
PLG.TextLabel_16.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_16.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_16.Font = Enum.Font.ArialBold
PLG.TextLabel_16.Text = "Blank"
PLG.TextLabel_16.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_16.TextSize = 14.000
PLG.TextLabel_16.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_8.Name = "Blank"
PLG.Blank_8.Parent = PLG.Things_4
PLG.Blank_8.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_8.BorderSizePixel = 0
PLG.Blank_8.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_8.Font = Enum.Font.SourceSans
PLG.Blank_8.Text = "Bruh"
PLG.Blank_8.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_8.TextSize = 14.000
PLG.Blank_8.TextTransparency = 1.000

PLG.TextLabel_17.Parent = PLG.Blank_8
PLG.TextLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_17.BackgroundTransparency = 1.000
PLG.TextLabel_17.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_17.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_17.Font = Enum.Font.ArialBold
PLG.TextLabel_17.Text = "Blank"
PLG.TextLabel_17.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_17.TextSize = 14.000
PLG.TextLabel_17.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_9.Name = "Blank"
PLG.Blank_9.Parent = PLG.Things_4
PLG.Blank_9.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_9.BorderSizePixel = 0
PLG.Blank_9.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_9.Font = Enum.Font.SourceSans
PLG.Blank_9.Text = "Bruh"
PLG.Blank_9.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_9.TextSize = 14.000
PLG.Blank_9.TextTransparency = 1.000

PLG.TextLabel_18.Parent = PLG.Blank_9
PLG.TextLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_18.BackgroundTransparency = 1.000
PLG.TextLabel_18.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_18.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_18.Font = Enum.Font.ArialBold
PLG.TextLabel_18.Text = "Blank"
PLG.TextLabel_18.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_18.TextSize = 14.000
PLG.TextLabel_18.TextXAlignment = Enum.TextXAlignment.Left

PLG.Blank_10.Name = "Blank"
PLG.Blank_10.Parent = PLG.Things_4
PLG.Blank_10.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Blank_10.BorderSizePixel = 0
PLG.Blank_10.Size = UDim2.new(0, 21, 0, 21)
PLG.Blank_10.Font = Enum.Font.SourceSans
PLG.Blank_10.Text = "Bruh"
PLG.Blank_10.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Blank_10.TextSize = 14.000
PLG.Blank_10.TextTransparency = 1.000

PLG.TextLabel_19.Parent = PLG.Blank_10
PLG.TextLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_19.BackgroundTransparency = 1.000
PLG.TextLabel_19.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_19.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_19.Font = Enum.Font.ArialBold
PLG.TextLabel_19.Text = "Blank"
PLG.TextLabel_19.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_19.TextSize = 14.000
PLG.TextLabel_19.TextXAlignment = Enum.TextXAlignment.Left

PLG.Tab.Name = "Tab"
PLG.Tab.Parent = PLG.Main
PLG.Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Tab.BackgroundTransparency = 1.000
PLG.Tab.BorderColor3 = Color3.fromRGB(27, 42, 53)
PLG.Tab.BorderSizePixel = 0
PLG.Tab.Position = UDim2.new(0, 0, -0.0649999976, 0)
PLG.Tab.Size = UDim2.new(0, 170, 0, 34)
PLG.Tab.Image = "rbxassetid://2432754026"
PLG.Tab.ImageColor3 = Color3.fromRGB(35, 35, 45)

PLG.Title.Name = "Title"
PLG.Title.Parent = PLG.Main
PLG.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Title.BackgroundTransparency = 1.000
PLG.Title.Position = UDim2.new(0, 0, -0.0478460863, 0)
PLG.Title.Size = UDim2.new(0, 149, 0, 24)
PLG.Title.Font = Enum.Font.ArialBold
PLG.Title.Text = "PLG v3.1"
PLG.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.Title.TextSize = 20.000

PLG.JoeMama.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 170, 255))
}
PLG.JoeMama.Name = "Joe Mama"
PLG.JoeMama.Parent = PLG.Title

PLG.aLocalFrame.Name = "aLocalFrame"
PLG.aLocalFrame.Parent = PLG.Main
PLG.aLocalFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.aLocalFrame.BackgroundTransparency = 1.000
PLG.aLocalFrame.BorderSizePixel = 0
PLG.aLocalFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.aLocalFrame.Size = UDim2.new(0, 648, 0, 330)
PLG.aLocalFrame.Visible = false

PLG.GunsFrame.Name = "GunsFrame"
PLG.GunsFrame.Parent = PLG.aLocalFrame
PLG.GunsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.GunsFrame.BackgroundTransparency = 0.350
PLG.GunsFrame.BorderSizePixel = 0
PLG.GunsFrame.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.GunsFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_5.Name = "TitlePart"
PLG.TitlePart_5.Parent = PLG.GunsFrame
PLG.TitlePart_5.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_5.BackgroundTransparency = 0.350
PLG.TitlePart_5.BorderSizePixel = 0
PLG.TitlePart_5.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_5.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_20.Parent = PLG.TitlePart_5
PLG.TextLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_20.BackgroundTransparency = 1.000
PLG.TextLabel_20.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_20.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_20.Font = Enum.Font.ArialBold
PLG.TextLabel_20.Text = "Give Guns"
PLG.TextLabel_20.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_20.TextScaled = true
PLG.TextLabel_20.TextSize = 14.000
PLG.TextLabel_20.TextWrapped = true
PLG.TextLabel_20.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_5.Name = "Things"
PLG.Things_5.Parent = PLG.GunsFrame
PLG.Things_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_5.BackgroundTransparency = 1.000
PLG.Things_5.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_5.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_6.Parent = PLG.Things_5
PLG.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_6.Padding = UDim.new(0.0700000003, 0)

PLG.m4.Name = "m4"
PLG.m4.Parent = PLG.Things_5
PLG.m4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.m4.BorderSizePixel = 0
PLG.m4.Size = UDim2.new(0, 21, 0, 21)
PLG.m4.Font = Enum.Font.SourceSans
PLG.m4.Text = "Bruh"
PLG.m4.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.m4.TextSize = 14.000
PLG.m4.TextTransparency = 1.000
PLG.m4.MouseButton1Click:connect(
    function()
        local Weapon = {"M4A1"}
        for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
            if v.Name == Weapon[1] then
                local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end
    end
)

PLG.TextLabel_21.Parent = PLG.m4
PLG.TextLabel_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_21.BackgroundTransparency = 1.000
PLG.TextLabel_21.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_21.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_21.Font = Enum.Font.ArialBold
PLG.TextLabel_21.Text = "M4A1"
PLG.TextLabel_21.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_21.TextSize = 14.000
PLG.TextLabel_21.TextXAlignment = Enum.TextXAlignment.Left

PLG.ak.Name = "ak"
PLG.ak.Parent = PLG.Things_5
PLG.ak.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ak.BorderSizePixel = 0
PLG.ak.Size = UDim2.new(0, 21, 0, 21)
PLG.ak.Font = Enum.Font.SourceSans
PLG.ak.Text = "Bruh"
PLG.ak.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ak.TextSize = 14.000
PLG.ak.TextTransparency = 1.000
PLG.ak.MouseButton1Click:connect(
    function()
        local Weapon = {"AK-47"}
        for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
            if v.Name == Weapon[1] then
                local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end
    end
)

PLG.TextLabel_22.Parent = PLG.ak
PLG.TextLabel_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_22.BackgroundTransparency = 1.000
PLG.TextLabel_22.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_22.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_22.Font = Enum.Font.ArialBold
PLG.TextLabel_22.Text = "AK-47"
PLG.TextLabel_22.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_22.TextSize = 14.000
PLG.TextLabel_22.TextXAlignment = Enum.TextXAlignment.Left

PLG.rem.Name = "rem"
PLG.rem.Parent = PLG.Things_5
PLG.rem.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.rem.BorderSizePixel = 0
PLG.rem.Size = UDim2.new(0, 21, 0, 21)
PLG.rem.Font = Enum.Font.SourceSans
PLG.rem.Text = "Bruh"
PLG.rem.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.rem.TextSize = 14.000
PLG.rem.TextTransparency = 1.000
PLG.rem.MouseButton1Click:connect(
    function()
        local Weapon = {"Remington 870"}
        for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
            if v.Name == Weapon[1] then
                local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end
    end
)

PLG.TextLabel_23.Parent = PLG.rem
PLG.TextLabel_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_23.BackgroundTransparency = 1.000
PLG.TextLabel_23.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_23.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_23.Font = Enum.Font.ArialBold
PLG.TextLabel_23.Text = "Remington 870"
PLG.TextLabel_23.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_23.TextSize = 14.000
PLG.TextLabel_23.TextXAlignment = Enum.TextXAlignment.Left

PLG.m9.Name = "m9"
PLG.m9.Parent = PLG.Things_5
PLG.m9.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.m9.BorderSizePixel = 0
PLG.m9.Size = UDim2.new(0, 21, 0, 21)
PLG.m9.Font = Enum.Font.SourceSans
PLG.m9.Text = "Bruh"
PLG.m9.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.m9.TextSize = 14.000
PLG.m9.TextTransparency = 1.000
PLG.m9.MouseButton1Click:connect(
    function()
        local Weapon = {"M9"}
        for i, v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
            if v.Name == Weapon[1] then
                local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end
    end
)

PLG.TextLabel_24.Parent = PLG.m9
PLG.TextLabel_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_24.BackgroundTransparency = 1.000
PLG.TextLabel_24.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_24.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_24.Font = Enum.Font.ArialBold
PLG.TextLabel_24.Text = "M9"
PLG.TextLabel_24.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_24.TextSize = 14.000
PLG.TextLabel_24.TextXAlignment = Enum.TextXAlignment.Left

PLG.SkyFrame.Name = "SkyFrame"
PLG.SkyFrame.Parent = PLG.aLocalFrame
PLG.SkyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.SkyFrame.BackgroundTransparency = 0.350
PLG.SkyFrame.BorderSizePixel = 0
PLG.SkyFrame.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.SkyFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_6.Name = "TitlePart"
PLG.TitlePart_6.Parent = PLG.SkyFrame
PLG.TitlePart_6.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_6.BackgroundTransparency = 0.350
PLG.TitlePart_6.BorderSizePixel = 0
PLG.TitlePart_6.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_6.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_25.Parent = PLG.TitlePart_6
PLG.TextLabel_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_25.BackgroundTransparency = 1.000
PLG.TextLabel_25.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_25.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_25.Font = Enum.Font.ArialBold
PLG.TextLabel_25.Text = "Set Skybox"
PLG.TextLabel_25.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_25.TextScaled = true
PLG.TextLabel_25.TextSize = 14.000
PLG.TextLabel_25.TextWrapped = true
PLG.TextLabel_25.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_6.Name = "Things"
PLG.Things_6.Parent = PLG.SkyFrame
PLG.Things_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_6.BackgroundTransparency = 1.000
PLG.Things_6.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_6.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_7.Parent = PLG.Things_6
PLG.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_7.Padding = UDim.new(0.0700000003, 0)

PLG.doge.Name = "doge"
PLG.doge.Parent = PLG.Things_6
PLG.doge.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.doge.BorderSizePixel = 0
PLG.doge.Size = UDim2.new(0, 21, 0, 21)
PLG.doge.Font = Enum.Font.SourceSans
PLG.doge.Text = "Bruh"
PLG.doge.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.doge.TextSize = 14.000
PLG.doge.TextTransparency = 1.000
PLG.doge.MouseButton1Click:connect(
    function()
        skych = game:service("Lighting").Sky

        skych.SkyboxBk = "http://www.roblox.com/asset/?id=133442689"
        skych.SkyboxDn = "http://www.roblox.com/asset/?id=133442689"
        skych.SkyboxFt = "http://www.roblox.com/asset/?id=133442689"
        skych.SkyboxLf = "http://www.roblox.com/asset/?id=133442689"
        skych.SkyboxRt = "http://www.roblox.com/asset/?id=133442689"
        skych.SkyboxUp = "http://www.roblox.com/asset/?id=133442689"
    end
)

PLG.TextLabel_26.Parent = PLG.doge
PLG.TextLabel_26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_26.BackgroundTransparency = 1.000
PLG.TextLabel_26.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_26.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_26.Font = Enum.Font.ArialBold
PLG.TextLabel_26.Text = "Doge"
PLG.TextLabel_26.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_26.TextSize = 14.000
PLG.TextLabel_26.TextXAlignment = Enum.TextXAlignment.Left

PLG.office.Name = "office"
PLG.office.Parent = PLG.Things_6
PLG.office.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.office.BorderSizePixel = 0
PLG.office.Size = UDim2.new(0, 21, 0, 21)
PLG.office.Font = Enum.Font.SourceSans
PLG.office.Text = "Bruh"
PLG.office.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.office.TextSize = 14.000
PLG.office.TextTransparency = 1.000
PLG.office.MouseButton1Click:connect(
    function()
        skych = game:service("Lighting").Sky

        skych.SkyboxBk = "rbxassetid://658623433"
        skych.SkyboxDn = "rbxassetid://316342560"
        skych.SkyboxFt = "rbxassetid://658625205"
        skych.SkyboxLf = "rbxassetid://658627155"
        skych.SkyboxRt = "rbxassetid://658628504"
        skych.SkyboxUp = "rbxassetid://658632701"
    end
)

PLG.TextLabel_27.Parent = PLG.office
PLG.TextLabel_27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_27.BackgroundTransparency = 1.000
PLG.TextLabel_27.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_27.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_27.Font = Enum.Font.ArialBold
PLG.TextLabel_27.Text = "Office"
PLG.TextLabel_27.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_27.TextSize = 14.000
PLG.TextLabel_27.TextXAlignment = Enum.TextXAlignment.Left

PLG.jungle.Name = "jungle"
PLG.jungle.Parent = PLG.Things_6
PLG.jungle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.jungle.BorderSizePixel = 0
PLG.jungle.Size = UDim2.new(0, 21, 0, 21)
PLG.jungle.Font = Enum.Font.SourceSans
PLG.jungle.Text = "Bruh"
PLG.jungle.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.jungle.TextSize = 14.000
PLG.jungle.TextTransparency = 1.000
PLG.jungle.MouseButton1Click:connect(
    function()
        skych = game:service("Lighting").Sky

        skych.SkyboxBk = "http://www.roblox.com/asset/?id=214399891"
        skych.SkyboxDn = "http://www.roblox.com/asset/?id=214399887"
        skych.SkyboxFt = "http://www.roblox.com/asset/?id=214399894"
        skych.SkyboxLf = "http://www.roblox.com/asset/?id=214405668"
        skych.SkyboxRt = "http://www.roblox.com/asset/?id=214399899"
        skych.SkyboxUp = "http://www.roblox.com/asset/?id=214399889"
    end
)

PLG.TextLabel_28.Parent = PLG.jungle
PLG.TextLabel_28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_28.BackgroundTransparency = 1.000
PLG.TextLabel_28.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_28.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_28.Font = Enum.Font.ArialBold
PLG.TextLabel_28.Text = "Jungle"
PLG.TextLabel_28.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_28.TextSize = 14.000
PLG.TextLabel_28.TextXAlignment = Enum.TextXAlignment.Left

PLG.default_2.Name = "default"
PLG.default_2.Parent = PLG.Things_6
PLG.default_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.default_2.BorderSizePixel = 0
PLG.default_2.Size = UDim2.new(0, 21, 0, 21)
PLG.default_2.Font = Enum.Font.SourceSans
PLG.default_2.Text = "Bruh"
PLG.default_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.default_2.TextSize = 14.000
PLG.default_2.TextTransparency = 1.000
PLG.default_2.MouseButton1Click:connect(
    function()
        skych = game:service("Lighting").Sky

        skych.SkyboxBk = "rbxassetid://150553096"
        skych.SkyboxDn = "rbxassetid://150553062"
        skych.SkyboxFt = "rbxassetid://150553119"
        skych.SkyboxLf = "rbxassetid://150553049"
        skych.SkyboxRt = "rbxassetid://150553079"
        skych.SkyboxUp = "rbxassetid://150553131"
    end
)

PLG.TextLabel_29.Parent = PLG.default_2
PLG.TextLabel_29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_29.BackgroundTransparency = 1.000
PLG.TextLabel_29.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_29.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_29.Font = Enum.Font.ArialBold
PLG.TextLabel_29.Text = "Default"
PLG.TextLabel_29.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_29.TextSize = 14.000
PLG.TextLabel_29.TextXAlignment = Enum.TextXAlignment.Left

PLG.OtherFrame.Name = "OtherFrame"
PLG.OtherFrame.Parent = PLG.aLocalFrame
PLG.OtherFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.OtherFrame.BackgroundTransparency = 0.350
PLG.OtherFrame.BorderSizePixel = 0
PLG.OtherFrame.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.OtherFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_7.Name = "TitlePart"
PLG.TitlePart_7.Parent = PLG.OtherFrame
PLG.TitlePart_7.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_7.BackgroundTransparency = 0.350
PLG.TitlePart_7.BorderSizePixel = 0
PLG.TitlePart_7.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_7.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_30.Parent = PLG.TitlePart_7
PLG.TextLabel_30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_30.BackgroundTransparency = 1.000
PLG.TextLabel_30.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_30.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_30.Font = Enum.Font.ArialBold
PLG.TextLabel_30.Text = "Other"
PLG.TextLabel_30.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_30.TextScaled = true
PLG.TextLabel_30.TextSize = 14.000
PLG.TextLabel_30.TextWrapped = true
PLG.TextLabel_30.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_7.Name = "Things"
PLG.Things_7.Parent = PLG.OtherFrame
PLG.Things_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_7.BackgroundTransparency = 1.000
PLG.Things_7.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_7.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_8.Parent = PLG.Things_7
PLG.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_8.Padding = UDim.new(0.0700000003, 0)

PLG.Speed.Name = "Speed"
PLG.Speed.Parent = PLG.Things_7
PLG.Speed.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Speed.BorderSizePixel = 0
PLG.Speed.Size = UDim2.new(0, 21, 0, 21)
PLG.Speed.Font = Enum.Font.SourceSans
PLG.Speed.Text = "Bruh"
PLG.Speed.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Speed.TextSize = 14.000
PLG.Speed.TextTransparency = 1.000
PLG.Speed.MouseButton1Click:connect(
    function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = PLG.SpeedS.Text
    end
)

PLG.SpeedS.Name = "SpeedS"
PLG.SpeedS.Parent = PLG.Speed
PLG.SpeedS.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.SpeedS.BorderSizePixel = 0
PLG.SpeedS.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.SpeedS.Size = UDim2.new(0, 200, 0, 21)
PLG.SpeedS.Font = Enum.Font.ArialBold
PLG.SpeedS.Text = "[Set Speed]"
PLG.SpeedS.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.SpeedS.TextSize = 14.000

PLG.Jump.Name = "Jump"
PLG.Jump.Parent = PLG.Things_7
PLG.Jump.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Jump.BorderSizePixel = 0
PLG.Jump.Size = UDim2.new(0, 21, 0, 21)
PLG.Jump.Font = Enum.Font.SourceSans
PLG.Jump.Text = "Bruh"
PLG.Jump.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Jump.TextSize = 14.000
PLG.Jump.TextTransparency = 1.000
PLG.Jump.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = PLG.JumpS.Text
    end
)

PLG.JumpS.Name = "JumpS"
PLG.JumpS.Parent = PLG.Jump
PLG.JumpS.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.JumpS.BorderSizePixel = 0
PLG.JumpS.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.JumpS.Size = UDim2.new(0, 200, 0, 21)
PLG.JumpS.Font = Enum.Font.ArialBold
PLG.JumpS.Text = "[Set Jump]"
PLG.JumpS.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.JumpS.TextSize = 14.000

PLG.Btools.Name = "Btools"
PLG.Btools.Parent = PLG.Things_7
PLG.Btools.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Btools.BorderSizePixel = 0
PLG.Btools.Size = UDim2.new(0, 21, 0, 21)
PLG.Btools.Font = Enum.Font.SourceSans
PLG.Btools.Text = "Bruh"
PLG.Btools.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.Btools.TextSize = 14.000
PLG.Btools.TextTransparency = 1.000
PLG.Btools.MouseButton1Click:connect(
    function()
        wait(0.1)
        local tool1 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        local tool2 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        local tool3 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        tool1.BinType = "Clone"
        tool2.BinType = "Hammer"
        tool3.BinType = "Grab"
    end
)

PLG.TextLabel_31.Parent = PLG.Btools
PLG.TextLabel_31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_31.BackgroundTransparency = 1.000
PLG.TextLabel_31.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_31.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_31.Font = Enum.Font.ArialBold
PLG.TextLabel_31.Text = "Btools"
PLG.TextLabel_31.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_31.TextSize = 14.000
PLG.TextLabel_31.TextXAlignment = Enum.TextXAlignment.Left

PLG.TeamsFrame.Name = "TeamsFrame"
PLG.TeamsFrame.Parent = PLG.aLocalFrame
PLG.TeamsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.TeamsFrame.BackgroundTransparency = 0.350
PLG.TeamsFrame.BorderSizePixel = 0
PLG.TeamsFrame.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.TeamsFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_8.Name = "TitlePart"
PLG.TitlePart_8.Parent = PLG.TeamsFrame
PLG.TitlePart_8.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_8.BackgroundTransparency = 0.350
PLG.TitlePart_8.BorderSizePixel = 0
PLG.TitlePart_8.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_8.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_32.Parent = PLG.TitlePart_8
PLG.TextLabel_32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_32.BackgroundTransparency = 1.000
PLG.TextLabel_32.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_32.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_32.Font = Enum.Font.ArialBold
PLG.TextLabel_32.Text = "Teams"
PLG.TextLabel_32.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_32.TextScaled = true
PLG.TextLabel_32.TextSize = 14.000
PLG.TextLabel_32.TextWrapped = true
PLG.TextLabel_32.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_8.Name = "Things"
PLG.Things_8.Parent = PLG.TeamsFrame
PLG.Things_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_8.BackgroundTransparency = 1.000
PLG.Things_8.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_8.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_9.Parent = PLG.Things_8
PLG.UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_9.Padding = UDim.new(0.0700000003, 0)

PLG.police.Name = "police"
PLG.police.Parent = PLG.Things_8
PLG.police.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.police.BorderSizePixel = 0
PLG.police.Size = UDim2.new(0, 21, 0, 21)
PLG.police.Font = Enum.Font.SourceSans
PLG.police.Text = "Bruh"
PLG.police.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.police.TextSize = 14.000
PLG.police.TextTransparency = 1.000
PLG.police.MouseButton1Click:connect(
    function()
        Workspace.Remote.TeamEvent:FireServer("Bright blue")
    end
)

PLG.TextLabel_33.Parent = PLG.police
PLG.TextLabel_33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_33.BackgroundTransparency = 1.000
PLG.TextLabel_33.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_33.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_33.Font = Enum.Font.ArialBold
PLG.TextLabel_33.Text = "Police"
PLG.TextLabel_33.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_33.TextSize = 14.000
PLG.TextLabel_33.TextXAlignment = Enum.TextXAlignment.Left

PLG.inmate.Name = "inmate"
PLG.inmate.Parent = PLG.Things_8
PLG.inmate.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.inmate.BorderSizePixel = 0
PLG.inmate.Size = UDim2.new(0, 21, 0, 21)
PLG.inmate.Font = Enum.Font.SourceSans
PLG.inmate.Text = "Bruh"
PLG.inmate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.inmate.TextSize = 14.000
PLG.inmate.TextTransparency = 1.000
PLG.inmate.MouseButton1Click:connect(
    function()
        Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end
)

PLG.TextLabel_34.Parent = PLG.inmate
PLG.TextLabel_34.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_34.BackgroundTransparency = 1.000
PLG.TextLabel_34.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_34.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_34.Font = Enum.Font.ArialBold
PLG.TextLabel_34.Text = "Inmate"
PLG.TextLabel_34.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_34.TextSize = 14.000
PLG.TextLabel_34.TextXAlignment = Enum.TextXAlignment.Left

PLG.criminals.Name = "criminals"
PLG.criminals.Parent = PLG.Things_8
PLG.criminals.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.criminals.BorderSizePixel = 0
PLG.criminals.Size = UDim2.new(0, 21, 0, 21)
PLG.criminals.Font = Enum.Font.SourceSans
PLG.criminals.Text = "Bruh"
PLG.criminals.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.criminals.TextSize = 14.000
PLG.criminals.TextTransparency = 1.000
PLG.criminals.MouseButton1Click:connect(
    function()
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
    end
)

PLG.TextLabel_35.Parent = PLG.criminals
PLG.TextLabel_35.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_35.BackgroundTransparency = 1.000
PLG.TextLabel_35.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_35.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_35.Font = Enum.Font.ArialBold
PLG.TextLabel_35.Text = "Criminals"
PLG.TextLabel_35.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_35.TextSize = 14.000
PLG.TextLabel_35.TextXAlignment = Enum.TextXAlignment.Left

PLG.neutral.Name = "neutral"
PLG.neutral.Parent = PLG.Things_8
PLG.neutral.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.neutral.BorderSizePixel = 0
PLG.neutral.Size = UDim2.new(0, 21, 0, 21)
PLG.neutral.Font = Enum.Font.SourceSans
PLG.neutral.Text = "Bruh"
PLG.neutral.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.neutral.TextSize = 14.000
PLG.neutral.TextTransparency = 1.000
PLG.neutral.MouseButton1Click:connect(
    function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end
)

PLG.TextLabel_36.Parent = PLG.neutral
PLG.TextLabel_36.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_36.BackgroundTransparency = 1.000
PLG.TextLabel_36.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_36.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_36.Font = Enum.Font.ArialBold
PLG.TextLabel_36.Text = "Neutral "
PLG.TextLabel_36.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_36.TextSize = 14.000
PLG.TextLabel_36.TextXAlignment = Enum.TextXAlignment.Left

PLG.PlayerList.Name = "PlayerList"
PLG.PlayerList.Parent = PLG.Main
PLG.PlayerList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.PlayerList.BackgroundTransparency = 1.000
PLG.PlayerList.BorderSizePixel = 0
PLG.PlayerList.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.PlayerList.Size = UDim2.new(0, 648, 0, 330)
PLG.PlayerList.Visible = false

PLG.PlayersFrame.Name = "PlayersFrame"
PLG.PlayersFrame.Parent = PLG.PlayerList
PLG.PlayersFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.PlayersFrame.BackgroundTransparency = 0.350
PLG.PlayersFrame.BorderSizePixel = 0
PLG.PlayersFrame.Position = UDim2.new(0.0354938284, 0, 0.0363636352, 0)
PLG.PlayersFrame.Size = UDim2.new(0, 412, 0, 348)

PLG.TitlePart_9.Name = "TitlePart"
PLG.TitlePart_9.Parent = PLG.PlayersFrame
PLG.TitlePart_9.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_9.BackgroundTransparency = 0.350
PLG.TitlePart_9.BorderSizePixel = 0
PLG.TitlePart_9.Position = UDim2.new(0, 0, -0.0939999968, 0)
PLG.TitlePart_9.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_37.Parent = PLG.TitlePart_9
PLG.TextLabel_37.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_37.BackgroundTransparency = 1.000
PLG.TextLabel_37.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_37.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_37.Font = Enum.Font.ArialBold
PLG.TextLabel_37.Text = "Players"
PLG.TextLabel_37.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_37.TextScaled = true
PLG.TextLabel_37.TextSize = 14.000
PLG.TextLabel_37.TextWrapped = true
PLG.TextLabel_37.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_9.Name = "Things"
PLG.Things_9.Parent = PLG.PlayersFrame
PLG.Things_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_9.BackgroundTransparency = 1.000
PLG.Things_9.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_9.Size = UDim2.new(0, 271, 0, 105)

PLG.PlayersBruhBruh.Name = "PlayersBruhBruh"
PLG.PlayersBruhBruh.Parent = PLG.Things_9
PLG.PlayersBruhBruh.Active = true
PLG.PlayersBruhBruh.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
PLG.PlayersBruhBruh.BorderSizePixel = 0
PLG.PlayersBruhBruh.Position = UDim2.new(0.225092262, 0, 0.00952380989, 0)
PLG.PlayersBruhBruh.Size = UDim2.new(0, 256, 0, 310)

PLG.PlayerList_2.Name = "PlayerList"
PLG.PlayerList_2.Parent = PLG.PlayersBruhBruh
PLG.PlayerList_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
PLG.PlayerList_2.SortOrder = Enum.SortOrder.LayoutOrder
PLG.PlayerList_2.Padding = UDim.new(0, 2)

PLG.sampletextxd.Name = "sampletextxd"
PLG.sampletextxd.Parent = PLG.PlayersBruhBruh
PLG.sampletextxd.Active = false
PLG.sampletextxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.sampletextxd.BackgroundTransparency = 1.000
PLG.sampletextxd.BorderSizePixel = 0
PLG.sampletextxd.Position = UDim2.new(0.124423966, 0, 0, 0)
PLG.sampletextxd.Size = UDim2.new(0, 163, 0, 17)
PLG.sampletextxd.Font = Enum.Font.SourceSansBold
PLG.sampletextxd.Text = "OnlyTwentyCharacters"
PLG.sampletextxd.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.sampletextxd.TextSize = 14.000
PLG.sampletextxd.TextStrokeTransparency = 0.000

PLG.PLGUsers.Name = "PLGUsers"
PLG.PLGUsers.Parent = PLG.PlayerList
PLG.PLGUsers.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.PLGUsers.BackgroundTransparency = 0.350
PLG.PLGUsers.BorderSizePixel = 0
PLG.PLGUsers.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.PLGUsers.Size = UDim2.new(0, 412, 0, 155)
PLG.PLGUsers.Visible = false

PLG.TitlePart_10.Name = "TitlePart"
PLG.TitlePart_10.Parent = PLG.PLGUsers
PLG.TitlePart_10.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_10.BackgroundTransparency = 0.350
PLG.TitlePart_10.BorderSizePixel = 0
PLG.TitlePart_10.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_10.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_38.Parent = PLG.TitlePart_10
PLG.TextLabel_38.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_38.BackgroundTransparency = 1.000
PLG.TextLabel_38.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_38.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_38.Font = Enum.Font.ArialBold
PLG.TextLabel_38.Text = "PLG Users"
PLG.TextLabel_38.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_38.TextScaled = true
PLG.TextLabel_38.TextSize = 14.000
PLG.TextLabel_38.TextWrapped = true
PLG.TextLabel_38.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_10.Name = "Things"
PLG.Things_10.Parent = PLG.PLGUsers
PLG.Things_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_10.BackgroundTransparency = 1.000
PLG.Things_10.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_10.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_10.Parent = PLG.Things_10
PLG.UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_10.Padding = UDim.new(0.0700000003, 0)

PLG.PlayerOptions.Name = "PlayerOptions"
PLG.PlayerOptions.Parent = PLG.PlayerList
PLG.PlayerOptions.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.PlayerOptions.BackgroundTransparency = 0.350
PLG.PlayerOptions.BorderSizePixel = 0
PLG.PlayerOptions.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.PlayerOptions.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_11.Name = "TitlePart"
PLG.TitlePart_11.Parent = PLG.PlayerOptions
PLG.TitlePart_11.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_11.BackgroundTransparency = 0.350
PLG.TitlePart_11.BorderSizePixel = 0
PLG.TitlePart_11.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_11.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_39.Parent = PLG.TitlePart_11
PLG.TextLabel_39.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_39.BackgroundTransparency = 1.000
PLG.TextLabel_39.Position = UDim2.new(0.0397350714, 0, 0.21875, 0)
PLG.TextLabel_39.Size = UDim2.new(0, 395, 0, 18)
PLG.TextLabel_39.Font = Enum.Font.ArialBold
PLG.TextLabel_39.Text = "Player Options"
PLG.TextLabel_39.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_39.TextScaled = true
PLG.TextLabel_39.TextSize = 14.000
PLG.TextLabel_39.TextWrapped = true
PLG.TextLabel_39.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_11.Name = "Things"
PLG.Things_11.Parent = PLG.PlayerOptions
PLG.Things_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_11.BackgroundTransparency = 1.000
PLG.Things_11.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_11.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_11.Parent = PLG.Things_11
PLG.UIListLayout_11.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_11.Padding = UDim.new(0.0700000003, 0)

PLG.spectate.Name = "spectate"
PLG.spectate.Parent = PLG.Things_11
PLG.spectate.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.spectate.BorderSizePixel = 0
PLG.spectate.Size = UDim2.new(0, 21, 0, 21)
PLG.spectate.Font = Enum.Font.SourceSans
PLG.spectate.Text = "Bruh"
PLG.spectate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.spectate.TextSize = 14.000
PLG.spectate.TextTransparency = 1.000

PLG.TextLabel_40.Parent = PLG.spectate
PLG.TextLabel_40.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_40.BackgroundTransparency = 1.000
PLG.TextLabel_40.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_40.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_40.Font = Enum.Font.ArialBold
PLG.TextLabel_40.Text = "Spectate"
PLG.TextLabel_40.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_40.TextSize = 14.000
PLG.TextLabel_40.TextXAlignment = Enum.TextXAlignment.Left

PLG.unspectate.Name = "unspectate"
PLG.unspectate.Parent = PLG.Things_11
PLG.unspectate.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.unspectate.BorderSizePixel = 0
PLG.unspectate.Size = UDim2.new(0, 21, 0, 21)
PLG.unspectate.Font = Enum.Font.SourceSans
PLG.unspectate.Text = "Bruh"
PLG.unspectate.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.unspectate.TextSize = 14.000
PLG.unspectate.TextTransparency = 1.000

PLG.TextLabel_41.Parent = PLG.unspectate
PLG.TextLabel_41.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_41.BackgroundTransparency = 1.000
PLG.TextLabel_41.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_41.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_41.Font = Enum.Font.ArialBold
PLG.TextLabel_41.Text = "Unspectate"
PLG.TextLabel_41.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_41.TextSize = 14.000
PLG.TextLabel_41.TextXAlignment = Enum.TextXAlignment.Left

PLG.tptoplayer.Name = "tptoplayer"
PLG.tptoplayer.Parent = PLG.Things_11
PLG.tptoplayer.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.tptoplayer.BorderSizePixel = 0
PLG.tptoplayer.Size = UDim2.new(0, 21, 0, 21)
PLG.tptoplayer.Font = Enum.Font.SourceSans
PLG.tptoplayer.Text = "Bruh"
PLG.tptoplayer.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.tptoplayer.TextSize = 14.000
PLG.tptoplayer.TextTransparency = 1.000

PLG.TextLabel_42.Parent = PLG.tptoplayer
PLG.TextLabel_42.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_42.BackgroundTransparency = 1.000
PLG.TextLabel_42.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_42.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_42.Font = Enum.Font.ArialBold
PLG.TextLabel_42.Text = "Teleport To Player"
PLG.TextLabel_42.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_42.TextSize = 14.000
PLG.TextLabel_42.TextXAlignment = Enum.TextXAlignment.Left

PLG.kill.Name = "kill"
PLG.kill.Parent = PLG.Things_11
PLG.kill.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.kill.BorderSizePixel = 0
PLG.kill.Size = UDim2.new(0, 21, 0, 21)
PLG.kill.Font = Enum.Font.SourceSans
PLG.kill.Text = "Bruh"
PLG.kill.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.kill.TextSize = 14.000
PLG.kill.TextTransparency = 1.000

PLG.TextLabel_43.Parent = PLG.kill
PLG.TextLabel_43.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_43.BackgroundTransparency = 1.000
PLG.TextLabel_43.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_43.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_43.Font = Enum.Font.ArialBold
PLG.TextLabel_43.Text = "Kill Player"
PLG.TextLabel_43.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_43.TextSize = 14.000
PLG.TextLabel_43.TextXAlignment = Enum.TextXAlignment.Left

PLG.loopkillplayer.Name = "loopkillplayer"
PLG.loopkillplayer.Parent = PLG.Things_11
PLG.loopkillplayer.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.loopkillplayer.BorderSizePixel = 0
PLG.loopkillplayer.Size = UDim2.new(0, 21, 0, 21)
PLG.loopkillplayer.Font = Enum.Font.SourceSans
PLG.loopkillplayer.Text = "Bruh"
PLG.loopkillplayer.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.loopkillplayer.TextSize = 14.000
PLG.loopkillplayer.TextTransparency = 1.000
PLG.loopkillplayer.Visible = false

PLG.gangster.Name = "gangster"
PLG.gangster.Parent = PLG.loopkillplayer
PLG.gangster.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.gangster.BackgroundTransparency = 1.000
PLG.gangster.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.gangster.Size = UDim2.new(0, 200, 0, 21)
PLG.gangster.Font = Enum.Font.ArialBold
PLG.gangster.Text = "Loop Kill"
PLG.gangster.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.gangster.TextSize = 14.000
PLG.gangster.TextXAlignment = Enum.TextXAlignment.Left
PLG.gangster.Visible = false

PLG.RageFrame.Name = "RageFrame"
PLG.RageFrame.Parent = PLG.Main
PLG.RageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.RageFrame.BackgroundTransparency = 1.000
PLG.RageFrame.BorderSizePixel = 0
PLG.RageFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.RageFrame.Size = UDim2.new(0, 648, 0, 330)
PLG.RageFrame.Visible = false

PLG.RageF.Name = "RageF"
PLG.RageF.Parent = PLG.RageFrame
PLG.RageF.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.RageF.BackgroundTransparency = 0.350
PLG.RageF.BorderSizePixel = 0
PLG.RageF.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.RageF.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_12.Name = "TitlePart"
PLG.TitlePart_12.Parent = PLG.RageF
PLG.TitlePart_12.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_12.BackgroundTransparency = 0.350
PLG.TitlePart_12.BorderSizePixel = 0
PLG.TitlePart_12.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_12.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_44.Parent = PLG.TitlePart_12
PLG.TextLabel_44.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_44.BackgroundTransparency = 1.000
PLG.TextLabel_44.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_44.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_44.Font = Enum.Font.ArialBold
PLG.TextLabel_44.Text = "Rage"
PLG.TextLabel_44.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_44.TextScaled = true
PLG.TextLabel_44.TextSize = 14.000
PLG.TextLabel_44.TextWrapped = true
PLG.TextLabel_44.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_12.Name = "Things"
PLG.Things_12.Parent = PLG.RageF
PLG.Things_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_12.BackgroundTransparency = 1.000
PLG.Things_12.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_12.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_12.Parent = PLG.Things_12
PLG.UIListLayout_12.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_12.Padding = UDim.new(0.0700000003, 0)

PLG.killall.Name = "killall"
PLG.killall.Parent = PLG.Things_12
PLG.killall.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.killall.BorderSizePixel = 0
PLG.killall.Size = UDim2.new(0, 21, 0, 21)
PLG.killall.Font = Enum.Font.SourceSans
PLG.killall.Text = ""
PLG.killall.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.killall.TextSize = 14.000
PLG.killall.TextTransparency = 1.000
PLG.killall.MouseButton1Click:connect(
    function()
        local ignore = {
            game.Players.LocalPlayer.Name,
            "JmuseYT",
            "AR15carbon9",
            "jake11price",
            "N0ah19price",
            "mercypIz",
            "AntiAntiCheat",
            "WolfBladez981",
            "LilNasya",
            "MinecraftRobuck",
            "Exodots"
        }

        workspace.Remote.TeamEvent:FireServer("Medium stone grey")

        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

        wait(0.5)
        local function newkill(a)
            local A_1 = {
                [1] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(845.555908, 101.429337, 2269.43945),
                        Vector3.new(-391.152252, 8.65560055, -83.2166901)
                    ),
                    ["Distance"] = 30.2524313926697,
                    ["Cframe"] = CFrame.new(
                        840.310791,
                        101.334137,
                        2267.87988,
                        0.0636406094,
                        0.151434347,
                        -0.986416459,
                        0,
                        0.988420188,
                        0.151741937,
                        0.997972965,
                        -0.00965694897,
                        0.0629036576
                    ),
                    ["Hit"] = a.Character.Head
                },
                [2] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(845.555908, 101.429337, 2269.43945),
                        Vector3.new(-392.481476, -8.44939327, -76.7261353)
                    ),
                    ["Distance"] = 30.2699294090271,
                    ["Cframe"] = CFrame.new(
                        840.290466,
                        101.184189,
                        2267.93506,
                        0.0964837447,
                        0.0589403138,
                        -0.993587971,
                        4.65661287e-10,
                        0.998245299,
                        0.0592165813,
                        0.995334625,
                        -0.00571343815,
                        0.0963144377
                    ),
                    ["Hit"] = a.Character.Head
                },
                [3] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(845.555908, 101.429337, 2269.43945),
                        Vector3.new(-389.21701, -2.50536323, -92.2163162)
                    ),
                    ["Distance"] = 30.1665518283844,
                    ["Cframe"] = CFrame.new(
                        840.338867,
                        101.236496,
                        2267.80371,
                        0.0166504811,
                        0.0941716284,
                        -0.995416701,
                        1.16415322e-10,
                        0.995554805,
                        0.0941846818,
                        0.999861419,
                        -0.00156822044,
                        0.0165764652
                    ),
                    ["Hit"] = a.Character.Head
                },
                [4] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(845.555908, 101.429337, 2269.43945),
                        Vector3.new(-393.353973, 3.13988972, -72.5452042)
                    ),
                    ["Distance"] = 30.3218522071838,
                    ["Cframe"] = CFrame.new(
                        840.277222,
                        101.285957,
                        2267.9707,
                        0.117109694,
                        0.118740402,
                        -0.985994935,
                        -1.86264515e-09,
                        0.992826641,
                        0.119563118,
                        0.993119001,
                        -0.0140019981,
                        0.116269611
                    ),
                    ["Hit"] = a.Character.Head
                },
                [5] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(845.555908, 101.429337, 2269.43945),
                        Vector3.new(-390.73172, 3.2097764, -85.5477524)
                    ),
                    ["Distance"] = 30.222757101059,
                    ["Cframe"] = CFrame.new(
                        840.317993,
                        101.286423,
                        2267.86035,
                        0.0517584644,
                        0.123365127,
                        -0.991010666,
                        0,
                        0.992340803,
                        0.123530701,
                        0.99865967,
                        -0.00639375951,
                        0.0513620302
                    ),
                    ["Hit"] = a.Character.Head
                }
            }
            local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
            local Event = game:GetService("ReplicatedStorage").ShootEvent
            Event:FireServer(A_1, A_2)
            Event:FireServer(A_1, A_2)
        end

        for i, v in pairs(game.Players:GetPlayers()) do
            local possible = 0
            for a, b in next, ignore do
                if tostring(b) == tostring(v) then
                    possible = possible + 1
                end
            end
            if possible == 0 then
                newkill(v)
            end
        end
        wait(1)
        workspace.Remote.TeamEvent:FireServer("Bright orange")

        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

        wait(0.5)
        local function newkill(a)
            local Success, Error =
                pcall(
                function()
                    local A_1 = {
                        [1] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-391.152252, 8.65560055, -83.2166901)
                            ),
                            ["Distance"] = 30.2524313926697,
                            ["Cframe"] = CFrame.new(
                                840.310791,
                                101.334137,
                                2267.87988,
                                0.0636406094,
                                0.151434347,
                                -0.986416459,
                                0,
                                0.988420188,
                                0.151741937,
                                0.997972965,
                                -0.00965694897,
                                0.0629036576
                            ),
                            ["Hit"] = a.Character.Head
                        },
                        [2] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-392.481476, -8.44939327, -76.7261353)
                            ),
                            ["Distance"] = 30.2699294090271,
                            ["Cframe"] = CFrame.new(
                                840.290466,
                                101.184189,
                                2267.93506,
                                0.0964837447,
                                0.0589403138,
                                -0.993587971,
                                4.65661287e-10,
                                0.998245299,
                                0.0592165813,
                                0.995334625,
                                -0.00571343815,
                                0.0963144377
                            ),
                            ["Hit"] = a.Character.Head
                        },
                        [3] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-389.21701, -2.50536323, -92.2163162)
                            ),
                            ["Distance"] = 30.1665518283844,
                            ["Cframe"] = CFrame.new(
                                840.338867,
                                101.236496,
                                2267.80371,
                                0.0166504811,
                                0.0941716284,
                                -0.995416701,
                                1.16415322e-10,
                                0.995554805,
                                0.0941846818,
                                0.999861419,
                                -0.00156822044,
                                0.0165764652
                            ),
                            ["Hit"] = a.Character.Head
                        },
                        [4] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-393.353973, 3.13988972, -72.5452042)
                            ),
                            ["Distance"] = 30.3218522071838,
                            ["Cframe"] = CFrame.new(
                                840.277222,
                                101.285957,
                                2267.9707,
                                0.117109694,
                                0.118740402,
                                -0.985994935,
                                -1.86264515e-09,
                                0.992826641,
                                0.119563118,
                                0.993119001,
                                -0.0140019981,
                                0.116269611
                            ),
                            ["Hit"] = a.Character.Head
                        },
                        [5] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-390.73172, 3.2097764, -85.5477524)
                            ),
                            ["Distance"] = 30.222757101059,
                            ["Cframe"] = CFrame.new(
                                840.317993,
                                101.286423,
                                2267.86035,
                                0.0517584644,
                                0.123365127,
                                -0.991010666,
                                0,
                                0.992340803,
                                0.123530701,
                                0.99865967,
                                -0.00639375951,
                                0.0513620302
                            ),
                            ["Hit"] = a.Character.Head
                        }
                    }
                    local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
                    local Event = game:GetService("ReplicatedStorage").ShootEvent
                    Event:FireServer(A_1, A_2)
                    Event:FireServer(A_1, A_2)
                end
            )
        end

        for i, v in pairs(game.Players:GetPlayers()) do
            local possible = 0
            for a, b in next, ignore do
                if tostring(b) == tostring(v) then
                    possible = possible + 1
                end
            end
            if possible == 0 then
                newkill(v)
            end
        end
        wait(1)
    end
)

PLG.TextLabel_45.Parent = PLG.killall
PLG.TextLabel_45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_45.BackgroundTransparency = 1.000
PLG.TextLabel_45.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_45.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_45.Font = Enum.Font.ArialBold
PLG.TextLabel_45.Text = "Kill All"
PLG.TextLabel_45.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_45.TextSize = 14.000
PLG.TextLabel_45.TextXAlignment = Enum.TextXAlignment.Left

PLG.killaura.Name = "killaura"
PLG.killaura.Parent = PLG.Things_12
PLG.killaura.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.killaura.BorderSizePixel = 0
PLG.killaura.Size = UDim2.new(0, 21, 0, 21)
PLG.killaura.Font = Enum.Font.SourceSans
PLG.killaura.Text = "Bruh"
PLG.killaura.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.killaura.TextSize = 14.000
PLG.killaura.TextTransparency = 1.000
PLG.killaura.MouseButton1Click:connect(
    function()
        game:GetService("StarterGui"):SetCore(
            "SendNotification",
            {
                Title = "Info:",
                Text = "Press E To Kill People Near You!"
            }
        )

        plr = game:service "Players".LocalPlayer
        char = plr.Character
        mouse = plr:GetMouse()
        on = false

        mouse.KeyDown:connect(
            function(key)
                if key == "e" then
                    on = true
                end
            end
        )

        mouse.KeyUp:connect(
            function(key)
                if key == "e" then
                    on = false
                end
            end
        )

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
            for i, v in pairs(game.Players:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game.Players[v.Name].Character.HumanoidRootPart.CFrame
                game.ReplicatedStorage.meleeEvent:FireServer(v.Name)
                wait(.8)
            end
        end
    end
)

PLG.TextLabel_46.Parent = PLG.killaura
PLG.TextLabel_46.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_46.BackgroundTransparency = 1.000
PLG.TextLabel_46.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_46.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_46.Font = Enum.Font.ArialBold
PLG.TextLabel_46.Text = "Kill Aura"
PLG.TextLabel_46.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_46.TextSize = 14.000
PLG.TextLabel_46.TextXAlignment = Enum.TextXAlignment.Left

PLG.Hitbox.Name = "Hitbox"
PLG.Hitbox.Parent = PLG.RageFrame
PLG.Hitbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Hitbox.BackgroundTransparency = 0.350
PLG.Hitbox.BorderSizePixel = 0
PLG.Hitbox.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.Hitbox.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_13.Name = "TitlePart"
PLG.TitlePart_13.Parent = PLG.Hitbox
PLG.TitlePart_13.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_13.BackgroundTransparency = 0.350
PLG.TitlePart_13.BorderSizePixel = 0
PLG.TitlePart_13.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_13.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_47.Parent = PLG.TitlePart_13
PLG.TextLabel_47.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_47.BackgroundTransparency = 1.000
PLG.TextLabel_47.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_47.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_47.Font = Enum.Font.ArialBold
PLG.TextLabel_47.Text = "Hitbox Changer"
PLG.TextLabel_47.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_47.TextScaled = true
PLG.TextLabel_47.TextSize = 14.000
PLG.TextLabel_47.TextWrapped = true
PLG.TextLabel_47.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_13.Name = "Things"
PLG.Things_13.Parent = PLG.Hitbox
PLG.Things_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_13.BackgroundTransparency = 1.000
PLG.Things_13.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_13.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_13.Parent = PLG.Things_13
PLG.UIListLayout_13.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_13.Padding = UDim.new(0.0700000003, 0)

PLG.guardbox.Name = "guardbox"
PLG.guardbox.Parent = PLG.Things_13
PLG.guardbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.guardbox.BorderSizePixel = 0
PLG.guardbox.Size = UDim2.new(0, 21, 0, 21)
PLG.guardbox.Font = Enum.Font.SourceSans
PLG.guardbox.Text = "Bruh"
PLG.guardbox.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.guardbox.TextSize = 14.000
PLG.guardbox.TextTransparency = 1.000

guardperson = false
PLG.guardbox.MouseButton1Click:Connect(
    function()
        if not guardperson then
            guardperson = true
            PLG.guardbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.guardbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

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
    end
)

PLG.TextLabel_48.Parent = PLG.guardbox
PLG.TextLabel_48.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_48.BackgroundTransparency = 1.000
PLG.TextLabel_48.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_48.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_48.Font = Enum.Font.ArialBold
PLG.TextLabel_48.Text = "Guard HItbox"
PLG.TextLabel_48.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_48.TextSize = 14.000
PLG.TextLabel_48.TextXAlignment = Enum.TextXAlignment.Left

PLG.inmatebox.Name = "inmatebox"
PLG.inmatebox.Parent = PLG.Things_13
PLG.inmatebox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.inmatebox.BorderSizePixel = 0
PLG.inmatebox.Size = UDim2.new(0, 21, 0, 21)
PLG.inmatebox.Font = Enum.Font.SourceSans
PLG.inmatebox.Text = "Bruh"
PLG.inmatebox.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.inmatebox.TextSize = 14.000
PLG.inmatebox.TextTransparency = 1.000

inmateperson = false
PLG.inmatebox.MouseButton1Click:Connect(
    function()
        if not inmateperson then
            inmateperson = true
            PLG.inmatebox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.inmatebox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

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
    end
)

PLG.TextLabel_49.Parent = PLG.inmatebox
PLG.TextLabel_49.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_49.BackgroundTransparency = 1.000
PLG.TextLabel_49.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_49.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_49.Font = Enum.Font.ArialBold
PLG.TextLabel_49.Text = "Inmate Hitbox"
PLG.TextLabel_49.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_49.TextSize = 14.000
PLG.TextLabel_49.TextXAlignment = Enum.TextXAlignment.Left

PLG.crimbox.Name = "crimbox"
PLG.crimbox.Parent = PLG.Things_13
PLG.crimbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.crimbox.BorderSizePixel = 0
PLG.crimbox.Size = UDim2.new(0, 21, 0, 21)
PLG.crimbox.Font = Enum.Font.SourceSans
PLG.crimbox.Text = "Bruh"
PLG.crimbox.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.crimbox.TextSize = 14.000
PLG.crimbox.TextTransparency = 1.000

crimeperson = false
PLG.crimbox.MouseButton1Click:Connect(
    function()
        if not crimeperson then
            crimeperson = true
            PLG.crimbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.crimbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

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
    end
)

PLG.TextLabel_50.Parent = PLG.crimbox
PLG.TextLabel_50.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_50.BackgroundTransparency = 1.000
PLG.TextLabel_50.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_50.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_50.Font = Enum.Font.ArialBold
PLG.TextLabel_50.Text = "Criminal Hitbox"
PLG.TextLabel_50.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_50.TextSize = 14.000
PLG.TextLabel_50.TextXAlignment = Enum.TextXAlignment.Left

PLG.neutralbox.Name = "neutralbox"
PLG.neutralbox.Parent = PLG.Things_13
PLG.neutralbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.neutralbox.BorderSizePixel = 0
PLG.neutralbox.Size = UDim2.new(0, 21, 0, 21)
PLG.neutralbox.Font = Enum.Font.SourceSans
PLG.neutralbox.Text = "Bruh"
PLG.neutralbox.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.neutralbox.TextSize = 14.000
PLG.neutralbox.TextTransparency = 1.000

graydude = false
PLG.neutralbox.MouseButton1Click:Connect(
    function()
        if not graydude then
            graydude = true
            PLG.neutralbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

            _G.HeaadSize123 = 10
            _G.Disabled123 = true

            game:GetService("RunService").RenderStepped:connect(
                function()
                    if _G.Disabled123 then
                        for i, v in pairs(game.Teams["Neutral"]:GetPlayers()) do
                            if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                                pcall(
                                    function()
                                        v.Character.HumanoidRootPart.Size =
                                            Vector3.new(_G.HeaadSize123, _G.HeaadSize123, _G.HeaadSize123)
                                        v.Character.HumanoidRootPart.Transparency = 0.7
                                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
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
            graydude = false
            PLG.neutralbox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.Disabled123 = false
            _G.Off123 = true

            game:GetService("RunService").RenderStepped:connect(
                function()
                    if _G.Off123 then
                        for i, v in pairs(game.Teams["Criminals"]:GetPlayers()) do
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
    end
)

PLG.TextLabel_51.Parent = PLG.neutralbox
PLG.TextLabel_51.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_51.BackgroundTransparency = 1.000
PLG.TextLabel_51.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_51.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_51.Font = Enum.Font.ArialBold
PLG.TextLabel_51.Text = "Neutral Hitbox"
PLG.TextLabel_51.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_51.TextSize = 14.000
PLG.TextLabel_51.TextXAlignment = Enum.TextXAlignment.Left

PLG.KillAllToggle.Name = "KillAllToggle"
PLG.KillAllToggle.Parent = PLG.RageFrame
PLG.KillAllToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.KillAllToggle.BackgroundTransparency = 0.350
PLG.KillAllToggle.BorderSizePixel = 0
PLG.KillAllToggle.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.KillAllToggle.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_14.Name = "TitlePart"
PLG.TitlePart_14.Parent = PLG.KillAllToggle
PLG.TitlePart_14.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_14.BackgroundTransparency = 0.350
PLG.TitlePart_14.BorderSizePixel = 0
PLG.TitlePart_14.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_14.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_52.Parent = PLG.TitlePart_14
PLG.TextLabel_52.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_52.BackgroundTransparency = 1.000
PLG.TextLabel_52.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_52.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_52.Font = Enum.Font.ArialBold
PLG.TextLabel_52.Text = "Kill All Toggles"
PLG.TextLabel_52.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_52.TextScaled = true
PLG.TextLabel_52.TextSize = 14.000
PLG.TextLabel_52.TextWrapped = true
PLG.TextLabel_52.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_14.Name = "Things"
PLG.Things_14.Parent = PLG.KillAllToggle
PLG.Things_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_14.BackgroundTransparency = 1.000
PLG.Things_14.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_14.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_14.Parent = PLG.Things_14
PLG.UIListLayout_14.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_14.Padding = UDim.new(0.0700000003, 0)

PLG.ktcops.Name = "ktcops"
PLG.ktcops.Parent = PLG.Things_14
PLG.ktcops.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ktcops.BorderSizePixel = 0
PLG.ktcops.Size = UDim2.new(0, 21, 0, 21)
PLG.ktcops.Font = Enum.Font.SourceSans
PLG.ktcops.Text = "Bruh"
PLG.ktcops.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ktcops.TextSize = 14.000
PLG.ktcops.TextTransparency = 1.000

copskt = false
PLG.ktcops.MouseButton1Click:Connect(
    function()
        if not copskt then
            copskt = true
            PLG.ktcops.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            local Success, Error =
                pcall(
                function()
                    toggleTeam("Guards")
                end
            )
        else
            copskt = false
            PLG.ktcops.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            local Success, Error =
                pcall(
                function()
                    toggleTeam("Guards")
                end
            )
        end
    end
)

PLG.TextLabel_53.Parent = PLG.ktcops
PLG.TextLabel_53.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_53.BackgroundTransparency = 1.000
PLG.TextLabel_53.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_53.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_53.Font = Enum.Font.ArialBold
PLG.TextLabel_53.Text = "Cops"
PLG.TextLabel_53.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_53.TextSize = 14.000
PLG.TextLabel_53.TextXAlignment = Enum.TextXAlignment.Left

PLG.ktinmates.Name = "ktinmates"
PLG.ktinmates.Parent = PLG.Things_14
PLG.ktinmates.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ktinmates.BorderSizePixel = 0
PLG.ktinmates.Size = UDim2.new(0, 21, 0, 21)
PLG.ktinmates.Font = Enum.Font.SourceSans
PLG.ktinmates.Text = "Bruh"
PLG.ktinmates.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ktinmates.TextSize = 14.000
PLG.ktinmates.TextTransparency = 1.000

inmateskt = false
PLG.ktinmates.MouseButton1Click:Connect(
    function()
        if not inmateskt then
            inmateskt = true
            PLG.ktinmates.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

            local Success, Error =
                pcall(
                function()
                    toggleTeam("Inmates")
                end
            )
        else
            inmateskt = false
            PLG.ktinmates.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            local Success, Error =
                pcall(
                function()
                    toggleTeam("Inmates")
                end
            )
        end
    end
)

PLG.TextLabel_54.Parent = PLG.ktinmates
PLG.TextLabel_54.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_54.BackgroundTransparency = 1.000
PLG.TextLabel_54.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_54.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_54.Font = Enum.Font.ArialBold
PLG.TextLabel_54.Text = "Inmates"
PLG.TextLabel_54.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_54.TextSize = 14.000
PLG.TextLabel_54.TextXAlignment = Enum.TextXAlignment.Left

PLG.ktcriminals.Name = "ktcriminals"
PLG.ktcriminals.Parent = PLG.Things_14
PLG.ktcriminals.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ktcriminals.BorderSizePixel = 0
PLG.ktcriminals.Size = UDim2.new(0, 21, 0, 21)
PLG.ktcriminals.Font = Enum.Font.SourceSans
PLG.ktcriminals.Text = "Bruh"
PLG.ktcriminals.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ktcriminals.TextSize = 14.000
PLG.ktcriminals.TextTransparency = 1.000

crimekaa = false
PLG.ktcriminals.MouseButton1Click:Connect(
    function()
        if not crimekaa then
            crimekaa = true
            PLG.ktcriminals.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

            local Success, Error =
                pcall(
                function()
                    toggleTeam("Criminals")
                end
            )
        else
            crimekaa = false
            PLG.ktcriminals.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            local Success, Error =
                pcall(
                function()
                    toggleTeam("Criminals")
                end
            )
        end
    end
)

PLG.TextLabel_55.Parent = PLG.ktcriminals
PLG.TextLabel_55.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_55.BackgroundTransparency = 1.000
PLG.TextLabel_55.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_55.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_55.Font = Enum.Font.ArialBold
PLG.TextLabel_55.Text = "Criminals"
PLG.TextLabel_55.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_55.TextSize = 14.000
PLG.TextLabel_55.TextXAlignment = Enum.TextXAlignment.Left

PLG.ktneutral.Name = "ktneutral"
PLG.ktneutral.Parent = PLG.Things_14
PLG.ktneutral.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ktneutral.BorderSizePixel = 0
PLG.ktneutral.Size = UDim2.new(0, 21, 0, 21)
PLG.ktneutral.Font = Enum.Font.SourceSans
PLG.ktneutral.Text = "Bruh"
PLG.ktneutral.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ktneutral.TextSize = 14.000
PLG.ktneutral.TextTransparency = 1.000
PLG.ktneutral.Visible = false

PLG.TextLabel_56.Parent = PLG.ktneutral
PLG.TextLabel_56.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_56.BackgroundTransparency = 1.000
PLG.TextLabel_56.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_56.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_56.Font = Enum.Font.ArialBold
PLG.TextLabel_56.Text = "Neutral"
PLG.TextLabel_56.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_56.TextSize = 14.000
PLG.TextLabel_56.TextXAlignment = Enum.TextXAlignment.Left

PLG.KillAuraToggles.Name = "KillAuraToggles"
PLG.KillAuraToggles.Parent = PLG.RageFrame
PLG.KillAuraToggles.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.KillAuraToggles.BackgroundTransparency = 0.350
PLG.KillAuraToggles.BorderSizePixel = 0
PLG.KillAuraToggles.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.KillAuraToggles.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_15.Name = "TitlePart"
PLG.TitlePart_15.Parent = PLG.KillAuraToggles
PLG.TitlePart_15.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_15.BackgroundTransparency = 0.350
PLG.TitlePart_15.BorderSizePixel = 0
PLG.TitlePart_15.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_15.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_57.Parent = PLG.TitlePart_15
PLG.TextLabel_57.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_57.BackgroundTransparency = 1.000
PLG.TextLabel_57.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_57.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_57.Font = Enum.Font.ArialBold
PLG.TextLabel_57.Text = "Kill Aura Toggles"
PLG.TextLabel_57.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_57.TextScaled = true
PLG.TextLabel_57.TextSize = 14.000
PLG.TextLabel_57.TextWrapped = true
PLG.TextLabel_57.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_15.Name = "Things"
PLG.Things_15.Parent = PLG.KillAuraToggles
PLG.Things_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_15.BackgroundTransparency = 1.000
PLG.Things_15.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_15.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_15.Parent = PLG.Things_15
PLG.UIListLayout_15.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_15.Padding = UDim.new(0.0700000003, 0)

PLG.kacops.Name = "kacops"
PLG.kacops.Parent = PLG.Things_15
PLG.kacops.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.kacops.BorderSizePixel = 0
PLG.kacops.Size = UDim2.new(0, 21, 0, 21)
PLG.kacops.Font = Enum.Font.SourceSans
PLG.kacops.Text = "Bruh"
PLG.kacops.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.kacops.TextSize = 14.000
PLG.kacops.TextTransparency = 1.000

copska = false
PLG.kacops.MouseButton1Click:Connect(
    function()
        if not copska then
            copska = true
            PLG.kacops.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.kacops.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.GuardKillAura = false
        end
    end
)

PLG.TextLabel_58.Parent = PLG.kacops
PLG.TextLabel_58.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_58.BackgroundTransparency = 1.000
PLG.TextLabel_58.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_58.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_58.Font = Enum.Font.ArialBold
PLG.TextLabel_58.Text = "Cops"
PLG.TextLabel_58.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_58.TextSize = 14.000
PLG.TextLabel_58.TextXAlignment = Enum.TextXAlignment.Left

PLG.kainmates.Name = "kainmates"
PLG.kainmates.Parent = PLG.Things_15
PLG.kainmates.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.kainmates.BorderSizePixel = 0
PLG.kainmates.Size = UDim2.new(0, 21, 0, 21)
PLG.kainmates.Font = Enum.Font.SourceSans
PLG.kainmates.Text = "Bruh"
PLG.kainmates.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.kainmates.TextSize = 14.000
PLG.kainmates.TextTransparency = 1.000

inmateka = false
PLG.kainmates.MouseButton1Click:Connect(
    function()
        if not inmateka then
            inmateka = true
            PLG.kainmates.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.kainmates.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.InmateKillAura = false
        end
    end
)

PLG.TextLabel_59.Parent = PLG.kainmates
PLG.TextLabel_59.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_59.BackgroundTransparency = 1.000
PLG.TextLabel_59.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_59.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_59.Font = Enum.Font.ArialBold
PLG.TextLabel_59.Text = "Inmates"
PLG.TextLabel_59.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_59.TextSize = 14.000
PLG.TextLabel_59.TextXAlignment = Enum.TextXAlignment.Left

PLG.kacriminals.Name = "kacriminals"
PLG.kacriminals.Parent = PLG.Things_15
PLG.kacriminals.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.kacriminals.BorderSizePixel = 0
PLG.kacriminals.Size = UDim2.new(0, 21, 0, 21)
PLG.kacriminals.Font = Enum.Font.SourceSans
PLG.kacriminals.Text = "Bruh"
PLG.kacriminals.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.kacriminals.TextSize = 14.000
PLG.kacriminals.TextTransparency = 1.000

crimeka = false
PLG.kacriminals.MouseButton1Click:Connect(
    function()
        if not crimeka then
            crimeka = true
            PLG.kacriminals.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.kacriminals.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.CriminalKillAura = false
        end
    end
)

PLG.TextLabel_60.Parent = PLG.kacriminals
PLG.TextLabel_60.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_60.BackgroundTransparency = 1.000
PLG.TextLabel_60.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_60.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_60.Font = Enum.Font.ArialBold
PLG.TextLabel_60.Text = "Criminals"
PLG.TextLabel_60.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_60.TextSize = 14.000
PLG.TextLabel_60.TextXAlignment = Enum.TextXAlignment.Left

PLG.MiscFrame.Name = "MiscFrame"
PLG.MiscFrame.Parent = PLG.Main
PLG.MiscFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.MiscFrame.BackgroundTransparency = 1.000
PLG.MiscFrame.BorderSizePixel = 0
PLG.MiscFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.MiscFrame.Size = UDim2.new(0, 648, 0, 330)
PLG.MiscFrame.Visible = false

PLG.ModGunsFrame.Name = "ModGunsFrame"
PLG.ModGunsFrame.Parent = PLG.MiscFrame
PLG.ModGunsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ModGunsFrame.BackgroundTransparency = 0.350
PLG.ModGunsFrame.BorderSizePixel = 0
PLG.ModGunsFrame.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.ModGunsFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_16.Name = "TitlePart"
PLG.TitlePart_16.Parent = PLG.ModGunsFrame
PLG.TitlePart_16.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_16.BackgroundTransparency = 0.350
PLG.TitlePart_16.BorderSizePixel = 0
PLG.TitlePart_16.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_16.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_61.Parent = PLG.TitlePart_16
PLG.TextLabel_61.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_61.BackgroundTransparency = 1.000
PLG.TextLabel_61.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_61.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_61.Font = Enum.Font.ArialBold
PLG.TextLabel_61.Text = "Mod Guns"
PLG.TextLabel_61.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_61.TextScaled = true
PLG.TextLabel_61.TextSize = 14.000
PLG.TextLabel_61.TextWrapped = true
PLG.TextLabel_61.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_16.Name = "Things"
PLG.Things_16.Parent = PLG.ModGunsFrame
PLG.Things_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_16.BackgroundTransparency = 1.000
PLG.Things_16.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_16.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_16.Parent = PLG.Things_16
PLG.UIListLayout_16.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_16.Padding = UDim.new(0.0700000003, 0)

PLG.modm4.Name = "modm4"
PLG.modm4.Parent = PLG.Things_16
PLG.modm4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.modm4.BorderSizePixel = 0
PLG.modm4.Size = UDim2.new(0, 21, 0, 21)
PLG.modm4.Font = Enum.Font.SourceSans
PLG.modm4.Text = "Bruh"
PLG.modm4.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.modm4.TextSize = 14.000
PLG.modm4.TextTransparency = 1.000
PLG.modm4.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.Spread = 0
	            rs.FireRate = 0
	            rs.CurrentAmmo = math.huge
	            rs.Bullets = 30
	            rs.AutoFire = true
			end
		end)
    end
)

PLG.TextLabel_62.Parent = PLG.modm4
PLG.TextLabel_62.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_62.BackgroundTransparency = 1.000
PLG.TextLabel_62.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_62.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_62.Font = Enum.Font.ArialBold
PLG.TextLabel_62.Text = "M4A1"
PLG.TextLabel_62.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_62.TextSize = 14.000
PLG.TextLabel_62.TextXAlignment = Enum.TextXAlignment.Left

PLG.modak.Name = "modak"
PLG.modak.Parent = PLG.Things_16
PLG.modak.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.modak.BorderSizePixel = 0
PLG.modak.Size = UDim2.new(0, 21, 0, 21)
PLG.modak.Font = Enum.Font.SourceSans
PLG.modak.Text = "Bruh"
PLG.modak.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.modak.TextSize = 14.000
PLG.modak.TextTransparency = 1.000
PLG.modak.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.Spread = 0
	            rs.FireRate = 0
	            rs.CurrentAmmo = math.huge
	            rs.Bullets = 30
	            rs.AutoFire = true
			end
		end)
    end
)

PLG.TextLabel_63.Parent = PLG.modak
PLG.TextLabel_63.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_63.BackgroundTransparency = 1.000
PLG.TextLabel_63.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_63.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_63.Font = Enum.Font.ArialBold
PLG.TextLabel_63.Text = "AK-47"
PLG.TextLabel_63.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_63.TextSize = 14.000
PLG.TextLabel_63.TextXAlignment = Enum.TextXAlignment.Left

PLG.modrem.Name = "modrem"
PLG.modrem.Parent = PLG.Things_16
PLG.modrem.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.modrem.BorderSizePixel = 0
PLG.modrem.Size = UDim2.new(0, 21, 0, 21)
PLG.modrem.Font = Enum.Font.SourceSans
PLG.modrem.Text = "Bruh"
PLG.modrem.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.modrem.TextSize = 14.000
PLG.modrem.TextTransparency = 1.000
PLG.modrem.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.Spread = 0
	            rs.FireRate = 0
	            rs.CurrentAmmo = math.huge
	            rs.Bullets = 30
	            rs.AutoFire = true
			end
		end)
    end
)

PLG.TextLabel_64.Parent = PLG.modrem
PLG.TextLabel_64.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_64.BackgroundTransparency = 1.000
PLG.TextLabel_64.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_64.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_64.Font = Enum.Font.ArialBold
PLG.TextLabel_64.Text = "Remington 870"
PLG.TextLabel_64.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_64.TextSize = 14.000
PLG.TextLabel_64.TextXAlignment = Enum.TextXAlignment.Left

PLG.modm9.Name = "modm9"
PLG.modm9.Parent = PLG.Things_16
PLG.modm9.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.modm9.BorderSizePixel = 0
PLG.modm9.Size = UDim2.new(0, 21, 0, 21)
PLG.modm9.Font = Enum.Font.SourceSans
PLG.modm9.Text = "Bruh"
PLG.modm9.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.modm9.TextSize = 14.000
PLG.modm9.TextTransparency = 1.000
PLG.modm9.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("M9").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.Spread = 0
	            rs.FireRate = 0
	            rs.CurrentAmmo = math.huge
	            rs.Bullets = 30
	            rs.AutoFire = true
			end
		end)
    end
)

PLG.TextLabel_65.Parent = PLG.modm9
PLG.TextLabel_65.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_65.BackgroundTransparency = 1.000
PLG.TextLabel_65.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_65.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_65.Font = Enum.Font.ArialBold
PLG.TextLabel_65.Text = "M9"
PLG.TextLabel_65.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_65.TextSize = 14.000
PLG.TextLabel_65.TextXAlignment = Enum.TextXAlignment.Left

PLG.modtaser.Name = "modtaser"
PLG.modtaser.Parent = PLG.Things_16
PLG.modtaser.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.modtaser.BorderSizePixel = 0
PLG.modtaser.Size = UDim2.new(0, 21, 0, 21)
PLG.modtaser.Font = Enum.Font.SourceSans
PLG.modtaser.Text = "Bruh"
PLG.modtaser.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.modtaser.TextSize = 14.000
PLG.modtaser.TextTransparency = 1.000
PLG.modtaser.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.Spread = 0
	            rs.FireRate = 0
	            rs.CurrentAmmo = math.huge
	            rs.Bullets = 30
	            rs.AutoFire = true
			end
		end)
    end
)

PLG.TextLabel_66.Parent = PLG.modtaser
PLG.TextLabel_66.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_66.BackgroundTransparency = 1.000
PLG.TextLabel_66.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_66.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_66.Font = Enum.Font.ArialBold
PLG.TextLabel_66.Text = "Taser"
PLG.TextLabel_66.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_66.TextSize = 14.000
PLG.TextLabel_66.TextXAlignment = Enum.TextXAlignment.Left

PLG.MoreMisc.Name = "MoreMisc"
PLG.MoreMisc.Parent = PLG.MiscFrame
PLG.MoreMisc.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.MoreMisc.BackgroundTransparency = 0.350
PLG.MoreMisc.BorderSizePixel = 0
PLG.MoreMisc.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.MoreMisc.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_17.Name = "TitlePart"
PLG.TitlePart_17.Parent = PLG.MoreMisc
PLG.TitlePart_17.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_17.BackgroundTransparency = 0.350
PLG.TitlePart_17.BorderSizePixel = 0
PLG.TitlePart_17.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_17.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_67.Parent = PLG.TitlePart_17
PLG.TextLabel_67.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_67.BackgroundTransparency = 1.000
PLG.TextLabel_67.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_67.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_67.Font = Enum.Font.ArialBold
PLG.TextLabel_67.Text = "More Misc"
PLG.TextLabel_67.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_67.TextScaled = true
PLG.TextLabel_67.TextSize = 14.000
PLG.TextLabel_67.TextWrapped = true
PLG.TextLabel_67.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_17.Name = "Things"
PLG.Things_17.Parent = PLG.MoreMisc
PLG.Things_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_17.BackgroundTransparency = 1.000
PLG.Things_17.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_17.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_17.Parent = PLG.Things_17
PLG.UIListLayout_17.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_17.Padding = UDim.new(0.0700000003, 0)

PLG.crimeall.Name = "crimeall"
PLG.crimeall.Parent = PLG.Things_17
PLG.crimeall.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.crimeall.BorderSizePixel = 0
PLG.crimeall.Size = UDim2.new(0, 21, 0, 21)
PLG.crimeall.Font = Enum.Font.SourceSans
PLG.crimeall.Text = "Bruh"
PLG.crimeall.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.crimeall.TextSize = 14.000
PLG.crimeall.TextTransparency = 1.000
PLG.crimeall.MouseButton1Click:connect(
    function()
        local Player = game.Players.LocalPlayer
        if Player.Character.Humanoid.Sit == true then
            Player.Character.Humanoid.Sit = false
        end
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i, v in pairs(game.Teams.Guards:GetPlayers()) do
            if v and v.Character then
                if v.Name ~= Player.Name then
                    if v.Name ~= "jake11pric" then
                        repeat
                            i = i - 1
                            Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
                            game.Workspace.Remote.ItemHandler:InvokeServer(
                                workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP
                            )

                            wait(0.01)
                            if Player.Character.Humanoid.Sit == true then
                                Player.Character.Humanoid.Sit = false
                            end
                            local A_1 = {
                                [1] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-391.152252, 8.65560055, -83.2166901)
                                    ),
                                    ["Distance"] = 3.2524313926697,
                                    ["Cframe"] = CFrame.new(
                                        840.310791,
                                        101.334137,
                                        2267.87988,
                                        0.0636406094,
                                        0.151434347,
                                        -0.986416459,
                                        0,
                                        0.988420188,
                                        0.151741937,
                                        0.997972965,
                                        -0.00965694897,
                                        0.0629036576
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [2] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-392.481476, -8.44939327, -76.7261353)
                                    ),
                                    ["Distance"] = 3.2699294090271,
                                    ["Cframe"] = CFrame.new(
                                        840.290466,
                                        101.184189,
                                        2267.93506,
                                        0.0964837447,
                                        0.0589403138,
                                        -0.993587971,
                                        4.65661287e-10,
                                        0.998245299,
                                        0.0592165813,
                                        0.995334625,
                                        -0.00571343815,
                                        0.0963144377
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [3] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-389.21701, -2.50536323, -92.2163162)
                                    ),
                                    ["Distance"] = 3.1665518283844,
                                    ["Cframe"] = CFrame.new(
                                        840.338867,
                                        101.236496,
                                        2267.80371,
                                        0.0166504811,
                                        0.0941716284,
                                        -0.995416701,
                                        1.16415322e-10,
                                        0.995554805,
                                        0.0941846818,
                                        0.999861419,
                                        -0.00156822044,
                                        0.0165764652
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [4] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-393.353973, 3.13988972, -72.5452042)
                                    ),
                                    ["Distance"] = 3.3218522071838,
                                    ["Cframe"] = CFrame.new(
                                        840.277222,
                                        101.285957,
                                        2267.9707,
                                        0.117109694,
                                        0.118740402,
                                        -0.985994935,
                                        -1.86264515e-09,
                                        0.992826641,
                                        0.119563118,
                                        0.993119001,
                                        -0.0140019981,
                                        0.116269611
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [5] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-390.73172, 3.2097764, -85.5477524)
                                    ),
                                    ["Distance"] = 3.222757101059,
                                    ["Cframe"] = CFrame.new(
                                        840.317993,
                                        101.286423,
                                        2267.86035,
                                        0.0517584644,
                                        0.123365127,
                                        -0.991010666,
                                        0,
                                        0.992340803,
                                        0.123530701,
                                        0.99865967,
                                        -0.00639375951,
                                        0.0513620302
                                    ),
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
                                Bruh.CFrame =
                                    CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
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
                                Bruh.CFrame =
                                    CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
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
        for i, v in pairs(game.Teams.Inmates:GetPlayers()) do
            if v and v.Character then
                if v.Name ~= Player.Name then
                    if v.Name ~= "jake11pric" then
                        repeat
                            i = i - 1
                            Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
                            game.Workspace.Remote.ItemHandler:InvokeServer(
                                workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP
                            )

                            wait(0.01)
                            if Player.Character.Humanoid.Sit == true then
                                Player.Character.Humanoid.Sit = false
                            end
                            local A_1 = {
                                [1] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-391.152252, 8.65560055, -83.2166901)
                                    ),
                                    ["Distance"] = 3.2524313926697,
                                    ["Cframe"] = CFrame.new(
                                        840.310791,
                                        101.334137,
                                        2267.87988,
                                        0.0636406094,
                                        0.151434347,
                                        -0.986416459,
                                        0,
                                        0.988420188,
                                        0.151741937,
                                        0.997972965,
                                        -0.00965694897,
                                        0.0629036576
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [2] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-392.481476, -8.44939327, -76.7261353)
                                    ),
                                    ["Distance"] = 3.2699294090271,
                                    ["Cframe"] = CFrame.new(
                                        840.290466,
                                        101.184189,
                                        2267.93506,
                                        0.0964837447,
                                        0.0589403138,
                                        -0.993587971,
                                        4.65661287e-10,
                                        0.998245299,
                                        0.0592165813,
                                        0.995334625,
                                        -0.00571343815,
                                        0.0963144377
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [3] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-389.21701, -2.50536323, -92.2163162)
                                    ),
                                    ["Distance"] = 3.1665518283844,
                                    ["Cframe"] = CFrame.new(
                                        840.338867,
                                        101.236496,
                                        2267.80371,
                                        0.0166504811,
                                        0.0941716284,
                                        -0.995416701,
                                        1.16415322e-10,
                                        0.995554805,
                                        0.0941846818,
                                        0.999861419,
                                        -0.00156822044,
                                        0.0165764652
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [4] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-393.353973, 3.13988972, -72.5452042)
                                    ),
                                    ["Distance"] = 3.3218522071838,
                                    ["Cframe"] = CFrame.new(
                                        840.277222,
                                        101.285957,
                                        2267.9707,
                                        0.117109694,
                                        0.118740402,
                                        -0.985994935,
                                        -1.86264515e-09,
                                        0.992826641,
                                        0.119563118,
                                        0.993119001,
                                        -0.0140019981,
                                        0.116269611
                                    ),
                                    ["Hit"] = v.Character.Head
                                },
                                [5] = {
                                    ["RayObject"] = Ray.new(
                                        Vector3.new(845.555908, 101.429337, 2269.43945),
                                        Vector3.new(-390.73172, 3.2097764, -85.5477524)
                                    ),
                                    ["Distance"] = 3.222757101059,
                                    ["Cframe"] = CFrame.new(
                                        840.317993,
                                        101.286423,
                                        2267.86035,
                                        0.0517584644,
                                        0.123365127,
                                        -0.991010666,
                                        0,
                                        0.992340803,
                                        0.123530701,
                                        0.99865967,
                                        -0.00639375951,
                                        0.0513620302
                                    ),
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
                                Bruh.CFrame =
                                    CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
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
                                Bruh.CFrame =
                                    CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
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
        for i, v in pairs(game.Teams.Neutral:GetPlayers()) do
            if v.Name ~= Player.Name then
                repeat
                    i = i - 1
                    Workspace.Remote.TeamEvent:FireServer("Bright orange")
                    game.Workspace.Remote.ItemHandler:InvokeServer(
                        workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP
                    )

                    wait(0.01)
                    local A_1 = {
                        [1] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-391.152252, 8.65560055, -83.2166901)
                            ),
                            ["Distance"] = 3.2524313926697,
                            ["Cframe"] = CFrame.new(
                                840.310791,
                                101.334137,
                                2267.87988,
                                0.0636406094,
                                0.151434347,
                                -0.986416459,
                                0,
                                0.988420188,
                                0.151741937,
                                0.997972965,
                                -0.00965694897,
                                0.0629036576
                            ),
                            ["Hit"] = v.Character.Head
                        },
                        [2] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-392.481476, -8.44939327, -76.7261353)
                            ),
                            ["Distance"] = 3.2699294090271,
                            ["Cframe"] = CFrame.new(
                                840.290466,
                                101.184189,
                                2267.93506,
                                0.0964837447,
                                0.0589403138,
                                -0.993587971,
                                4.65661287e-10,
                                0.998245299,
                                0.0592165813,
                                0.995334625,
                                -0.00571343815,
                                0.0963144377
                            ),
                            ["Hit"] = v.Character.Head
                        },
                        [3] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-389.21701, -2.50536323, -92.2163162)
                            ),
                            ["Distance"] = 3.1665518283844,
                            ["Cframe"] = CFrame.new(
                                840.338867,
                                101.236496,
                                2267.80371,
                                0.0166504811,
                                0.0941716284,
                                -0.995416701,
                                1.16415322e-10,
                                0.995554805,
                                0.0941846818,
                                0.999861419,
                                -0.00156822044,
                                0.0165764652
                            ),
                            ["Hit"] = v.Character.Head
                        },
                        [4] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-393.353973, 3.13988972, -72.5452042)
                            ),
                            ["Distance"] = 3.3218522071838,
                            ["Cframe"] = CFrame.new(
                                840.277222,
                                101.285957,
                                2267.9707,
                                0.117109694,
                                0.118740402,
                                -0.985994935,
                                -1.86264515e-09,
                                0.992826641,
                                0.119563118,
                                0.993119001,
                                -0.0140019981,
                                0.116269611
                            ),
                            ["Hit"] = v.Character.Head
                        },
                        [5] = {
                            ["RayObject"] = Ray.new(
                                Vector3.new(845.555908, 101.429337, 2269.43945),
                                Vector3.new(-390.73172, 3.2097764, -85.5477524)
                            ),
                            ["Distance"] = 3.222757101059,
                            ["Cframe"] = CFrame.new(
                                840.317993,
                                101.286423,
                                2267.86035,
                                0.0517584644,
                                0.123365127,
                                -0.991010666,
                                0,
                                0.992340803,
                                0.123530701,
                                0.99865967,
                                -0.00639375951,
                                0.0513620302
                            ),
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
)

PLG.TextLabel_68.Parent = PLG.crimeall
PLG.TextLabel_68.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_68.BackgroundTransparency = 1.000
PLG.TextLabel_68.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_68.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_68.Font = Enum.Font.ArialBold
PLG.TextLabel_68.Text = "Criminal All"
PLG.TextLabel_68.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_68.TextSize = 14.000
PLG.TextLabel_68.TextXAlignment = Enum.TextXAlignment.Left

PLG.invis.Name = "invis"
PLG.invis.Parent = PLG.Things_17
PLG.invis.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.invis.BorderSizePixel = 0
PLG.invis.Size = UDim2.new(0, 21, 0, 21)
PLG.invis.Font = Enum.Font.SourceSans
PLG.invis.Text = "Bruh"
PLG.invis.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.invis.TextSize = 14.000
PLG.invis.TextTransparency = 1.000
PLG.invis.MouseButton1Click:connect(
    function()
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
    end
)

PLG.TextLabel_69.Parent = PLG.invis
PLG.TextLabel_69.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_69.BackgroundTransparency = 1.000
PLG.TextLabel_69.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_69.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_69.Font = Enum.Font.ArialBold
PLG.TextLabel_69.Text = "Invisible"
PLG.TextLabel_69.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_69.TextSize = 14.000
PLG.TextLabel_69.TextXAlignment = Enum.TextXAlignment.Left

PLG.spawnguns.Name = "spawnguns"
PLG.spawnguns.Parent = PLG.Things_17
PLG.spawnguns.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.spawnguns.BorderSizePixel = 0
PLG.spawnguns.Size = UDim2.new(0, 21, 0, 21)
PLG.spawnguns.Font = Enum.Font.SourceSans
PLG.spawnguns.Text = "Bruh"
PLG.spawnguns.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.spawnguns.TextSize = 14.000
PLG.spawnguns.TextTransparency = 1.000
PLG.spawnguns.MouseButton1Down:connect(
    function()
        n = 0
        for i, v in pairs(game.Players:GetChildren()) do
            if v.Team.Name == "Guards" then
                n = n + 1
            end
        end
        if n < 8 then
            print("Not full")

            local amount = 10

            ---

            local player = game.Players.LocalPlayer

            local path = game.Workspace.Remote

            local oldcf = player.Character.HumanoidRootPart.CFrame

            for i = 1, amount do
                repeat
                    wait()
                until player.Character.Humanoid ~= nil

                repeat
                    wait()
                until player.Character.HumanoidRootPart ~= nil

                path.TeamEvent:FireServer("Bright blue")

                player.Character.HumanoidRootPart.CFrame = oldcf

                wait(.15)

                player.Character.Humanoid.Health = 0

                path.loadchar:InvokeServer("LocalPlayer")
            end

            player.Character.HumanoidRootPart.CFrame = oldcf

            Workspace.Remote.TeamEvent:FireServer("Bright orange")

            local blah = (game.Players.LocalPlayer.Name)
            saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local A_1 = "LocalPlayer"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(A_1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
        else
            game:GetService("StarterGui"):SetCore(
                "ChatMakeSystemMessage",
                {
                    Text = ("{System} Guards are full you cannot run this script!"),
                    Color = Color3.new(255, 255, 0),
                    FontSize = Enum.FontSize.Size24
                }
            )
        end
    end
)

PLG.TextLabel_70.Parent = PLG.spawnguns
PLG.TextLabel_70.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_70.BackgroundTransparency = 1.000
PLG.TextLabel_70.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_70.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_70.Font = Enum.Font.ArialBold
PLG.TextLabel_70.Text = "Spawn Guns"
PLG.TextLabel_70.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_70.TextSize = 14.000
PLG.TextLabel_70.TextXAlignment = Enum.TextXAlignment.Left

PLG.infs.Name = "infs"
PLG.infs.Parent = PLG.Things_17
PLG.infs.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.infs.BorderSizePixel = 0
PLG.infs.Size = UDim2.new(0, 21, 0, 21)
PLG.infs.Font = Enum.Font.SourceSans
PLG.infs.Text = "Bruh"
PLG.infs.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.infs.TextSize = 14.000
PLG.infs.TextTransparency = 1.000

game.Players.LocalPlayer.CharacterAdded:connect(
    function()
        wait(0.5)
        if game.Players.LocalPlayer.Character:FindFirstChild("ClientInputHandler") and stam == true then
            InfPunch(math.huge)
        end
    end
)

function InfPunch(Args)
    for i, v in pairs(debug.getregistry()) do
        if type(v) == "function" then
            for i2, v2 in pairs(debug.getupvalues(v)) do
                if i2 == 5 and typeof(v2) == "number" and tostring(v2) == string.split(v2, ".")[1] then
                    debug.setupvalue(v, i2, Args)
                end
            end
        end
    end
end

stam = false
PLG.infs.MouseButton1Click:Connect(
    function()
        if stam == false then
            stam = true
            PLG.infs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            InfPunch(math.huge)
        else
            stam = false
            PLG.infs.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
            InfPunch(12)
        end
    end
)

PLG.TextLabel_71.Parent = PLG.infs
PLG.TextLabel_71.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_71.BackgroundTransparency = 1.000
PLG.TextLabel_71.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_71.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_71.Font = Enum.Font.ArialBold
PLG.TextLabel_71.Text = "Inf Stamina "
PLG.TextLabel_71.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_71.TextSize = 14.000
PLG.TextLabel_71.TextXAlignment = Enum.TextXAlignment.Left

PLG.fastrespawn.Name = "fastrespawn"
PLG.fastrespawn.Parent = PLG.Things_17
PLG.fastrespawn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.fastrespawn.BorderSizePixel = 0
PLG.fastrespawn.Size = UDim2.new(0, 21, 0, 21)
PLG.fastrespawn.Font = Enum.Font.SourceSans
PLG.fastrespawn.Text = "Bruh"
PLG.fastrespawn.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.fastrespawn.TextSize = 14.000
PLG.fastrespawn.TextTransparency = 1.000

autorr = false
PLG.fastrespawn.MouseButton1Click:Connect(
    function()
        if not autorr then
            autorr = true
            PLG.fastrespawn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

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
            PLG.fastrespawn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

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
    end
)

PLG.TextLabel_72.Parent = PLG.fastrespawn
PLG.TextLabel_72.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_72.BackgroundTransparency = 1.000
PLG.TextLabel_72.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_72.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_72.Font = Enum.Font.ArialBold
PLG.TextLabel_72.Text = "Auto Respawn"
PLG.TextLabel_72.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_72.TextSize = 14.000
PLG.TextLabel_72.TextXAlignment = Enum.TextXAlignment.Left

PLG.OtherMiscFrame.Name = "OtherMiscFrame"
PLG.OtherMiscFrame.Parent = PLG.MiscFrame
PLG.OtherMiscFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.OtherMiscFrame.BackgroundTransparency = 0.350
PLG.OtherMiscFrame.BorderSizePixel = 0
PLG.OtherMiscFrame.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.OtherMiscFrame.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_18.Name = "TitlePart"
PLG.TitlePart_18.Parent = PLG.OtherMiscFrame
PLG.TitlePart_18.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_18.BackgroundTransparency = 0.350
PLG.TitlePart_18.BorderSizePixel = 0
PLG.TitlePart_18.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_18.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_73.Parent = PLG.TitlePart_18
PLG.TextLabel_73.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_73.BackgroundTransparency = 1.000
PLG.TextLabel_73.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_73.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_73.Font = Enum.Font.ArialBold
PLG.TextLabel_73.Text = "Other"
PLG.TextLabel_73.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_73.TextScaled = true
PLG.TextLabel_73.TextSize = 14.000
PLG.TextLabel_73.TextWrapped = true
PLG.TextLabel_73.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_18.Name = "Things"
PLG.Things_18.Parent = PLG.OtherMiscFrame
PLG.Things_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_18.BackgroundTransparency = 1.000
PLG.Things_18.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_18.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_18.Parent = PLG.Things_18
PLG.UIListLayout_18.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_18.Padding = UDim.new(0.0700000003, 0)

PLG.fr.Name = "fr"
PLG.fr.Parent = PLG.Things_18
PLG.fr.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.fr.BorderSizePixel = 0
PLG.fr.Size = UDim2.new(0, 21, 0, 21)
PLG.fr.Font = Enum.Font.SourceSans
PLG.fr.Text = "Bruh"
PLG.fr.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.fr.TextSize = 14.000
PLG.fr.TextTransparency = 1.000
PLG.fr.MouseButton1Down:connect(
    function()
        local blah = (game.Players.LocalPlayer.Name)
        saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local A_1 = "LocalPlayer"
        local Event = game:GetService("Workspace").Remote.loadchar
        Event:InvokeServer(A_1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
    end
)

PLG.TextLabel_74.Parent = PLG.fr
PLG.TextLabel_74.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_74.BackgroundTransparency = 1.000
PLG.TextLabel_74.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_74.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_74.Font = Enum.Font.ArialBold
PLG.TextLabel_74.Text = "Fast Respawn"
PLG.TextLabel_74.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_74.TextSize = 14.000
PLG.TextLabel_74.TextXAlignment = Enum.TextXAlignment.Left

PLG.ta.Name = "ta"
PLG.ta.Parent = PLG.Things_18
PLG.ta.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ta.BorderSizePixel = 0
PLG.ta.Size = UDim2.new(0, 21, 0, 21)
PLG.ta.Font = Enum.Font.SourceSans
PLG.ta.Text = "Bruh"
PLG.ta.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ta.TextSize = 14.000
PLG.ta.TextTransparency = 1.000
PLG.ta.MouseButton1Down:connect(
    function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")

        function kill(a)
            local A_1 = {
                [1] = {
                    ["RayObject"] = Ray.new(
                        Vector3.new(829.838562, 101.489998, 2331.25635),
                        Vector3.new(-30.6540909, -5.42795324, 95.0308533)
                    ),
                    ["Distance"] = 15.355997085571,
                    ["Cframe"] = CFrame.new(
                        826.616699,
                        100.8508,
                        2340.11279,
                        0.964640439,
                        -0.00993416365,
                        -0.263382077,
                        9.31322575e-10,
                        0.999289393,
                        -0.0376908854,
                        0.263569355,
                        0.0363581516,
                        0.963954985
                    ),
                    ["Hit"] = a.Character.Torso
                }
            }
            local A_2 = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
            local Event = game:GetService("ReplicatedStorage").ShootEvent
            Event:FireServer(A_1, A_2)
        end

        for i, v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                kill(v)
            end
        end
    end
)

PLG.TextLabel_75.Parent = PLG.ta
PLG.TextLabel_75.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_75.BackgroundTransparency = 1.000
PLG.TextLabel_75.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_75.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_75.Font = Enum.Font.ArialBold
PLG.TextLabel_75.Text = "Tase All"
PLG.TextLabel_75.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_75.TextSize = 14.000
PLG.TextLabel_75.TextXAlignment = Enum.TextXAlignment.Left

PLG.aall.Name = "aall"
PLG.aall.Parent = PLG.Things_18
PLG.aall.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.aall.BorderSizePixel = 0
PLG.aall.Size = UDim2.new(0, 21, 0, 21)
PLG.aall.Font = Enum.Font.SourceSans
PLG.aall.Text = "Bruh"
PLG.aall.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.aall.TextSize = 14.000
PLG.aall.TextTransparency = 1.000
PLG.aall.MouseButton1Down:connect(
    function()
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
    end
)

PLG.TextLabel_76.Parent = PLG.aall
PLG.TextLabel_76.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_76.BackgroundTransparency = 1.000
PLG.TextLabel_76.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_76.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_76.Font = Enum.Font.ArialBold
PLG.TextLabel_76.Text = "Arrest All"
PLG.TextLabel_76.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_76.TextSize = 14.000
PLG.TextLabel_76.TextXAlignment = Enum.TextXAlignment.Left

PLG.cn.Name = "cn"
PLG.cn.Parent = PLG.Things_18
PLG.cn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.cn.BorderSizePixel = 0
PLG.cn.Size = UDim2.new(0, 21, 0, 21)
PLG.cn.Font = Enum.Font.SourceSans
PLG.cn.Text = "Bruh"
PLG.cn.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.cn.TextSize = 14.000
PLG.cn.TextTransparency = 1.000
PLG.cn.MouseButton1Down:connect(
    function()
        saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local tbl_main = {
            game:GetService("Players").LocalPlayer,
            "Bright yellow"
        }
        game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(tbl_main))
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
    end
)

PLG.TextLabel_77.Parent = PLG.cn
PLG.TextLabel_77.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_77.BackgroundTransparency = 1.000
PLG.TextLabel_77.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_77.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_77.Font = Enum.Font.ArialBold
PLG.TextLabel_77.Text = "Color Name"
PLG.TextLabel_77.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_77.TextSize = 14.000
PLG.TextLabel_77.TextXAlignment = Enum.TextXAlignment.Left

PLG.fk.Name = "fk"
PLG.fk.Parent = PLG.Things_18
PLG.fk.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.fk.BorderSizePixel = 0
PLG.fk.Size = UDim2.new(0, 21, 0, 21)
PLG.fk.Font = Enum.Font.SourceSans
PLG.fk.Text = "Bruh"
PLG.fk.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.fk.TextSize = 14.000
PLG.fk.TextTransparency = 1.000
PLG.fk.MouseButton1Down:connect(
    function()
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "KeyCard Finder",
                Text = "Looking For Dropped KeyCards...",
                Duration = 1
            }
        )

        local Remote = game.Workspace.Remote["ItemHandler"]

        local Arguments = {
            [1] = Workspace.Prison_ITEMS.single:WaitForChild("Key card").ITEMPICKUP
        }
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "KeyCard Finder",
                Text = "KeyCard Found!",
                Duration = 1
            }
        )
        Remote:InvokeServer(unpack(Arguments))
    end
)

PLG.TextLabel_78.Parent = PLG.fk
PLG.TextLabel_78.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_78.BackgroundTransparency = 1.000
PLG.TextLabel_78.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_78.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_78.Font = Enum.Font.ArialBold
PLG.TextLabel_78.Text = "Find Keycard"
PLG.TextLabel_78.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_78.TextSize = 14.000
PLG.TextLabel_78.TextXAlignment = Enum.TextXAlignment.Left

PLG.MiscFrameThingIdk.Name = "MiscFrameThingIdk"
PLG.MiscFrameThingIdk.Parent = PLG.MiscFrame
PLG.MiscFrameThingIdk.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.MiscFrameThingIdk.BackgroundTransparency = 0.350
PLG.MiscFrameThingIdk.BorderSizePixel = 0
PLG.MiscFrameThingIdk.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.MiscFrameThingIdk.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_19.Name = "TitlePart"
PLG.TitlePart_19.Parent = PLG.MiscFrameThingIdk
PLG.TitlePart_19.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_19.BackgroundTransparency = 0.350
PLG.TitlePart_19.BorderSizePixel = 0
PLG.TitlePart_19.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_19.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_79.Parent = PLG.TitlePart_19
PLG.TextLabel_79.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_79.BackgroundTransparency = 1.000
PLG.TextLabel_79.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_79.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_79.Font = Enum.Font.ArialBold
PLG.TextLabel_79.Text = "Misc"
PLG.TextLabel_79.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_79.TextScaled = true
PLG.TextLabel_79.TextSize = 14.000
PLG.TextLabel_79.TextWrapped = true
PLG.TextLabel_79.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_19.Name = "Things"
PLG.Things_19.Parent = PLG.MiscFrameThingIdk
PLG.Things_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_19.BackgroundTransparency = 1.000
PLG.Things_19.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_19.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_19.Parent = PLG.Things_19
PLG.UIListLayout_19.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_19.Padding = UDim.new(0.0700000003, 0)

PLG.rd.Name = "rd"
PLG.rd.Parent = PLG.Things_19
PLG.rd.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.rd.BorderSizePixel = 0
PLG.rd.Size = UDim2.new(0, 21, 0, 21)
PLG.rd.Font = Enum.Font.SourceSans
PLG.rd.Text = "Bruh"
PLG.rd.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.rd.TextSize = 14.000
PLG.rd.TextTransparency = 1.000
PLG.rd.MouseButton1Down:connect(
    function()
        game.Workspace.Doors:Destroy()
    end
)

PLG.TextLabel_80.Parent = PLG.rd
PLG.TextLabel_80.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_80.BackgroundTransparency = 1.000
PLG.TextLabel_80.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_80.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_80.Font = Enum.Font.ArialBold
PLG.TextLabel_80.Text = "Remove Doors"
PLG.TextLabel_80.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_80.TextSize = 14.000
PLG.TextLabel_80.TextXAlignment = Enum.TextXAlignment.Left

PLG.rf.Name = "rf"
PLG.rf.Parent = PLG.Things_19
PLG.rf.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.rf.BorderSizePixel = 0
PLG.rf.Size = UDim2.new(0, 21, 0, 21)
PLG.rf.Font = Enum.Font.SourceSans
PLG.rf.Text = "Bruh"
PLG.rf.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.rf.TextSize = 14.000
PLG.rf.TextTransparency = 1.000
PLG.rf.MouseButton1Down:connect(
    function()
        game.Workspace.Prison_Fences:Destroy()
    end
)

PLG.TextLabel_81.Parent = PLG.rf
PLG.TextLabel_81.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_81.BackgroundTransparency = 1.000
PLG.TextLabel_81.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_81.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_81.Font = Enum.Font.ArialBold
PLG.TextLabel_81.Text = "Remove Fences"
PLG.TextLabel_81.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_81.TextSize = 14.000
PLG.TextLabel_81.TextXAlignment = Enum.TextXAlignment.Left

PLG.ca.Name = "ca"
PLG.ca.Parent = PLG.Things_19
PLG.ca.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ca.BorderSizePixel = 0
PLG.ca.Size = UDim2.new(0, 21, 0, 21)
PLG.ca.Font = Enum.Font.SourceSans
PLG.ca.Text = "Bruh"
PLG.ca.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.ca.TextSize = 14.000
PLG.ca.TextTransparency = 1.000
PLG.ca.MouseButton1Down:connect(
    function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local arrestEvent = game.Workspace.Remote.arrest
        mouse.Button1Down:connect(
            function()
                local obj = mouse.Target
                local response = arrestEvent:InvokeServer(obj)
            end
        )
    end
)

PLG.TextLabel_82.Parent = PLG.ca
PLG.TextLabel_82.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_82.BackgroundTransparency = 1.000
PLG.TextLabel_82.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_82.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_82.Font = Enum.Font.ArialBold
PLG.TextLabel_82.Text = "Click Arrest"
PLG.TextLabel_82.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_82.TextSize = 14.000
PLG.TextLabel_82.TextXAlignment = Enum.TextXAlignment.Left

PLG.fc.Name = "fc"
PLG.fc.Parent = PLG.Things_19
PLG.fc.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.fc.BorderSizePixel = 0
PLG.fc.Size = UDim2.new(0, 21, 0, 21)
PLG.fc.Font = Enum.Font.SourceSans
PLG.fc.Text = "Bruh"
PLG.fc.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.fc.TextSize = 14.000
PLG.fc.TextTransparency = 1.000
PLG.fc.MouseButton1Down:connect(
    function()
        local hint = Instance.new("Hint", game.Players.LocalPlayer.PlayerGui)
        hint.Text = "Press Z To Toggle"
        hint.Name = game.JobId
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
    end
)

PLG.TextLabel_83.Parent = PLG.fc
PLG.TextLabel_83.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_83.BackgroundTransparency = 1.000
PLG.TextLabel_83.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_83.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_83.Font = Enum.Font.ArialBold
PLG.TextLabel_83.Text = "Fly Car"
PLG.TextLabel_83.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_83.TextSize = 14.000
PLG.TextLabel_83.TextXAlignment = Enum.TextXAlignment.Left

PLG.bb.Name = "bb"
PLG.bb.Parent = PLG.Things_19
PLG.bb.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.bb.BorderSizePixel = 0
PLG.bb.Size = UDim2.new(0, 21, 0, 21)
PLG.bb.Font = Enum.Font.SourceSans
PLG.bb.Text = "Bruh"
PLG.bb.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.bb.TextSize = 14.000
PLG.bb.TextTransparency = 1.000
PLG.bb.MouseButton1Click:connect(
    function()
        local plr = game.Players.LocalPlayer
        local tool = Instance.new("Tool", plr.Backpack)
        tool.GripPos = Vector3.new(0.1, -1, 0)
        tool.Name = "Baseball Bat"
        local k = Instance.new("Part", tool)
        k.Name = "Handle"
        k.Size = Vector3.new(0.4, 4, 0.4)
        local l = Instance.new("Animation", tool)
        l.AnimationId = "rbxassetid://218504594"
        local m = plr.Character.Humanoid:LoadAnimation(l)
        db = true
        da = false
        tool.Equipped:connect(
            function()
                tool.Activated:connect(
                    function()
                        if db == true then
                            db = false
                            m:Play()
                            wait()
                            da = true
                            db = true
                            wait(0.1)
                            da = false
                        end
                    end
                )
            end
        )
        k.Touched:connect(
            function(n)
                if da == true then
                    local o = n.Parent.Humanoid
                    if o ~= nil then
                        local p = game.Players:FindFirstChild(n.Parent.Name)
                        for j = 1, 10 do
                            if p.Name ~= "gwapobeboy3_YT" then
                                game.ReplicatedStorage.meleeEvent:FireServer(p)
                            end
                        end
                    end
                end
            end
        )
    end
)

PLG.TextLabel_84.Parent = PLG.bb
PLG.TextLabel_84.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_84.BackgroundTransparency = 1.000
PLG.TextLabel_84.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_84.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_84.Font = Enum.Font.ArialBold
PLG.TextLabel_84.Text = "Baseball Bat"
PLG.TextLabel_84.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_84.TextSize = 14.000
PLG.TextLabel_84.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_85.Parent = PLG.Main
PLG.TextLabel_85.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_85.BackgroundTransparency = 1.000
PLG.TextLabel_85.Position = UDim2.new(0.872582436, 0, -0.0447154678, 0)
PLG.TextLabel_85.Size = UDim2.new(0, 112, 0, 22)
PLG.TextLabel_85.Font = Enum.Font.ArialBold
PLG.TextLabel_85.Text = "Joe Mama"
PLG.TextLabel_85.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_85.TextSize = 14.000
PLG.TextLabel_85.TextStrokeTransparency = 0.000

PLG.TpList.Name = "TpList"
PLG.TpList.Parent = PLG.Main
PLG.TpList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TpList.BackgroundTransparency = 1.000
PLG.TpList.BorderSizePixel = 0
PLG.TpList.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.TpList.Size = UDim2.new(0, 648, 0, 330)
PLG.TpList.Visible = false

PLG.MainTeleports.Name = "MainTeleports"
PLG.MainTeleports.Parent = PLG.TpList
PLG.MainTeleports.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.MainTeleports.BackgroundTransparency = 0.350
PLG.MainTeleports.BorderSizePixel = 0
PLG.MainTeleports.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.MainTeleports.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_20.Name = "TitlePart"
PLG.TitlePart_20.Parent = PLG.MainTeleports
PLG.TitlePart_20.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_20.BackgroundTransparency = 0.350
PLG.TitlePart_20.BorderSizePixel = 0
PLG.TitlePart_20.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_20.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_86.Parent = PLG.TitlePart_20
PLG.TextLabel_86.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_86.BackgroundTransparency = 1.000
PLG.TextLabel_86.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_86.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_86.Font = Enum.Font.ArialBold
PLG.TextLabel_86.Text = "Main Teleports"
PLG.TextLabel_86.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_86.TextScaled = true
PLG.TextLabel_86.TextSize = 14.000
PLG.TextLabel_86.TextWrapped = true
PLG.TextLabel_86.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_20.Name = "Things"
PLG.Things_20.Parent = PLG.MainTeleports
PLG.Things_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_20.BackgroundTransparency = 1.000
PLG.Things_20.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_20.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_20.Parent = PLG.Things_20
PLG.UIListLayout_20.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_20.Padding = UDim.new(0.0700000003, 0)

PLG.policeroom.Name = "policeroom"
PLG.policeroom.Parent = PLG.Things_20
PLG.policeroom.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.policeroom.BorderSizePixel = 0
PLG.policeroom.Size = UDim2.new(0, 21, 0, 21)
PLG.policeroom.Font = Enum.Font.SourceSans
PLG.policeroom.Text = "Bruh"
PLG.policeroom.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.policeroom.TextSize = 14.000
PLG.policeroom.TextTransparency = 1.000
PLG.policeroom.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.155945, 99.9900055, 2269.48462)
    end
)

PLG.TextLabel_87.Parent = PLG.policeroom
PLG.TextLabel_87.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_87.BackgroundTransparency = 1.000
PLG.TextLabel_87.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_87.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_87.Font = Enum.Font.ArialBold
PLG.TextLabel_87.Text = "Police Room"
PLG.TextLabel_87.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_87.TextSize = 14.000
PLG.TextLabel_87.TextXAlignment = Enum.TextXAlignment.Left

PLG.prisoncell.Name = "prisoncell"
PLG.prisoncell.Parent = PLG.Things_20
PLG.prisoncell.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.prisoncell.BorderSizePixel = 0
PLG.prisoncell.Size = UDim2.new(0, 21, 0, 21)
PLG.prisoncell.Font = Enum.Font.SourceSans
PLG.prisoncell.Text = "Bruh"
PLG.prisoncell.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.prisoncell.TextSize = 14.000
PLG.prisoncell.TextTransparency = 1.000
PLG.prisoncell.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
    end
)

PLG.TextLabel_88.Parent = PLG.prisoncell
PLG.TextLabel_88.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_88.BackgroundTransparency = 1.000
PLG.TextLabel_88.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_88.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_88.Font = Enum.Font.ArialBold
PLG.TextLabel_88.Text = "Prison Cells"
PLG.TextLabel_88.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_88.TextSize = 14.000
PLG.TextLabel_88.TextXAlignment = Enum.TextXAlignment.Left

PLG.crimebase.Name = "crimebase"
PLG.crimebase.Parent = PLG.Things_20
PLG.crimebase.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.crimebase.BorderSizePixel = 0
PLG.crimebase.Size = UDim2.new(0, 21, 0, 21)
PLG.crimebase.Font = Enum.Font.SourceSans
PLG.crimebase.Text = "Bruh"
PLG.crimebase.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.crimebase.TextSize = 14.000
PLG.crimebase.TextTransparency = 1.000
PLG.crimebase.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.704, 91.632, 2056.925)
    end
)

PLG.TextLabel_89.Parent = PLG.crimebase
PLG.TextLabel_89.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_89.BackgroundTransparency = 1.000
PLG.TextLabel_89.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_89.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_89.Font = Enum.Font.ArialBold
PLG.TextLabel_89.Text = "Criminal Base"
PLG.TextLabel_89.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_89.TextSize = 14.000
PLG.TextLabel_89.TextXAlignment = Enum.TextXAlignment.Left

PLG.yard.Name = "yard"
PLG.yard.Parent = PLG.Things_20
PLG.yard.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.yard.BorderSizePixel = 0
PLG.yard.Size = UDim2.new(0, 21, 0, 21)
PLG.yard.Font = Enum.Font.SourceSans
PLG.yard.Text = "Bruh"
PLG.yard.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.yard.TextSize = 14.000
PLG.yard.TextTransparency = 1.000
PLG.yard.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
    end
)

PLG.TextLabel_90.Parent = PLG.yard
PLG.TextLabel_90.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_90.BackgroundTransparency = 1.000
PLG.TextLabel_90.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_90.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_90.Font = Enum.Font.ArialBold
PLG.TextLabel_90.Text = "Yard"
PLG.TextLabel_90.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_90.TextSize = 14.000
PLG.TextLabel_90.TextXAlignment = Enum.TextXAlignment.Left

PLG.EvenMoreTeleports.Name = "EvenMoreTeleports"
PLG.EvenMoreTeleports.Parent = PLG.TpList
PLG.EvenMoreTeleports.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.EvenMoreTeleports.BackgroundTransparency = 0.350
PLG.EvenMoreTeleports.BorderSizePixel = 0
PLG.EvenMoreTeleports.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.EvenMoreTeleports.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_21.Name = "TitlePart"
PLG.TitlePart_21.Parent = PLG.EvenMoreTeleports
PLG.TitlePart_21.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_21.BackgroundTransparency = 0.350
PLG.TitlePart_21.BorderSizePixel = 0
PLG.TitlePart_21.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_21.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_91.Parent = PLG.TitlePart_21
PLG.TextLabel_91.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_91.BackgroundTransparency = 1.000
PLG.TextLabel_91.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_91.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_91.Font = Enum.Font.ArialBold
PLG.TextLabel_91.Text = "Even More Teleports"
PLG.TextLabel_91.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_91.TextScaled = true
PLG.TextLabel_91.TextSize = 14.000
PLG.TextLabel_91.TextWrapped = true
PLG.TextLabel_91.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_21.Name = "Things"
PLG.Things_21.Parent = PLG.EvenMoreTeleports
PLG.Things_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_21.BackgroundTransparency = 1.000
PLG.Things_21.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_21.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_21.Parent = PLG.Things_21
PLG.UIListLayout_21.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_21.Padding = UDim.new(0.0700000003, 0)

PLG.sr.Name = "sr"
PLG.sr.Parent = PLG.Things_21
PLG.sr.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.sr.BorderSizePixel = 0
PLG.sr.Size = UDim2.new(0, 21, 0, 21)
PLG.sr.Font = Enum.Font.SourceSans
PLG.sr.Text = "Bruh"
PLG.sr.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.sr.TextSize = 14.000
PLG.sr.TextTransparency = 1.000
PLG.sr.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(431.123413, 11.8254128, 1093.17139)
    end
)

PLG.TextLabel_92.Parent = PLG.sr
PLG.TextLabel_92.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_92.BackgroundTransparency = 1.000
PLG.TextLabel_92.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_92.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_92.Font = Enum.Font.ArialBold
PLG.TextLabel_92.Text = "Shooting Range"
PLG.TextLabel_92.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_92.TextSize = 14.000
PLG.TextLabel_92.TextXAlignment = Enum.TextXAlignment.Left

PLG.sroom.Name = "sroom"
PLG.sroom.Parent = PLG.Things_21
PLG.sroom.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.sroom.BorderSizePixel = 0
PLG.sroom.Size = UDim2.new(0, 21, 0, 21)
PLG.sroom.Font = Enum.Font.SourceSans
PLG.sroom.Text = "Bruh"
PLG.sroom.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.sroom.TextSize = 14.000
PLG.sroom.TextTransparency = 1.000
PLG.sroom.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-46.7975845, 11.0993299, 1296.38086)
    end
)

PLG.TextLabel_93.Parent = PLG.sroom
PLG.TextLabel_93.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_93.BackgroundTransparency = 1.000
PLG.TextLabel_93.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_93.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_93.Font = Enum.Font.ArialBold
PLG.TextLabel_93.Text = "Secret Room"
PLG.TextLabel_93.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_93.TextSize = 14.000
PLG.TextLabel_93.TextXAlignment = Enum.TextXAlignment.Left

PLG.um.Name = "um"
PLG.um.Parent = PLG.Things_21
PLG.um.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.um.BorderSizePixel = 0
PLG.um.Size = UDim2.new(0, 21, 0, 21)
PLG.um.Font = Enum.Font.SourceSans
PLG.um.Text = "Bruh"
PLG.um.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.um.TextSize = 14.000
PLG.um.TextTransparency = 1.000
PLG.um.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(285.661804, -18.1463909, 1327.47058)
    end
)

PLG.TextLabel_94.Parent = PLG.um
PLG.TextLabel_94.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_94.BackgroundTransparency = 1.000
PLG.TextLabel_94.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_94.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_94.Font = Enum.Font.ArialBold
PLG.TextLabel_94.Text = "Under Map"
PLG.TextLabel_94.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_94.TextSize = 14.000
PLG.TextLabel_94.TextXAlignment = Enum.TextXAlignment.Left

PLG.sewer.Name = "sewer"
PLG.sewer.Parent = PLG.Things_21
PLG.sewer.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.sewer.BorderSizePixel = 0
PLG.sewer.Size = UDim2.new(0, 21, 0, 21)
PLG.sewer.Font = Enum.Font.SourceSans
PLG.sewer.Text = "Bruh"
PLG.sewer.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.sewer.TextSize = 14.000
PLG.sewer.TextTransparency = 1.000
PLG.sewer.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.811829, 78.6997986, 2427.82056)
    end
)

PLG.TextLabel_95.Parent = PLG.sewer
PLG.TextLabel_95.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_95.BackgroundTransparency = 1.000
PLG.TextLabel_95.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_95.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_95.Font = Enum.Font.ArialBold
PLG.TextLabel_95.Text = "Sewer"
PLG.TextLabel_95.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_95.TextSize = 14.000
PLG.TextLabel_95.TextXAlignment = Enum.TextXAlignment.Left

PLG.pv.Name = "pv"
PLG.pv.Parent = PLG.Things_21
PLG.pv.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.pv.BorderSizePixel = 0
PLG.pv.Size = UDim2.new(0, 21, 0, 21)
PLG.pv.Font = Enum.Font.SourceSans
PLG.pv.Text = "Bruh"
PLG.pv.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.pv.TextSize = 14.000
PLG.pv.TextTransparency = 1.000
PLG.pv.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(896.912109, 124.389969, 2215.18945)
    end
)

PLG.TextLabel_96.Parent = PLG.pv
PLG.TextLabel_96.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_96.BackgroundTransparency = 1.000
PLG.TextLabel_96.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_96.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_96.Font = Enum.Font.ArialBold
PLG.TextLabel_96.Text = "Prison Vents"
PLG.TextLabel_96.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_96.TextSize = 14.000
PLG.TextLabel_96.TextXAlignment = Enum.TextXAlignment.Left

PLG.MoreTeleports.Name = "MoreTeleports"
PLG.MoreTeleports.Parent = PLG.TpList
PLG.MoreTeleports.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.MoreTeleports.BackgroundTransparency = 0.350
PLG.MoreTeleports.BorderSizePixel = 0
PLG.MoreTeleports.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.MoreTeleports.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_22.Name = "TitlePart"
PLG.TitlePart_22.Parent = PLG.MoreTeleports
PLG.TitlePart_22.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_22.BackgroundTransparency = 0.350
PLG.TitlePart_22.BorderSizePixel = 0
PLG.TitlePart_22.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_22.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_97.Parent = PLG.TitlePart_22
PLG.TextLabel_97.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_97.BackgroundTransparency = 1.000
PLG.TextLabel_97.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_97.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_97.Font = Enum.Font.ArialBold
PLG.TextLabel_97.Text = "More Teleports"
PLG.TextLabel_97.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_97.TextScaled = true
PLG.TextLabel_97.TextSize = 14.000
PLG.TextLabel_97.TextWrapped = true
PLG.TextLabel_97.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_22.Name = "Things"
PLG.Things_22.Parent = PLG.MoreTeleports
PLG.Things_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_22.BackgroundTransparency = 1.000
PLG.Things_22.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_22.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_22.Parent = PLG.Things_22
PLG.UIListLayout_22.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_22.Padding = UDim.new(0.0700000003, 0)

PLG.top.Name = "top"
PLG.top.Parent = PLG.Things_22
PLG.top.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.top.BorderSizePixel = 0
PLG.top.Size = UDim2.new(0, 21, 0, 21)
PLG.top.Font = Enum.Font.SourceSans
PLG.top.Text = "Bruh"
PLG.top.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.top.TextSize = 14.000
PLG.top.TextTransparency = 1.000
PLG.top.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(895.371582, 118.98999, 2368.4812)
    end
)

PLG.TextLabel_98.Parent = PLG.top
PLG.TextLabel_98.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_98.BackgroundTransparency = 1.000
PLG.TextLabel_98.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_98.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_98.Font = Enum.Font.ArialBold
PLG.TextLabel_98.Text = "Top Of Prison"
PLG.TextLabel_98.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_98.TextSize = 14.000
PLG.TextLabel_98.TextXAlignment = Enum.TextXAlignment.Left

PLG.tower.Name = "tower"
PLG.tower.Parent = PLG.Things_22
PLG.tower.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.tower.BorderSizePixel = 0
PLG.tower.Size = UDim2.new(0, 21, 0, 21)
PLG.tower.Font = Enum.Font.SourceSans
PLG.tower.Text = "Bruh"
PLG.tower.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.tower.TextSize = 14.000
PLG.tower.TextTransparency = 1.000
PLG.tower.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(823.218689, 130.039948, 2586.46851)
    end
)

PLG.TextLabel_99.Parent = PLG.tower
PLG.TextLabel_99.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_99.BackgroundTransparency = 1.000
PLG.TextLabel_99.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_99.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_99.Font = Enum.Font.ArialBold
PLG.TextLabel_99.Text = "Tower"
PLG.TextLabel_99.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_99.TextSize = 14.000
PLG.TextLabel_99.TextXAlignment = Enum.TextXAlignment.Left

PLG.gas.Name = "gas"
PLG.gas.Parent = PLG.Things_22
PLG.gas.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.gas.BorderSizePixel = 0
PLG.gas.Size = UDim2.new(0, 21, 0, 21)
PLG.gas.Font = Enum.Font.SourceSans
PLG.gas.Text = "Bruh"
PLG.gas.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.gas.TextSize = 14.000
PLG.gas.TextTransparency = 1.000
PLG.gas.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-518.803589, 54.3937874, 1659.07263)
    end
)

PLG.TextLabel_100.Parent = PLG.gas
PLG.TextLabel_100.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_100.BackgroundTransparency = 1.000
PLG.TextLabel_100.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_100.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_100.Font = Enum.Font.ArialBold
PLG.TextLabel_100.Text = "Gas Station"
PLG.TextLabel_100.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_100.TextSize = 14.000
PLG.TextLabel_100.TextXAlignment = Enum.TextXAlignment.Left

PLG.lunch.Name = "lunch"
PLG.lunch.Parent = PLG.Things_22
PLG.lunch.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.lunch.BorderSizePixel = 0
PLG.lunch.Size = UDim2.new(0, 21, 0, 21)
PLG.lunch.Font = Enum.Font.SourceSans
PLG.lunch.Text = "Bruh"
PLG.lunch.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.lunch.TextSize = 14.000
PLG.lunch.TextTransparency = 1.000
PLG.lunch.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(931.714111, 99.9899597, 2289.88135)
    end
)

PLG.TextLabel_101.Parent = PLG.lunch
PLG.TextLabel_101.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_101.BackgroundTransparency = 1.000
PLG.TextLabel_101.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_101.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_101.Font = Enum.Font.ArialBold
PLG.TextLabel_101.Text = "Lunch Room"
PLG.TextLabel_101.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_101.TextSize = 14.000
PLG.TextLabel_101.TextXAlignment = Enum.TextXAlignment.Left

PLG.SkyFrame_2.Name = "SkyFrame"
PLG.SkyFrame_2.Parent = PLG.TpList
PLG.SkyFrame_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.SkyFrame_2.BackgroundTransparency = 0.350
PLG.SkyFrame_2.BorderSizePixel = 0
PLG.SkyFrame_2.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.SkyFrame_2.Size = UDim2.new(0, 412, 0, 155)
PLG.SkyFrame_2.Visible = false

PLG.TitlePart_23.Name = "TitlePart"
PLG.TitlePart_23.Parent = PLG.SkyFrame_2
PLG.TitlePart_23.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_23.BackgroundTransparency = 0.350
PLG.TitlePart_23.BorderSizePixel = 0
PLG.TitlePart_23.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_23.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_102.Parent = PLG.TitlePart_23
PLG.TextLabel_102.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_102.BackgroundTransparency = 1.000
PLG.TextLabel_102.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_102.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_102.Font = Enum.Font.ArialBold
PLG.TextLabel_102.Text = "Set Skybox"
PLG.TextLabel_102.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_102.TextScaled = true
PLG.TextLabel_102.TextSize = 14.000
PLG.TextLabel_102.TextWrapped = true
PLG.TextLabel_102.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_23.Name = "Things"
PLG.Things_23.Parent = PLG.SkyFrame_2
PLG.Things_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_23.BackgroundTransparency = 1.000
PLG.Things_23.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_23.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_23.Parent = PLG.Things_23
PLG.UIListLayout_23.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_23.Padding = UDim.new(0.0700000003, 0)

PLG.doge_2.Name = "doge"
PLG.doge_2.Parent = PLG.Things_23
PLG.doge_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.doge_2.BorderSizePixel = 0
PLG.doge_2.Size = UDim2.new(0, 21, 0, 21)
PLG.doge_2.Font = Enum.Font.SourceSans
PLG.doge_2.Text = "Bruh"
PLG.doge_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.doge_2.TextSize = 14.000
PLG.doge_2.TextTransparency = 1.000

PLG.TextLabel_103.Parent = PLG.doge_2
PLG.TextLabel_103.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_103.BackgroundTransparency = 1.000
PLG.TextLabel_103.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_103.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_103.Font = Enum.Font.ArialBold
PLG.TextLabel_103.Text = "Doge"
PLG.TextLabel_103.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_103.TextSize = 14.000
PLG.TextLabel_103.TextXAlignment = Enum.TextXAlignment.Left

PLG.office_2.Name = "office"
PLG.office_2.Parent = PLG.Things_23
PLG.office_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.office_2.BorderSizePixel = 0
PLG.office_2.Size = UDim2.new(0, 21, 0, 21)
PLG.office_2.Font = Enum.Font.SourceSans
PLG.office_2.Text = "Bruh"
PLG.office_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.office_2.TextSize = 14.000
PLG.office_2.TextTransparency = 1.000

PLG.TextLabel_104.Parent = PLG.office_2
PLG.TextLabel_104.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_104.BackgroundTransparency = 1.000
PLG.TextLabel_104.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_104.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_104.Font = Enum.Font.ArialBold
PLG.TextLabel_104.Text = "Office"
PLG.TextLabel_104.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_104.TextSize = 14.000
PLG.TextLabel_104.TextXAlignment = Enum.TextXAlignment.Left

PLG.jungle_2.Name = "jungle"
PLG.jungle_2.Parent = PLG.Things_23
PLG.jungle_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.jungle_2.BorderSizePixel = 0
PLG.jungle_2.Size = UDim2.new(0, 21, 0, 21)
PLG.jungle_2.Font = Enum.Font.SourceSans
PLG.jungle_2.Text = "Bruh"
PLG.jungle_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.jungle_2.TextSize = 14.000
PLG.jungle_2.TextTransparency = 1.000

PLG.TextLabel_105.Parent = PLG.jungle_2
PLG.TextLabel_105.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_105.BackgroundTransparency = 1.000
PLG.TextLabel_105.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_105.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_105.Font = Enum.Font.ArialBold
PLG.TextLabel_105.Text = "Jungle"
PLG.TextLabel_105.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_105.TextSize = 14.000
PLG.TextLabel_105.TextXAlignment = Enum.TextXAlignment.Left

PLG.default_3.Name = "default"
PLG.default_3.Parent = PLG.Things_23
PLG.default_3.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.default_3.BorderSizePixel = 0
PLG.default_3.Size = UDim2.new(0, 21, 0, 21)
PLG.default_3.Font = Enum.Font.SourceSans
PLG.default_3.Text = "Bruh"
PLG.default_3.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.default_3.TextSize = 14.000
PLG.default_3.TextTransparency = 1.000

PLG.TextLabel_106.Parent = PLG.default_3
PLG.TextLabel_106.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_106.BackgroundTransparency = 1.000
PLG.TextLabel_106.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_106.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_106.Font = Enum.Font.ArialBold
PLG.TextLabel_106.Text = "Default"
PLG.TextLabel_106.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_106.TextSize = 14.000
PLG.TextLabel_106.TextXAlignment = Enum.TextXAlignment.Left

PLG.ExtraFrame.Name = "ExtraFrame"
PLG.ExtraFrame.Parent = PLG.Main
PLG.ExtraFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.ExtraFrame.BackgroundTransparency = 1.000
PLG.ExtraFrame.BorderSizePixel = 0
PLG.ExtraFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.ExtraFrame.Size = UDim2.new(0, 648, 0, 330)
PLG.ExtraFrame.Visible = false

PLG.LocalExtra.Name = "LocalExtra"
PLG.LocalExtra.Parent = PLG.ExtraFrame
PLG.LocalExtra.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.LocalExtra.BackgroundTransparency = 0.350
PLG.LocalExtra.BorderSizePixel = 0
PLG.LocalExtra.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.LocalExtra.Size = UDim2.new(0, 412, 0, 348)

PLG.TitlePart_24.Name = "TitlePart"
PLG.TitlePart_24.Parent = PLG.LocalExtra
PLG.TitlePart_24.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_24.BackgroundTransparency = 0.350
PLG.TitlePart_24.BorderSizePixel = 0
PLG.TitlePart_24.Position = UDim2.new(0, 0, -0.0939999968, 0)
PLG.TitlePart_24.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_107.Parent = PLG.TitlePart_24
PLG.TextLabel_107.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_107.BackgroundTransparency = 1.000
PLG.TextLabel_107.Position = UDim2.new(0.0397350714, 0, 0.21875, 0)
PLG.TextLabel_107.Size = UDim2.new(0, 362, 0, 18)
PLG.TextLabel_107.Font = Enum.Font.ArialBold
PLG.TextLabel_107.Text = "Local Extra (Gun Colors)"
PLG.TextLabel_107.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_107.TextScaled = true
PLG.TextLabel_107.TextSize = 14.000
PLG.TextLabel_107.TextWrapped = true
PLG.TextLabel_107.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_24.Name = "Things"
PLG.Things_24.Parent = PLG.LocalExtra
PLG.Things_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_24.BackgroundTransparency = 1.000
PLG.Things_24.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_24.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_24.Parent = PLG.Things_24
PLG.UIListLayout_24.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_24.Padding = UDim.new(0.0700000003, 0)

PLG.red_2.Name = "red"
PLG.red_2.Parent = PLG.Things_24
PLG.red_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.red_2.BorderSizePixel = 0
PLG.red_2.Size = UDim2.new(0, 21, 0, 21)
PLG.red_2.Font = Enum.Font.SourceSans
PLG.red_2.Text = "Bruh"
PLG.red_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.red_2.TextSize = 14.000
PLG.red_2.TextTransparency = 1.000
PLG.red_2.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(255 / 255, 0 / 255, 0 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 0 / 255, 0 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 0 / 255, 0 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 0 / 255, 0 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_108.Parent = PLG.red_2
PLG.TextLabel_108.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_108.BackgroundTransparency = 1.000
PLG.TextLabel_108.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_108.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_108.Font = Enum.Font.ArialBold
PLG.TextLabel_108.Text = "Red"
PLG.TextLabel_108.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_108.TextSize = 14.000
PLG.TextLabel_108.TextXAlignment = Enum.TextXAlignment.Left

PLG.green_2.Name = "green"
PLG.green_2.Parent = PLG.Things_24
PLG.green_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.green_2.BorderSizePixel = 0
PLG.green_2.Size = UDim2.new(0, 21, 0, 21)
PLG.green_2.Font = Enum.Font.SourceSans
PLG.green_2.Text = "Bruh"
PLG.green_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.green_2.TextSize = 14.000
PLG.green_2.TextTransparency = 1.000
PLG.green_2.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(0 / 255, 255 / 255, 0 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 255 / 255, 0 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 255 / 255, 0 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 255 / 255, 0 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_109.Parent = PLG.green_2
PLG.TextLabel_109.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_109.BackgroundTransparency = 1.000
PLG.TextLabel_109.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_109.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_109.Font = Enum.Font.ArialBold
PLG.TextLabel_109.Text = "Green"
PLG.TextLabel_109.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_109.TextSize = 14.000
PLG.TextLabel_109.TextXAlignment = Enum.TextXAlignment.Left

PLG.blue_2.Name = "blue"
PLG.blue_2.Parent = PLG.Things_24
PLG.blue_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blue_2.BorderSizePixel = 0
PLG.blue_2.Size = UDim2.new(0, 21, 0, 21)
PLG.blue_2.Font = Enum.Font.SourceSans
PLG.blue_2.Text = "Bruh"
PLG.blue_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blue_2.TextSize = 14.000
PLG.blue_2.TextTransparency = 1.000
PLG.blue_2.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(0 / 255, 0 / 255, 255 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 0 / 255, 255 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 0 / 255, 255 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(0 / 255, 0 / 255, 255 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_110.Parent = PLG.blue_2
PLG.TextLabel_110.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_110.BackgroundTransparency = 1.000
PLG.TextLabel_110.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_110.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_110.Font = Enum.Font.ArialBold
PLG.TextLabel_110.Text = "Blue"
PLG.TextLabel_110.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_110.TextSize = 14.000
PLG.TextLabel_110.TextXAlignment = Enum.TextXAlignment.Left

PLG.pink.Name = "pink"
PLG.pink.Parent = PLG.Things_24
PLG.pink.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.pink.BorderSizePixel = 0
PLG.pink.Size = UDim2.new(0, 21, 0, 21)
PLG.pink.Font = Enum.Font.SourceSans
PLG.pink.Text = "Bruh"
PLG.pink.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.pink.TextSize = 14.000
PLG.pink.TextTransparency = 1.000
PLG.pink.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(255 / 255, 102 / 255, 204 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 102 / 255, 204 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 102 / 255, 204 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 102 / 255, 204 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_111.Parent = PLG.pink
PLG.TextLabel_111.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_111.BackgroundTransparency = 1.000
PLG.TextLabel_111.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_111.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_111.Font = Enum.Font.ArialBold
PLG.TextLabel_111.Text = "Pink"
PLG.TextLabel_111.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_111.TextSize = 14.000
PLG.TextLabel_111.TextXAlignment = Enum.TextXAlignment.Left

PLG.purple.Name = "purple"
PLG.purple.Parent = PLG.Things_24
PLG.purple.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.purple.BorderSizePixel = 0
PLG.purple.Size = UDim2.new(0, 21, 0, 21)
PLG.purple.Font = Enum.Font.SourceSans
PLG.purple.Text = "Bruh"
PLG.purple.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.purple.TextSize = 14.000
PLG.purple.TextTransparency = 1.000
PLG.purple.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(98 / 255, 37 / 255, 209 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(98 / 255, 37 / 255, 209 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(98 / 255, 37 / 255, 209 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(98 / 255, 37 / 255, 209 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_112.Parent = PLG.purple
PLG.TextLabel_112.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_112.BackgroundTransparency = 1.000
PLG.TextLabel_112.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_112.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_112.Font = Enum.Font.ArialBold
PLG.TextLabel_112.Text = "Purple"
PLG.TextLabel_112.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_112.TextSize = 14.000
PLG.TextLabel_112.TextXAlignment = Enum.TextXAlignment.Left

PLG.yellow.Name = "yellow"
PLG.yellow.Parent = PLG.Things_24
PLG.yellow.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.yellow.BorderSizePixel = 0
PLG.yellow.Size = UDim2.new(0, 21, 0, 21)
PLG.yellow.Font = Enum.Font.SourceSans
PLG.yellow.Text = "Bruh"
PLG.yellow.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.yellow.TextSize = 14.000
PLG.yellow.TextTransparency = 1.000
PLG.yellow.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(255 / 255, 255 / 255, 0 / 255)
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 255 / 255, 0 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 255 / 255, 0 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(255 / 255, 255 / 255, 0 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_113.Parent = PLG.yellow
PLG.TextLabel_113.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_113.BackgroundTransparency = 1.000
PLG.TextLabel_113.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_113.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_113.Font = Enum.Font.ArialBold
PLG.TextLabel_113.Text = "Yellow"
PLG.TextLabel_113.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_113.TextSize = 14.000
PLG.TextLabel_113.TextXAlignment = Enum.TextXAlignment.Left

PLG.orange.Name = "orange"
PLG.orange.Parent = PLG.Things_24
PLG.orange.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.orange.BorderSizePixel = 0
PLG.orange.Size = UDim2.new(0, 21, 0, 21)
PLG.orange.Font = Enum.Font.SourceSans
PLG.orange.Text = "Bruh"
PLG.orange.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.orange.TextSize = 14.000
PLG.orange.TextTransparency = 1.000
PLG.orange.MouseButton1Click:connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            --print(i,v)
            if v.Name == "M9" then
                game.Players.LocalPlayer.Backpack.M9.Part.Color = Color3.new(218 / 255, 133 / 255, 65 / 255)
                game.Players.LocalPlayer.Backpack.M9.Part.Transparency = 0.5
            end
            if v.Name == "Remington 870" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["Remington 870"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(218 / 255, 133 / 255, 65 / 255)
                end
            end
            if v.Name == "AK-47" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["AK-47"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(218 / 255, 133 / 255, 65 / 255)
                end
            end
            if v.Name == "M4A1" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack["M4A1"].Model:GetChildren()) do
                    v.Transparency = 0.5
                    v.Color = Color3.new(218 / 255, 133 / 255, 65 / 255)
                end
            end
        end
    end
)

PLG.TextLabel_114.Parent = PLG.orange
PLG.TextLabel_114.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_114.BackgroundTransparency = 1.000
PLG.TextLabel_114.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_114.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_114.Font = Enum.Font.ArialBold
PLG.TextLabel_114.Text = "Orange"
PLG.TextLabel_114.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_114.TextSize = 14.000
PLG.TextLabel_114.TextXAlignment = Enum.TextXAlignment.Left

PLG.ExtraGuns.Name = "ExtraGuns"
PLG.ExtraGuns.Parent = PLG.ExtraFrame
PLG.ExtraGuns.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ExtraGuns.BackgroundTransparency = 0.350
PLG.ExtraGuns.BorderSizePixel = 0
PLG.ExtraGuns.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.ExtraGuns.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_25.Name = "TitlePart"
PLG.TitlePart_25.Parent = PLG.ExtraGuns
PLG.TitlePart_25.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_25.BackgroundTransparency = 0.350
PLG.TitlePart_25.BorderSizePixel = 0
PLG.TitlePart_25.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_25.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_115.Parent = PLG.TitlePart_25
PLG.TextLabel_115.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_115.BackgroundTransparency = 1.000
PLG.TextLabel_115.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_115.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_115.Font = Enum.Font.ArialBold
PLG.TextLabel_115.Text = "Misc Extra Guns"
PLG.TextLabel_115.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_115.TextScaled = true
PLG.TextLabel_115.TextSize = 14.000
PLG.TextLabel_115.TextWrapped = true
PLG.TextLabel_115.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_25.Name = "Things"
PLG.Things_25.Parent = PLG.ExtraGuns
PLG.Things_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_25.BackgroundTransparency = 1.000
PLG.Things_25.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_25.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_25.Parent = PLG.Things_25
PLG.UIListLayout_25.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_25.Padding = UDim.new(0.0700000003, 0)

PLG.blank.Name = "blank"
PLG.blank.Parent = PLG.Things_25
PLG.blank.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blank.BorderSizePixel = 0
PLG.blank.Size = UDim2.new(0, 21, 0, 21)
PLG.blank.Font = Enum.Font.SourceSans
PLG.blank.Text = "Bruh"
PLG.blank.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blank.TextSize = 14.000
PLG.blank.TextTransparency = 1.000
PLG.blank.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.CurrentAmmo = math.huge
	            rs.MaxAmmo = math.huge
			end
		end)
    end
)

PLG.TextLabel_116.Parent = PLG.blank
PLG.TextLabel_116.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_116.BackgroundTransparency = 1.000
PLG.TextLabel_116.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_116.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_116.Font = Enum.Font.ArialBold
PLG.TextLabel_116.Text = "Inf Ammo M4A1"
PLG.TextLabel_116.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_116.TextSize = 14.000
PLG.TextLabel_116.TextXAlignment = Enum.TextXAlignment.Left

PLG.blank_2.Name = "blank"
PLG.blank_2.Parent = PLG.Things_25
PLG.blank_2.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blank_2.BorderSizePixel = 0
PLG.blank_2.Size = UDim2.new(0, 21, 0, 21)
PLG.blank_2.Font = Enum.Font.SourceSans
PLG.blank_2.Text = "Bruh"
PLG.blank_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blank_2.TextSize = 14.000
PLG.blank_2.TextTransparency = 1.000
PLG.blank_2.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.CurrentAmmo = math.huge
	            rs.MaxAmmo = math.huge
			end
		end)
    end
)

PLG.TextLabel_117.Parent = PLG.blank_2
PLG.TextLabel_117.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_117.BackgroundTransparency = 1.000
PLG.TextLabel_117.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_117.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_117.Font = Enum.Font.ArialBold
PLG.TextLabel_117.Text = "Inf Ammo AK-47"
PLG.TextLabel_117.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_117.TextSize = 14.000
PLG.TextLabel_117.TextXAlignment = Enum.TextXAlignment.Left

PLG.blank_3.Name = "blank"
PLG.blank_3.Parent = PLG.Things_25
PLG.blank_3.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blank_3.BorderSizePixel = 0
PLG.blank_3.Size = UDim2.new(0, 21, 0, 21)
PLG.blank_3.Font = Enum.Font.SourceSans
PLG.blank_3.Text = "Bruh"
PLG.blank_3.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blank_3.TextSize = 14.000
PLG.blank_3.TextTransparency = 1.000
PLG.blank_3.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.CurrentAmmo = math.huge
	            rs.MaxAmmo = math.huge
			end
		end)
    end
)

PLG.TextLabel_118.Parent = PLG.blank_3
PLG.TextLabel_118.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_118.BackgroundTransparency = 1.000
PLG.TextLabel_118.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_118.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_118.Font = Enum.Font.ArialBold
PLG.TextLabel_118.Text = "Inf Ammo Remington 870"
PLG.TextLabel_118.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_118.TextSize = 14.000
PLG.TextLabel_118.TextXAlignment = Enum.TextXAlignment.Left

PLG.blank_4.Name = "blank"
PLG.blank_4.Parent = PLG.Things_25
PLG.blank_4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blank_4.BorderSizePixel = 0
PLG.blank_4.Size = UDim2.new(0, 21, 0, 21)
PLG.blank_4.Font = Enum.Font.SourceSans
PLG.blank_4.Text = "Bruh"
PLG.blank_4.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blank_4.TextSize = 14.000
PLG.blank_4.TextTransparency = 1.000
PLG.blank_4.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("M9").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.CurrentAmmo = math.huge
	            rs.MaxAmmo = math.huge
			end
		end)
    end
)

PLG.TextLabel_119.Parent = PLG.blank_4
PLG.TextLabel_119.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_119.BackgroundTransparency = 1.000
PLG.TextLabel_119.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_119.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_119.Font = Enum.Font.ArialBold
PLG.TextLabel_119.Text = "Inf Ammo M9"
PLG.TextLabel_119.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_119.TextSize = 14.000
PLG.TextLabel_119.TextXAlignment = Enum.TextXAlignment.Left

PLG.blank_5.Name = "blank"
PLG.blank_5.Parent = PLG.Things_25
PLG.blank_5.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.blank_5.BorderSizePixel = 0
PLG.blank_5.Size = UDim2.new(0, 21, 0, 21)
PLG.blank_5.Font = Enum.Font.SourceSans
PLG.blank_5.Text = "Bruh"
PLG.blank_5.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.blank_5.TextSize = 14.000
PLG.blank_5.TextTransparency = 1.000
PLG.blank_5.MouseButton1Click:connect(
	function()
		local Success, Error = pcall(function()
	        S = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser").GunStates
	        if getgenv().Shadow_Loaded then
	            setidentity(2)
	            rs = require(S)
	            setidentity(7)
	        else
	            rs = require(S)
	        end
	        for i, v in next, rs do
	            rs.CurrentAmmo = math.huge
	            rs.MaxAmmo = math.huge
			end
		end)
    end
)

PLG.TextLabel_120.Parent = PLG.blank_5
PLG.TextLabel_120.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_120.BackgroundTransparency = 1.000
PLG.TextLabel_120.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_120.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_120.Font = Enum.Font.ArialBold
PLG.TextLabel_120.Text = "Inf Ammo Taser"
PLG.TextLabel_120.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_120.TextSize = 14.000
PLG.TextLabel_120.TextXAlignment = Enum.TextXAlignment.Left

PLG.ExtraESP.Name = "ExtraESP"
PLG.ExtraESP.Parent = PLG.ExtraFrame
PLG.ExtraESP.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ExtraESP.BackgroundTransparency = 0.350
PLG.ExtraESP.BorderSizePixel = 0
PLG.ExtraESP.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.ExtraESP.Size = UDim2.new(0, 412, 0, 155)

PLG.TitleParthufdjkh.Name = "TitleParthufdjkh"
PLG.TitleParthufdjkh.Parent = PLG.ExtraESP
PLG.TitleParthufdjkh.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitleParthufdjkh.BackgroundTransparency = 0.350
PLG.TitleParthufdjkh.BorderSizePixel = 0
PLG.TitleParthufdjkh.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitleParthufdjkh.Size = UDim2.new(0, 412, 0, 32)

PLG.kfkfkfkfkfkfkfkfkfkk.Name = "kfkfkfkfkfkfkfkfkfkk"
PLG.kfkfkfkfkfkfkfkfkfkk.Parent = PLG.TitleParthufdjkh
PLG.kfkfkfkfkfkfkfkfkfkk.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.kfkfkfkfkfkfkfkfkfkk.BackgroundTransparency = 1.000
PLG.kfkfkfkfkfkfkfkfkfkk.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.kfkfkfkfkfkfkfkfkfkk.Size = UDim2.new(0, 175, 0, 18)
PLG.kfkfkfkfkfkfkfkfkfkk.Font = Enum.Font.ArialBold
PLG.kfkfkfkfkfkfkfkfkfkk.Text = "ESP"
PLG.kfkfkfkfkfkfkfkfkfkk.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.kfkfkfkfkfkfkfkfkfkk.TextScaled = true
PLG.kfkfkfkfkfkfkfkfkfkk.TextSize = 14.000
PLG.kfkfkfkfkfkfkfkfkfkk.TextWrapped = true
PLG.kfkfkfkfkfkfkfkfkfkk.TextXAlignment = Enum.TextXAlignment.Left

PLG.Thingsdhfkjhj.Name = "Thingsdhfkjhj"
PLG.Thingsdhfkjhj.Parent = PLG.ExtraESP
PLG.Thingsdhfkjhj.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Thingsdhfkjhj.BackgroundTransparency = 1.000
PLG.Thingsdhfkjhj.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Thingsdhfkjhj.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayoutjdjdjdjjd.Name = "UIListLayoutjdjdjdjjd"
PLG.UIListLayoutjdjdjdjjd.Parent = PLG.Thingsdhfkjhj
PLG.UIListLayoutjdjdjdjjd.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayoutjdjdjdjjd.Padding = UDim.new(0.0700000003, 0)

PLG.droppedguns.Name = "droppedguns"
PLG.droppedguns.Parent = PLG.Thingsdhfkjhj
PLG.droppedguns.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.droppedguns.BorderSizePixel = 0
PLG.droppedguns.Size = UDim2.new(0, 21, 0, 21)
PLG.droppedguns.Font = Enum.Font.SourceSans
PLG.droppedguns.Text = "Bruh"
PLG.droppedguns.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.droppedguns.TextSize = 14.000
PLG.droppedguns.TextTransparency = 1.000

PLG.osdfsdfh.Name = "osdfsdfh"
PLG.osdfsdfh.Parent = PLG.droppedguns
PLG.osdfsdfh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.osdfsdfh.BackgroundTransparency = 1.000
PLG.osdfsdfh.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.osdfsdfh.Size = UDim2.new(0, 200, 0, 21)
PLG.osdfsdfh.Font = Enum.Font.ArialBold
PLG.osdfsdfh.Text = "Dropped Items"
PLG.osdfsdfh.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.osdfsdfh.TextSize = 14.000
PLG.osdfsdfh.TextXAlignment = Enum.TextXAlignment.Left

droppedguuns = false
PLG.droppedguns.MouseButton1Click:Connect(
    function()
        if not droppedguuns then
            droppedguuns = true
            PLG.droppedguns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

            _G.ESP_ENABLED = true
        else
            droppedguuns = false
            PLG.droppedguns.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.ESP_ENABLED = false
        end
    end
)

PLG.playeresp.Name = "playeresp"
PLG.playeresp.Parent = PLG.Thingsdhfkjhj
PLG.playeresp.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.playeresp.BorderSizePixel = 0
PLG.playeresp.Size = UDim2.new(0, 21, 0, 21)
PLG.playeresp.Font = Enum.Font.SourceSans
PLG.playeresp.Text = "Bruh"
PLG.playeresp.TextColor3 = Color3.fromRGB(0, 0, 0)
PLG.playeresp.TextSize = 14.000
PLG.playeresp.TextTransparency = 1.000

PLG.osdfsdfhhh.Name = "osdfsdfhhh"
PLG.osdfsdfhhh.Parent = PLG.playeresp
PLG.osdfsdfhhh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.osdfsdfhhh.BackgroundTransparency = 1.000
PLG.osdfsdfhhh.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.osdfsdfhhh.Size = UDim2.new(0, 200, 0, 21)
PLG.osdfsdfhhh.Font = Enum.Font.ArialBold
PLG.osdfsdfhhh.Text = "Players"
PLG.osdfsdfhhh.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.osdfsdfhhh.TextSize = 14.000
PLG.osdfsdfhhh.TextXAlignment = Enum.TextXAlignment.Left

plllayer = false
PLG.playeresp.MouseButton1Click:Connect(
    function()
        if not plllayer then
            plllayer = true
            PLG.playeresp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

            _G.PLAYER_ESP_ENABLED = true
        else
            plllayer = false
            PLG.playeresp.BackgroundColor3 = Color3.fromRGB(40, 40, 48)

            _G.PLAYER_ESP_ENABLED = false
        end
    end
)

PLG.InfoFrame.Name = "InfoFrame"
PLG.InfoFrame.Parent = PLG.Main
PLG.InfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.InfoFrame.BackgroundTransparency = 1.000
PLG.InfoFrame.BorderSizePixel = 0
PLG.InfoFrame.Position = UDim2.new(0, 0, 0.208633095, 0)
PLG.InfoFrame.Size = UDim2.new(0, 648, 0, 330)

PLG.BlankFrame_5.Name = "BlankFrame"
PLG.BlankFrame_5.Parent = PLG.InfoFrame
PLG.BlankFrame_5.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.BlankFrame_5.BackgroundTransparency = 0.350
PLG.BlankFrame_5.BorderSizePixel = 0
PLG.BlankFrame_5.Position = UDim2.new(0.0354938284, 0, 0.0363636389, 0)
PLG.BlankFrame_5.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_26.Name = "TitlePart"
PLG.TitlePart_26.Parent = PLG.BlankFrame_5
PLG.TitlePart_26.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_26.BackgroundTransparency = 0.350
PLG.TitlePart_26.BorderSizePixel = 0
PLG.TitlePart_26.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_26.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_121.Parent = PLG.TitlePart_26
PLG.TextLabel_121.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_121.BackgroundTransparency = 1.000
PLG.TextLabel_121.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_121.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_121.Font = Enum.Font.ArialBold
PLG.TextLabel_121.Text = "Credits"
PLG.TextLabel_121.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_121.TextScaled = true
PLG.TextLabel_121.TextSize = 14.000
PLG.TextLabel_121.TextWrapped = true
PLG.TextLabel_121.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_26.Name = "Things"
PLG.Things_26.Parent = PLG.BlankFrame_5
PLG.Things_26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_26.BackgroundTransparency = 1.000
PLG.Things_26.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_26.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_26.Parent = PLG.Things_26
PLG.UIListLayout_26.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_26.Padding = UDim.new(0.0700000003, 0)

PLG.TextLabel_122.Parent = PLG.Things_26
PLG.TextLabel_122.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_122.BackgroundTransparency = 1.000
PLG.TextLabel_122.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_122.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_122.Font = Enum.Font.ArialBold
PLG.TextLabel_122.Text = "GUI: Jmuse#3982"
PLG.TextLabel_122.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_122.TextSize = 14.000
PLG.TextLabel_122.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_123.Parent = PLG.Things_26
PLG.TextLabel_123.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_123.BackgroundTransparency = 1.000
PLG.TextLabel_123.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_123.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_123.Font = Enum.Font.ArialBold
PLG.TextLabel_123.Text = "Script Devs: Jake11price / Exodots"
PLG.TextLabel_123.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_123.TextSize = 14.000
PLG.TextLabel_123.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_124.Parent = PLG.Things_26
PLG.TextLabel_124.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_124.BackgroundTransparency = 1.000
PLG.TextLabel_124.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_124.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_124.Font = Enum.Font.ArialBold
PLG.TextLabel_124.Text = "02Hacks / Zyrex"
PLG.TextLabel_124.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_124.TextSize = 14.000
PLG.TextLabel_124.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_125.Parent = PLG.Things_26
PLG.TextLabel_125.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_125.BackgroundTransparency = 1.000
PLG.TextLabel_125.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_125.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_125.Font = Enum.Font.ArialBold
PLG.TextLabel_125.Text = "JasonJJK / Q-TIP / Azul"
PLG.TextLabel_125.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_125.TextSize = 14.000
PLG.TextLabel_125.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_126.Parent = PLG.Things_26
PLG.TextLabel_126.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_126.BackgroundTransparency = 1.000
PLG.TextLabel_126.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_126.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_126.Font = Enum.Font.ArialBold
PLG.TextLabel_126.Text = "GUI Idea: s p o o k y#2038"
PLG.TextLabel_126.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_126.TextSize = 14.000
PLG.TextLabel_126.TextXAlignment = Enum.TextXAlignment.Left

PLG.Moreinfo.Name = "Moreinfo"
PLG.Moreinfo.Parent = PLG.InfoFrame
PLG.Moreinfo.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.Moreinfo.BackgroundTransparency = 0.350
PLG.Moreinfo.BorderSizePixel = 0
PLG.Moreinfo.Position = UDim2.new(0.684000015, 0, 0.0329999998, 0)
PLG.Moreinfo.Size = UDim2.new(0, 412, 0, 155)

PLG.TitlePart_27.Name = "TitlePart"
PLG.TitlePart_27.Parent = PLG.Moreinfo
PLG.TitlePart_27.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_27.BackgroundTransparency = 0.350
PLG.TitlePart_27.BorderSizePixel = 0
PLG.TitlePart_27.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_27.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_127.Parent = PLG.TitlePart_27
PLG.TextLabel_127.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_127.BackgroundTransparency = 1.000
PLG.TextLabel_127.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_127.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_127.Font = Enum.Font.ArialBold
PLG.TextLabel_127.Text = "How to use"
PLG.TextLabel_127.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_127.TextScaled = true
PLG.TextLabel_127.TextSize = 14.000
PLG.TextLabel_127.TextWrapped = true
PLG.TextLabel_127.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_27.Name = "Things"
PLG.Things_27.Parent = PLG.Moreinfo
PLG.Things_27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_27.BackgroundTransparency = 1.000
PLG.Things_27.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_27.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_27.Parent = PLG.Things_27
PLG.UIListLayout_27.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_27.Padding = UDim.new(0.0700000003, 0)

PLG.TextLabel_128.Parent = PLG.Things_27
PLG.TextLabel_128.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_128.BackgroundTransparency = 1.000
PLG.TextLabel_128.Size = UDim2.new(0, 252, 0, 21)
PLG.TextLabel_128.Font = Enum.Font.ArialBold
PLG.TextLabel_128.Text = 'To open / close the GUI press "G"'
PLG.TextLabel_128.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_128.TextSize = 14.000
PLG.TextLabel_128.TextXAlignment = Enum.TextXAlignment.Left

PLG.PlayerInfo.Name = "PlayerInfo"
PLG.PlayerInfo.Parent = PLG.InfoFrame
PLG.PlayerInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.PlayerInfo.BackgroundTransparency = 0.350
PLG.PlayerInfo.BorderSizePixel = 0
PLG.PlayerInfo.Position = UDim2.new(0.0354938507, 0, 0.621212184, 0)
PLG.PlayerInfo.Size = UDim2.new(0, 412, 0, 155)
PLG.PlayerInfo.Visible = false

PLG.TitlePart_29.Name = "TitlePart"
PLG.TitlePart_29.Parent = PLG.PlayerInfo
PLG.TitlePart_29.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_29.BackgroundTransparency = 0.350
PLG.TitlePart_29.BorderSizePixel = 0
PLG.TitlePart_29.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_29.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_130.Parent = PLG.TitlePart_29
PLG.TextLabel_130.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_130.BackgroundTransparency = 1.000
PLG.TextLabel_130.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_130.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_130.Font = Enum.Font.ArialBold
PLG.TextLabel_130.Text = "Player Info"
PLG.TextLabel_130.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_130.TextScaled = true
PLG.TextLabel_130.TextSize = 14.000
PLG.TextLabel_130.TextWrapped = true
PLG.TextLabel_130.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_29.Name = "Things"
PLG.Things_29.Parent = PLG.PlayerInfo
PLG.Things_29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_29.BackgroundTransparency = 1.000
PLG.Things_29.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_29.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_29.Parent = PLG.Things_29
PLG.UIListLayout_29.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_29.Padding = UDim.new(0.0700000003, 0)

PLG.TextLabel_131.Parent = PLG.Things_29
PLG.TextLabel_131.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_131.BackgroundTransparency = 1.000
PLG.TextLabel_131.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_131.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_131.Font = Enum.Font.ArialBold
PLG.TextLabel_131.Text = "Team: "
PLG.TextLabel_131.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_131.TextSize = 14.000
PLG.TextLabel_131.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_132.Parent = PLG.Things_29
PLG.TextLabel_132.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_132.BackgroundTransparency = 1.000
PLG.TextLabel_132.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_132.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_132.Font = Enum.Font.ArialBold
PLG.TextLabel_132.Text = "Health: "
PLG.TextLabel_132.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_132.TextSize = 14.000
PLG.TextLabel_132.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_133.Parent = PLG.Things_29
PLG.TextLabel_133.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_133.BackgroundTransparency = 1.000
PLG.TextLabel_133.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_133.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_133.Font = Enum.Font.ArialBold
PLG.TextLabel_133.Text = "Position: "
PLG.TextLabel_133.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_133.TextSize = 14.000
PLG.TextLabel_133.TextXAlignment = Enum.TextXAlignment.Left

PLG.TextLabel_134.Parent = PLG.Things_29
PLG.TextLabel_134.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_134.BackgroundTransparency = 1.000
PLG.TextLabel_134.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_134.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_134.Font = Enum.Font.ArialBold

PLG.TextLabel_134.Text = "Ping: "
PLG.TextLabel_134.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_134.TextSize = 14.000
PLG.TextLabel_134.TextXAlignment = Enum.TextXAlignment.Left

PLG.ServerInfo.Name = "ServerInfo"
PLG.ServerInfo.Parent = PLG.InfoFrame
PLG.ServerInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
PLG.ServerInfo.BackgroundTransparency = 0.350
PLG.ServerInfo.BorderSizePixel = 0
PLG.ServerInfo.Position = UDim2.new(0.68364197, 0, 0.621212184, 0)
PLG.ServerInfo.Size = UDim2.new(0, 412, 0, 155)
PLG.ServerInfo.Visible = false

PLG.TitlePart_30.Name = "TitlePart"
PLG.TitlePart_30.Parent = PLG.ServerInfo
PLG.TitlePart_30.BackgroundColor3 = Color3.fromRGB(42, 42, 50)
PLG.TitlePart_30.BackgroundTransparency = 0.350
PLG.TitlePart_30.BorderSizePixel = 0
PLG.TitlePart_30.Position = UDim2.new(0, 0, -0.210161269, 0)
PLG.TitlePart_30.Size = UDim2.new(0, 412, 0, 32)

PLG.TextLabel_135.Parent = PLG.TitlePart_30
PLG.TextLabel_135.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_135.BackgroundTransparency = 1.000
PLG.TextLabel_135.Position = UDim2.new(0.0397350974, 0, 0.21875, 0)
PLG.TextLabel_135.Size = UDim2.new(0, 175, 0, 18)
PLG.TextLabel_135.Font = Enum.Font.ArialBold
PLG.TextLabel_135.Text = "Server Info"
PLG.TextLabel_135.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_135.TextScaled = true
PLG.TextLabel_135.TextSize = 14.000
PLG.TextLabel_135.TextWrapped = true
PLG.TextLabel_135.TextXAlignment = Enum.TextXAlignment.Left

PLG.Things_30.Name = "Things"
PLG.Things_30.Parent = PLG.ServerInfo
PLG.Things_30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.Things_30.BackgroundTransparency = 1.000
PLG.Things_30.Position = UDim2.new(0.0397351012, 0, 0.0569105521, 0)
PLG.Things_30.Size = UDim2.new(0, 271, 0, 105)

PLG.UIListLayout_30.Parent = PLG.Things_30
PLG.UIListLayout_30.SortOrder = Enum.SortOrder.LayoutOrder
PLG.UIListLayout_30.Padding = UDim.new(0.0700000003, 0)

PLG.TextLabel_136.Parent = PLG.Things_30
PLG.TextLabel_136.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_136.BackgroundTransparency = 1.000
PLG.TextLabel_136.Position = UDim2.new(1.85714281, 0, 0, 0)
PLG.TextLabel_136.Size = UDim2.new(0, 200, 0, 21)
PLG.TextLabel_136.Font = Enum.Font.ArialBold

PLG.TextLabel_136.Text = "Players 0/0"
PLG.TextLabel_136.TextColor3 = Color3.fromRGB(255, 255, 255)
PLG.TextLabel_136.TextSize = 14.000
PLG.TextLabel_136.TextXAlignment = Enum.TextXAlignment.Left

-- Open / Close GUI

game.Players.LocalPlayer:GetMouse().KeyDown:connect(
    function(key)
        if key:lower() == "g" then
            if PLG.All.Visible == false then
                PLG.All.Visible = true
            else
                PLG.All.Visible = false
            end
        end
    end
)

-- Player List

PLG.sampletextxd.Visible = false
PLG.sampletextxd.Active = false
PLG.sampletextxd.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
PLG.sampletextxd.BackgroundTransparency = 0.5
PLG.sampletextxd.BorderSizePixel = 0

function updatescroll()
    PLG.PlayersBruhBruh.CanvasSize = UDim2.new(0, 0, 0, 0)
    local btncount = 0
    for i, v in pairs(PLG.PlayersBruhBruh:GetChildren()) do
        if v:IsA("TextButton") then
            if v.Name == "TextButton" then
            elseif v.Name == game.Players.LocalPlayer.Name then
            else
                btncount = btncount + 20
            end
        end
    end
    PLG.PlayersBruhBruh.CanvasSize = UDim2.new(0, 0, 0, btncount)
end

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        local btn = PLG.sampletextxd:Clone()
        btn.Parent = PLG.PlayersBruhBruh
        btn.Name = v.Name
        btn.Visible = true
        btn.Text = v.Name
        btn.MouseButton1Click:Connect(
            function()
                if not btn.Active then
                    for a, b in pairs(PLG.PlayersBruhBruh:GetChildren()) do
                        if b:IsA("TextButton") then
                            b.Active = false
                            b.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
                        end
                    end
                    btn.Active = true
                    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                else
                    btn.Active = false
                    btn.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
                end
            end
        )
        updatescroll()
    end
end

game.Players.PlayerAdded:Connect(
    function(v)
        local btn = PLG.sampletextxd:Clone()
        btn.Parent = PLG.PlayersBruhBruh
        btn.Name = v.Name
        btn.Visible = true
        btn.Text = v.Name
        btn.MouseButton1Click:Connect(
            function()
                if not btn.Active then
                    for a, b in pairs(PLG.PlayersBruhBruh:GetChildren()) do
                        if b:IsA("TextButton") then
                            b.Active = false
                            b.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
                        end
                    end
                    btn.Active = true
                    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                else
                    btn.Active = false
                    btn.BackgroundColor3 = Color3.fromRGB(38, 38, 47)
                end
            end
        )
        updatescroll()
    end
)

game.Players.PlayerRemoving:Connect(
    function(v)
        for a, b in pairs(PLG.PlayersBruhBruh:GetChildren()) do
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
        for a, b in pairs(PLG.PlayersBruhBruh:GetChildren()) do
            if b:IsA("TextButton") then
                if b.Name == v.Name then
                    b:Destroy()
                end
            end
        end
        updatescroll()
    end
)

PLG.tptoplayer.MouseButton1Click:Connect(
    function()
        for i, v in pairs(PLG.PlayersBruhBruh:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Active then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        game.Players[v.Text].Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
)

PLG.spectate.MouseButton1Click:Connect(
    function()
        for i, v in pairs(PLG.PlayersBruhBruh:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Active then
                    persontospec = v.Text
                end
            end
        end
    end
)

PLG.unspectate.MouseButton1Click:Connect(
    function()
        persontospec = game.Players.LocalPlayer.Name
    end
)

PLG.kill.MouseButton1Down:connect(
    function()
        local prsn
        for i, v in pairs(PLG.PlayersBruhBruh:GetChildren()) do
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