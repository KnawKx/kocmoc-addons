--Sakata
function SakataMain(Window)
local sakata = Window:CreateTab("Sakata's Functions")

local SakataTables = {
        Toggles = {
        SendWebhook = nil
    },
    valuee = {
        Webhook = "",
        WebCooldown = 60
    },
        Unknown = {
        Unknown2 = nil
    }
}
getgenv().Orange = "🟠"
local sakatasection1 = sakata:CreateSection("Sakata's Exclusive Function")
sakatasection1:CreateLabel("Don't forget to add your webhook to the top of the script")
sakatasection1:CreateSlider("Cooldown", 0, 120, 60, false, function(Value) SakataTables.value.WebCooldown = Value end)
sakatasection1:CreateLabel(" ")
sakatasection1:CreateToggle("Webhook "..Orange, nil, function(State) SakataTables.Toggles.SendWebhook = State end)
local requestfunction = syn and syn.request or http_request
--Sakata Script
local start_tick = os.time()
local RunService = game:GetService("RunService")
local TimeFunction = RunService:IsRunning() and time or os.clock

local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end

	FrameUpdateTable[1] = LastIteration
	FPSHANDLER = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
end

Start = TimeFunction()
RunService.Heartbeat:Connect(HeartbeatUpdate)

task.spawn(function() while task.wait(SakataTables.value.WebCooldown) do
    if SakataTables.Toggles.SendWebhook then
        local data = {
            ["username"]  = "Sakata",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/944313427126534178/949612368323833876/ichigo.gif",
            ["embeds"] = {
                {
                    ["author"] = {
                        ["name"] = game.Players.LocalPlayer.Name,
                        ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile",
                        ["icon_url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
                    },
                    ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
                    ["description"] = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
                    ["color"] = fc5603,
                    ["fields"] = {
                        {
                           ["name"] = "Player Info:",
                           ["value"] = "**Name: **"..game.Players.LocalPlayer.Name.."\n**DisplayName: **"..game.Players.LocalPlayer.DisplayName.."\n**Age: **"..game.Players.LocalPlayer.AccountAge
                        },
                       {
                            ["name"] = "Honey:",
                            ["value"] = tostring("`"..game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar.TextLabel.Text.."` Honey"),
                       },
                       {
                            ["name"] = "Online Time:",
                            ["value"] = tostring("`"..os.time()-start_tick.."`Seconds"),
                        },
                        {
                            ["name"] = "Fps:",
                            ["value"] = tostring("`"..FPSHANDLER.."`"),
                        },
                    },
                    ["thumbnail"] = {
                        ["url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
                    },
                    ["footer"] = {
                        ["text"] = "Sakata#0001",
                    }
                }
            }
        }
        local Post = req({Url = getgenv().WebHook,  Method = 'POST', Headers = { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode(data)})
    end
end end) end

return SakataMain
