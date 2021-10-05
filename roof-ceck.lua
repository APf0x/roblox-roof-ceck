local PlayerService = game:GetService("Players")
local RunService = game:GetService("RunService")
local Character = script.Parent

local RootPart = Character:WaitForChild("HumanoidRootPart")
local WindSounds = game.StarterPlayer.StarterCharacterScripts.noise_script:GetDescendants()

local WindNumber = math.random(1, #WindSounds)
WindSounds[WindNumber]:Play()

local SoundLoop = RunService.Stepped:Connect(function()    
	local RayCastParameters = RaycastParams.new()
	RayCastParameters.FilterType = Enum.RaycastFilterType.Blacklist
	RayCastParameters.FilterDescendantsInstances = {Character}
	local Ray = workspace:Raycast(RootPart.Position, Vector3.new(0, 100, 0), RayCastParameters)
	
	local Sound = WindSounds[WindNumber]
	if Ray and Ray.Instance then  
		if Sound.Playing then
			if Sound.Volume > 0 then
				print("the volume is set to 0 at line 21")
				Sound.Volume = 0
			end
		else
			print("line 25 was printed")
			Sound.Volume = 7
		end
	else
		print("code in line 29 is executed")
		Sound.Volume = 7
		if not Sound.Playing then
			Sound:Play()
			print("sound has beeen played at line 33")
		end

		
		
	end
end) 
print("line 39 was printed")

Character:WaitForChild("Humanoid").Died:Connect(function()
	SoundLoop:Disconnect()
end)
