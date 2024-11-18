local AlwaysSprint = ObeseAddons:Section({Name = "Auto Sprint", Side = "left"})
local UIS = game:GetService("UserInputService")
local isMoving = false
local connection

local function checkMovement()
   return UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.A) or 
          UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.D)
end

AlwaysSprint:Toggle({
   Name = "Auto Sprint", 
   Flag = "AutoSprintToggle", 
   Def = false, 
   Callback = function(enabled)
       if enabled then
           connection = game:GetService("RunService").RenderStepped:Connect(function()
               local moving = checkMovement()
               if moving ~= isMoving then
                   isMoving = moving
                   if moving then keypress(0xA0) else keyrelease(0xA0) end
               end
           end)
       else
           if connection then connection:Disconnect(); keyrelease(0xA0) end
       end
   end
})
