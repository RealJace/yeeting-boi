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

local creatorId = game:GetService("Players"):GetPlayerByUserId(1019187771)

print("Yeeter by " .. creatorId.DisplayName .. " (@" .. creatorId.Name .. ")")

local char = owner.Character
local hum = char:FindFirstChildWhichIsA("Humanoid")
local ts = game:GetService("TweenService")
local chat = game:GetService("Chat")
local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")

if not hum.RigType == Enum.HumanoidRigType.R6 then
	warn("Please switch to R6 and run this script again.")
else
	print("Script loaded correctly")
end

--Values

local dbc = false
local keyDbc = false
local running = false

--Tables

local chat_messages = {
	"has been oblivirated by",
	"has been yeeted so hard he died",
	"has been reached health 0 by being yeeted by",
	"has been joe mamad"
}

--Code

hum.BreakJointsOnDeath = false

local runningEvent = Instance.new("BindableEvent")
runningEvent.Name = "RunningEvent"

runningEvent.Parent = NLS([==[

local event = script:WaitForChild("RunningEvent")

local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input,gameProccesed)
	if not gameProccesed then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			event:Fire(true)
		end
	end
end)

uis.InputEnded:Connect(function(input,gameProccesed)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		event:Fire(false)
	end
end)
]==],char)

runningEvent.Event:Connect(function(value)
	running = value
	print(running)
end)

local GOINGTOBRAZIL = Instance.new("Sound",hrp)
GOINGTOBRAZIL.SoundId = "rbxassetid://6531010123"
GOINGTOBRAZIL.Volume = 1

local rightArm = Instance.new("Weld")
rightArm.Name = "RightArmWeld"
rightArm.Parent = char.Torso
rightArm.Part1 = char["Right Arm"]
rightArm.Part0 = char.Torso
rightArm.C0 = char.Torso["Right Shoulder"].C0
rightArm.C1 = char.Torso["Right Shoulder"].C1

local leftArm = Instance.new("Weld")
leftArm.Name = "LeftArmWeld"
leftArm.Parent = char.Torso
leftArm.Part1 = char["Left Arm"]
leftArm.Part0 = char.Torso
leftArm.C0 = char.Torso["Left Shoulder"].C0
leftArm.C1 = char.Torso["Left Shoulder"].C1

local rightLeg = Instance.new("Weld")
rightLeg.Name = "RightLegWeld"
rightLeg.Parent = char.Torso
rightLeg.Part1 = char["Right Leg"]
rightLeg.Part0 = char.Torso
rightLeg.C0 = CFrame.new(0.5,-2,0)
--rightLeg.C1 = char.Torso["Right Hip"].C1

local leftLeg = Instance.new("Weld")
leftLeg.Name = "LeftLegWeld"
leftLeg.Parent = char.Torso
leftLeg.Part1 = char["Left Leg"]
leftLeg.Part0 = char.Torso
leftLeg.C0 = CFrame.new(-0.5,-1,0)
--leftLeg.C1 = char.Torso["Left Hip"].C1

local head = Instance.new("Weld")
head.Name = "HeadWeld"
head.Parent = char.Torso
head.Part1 = char.Head
head.Part0 = char.Torso
head.C0 = char.Torso["Neck"].C0
head.C1 = char.Torso["Neck"].C1

local torso = Instance.new("Weld")
torso.Name = "TorsoWeld"
torso.Parent = hrp
torso.Part1 = char.Torso
torso.Part0 = hrp
--torso.C0 = hrp.RootJoint.C0
--torso.C1 = hrp.RootJoint.C1

hum.MaxHealth = math.huge
hum.Health = hum.MaxHealth

local BillboardGui0 = Instance.new("BillboardGui")
local Frame1 = Instance.new("Frame")
local TextLabel2 = Instance.new("TextLabel")
local Frame3 = Instance.new("Frame")
local TextLabel4 = Instance.new("TextLabel")
BillboardGui0.Parent = char.Head
BillboardGui0.Size = UDim2.new(4, 0, 2, 0)
BillboardGui0.Active = true
BillboardGui0.ClipsDescendants = true
BillboardGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui0.MaxDistance = 20
BillboardGui0.StudsOffset = Vector3.new(0, 2, 0)
BillboardGui0.Brightness = 1.5
Frame1.Parent = BillboardGui0
Frame1.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame1.Size = UDim2.new(1, 0, 1, 0)
Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
Frame1.BackgroundColor = BrickColor.new("Institutional white")
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BackgroundTransparency = 1
TextLabel2.Name = "PlrName"
TextLabel2.Parent = Frame1
TextLabel2.Size = UDim2.new(1, 0, 0.5, 0)
TextLabel2.BackgroundColor = BrickColor.new("Institutional white")
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Font = Enum.Font.LuckiestGuy
TextLabel2.FontSize = Enum.FontSize.Size28
TextLabel2.Text = owner.DisplayName
TextLabel2.TextColor = BrickColor.new("Institutional white")
TextLabel2.TextColor3 = Color3.new(1, 1, 1)
TextLabel2.TextScaled = true
TextLabel2.TextSize = 25
TextLabel2.TextStrokeTransparency = 0
TextLabel2.TextWrap = true
TextLabel2.TextWrapped = true
Frame3.Name = "helthBar"
Frame3.Parent = Frame1
Frame3.Position = UDim2.new(0, 0, 0.5, 0)
Frame3.Size = UDim2.new(1, 0, 0, 25)
Frame3.BackgroundColor = BrickColor.new("Lime green")
Frame3.BackgroundColor3 = Color3.new(0, 1, 0)
Frame3.BorderSizePixel = 0
TextLabel4.Name = "healthText"
TextLabel4.Parent = Frame3
TextLabel4.Position = UDim2.new(0.5, 0, 0.649999976, 0)
TextLabel4.Size = UDim2.new(1, 0, 0, 25)
TextLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel4.BackgroundColor = BrickColor.new("Lime green")
TextLabel4.BackgroundColor3 = Color3.new(0, 1, 0)
TextLabel4.BackgroundTransparency = 1
TextLabel4.BorderSizePixel = 0
TextLabel4.Font = Enum.Font.LuckiestGuy
TextLabel4.Text = "Health : 100%"
TextLabel4.TextColor = BrickColor.new("Institutional white")
TextLabel4.TextColor3 = Color3.new(1, 1, 1)
TextLabel4.TextScaled = true
TextLabel4.TextStrokeTransparency = 0
TextLabel4.TextWrap = true
TextLabel4.TextWrapped = true

local Attachment0A = Instance.new("Attachment",char["Right Arm"])
Attachment0A.Position = Vector3.new(0,1,0)

local Attachment1A = Instance.new("Attachment",char["Right Arm"])
Attachment1A.Position = Vector3.new(0,-1,0)

local Attachment0B = Instance.new("Attachment",char["Left Arm"])
Attachment0B.Position = Vector3.new(0,1,0)

local Attachment1B = Instance.new("Attachment",char["Left Arm"])
Attachment1B.Position = Vector3.new(0,-1,0)

local Trail0 = Instance.new("Trail")
Trail0.Parent = char["Right Arm"]
Trail0.Attachment0 = Attachment0A
Trail0.Attachment1 = Attachment1A
Trail0.Color = ColorSequence.new(Color3.new(0, 0, 1),Color3.new(0, 0, 1))
Trail0.LightInfluence = 1
Trail0.TextureMode = Enum.TextureMode.Static
Trail0.Lifetime = 1

local Trail1 = Instance.new("Trail")
Trail1.Parent = char["Left Arm"]
Trail1.Attachment0 = Attachment0B
Trail1.Attachment1 = Attachment1B
Trail1.Color = ColorSequence.new(Color3.new(0, 0, 1),Color3.new(0, 0, 1))
Trail1.LightInfluence = 1
Trail1.TextureMode = Enum.TextureMode.Static
Trail1.Lifetime = 1

local PointLight0 = Instance.new("PointLight")
PointLight0.Parent = hrp
PointLight0.Color = Color3.fromRGB(0, 0, 255)
PointLight0.Range = 14
PointLight0.Brightness = 0 --10
PointLight0.Shadows = true

local lightOn = ts:Create(PointLight0,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{
	Brightness = 10,
})

local lightOff = ts:Create(PointLight0,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{
	Brightness = 0,
})

function readyAnim()
	for i = 0,1,0.2 do
		rightArm.C0 = rightArm.C0:Lerp(char.Torso["Right Shoulder"].C0 * CFrame.Angles(0, 0, math.rad(15.011)),i)
		leftArm.C0 = leftArm.C0:Lerp(char.Torso["Left Shoulder"].C0 * CFrame.Angles(0, 0, math.rad(-15.011)),i)
		task.wait()
	end
	for i = 0,1,0.2 do
		rightArm.C0 = rightArm.C0:Lerp(char.Torso["Right Shoulder"].C0 * CFrame.new(0.224, 0.48, 0) * CFrame.Angles(0, 0, math.rad(154.985)),i)
		leftArm.C0 = leftArm.C0:Lerp(char.Torso["Left Shoulder"].C0 * CFrame.new(-0.224, 0.48, 0) * CFrame.Angles(0, 0, math.rad(-154.985)),i)
		task.wait()
	end
end

function yeetAnim()
	for i = 0,1,0.2 do
		rightArm.C0 = rightArm.C0:Lerp(char.Torso["Right Shoulder"].C0 * CFrame.new(1.382, 0.582, 0) * CFrame.Angles(0, 0, math.rad(94.996)),i)
		leftArm.C0 = leftArm.C0:Lerp(char.Torso["Left Shoulder"].C0 * CFrame.new(-0.925, 0.637, 0) * CFrame.Angles(0, 0, math.rad(-94.996)),i)
		task.wait()
	end
	for i = 0,1,0.2 do
		rightArm.C0 = rightArm.C0:Lerp(char.Torso["Right Shoulder"].C0 * CFrame.new(1.355, -0.16, 0) * CFrame.Angles(0, 0, math.rad(-35.008)),i)
		leftArm.C0 = leftArm.C0:Lerp(char.Torso["Left Shoulder"].C0 * CFrame.new(-1.32, -0.172, 0) * CFrame.Angles(0, 0, math.rad(19.996)),i)
		task.wait()
	end
end

function defaultAnim()
	for i = 0,1,0.2 do
		rightArm.C0 = rightArm.C0:Lerp(char.Torso["Right Shoulder"].C0,i)
		leftArm.C0 = leftArm.C0:Lerp(char.Torso["Left Shoulder"].C0,i)
		task.wait()
	end
end

mouse.Button1Down:Connect(function()
	if mouse.Target ~= nil then
		local model = mouse.Target:FindFirstAncestorWhichIsA("Model")
		if model then
			if model:FindFirstChildWhichIsA("Humanoid") then
				local hum = model:FindFirstChildWhichIsA("Humanoid")
				local root = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Torso") or model:FindFirstChild("Head")
				if root then
					if dbc == false and keyDbc == false then
						dbc = true
						char:SetPrimaryPartCFrame(root.CFrame + Vector3.new(0,0,1.5))
						readyAnim()
						GOINGTOBRAZIL:Play()
						root.Anchored = false
						local weld = Instance.new("Weld",hrp)
						weld.Part0 = char.Torso
						weld.Part1 = root
						weld.C0 = CFrame.new(0,3,-0.5)
						hum.PlatformStand = true
						model.Destroying:Connect(function()
							coroutine.wrap(function()
								defaultAnim()
							end)()
							weld:Destroy()
							dbc = false
							keyDbc = false
						end)
						mouse.KeyDown:Connect(function(key)
							if keyDbc == false then
								if string.lower(key) == "q" then
									keyDbc = true
									weld:Destroy()
									coroutine.wrap(function()
										yeetAnim()
										defaultAnim()
									end)()
									local Skreem = Instance.new("Sound",root)
									Skreem.SoundId = "rbxassetid://4620905105"
									Skreem.Volume = 1
									Skreem:Play()
									for _,joint in pairs(model:GetDescendants()) do
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
										elseif joint:IsA("Weld") then
											joint.Enabled = false
										end
									end
									local Force = Instance.new("BodyForce")
									Force.Parent = root
									Force.Name = "Force"
									Force.Force = (hrp.CFrame.LookVector) * 2000
									task.wait(3)
									local fard = Instance.new("Sound",root)
									fard.SoundId = "rbxassetid://7466798053"
									fard.Volume = 2
									fard:Play()
									local e = Instance.new("Explosion")
									e.BlastPressure = 0
									e.BlastRadius = 0
									e.DestroyJointRadiusPercent = 0
									e.ExplosionType = Enum.ExplosionType.NoCraters
									e.Position = root.Position
									e.Parent = workspace
									for _,joint in pairs(model:GetDescendants()) do
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
										elseif joint:IsA("Weld") then
											joint.Enabled = true
										end
									end
									Skreem:Destroy()
									Force:Destroy()
									fard:Destroy()
									hum.PlatformStand = false
									hum.Health -= 10
									if hum.Health < 1 then
										game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{
											Text = (model.Name .. " " .. chat_messages[math.random(1,#chat_messages)] .. " " .. owner.DisplayName);
											Color = Color3.fromRGB(255,255,0);
											Font = Enum.Font.Arcade; 
											FontSize = Enum.FontSize.Size18;
										})
									end
									dbc = false
									keyDbc = false
								elseif string.lower(key) == "e" then
									if model then
										for _,joint in pairs(model:GetDescendants()) do
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
											elseif joint:IsA("Weld") then
												joint.Enabled = true
											end
										end
										hum.PlatformStand = false
									end
									coroutine.wrap(function()
										defaultAnim()
									end)()
									weld:Destroy()
									dbc = false
									keyDbc = false
								end
							end
						end)
					end
				end
			end
		end
	end
end)

mouse.KeyDown:Connect(function(key)
	if string.lower(key) == "leftshift" then
		running = true
	end
end)
	
mouse.KeyUp:Connect(function(key)
	if string.lower(key) == "leftshift" then
		running = false
	end
end)

--Walking

coroutine.wrap(function()
	while task.wait() do
		if hrp.Velocity.x > 1 or hrp.Velocity.x < -1 or hrp.Velocity.z > 1 or hrp.Velocity.z < -1 then
			torso.C0 = torso.C0:lerp(CFrame.new(0,math.sin(tick()*20)/15,0) * CFrame.Angles(0,math.rad(-hrp.Orientation.y),math.cos(tick()*10)/15) * CFrame.fromEulerAnglesXYZ(hum.MoveDirection.z/6,0,-hum.MoveDirection.x/6) * CFrame.Angles(0,math.rad(hrp.Orientation.y),0),0.3)
			leftLeg.C0 = leftLeg.C0:lerp(CFrame.new(-0.5,-1+math.cos(tick()*10)/4,0) * CFrame.Angles(0,math.rad(-hrp.Orientation.y),0) * CFrame.fromEulerAnglesXYZ((-math.sin(tick()*10)*hum.MoveDirection.z)/1.5,0,(-math.sin(tick()*10)*-hum.MoveDirection.x)/1.5) * CFrame.Angles(0,math.rad(hrp.Orientation.y),0) * CFrame.new(0,-1,0),0.3)
			rightLeg.C0 = rightLeg.C0:lerp(CFrame.new(0.5,-1-math.cos(tick()*10)/4,0) * CFrame.Angles(0,math.rad(-hrp.Orientation.y),0) * CFrame.fromEulerAnglesXYZ((math.sin(tick()*10)*hum.MoveDirection.z)/1.5,0,(math.sin(tick()*10)*-hum.MoveDirection.x)/1.5) * CFrame.Angles(0,math.rad(hrp.Orientation.y),0) * CFrame.new(0,-1,0),0.3)
		else
			torso.C0 = torso.C0:lerp(CFrame.new(0,math.sin(tick())/20,0) * CFrame.Angles(0,math.rad(0),math.sin(tick())/30),0.3)
			leftLeg.C0 = leftLeg.C0:lerp(CFrame.new(-0.5,-1-math.sin(tick())/20,0) * CFrame.Angles(0,0,math.rad(-3)-math.sin(tick())/30) * CFrame.new(0,-1,0),0.3)
			rightLeg.C0 = rightLeg.C0:lerp(CFrame.new(0.5,-1-math.sin(tick())/20,0) * CFrame.Angles(0,0,math.rad(3)-math.sin(tick())/30) * CFrame.new(0,-1,0),0.3)
		end
		if running == true then
			hum.WalkSpeed = 80
			if Trail0.Enabled == false then
				Trail0.Enabled = true
			end
			if Trail1.Enabled == false then
				Trail1.Enabled = true
			end
			if lightOff.PlaybackState == Enum.PlaybackState.Playing then
				lightOff:Pause()
			end
			if lightOn.PlaybackState ~= Enum.PlaybackState.Playing then
				lightOn:Play()
			end
		else
			hum.WalkSpeed = 16
			if Trail0.Enabled == true then
				Trail0.Enabled = false
			end
			if Trail1.Enabled == true then
				Trail1.Enabled = false
			end
			if lightOn.PlaybackState == Enum.PlaybackState.Playing then
				lightOn:Pause()
			end
			if lightOff.PlaybackState ~= Enum.PlaybackState.Playing then
				lightOff:Play()
			end
		end
		pcall(function()
			Frame3:TweenSize(UDim2.new(math.clamp(hum.Health / 100,0,1), 0,0, 25))
		end)
		TextLabel4.Text = "Health : " .. tostring(math.floor(math.clamp(hum.Health,0,100))) .. "%"
	end
end)()

char.DescendantAdded:Connect(function(i)
	if i:IsA("BodyPosition") or i:IsA("BodyForce") or i:IsA("BodyVelocity") or i:IsA("BodyGyro") then
		i:Destroy()
	end
end)

hum.Died:Connect(function()
	rightLeg.Enabled = false
	rightArm.Enabled = false
	leftLeg.Enabled = false
	leftArm.Enabled = false
	torso.Enabled = false
	head.Enabled = false
	hum.PlatformStand = true
	for _,joint in pairs(char:GetDescendants()) do
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
	coroutine.wrap(function()
		local Force = Instance.new("BodyForce")
		Force.Parent = char.Torso
		Force.Name = "Force"
		Force.Force = (char.Torso.CFrame.LookVector) * 500
		task.wait(0.1)
		Force:Destroy()
	end)()
end)
