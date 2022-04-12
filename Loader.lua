local Success, Error = pcall(function()
    -- #region Variables
    local Supported             = false
    local Game                  = nil
    local OverrideLoader        = false
    local CustomMessage         = false
    -- #endregion

    -- #region Criminality
    if game.PlaceId ~= 4588604953 then
        Supported               = true
        Game                    = "Criminality"
    elseif game.PlaceId == 4588604953 then
        Supported               = true
        OverrideLoader          = true
        CustomMessage           = "You're currently inside the Criminality lobby.\nPlease execute inside the game!"
    end
    -- #endregion

    -- #region The Booth Plaza
    if game.PlaceId == 7115420363 then
        Supported               = true
        Game                    = "The%20Booth%20Plaza"
    end
    -- #endregion

    -- #region Checker
    
        -- #region Not Supported
        if Supported == false then        
            local MSGBox = messagebox("Game is not supported\nPlease join a supported game!", "System", 0)

            if MSGBox == 1 then end
        end
        -- #endregion
        
        -- #region Supported
        if Supported == true then
            if OverrideLoader == false then
                local MSGBox = messagebox("This game is supported.\nAre you sure you want to run UwU-Ware?", "System", 4)

                if MSGBox == 6 then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f98zsdfdn23kjsxdssfs/2faxasv8asdsjkfsfj/main/Games/"..Game..".lua"))()
                end
            else                
                local MSGBox = messagebox(CustomMessage, "System", 0)

                if MSGBox == 1 then end
            end
        end
        -- #endregion

    -- #endregion
end)
