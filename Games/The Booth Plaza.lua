local Success, Error = pcall(function()

    repeat wait() until game:IsLoaded()

    if is_sirhurt_closure then
        error("Hi sirhurt user, fuck ur self.")
    end

    -- #region // No Console Log    
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, Connection in next, getconnections(game:GetService("ScriptContext").Error) do
            Connection:Disable()
        end
        
        for _, Connection in next, getconnections(game:GetService("LogService").MessageOut) do
            Connection:Disable()
        end
    end)
    -- #endregion

    -- #region // Services

    local game                              = game;
    local GetService                        = game.GetService;

    local Workspace                         = GetService(game, "Workspace");
    local Players                           = GetService(game, "Players");
    local ReplicatedStorage                 = GetService(game, "ReplicatedStorage");
    local StarterGui                        = GetService(game, "StarterGui");

    local LogService                        = GetService(game, "LogService");
    local HttpService                       = GetService(game, "HttpService");
    local ScriptContext                     = GetService(game, "ScriptContext");

    -- #endregion

    -- #region // Variables

    local Settings                          = { BoothStuff = {BoothStuffEnabled = false, BoothString1 = "", BoothString2 = "", BoothString3 = "", BoothImage1 = "", BoothImage2 = "", BoothImage3 = "", BoothPanicString = "", BoothPanicImage = ""} };
    
    local Player                            = Players.LocalPlayer;
    local Character                         = Player.Character;
    local Mouse                             = Player:GetMouse()
    local Cam                               = workspace.CurrentCamera;

    local Debounce                          = false

    while not Character or not Character.Parent do
        Character = Player.Character
        wait()
    end

    -- #endregion

    -- #region // Functions
    function JoinDiscord()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f98zsdfdn23kjsxdssfs/2faxasv8asdsjkfsfj/main/Essentials/AutoJoin.lua"))()
    end
    -- #endregion

    if game:IsLoaded() then JoinDiscord() end
    
    -- #region // Objects
    local ESPFramework             = loadstring(game:HttpGet("https://raw.githubusercontent.com/1f98zsdfdn23kjsxdssfs/2faxasv8asdsjkfsfj/main/Libraries/UILib.lua", true))()
    local Watermark                = Framework:CreateWatermark("UwU Ware | {game} | {fps}")
    local UwUWare                  = Framework:CreateWindow( "UwU Ware", Vector2.new(492, 588), Enum.KeyCode.BackSlash )

    local General                  = UwUWare:CreateTab("General")
    local Credits                  = UwUWare:CreateTab("Credits")

    local BoothS                   = General:CreateSector("Booth Cheats", "left")  

    local CreditsS                 = Credits:CreateSector("Credits", "left")  
    local MiscS                    = Credits:CreateSector("Miscellaneous", "right") 
    if syn then local ConfigS      = Credits:CreateConfigSystem("left") end
    -- #endregion

    -- #region // Codes

        -- #region Booth Cheats
        game:GetService("RunService").RenderStepped:Connect(function()
            if Settings.BoothStuff.BoothStuffEnabled == true then
                if Debounce == false then
                    Debounce = true

                    local function TypeWriter(Text, Image)
                        for i = 1, #Text, 1 do
                            if Settings.BoothStuff.BoothStuffEnabled == true then
                                game:GetService("ReplicatedStorage").Booth:FireServer("Update", {
                                    ["Decoration"] = "Select from dropdown",
                                    ["Text"] = tostring(string.sub(Text, 1, i)),
                                    ["Icon"] = Image,
                                    ["Colour"] = "You need the gamepass"
                                }) 
    
                                print("Ae")
                            
                                wait(0.30)
                            else
                                break
                            end
                        end
                    end
    
                    TypeWriter(Settings.BoothStuff.BoothString1, Settings.BoothStuff.BoothImage1)
                    TypeWriter(Settings.BoothStuff.BoothString2, Settings.BoothStuff.BoothImage2)
                    TypeWriter(Settings.BoothStuff.BoothString3, Settings.BoothStuff.BoothImage3)

                    Debounce = false
                end
            end
        end)
        -- #endregion

    -- #endregion

    -- #region // Tabs

        -- #region // General Tab
        
            -- #region // Main Sector
            BoothS:AddToggle("Toggle Booth Cheats", false, function(V)
                Settings.BoothStuff.BoothStuffEnabled = V

                if V == false then
                    game:GetService("ReplicatedStorage").Booth:FireServer("Update", {
                        ["Decoration"] = "Select from dropdown",
                        ["Text"] = Settings.BoothStuff.BoothPanicString,
                        ["Icon"] = Settings.BoothStuff.BoothPanicImage,
                        ["Colour"] = "You need the gamepass"
                    }) 
                end
            end)

            BoothS:AddSeperator("Strings")

            BoothS:AddTextbox("Booth String 1", "MSG Here", function(V)
                Settings.BoothStuff.BoothString1 = V
            end)
            
            BoothS:AddTextbox("Booth String 2", "MSG Here", function(V)
                Settings.BoothStuff.BoothString2 = V
            end)

            BoothS:AddTextbox("Booth String 3", "MSG Here", function(V)
                Settings.BoothStuff.BoothString3 = V
            end)

            BoothS:AddSeperator("Images")

            BoothS:AddTextbox("Booth Icon 1", "ID Here", function(V)
                Settings.BoothStuff.BoothImage1 = V
            end)
            
            BoothS:AddTextbox("Booth Icon 2", "ID Here", function(V)
                Settings.BoothStuff.BoothImage2 = V
            end)

            BoothS:AddTextbox("Booth Icon 3", "ID Here", function(V)
                Settings.BoothStuff.BoothImage3 = V
            end)

            BoothS:AddSeperator("Panic")

            BoothS:AddTextbox("String", "MSG Here", function(V)
                Settings.BoothStuff.BoothPanicString = V
            end)

            BoothS:AddTextbox("Icon", "ID Here", function(V)
                Settings.BoothStuff.BoothPanicImage = V
            end)
            -- #endregion

        -- #endregion

        -- #region // Credits Tab

            -- #region // Credits Sector
            CreditsS:AddSeperator("Creators")
            CreditsS:AddLabel("NilBoolean - Founder") 
            -- #endregion

            -- #region // Misc Sector
            MiscS:AddButton("Discord", function() JoinDiscord() end)
            MiscS:AddToggle("Toggle Watermark", true, function(V)
                Watermark.Visible = V
            end)
            -- #endregion

        -- #endregion

    -- #endregion

end)

-- // Error Handling

if not Success and Error then
    pcall(function()
        local ExecutorUsing            = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or "WTF?"
        local HttpService              = game:GetService("HttpService")
        
        local RandomTag                = string.sub(HttpService:GenerateGUID(false), 1, 8)
        local Data                     = { ["content"]=null,["embeds"]={{["title"]="UwU-Ware - Error Reporter",["description"]="An error has been found while execution.",["color"]=tonumber(0x287cd8),["fields"]={{["name"]="Support Code",["value"]=RandomTag,["inline"]=true},{["name"]="Game",["value"]="https://www.roblox.com/games/"..game.PlaceId,["inline"]=true},{["name"]="Executor",["value"]=ExecutorUsing,["inline"]=true},{["name"]="Error",["value"]="```"..Error.."```"}},["footer"]={["text"]="UwU-Ware | <date> | <time> | (Aurora Hub)",["icon_url"]="https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username="..game.Players.LocalPlayer.Name}}}}

        local Headers                  = {["Content-Type"]="application/json"}
        local Encoded                  = HttpService:JSONEncode(Data)

        Request                        = http_request or request or HttpPost or syn.request
        local Final = {Url             = "https://websec.services/ws/send/rsxJ4CNdgcNM8cELtt8TWVqsuIxzHeR5OsNYkgpa", Body = Encoded, Method = "POST", Headers = Headers}

        Request(Final)
    
        local MSGBox = messagebox("Unfortunately, UwU-Ware has detected an error. \n\nThis error has been sent to our servers.\nFor security reasons your game client will be closed.\n\nIf you need help fixing, A random generated Support tag ("..RandomTag..") has been copied, go in report bug and paste it in there and we will help you shortly.", "System", 0)
        setclipboard(RandomTag)

        if MSGBox == 1 then
            game:Shutdown()
        end
    end)
end
