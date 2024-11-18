local AlwaysSprint = ObeseAddons:Section({Name = "Always Sprint", Side = "left"})

local RunService = game:GetService("RunService")
local connection

AlwaysSprint:Toggle({
    Name = "Always Hold Shift", 
    Flag = "AlwaysHoldShiftToggle", 
    Def = false, 
    Callback = function(enabled)
        if enabled then
            connection = RunService.Heartbeat:Connect(function()
                keypress(0xA0)
            end)
        else
            if connection then
                connection:Disconnect()
                keyrelease(0xA0)
            end
        end
    end
})