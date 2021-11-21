-- This script has been converted to FE by iPxter

if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,Mouse,mouse,UserInputService,ContextActionService = owner
do
	script.Parent = Player.Character

	--RemoteEvent for communicating
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"

	--Fake event to make stuff like Mouse.KeyDown work
	local function fakeEvent()
		local t = {_fakeEvent=true,Connect=function(self,f)self.Function=f end}
		t.connect = t.Connect
		return t
	end

	--Creating fake input objects with fake variables
	local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function te(self,ev,...)
		local t = m[ev]
		if t and t._fakeEvent and t.Function then
			t.Function(...)
		end
	end
	m.TrigEvent = te
	UIS.TrigEvent = te

	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=Player then return end
		if io.isMouse then
			m.Target = io.Target
			m.Hit = io.Hit
		else
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return m:TrigEvent(b and "Button1Down" or "Button1Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[
	local Player = game:GetService("Players").LocalPlayer
	local Event = script:WaitForChild("UserInput_Event")

	local UIS = game:GetService("UserInputService")
	local input = function(io,a)
		if a then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local Mouse = Player:GetMouse()
	local h,t
	--Give the server mouse data 30 times every second, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	while task.wait(1/30) do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
	end]==],Player.Character)
	Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
end

print("Grab n Throw was made by JaceMorphing!")

local TweenSer = game:GetService("TweenService")
local Char = Player.Character
local Root = Char:WaitForChild("HumanoidRootPart")
local MaxForceValue = 10000
local debounce = false
local debounce2 = false

local Folder2 = Instance.new("Folder")
Folder2.Name = "Content"
Folder2.Parent = workspace

if not Folder2:FindFirstChildWhichIsA("Part") then
	local Button= Instance.new("Part")
	Button.Size = Vector3.new(4, 3.1, 4.3)
	Button.Position = Vector3.new(-1.7, 1.55, 9.35)
	Button.CanCollide = false
	Button.Anchored = true
	Button.BrickColor = BrickColor.new("Smoky grey")
	Button.Parent = Folder2
	local ButtonBase = Instance.new("Part")
	ButtonBase.Size = Vector3.new(2.8, 3.1, 2.9)
	ButtonBase.Position = Vector3.new(-1.7, 2.15, 9.35)
	ButtonBase.BrickColor = BrickColor.new("Really red")
	ButtonBase.CanCollide = false
	ButtonBase.Anchored = true
	ButtonBase.Parent = Folder2
	local Prompt = Instance.new("ClickDetector")
	Prompt.Parent = Button
	Prompt.MaxActivationDistance = 10
	local succes,err = pcall(function()
		local Script = Instance.new("Script",Button)
		Script.Source = [[
		local debounce2 == false

		script.Parent.ClickDetector.MouseClick:Connect(function()
			if debounce2 == false then
				debounce2 = true
				local hint = Instance.new("Hint")
				hint.Text = "Bruh " .. player.Name .. " wat do ya think will happen"
				hint.Parent = Char
				task.wait(5)
				hint:Destroy()
				debounce2 = false
			end
		end)
		]]
	end)
	
	if not succes then
		warn(err)
	end
end

local SoundIds = {
	187069777;
	6351447176;
	2972978104;
}

local Music = Instance.new("Sound")
Music.SoundId = "rbxassetid://" .. tostring(SoundIds[math.random(1,#SoundIds)])
Music.Parent = Char.Head
Music.Volume = 1
Music.Looped = true
Music:Play()

Music.DidLoop:Connect(function()
	Music.SoundId = "rbxassetid://" .. tostring(SoundIds[math.random(1,#SoundIds)])
end)

local Folder = Instance.new("Folder")
Folder.Name = "Parts"
Folder.Parent = Char
local Balls = Instance.new("Folder")
Balls.Name = "Balls"
Balls.Parent = Char

for _,part in pairs(Char:GetChildren()) do
	if part:IsA("BasePart") and (not part.Name == "HumanoidRootPart") then
		local p = Instance.new("Part")
		p.CFrame = part.CFrame
		p.Size = part.Size
		p.CanCollide = false
		p.Parent = Folder
		local weld = Instance.new("WeldConstraint")
		weld.Parent = p
		weld.Part0 = p
		weld.Part1 = part
	end
end

Char.Humanoid.MaxHealth = math.huge

local Messages = {
	"lol where are u going?";
	"come here lol";
	"bruh no escape";
	"cmon come here";
	"bruh cmon lol!";
}

local BillBoard = Instance.new("BillboardGui")
BillBoard.Parent = Char.Head
BillBoard.Size = UDim2.new(0,200,0,50)
BillBoard.Enabled = true
BillBoard.StudsOffset = Vector3.new(0,3,0)
BillBoard.AlwaysOnTop = true
BillBoard.ResetOnSpawn = false
BillBoard.MaxDistance = math.huge
local Text = Instance.new("TextBox")
Text.Parent = BillBoard
Text.Size = UDim2.new(0,200,0,50)
Text.Visible = true
Text.BackgroundTransparency = 1
Text.BorderSizePixel = 0
Text.TextStrokeTransparency = 0
Text.TextScaled = true

function anim1()

	local RSweld = Instance.new("Weld")
	RSweld.Name = "rs"
	RSweld.Part0 = Char["Right Arm"]
	RSweld.Part1 = Char.Torso
	RSweld.Parent = Char.Torso

	local LSweld = Instance.new("Weld")
	LSweld.Name = "ls"
	LSweld.Part0 = Char["Left Arm"]
	LSweld.Part1 = Char.Torso
	LSweld.Parent = Char.Torso

	for i=0,0.1,1 do
		RSweld.C0 = RSweld.C0:lerp(CFrame.new(1.5,2,0) * CFrame.Angles(math.rad(-200),0,0),i)
		LSweld.C0 = LSweld.C0:lerp(CFrame.new(-1.5,2,0) * CFrame.Angles(math.rad(-200),0,0),i)
		task.wait()
	end

end

function anim2()

	local RSweld = Char.Torso:FindFirstChild("rs")
	local LSweld = Char.Torso:FindFirstChild("ls")

	for i=0,0.1,1 do
		if RSweld then
			RSweld.C0 = RSweld.C0:lerp(CFrame.new(1.5,2,0) * CFrame.Angles(math.rad(-90),0,0),i)
		end
		if LSweld then
			LSweld.C0 = LSweld.C0:lerp(CFrame.new(-1.5,2,0) * CFrame.Angles(math.rad(-90),0,0),i)
		end
		task.wait()
	end

end

function anim3()

	local RSweld = Char.Torso:FindFirstChild("rs")
	local LSweld = Char.Torso:FindFirstChild("ls")

	for i=0,0.1,1 do
		if RSweld then
			RSweld.C0 = RSweld.C0:lerp(CFrame.new(1.5,0,0) * CFrame.Angles(0,0,0),i)
		end
		if LSweld then
			LSweld.C0 = LSweld.C0:lerp(CFrame.new(-1.5,0,0) * CFrame.Angles(0,0,0),i)
		end
		task.wait()
	end
	RSweld:Destroy()
	LSweld:Destroy()

end

coroutine.wrap(function()
	while task.wait() do
		Char.Humanoid.Health = Char.Humanoid.MaxHealth
		Char.Humanoid.WalkSpeed = 80
		Char.Humanoid.JumpPower = 100
	end
end)()

Mouse.Button1Down:Connect(function()
	local Target = Mouse.Target
	if Target.Parent:IsA("Model") then
		if Target.Parent:FindFirstChild("HumanoidRootPart") then
			local player = Target.Parent
			if not player.HumanoidRootPart:FindFirstChild("Force") then
				local distance = (Root.Position - player.HumanoidRootPart.Position).Magnitude
				--if distance < 100 then
				if debounce == false then
					debounce = true

					--player.HumanoidRootPart.Anchored = true
					local human = player:FindFirstChildWhichIsA("Humanoid")
					human.PlatformStand = true
					anim1()
					player.HumanoidRootPart.Anchored = false
					player.HumanoidRootPart.CFrame = Char.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
					local Weld = Instance.new("WeldConstraint")
					Weld.Parent = player.HumanoidRootPart
					Weld.Part0 = player.HumanoidRootPart
					Weld.Part1 = Root
					local Brazil = Instance.new("Sound")
					Brazil.Parent = Char.Head
					Brazil.SoundId = "rbxassetid://6531010123"
					Brazil:Play()
					local Brazil2 = Instance.new("Sound")
					Brazil2.Parent = Char
					Brazil2.SoundId = "rbxassetid://5663179979"
					Brazil2.Looped = true
					Brazil2:Play()
					local SoundBrazil = Instance.new("Sound")
					SoundBrazil.SoundId = "rbxassetid://5973351214"
					SoundBrazil.Parent = player.Head
					SoundBrazil.Volume = 5
					Mouse.KeyDown:Connect(function(key)
						if key == "q" then
							if debounce2 == false then
								debounce = true
								Brazil2:Stop()
								--task.wait(2)
								anim2()
								anim3()
								for _,joint in pairs(player:GetDescendants()) do
									if joint:IsA("Motor6D") then
										local A1 = Instance.new("Attachment")
										local A2 = Instance.new("Attachment")
										local socket = Instance.new("BallSocketConstraint")
										A1.Name = "A1"
										A2.Name = "A2"
										A1.Parent = joint.Part0
										A2.Parent = joint.Part1
										A1.CFrame = joint.C0
										A2.CFrame = joint.C1
										socket.Name = "Socket"
										socket.Parent = joint.Parent
										socket.Attachment0 = A1
										socket.Attachment1 = A2
										socket.LimitsEnabled = true
										socket.TwistLimitsEnabled = true
										joint.Enabled = false
									end
								end
								player.HumanoidRootPart.CanCollide = false
								SoundBrazil:Play()
								Weld:Destroy()
								local Force = Instance.new("BodyVelocity")
								Force.Parent = player.HumanoidRootPart
								Force.Name = "Force"
								Force.MaxForce = Vector3.new(MaxForceValue,MaxForceValue,MaxForceValue)
								Force.Velocity = (player.HumanoidRootPart.CFrame.lookVector)  * 100
								task.wait(3)
								local e = Instance.new("Explosion")
								e.BlastPressure = 0
								e.BlastRadius = 100
								e.Position = player.HumanoidRootPart.Position
								e.Parent = workspace
								for _,joint in pairs(player:GetDescendants()) do
									if joint:IsA("Motor6D") then
										if joint.Parent:FindFirstChild("Socket") then
											joint.Parent.Socket:Destroy()
										end
										if joint.Part0:FindFirstChild("A1") then
											joint.Part0.A1:Destroy()
										end
										if joint.Part1:FindFirstChild("A2") then
											joint.Part1.A2:Destroy()
										end
										joint.Enabled = true
									end
								end
								SoundBrazil:Destroy()
								Brazil:Destroy()
								Brazil2:Destroy()
								Force:Destroy()
								human.PlatformStand = false
								player.HumanoidRootPart.CanCollide = true
								debounce2 = false
								debounce = false
							end
						elseif key == "e" then
							if debounce2 == false then
								debounce2 = true
								anim3()
								Weld:Destroy()
								Brazil2:Stop()
								for _,joint in pairs(player:GetDescendants()) do
									if joint:IsA("Motor6D") then
										if joint.Parent:FindFirstChild("Socket") then
											joint.Parent.Socket:Destroy()
										end
										if joint.Part0:FindFirstChild("A1") then
											joint.Part0.A1:Destroy()
										end
										if joint.Part1:FindFirstChild("A2") then
											joint.Part1.A2:Destroy()
										end
										joint.Enabled = true
									end
								end
								SoundBrazil:Destroy()
								Brazil:Destroy()
								Brazil2:Destroy()
								human.PlatformStand = false
								player.HumanoidRootPart.CanCollide = true
								debounce2 = false
								debounce = false
							end
						end
					end)
					--end
				end
			end
		end
	end
end)

Char.Humanoid.Died:Connect(function()
	for _,joint in pairs(Char:GetDescendants()) do
		if joint:IsA("Motor6D") then
			local A1 = Instance.new("Attachment")
			local A2 = Instance.new("Attachment")
			local socket = Instance.new("BallSocketConstraint")
			A1.Name = "A1"
			A2.Name = "A2"
			A1.Parent = joint.Part0
			A2.Parent = joint.Part1
			A1.CFrame = joint.C0
			A2.CFrame = joint.C1
			socket.Name = "Socket"
			socket.Parent = joint.Parent
			socket.Attachment0 = A1
			socket.Attachment1 = A2
			socket.LimitsEnabled = true
			socket.TwistLimitsEnabled = true
			joint.Enabled = false
		end
	end
end)

coroutine.wrap(function()
	while task.wait() do
		Text.Rotation = math.random(-2,2)
		Text.Text = Messages[math.random(1, #Messages)]
		Text.TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
	end
end)()
