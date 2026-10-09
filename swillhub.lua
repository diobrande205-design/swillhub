-- SWILL HUB COMPACT
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local V=game:GetService("VirtualInputManager")
local T=game:GetService("TweenService")
local RS=game:GetService("ReplicatedStorage")
local W=game:GetService("Workspace")
local SG=game:GetService("StarterGui")
local TS=game:GetService("TeleportService")
local HS=game:GetService("HttpService")
local LP=P.LocalPlayer

getgenv().C={Spd=100,Jmp=100,Fly=false,IJ=false,NC=false,WW=false,KA=false,FA=false,AH=false,AR=false,NS=true,AF=false,AQ=false,ARaid=false,AB=false,FS=false,ESP=false,CC=false,CB=false,CH=false,CM=false,AA=false,AFK=true,AResp=true,SM=false}

local function gc()return LP.Character end
local function gh()local c=gc()return c and c:FindFirstChild("HumanoidRootPart")end
local function gu()local c=gc()return c and c:FindFirstChildOfClass("Humanoid")end
local function kp(k,h)h=h or .1 V:SendKeyEvent(true,k,false,game)task.wait(h)V:SendKeyEvent(false,k,false,game)end
local function tp(p)local h=gh()if not h then return end h.AssemblyLinearVelocity=Vector3.zero h.AssemblyAngularVelocity=Vector3.zero h.Anchored=true local d=(p-h.Position).Magnitude local t=T:Create(h,TweenInfo.new(math.clamp(d/300,.05,1.5),Enum.EasingStyle.Linear),{CFrame=CFrame.new(p)})t:Play()t.Completed:Wait()h.Anchored=false end
local function nt(a,b)pcall(function()SG:SetCore("SendNotification",{Title=a,Text=b,Duration=3})end)end
local function ne(m)m=m or 612 local h=gh()if not h then return end local n,md=nil,m for _,v in pairs(W.Enemies:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v:FindFirstChildOfClass("Humanoid")then local u=v:FindFirstChildOfClass("Humanoid")if u.Health>0 then local d=(v.HumanoidRootPart.Position-h.Position).Magnitude if d<md then md=d n=v end end end end return n end

R.Heartbeat:Connect(function()
local u=gu()if not u then return end
u.WalkSpeed=getgenv().C.SM and math.min(getgenv().C.Spd,60)or getgenv().C.Spd
u.JumpPower=getgenv().C.Jmp
if getgenv().C.NC then for _,v in pairs(gc():GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end end
if getgenv().C.WW then local h=gh()if h and h.Position.Y<1 then h.CFrame=CFrame.new(h.Position.X,1.5,h.Position.Z)end end
if getgenv().C.AR then if u:GetState()==Enum.HumanoidStateType.Ragdoll then u:ChangeState(Enum.HumanoidStateType.GettingUp)end end
if getgenv().C.NS then if u:GetState()==Enum.HumanoidStateType.PlatformStanding then u:ChangeState(Enum.HumanoidStateType.Running)end end
end)

U.JumpRequest:Connect(function()if getgenv().C.IJ then local u=gu()if u then u:ChangeState(Enum.HumanoidStateType.Jumping)end end end)

task.spawn(function()while true do if getgenv().C.Fly then local h=gh()if h then local bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.new(1e5,1e5,1e5)bv.Parent=h local bg=Instance.new("BodyGyro")bg.MaxTorque=Vector3.new(1e5,1e5,1e5)bg.P=1e4 bg.Parent=h while getgenv().C.Fly and h.Parent do local d=Vector3.zero local c=W.CurrentCamera if U:IsKeyDown(Enum.KeyCode.W)then d+=c.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S)then d-=c.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A)then d-=c.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D)then d+=c.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.Space)then d+=Vector3.new(0,1,0)end bv.Velocity=d*100 bg.CFrame=c.CFrame task.wait()end bv:Destroy()bg:Destroy()end end task.wait(.5)end end)

task.spawn(function()while true do if getgenv().C.AF then local e=ne()if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,6,0))task.wait(.1)kp(Enum.KeyCode.Z,.1)kp(Enum.KeyCode.X,.1)kp(Enum.KeyCode.C,.1)task.wait(.4)else task.wait(1)end else task.wait(.5)end end end)

task.spawn(function()while true do if getgenv().C.AQ then local n=W:FindFirstChild("NPCs")if n then for _,v in pairs(n:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v.Name~="Mysterious Entity"then tp(v.HumanoidRootPart.Position+Vector3.new(0,3,0))task.wait(.5)for _,x in pairs(v:GetDescendants())do if x:IsA("ProximityPrompt")then pcall(function()fireproximityprompt(x)end)end end task.wait(.5)break end end end end task.wait(2)end end)

task.spawn(function()while true do if getgenv().C.ARaid then pcall(function()RS.Remotes.CommF_:InvokeServer("Buy","Chip")end)task.wait(2)pcall(function()RS.Remotes.CommF_:InvokeServer("RequestRaid")end)task.wait(5)else task.wait(1)end end end)

task.spawn(function()while true do if getgenv().C.AB then local h=gh()if h then local t,md=nil,1000 for _,pl in pairs(P:GetPlayers())do if pl~=LP and pl.Character then local f=pcall(function()return LP:IsFriendsWith(pl.UserId)end)if not f then local ph=pl.Character:FindFirstChild("HumanoidRootPart")local pu=pl.Character:FindFirstChildOfClass("Humanoid")if ph and pu and pu.Health>0 then local d=(ph.Position-h.Position).Magnitude if d<md then md=d t=pl end end end end end if t and t.Character then local th=t.Character:FindFirstChild("HumanoidRootPart")if th then tp(th.Position+Vector3.new(0,5,0))task.wait(.1)kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)end end end end task.wait(.5)end end)

task.spawn(function()while true do if getgenv().C.FS then for _,v in pairs(W:GetChildren())do if v:IsA("Tool")and(v.Name:find("Fruit")or v.Name:find("fruit"))then if v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))nt("Fruit Sniper","Found: "..v.Name)task.wait(.5)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.KA then local h=gh()if h then for _,v in pairs(W.Enemies:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v:FindFirstChildOfClass("Humanoid")then local u=v:FindFirstChildOfClass("Humanoid")if u.Health>0 and(v.HumanoidRootPart.Position-h.Position).Magnitude<50 then kp(Enum.KeyCode.Z,.03)kp(Enum.KeyCode.X,.03)kp(Enum.KeyCode.C,.03)end end end end end task.wait(.1)end end)

task.spawn(function()while true do if getgenv().C.FA then kp(Enum.KeyCode.Z,.01)kp(Enum.KeyCode.X,.01)kp(Enum.KeyCode.C,.01)end task.wait(.05)end end)

task.spawn(function()while true do if getgenv().C.AH then pcall(function()RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Haki","1")end)end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.CC then for _,v in pairs(W:GetChildren())do if v.Name:find("Chest")or v.Name:find("chest")then if v:IsA("Model")or v:IsA("BasePart")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.CB then for _,v in pairs(W:GetChildren())do if v.Name:find("Berry")or v.Name:find("berry")then if v:IsA("Model")and v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.CH then for _,v in pairs(W:GetChildren())do if v.Name:find("Hop")or v.Name:find("hop")then if v:IsA("Model")and v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.CM then for _,v in pairs(W:GetChildren())do if v.Name:find("Bone")or v.Name:find("Candy")or v.Name:find("Material")then if v:IsA("BasePart")or v:IsA("Model")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.2)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.AA then for _,v in pairs(W:GetChildren())do if v.Name:find("Apple")or v.Name:find("apple")then if v:IsA("BasePart")or v:IsA("Model")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)

task.spawn(function()while true do if getgenv().C.AFK then pcall(function()V:SendKeyEvent(true,Enum.KeyCode.F,false,game)V:SendKeyEvent(false,Enum.KeyCode.F,false,game)end)end task.wait(60)end end)

LP.CharacterAdded:Connect(function(c)task.wait(3)if getgenv().C.AResp then local u=c:FindFirstChildOfClass("Humanoid")if u and u.Health<=0 then u.Health=u.MaxHealth end end end)

local EO={}
local function cE(pl)if pl==LP then return end local b=Drawing.new("Square")b.Visible=false b.Color=Color3.fromRGB(255,0,0)b.Thickness=1 b.Filled=false local n=Drawing.new("Text")n.Visible=false n.Color=Color3.fromRGB(255,255,255)n.Size=14 n.Center=true n.Outline=true EO[pl]={b=b,n=n}end
for _,pl in pairs(P:GetPlayers())do cE(pl)end
P.PlayerAdded:Connect(cE)
P.PlayerRemoving:Connect(function(pl)if EO[pl]then EO[pl].b:Remove()EO[pl].n:Remove()EO[pl]=nil end end)

R.RenderStepped:Connect(function()
if not getgenv().C.ESP then for _,o in pairs(EO)do o.b.Visible=false o.n.Visible=false end return end
local c=W.CurrentCamera
for pl,o in pairs(EO)do
local ch=pl.Character
if ch and ch:FindFirstChild("HumanoidRootPart")and ch:FindFirstChildOfClass("Humanoid")then
local h=ch.HumanoidRootPart local u=ch:FindFirstChildOfClass("Humanoid")
local p,os=c:WorldToViewportPoint(h.Position)
if os then
local s=(c:WorldToViewportPoint(h.Position+Vector3.new(0,3,0)).Y-c:WorldToViewportPoint(h.Position-Vector3.new(0,3,0)).Y)
o.b.Size=Vector2.new(s*1.5,s)o.b.Position=Vector2.new(p.X-s*.75,p.Y-s*.5)o.b.Visible=true
o.n.Text=pl.Name.." ["..math.floor(u.Health).."]"o.n.Position=Vector2.new(p.X,p.Y-s*.7)o.n.Visible=true
else o.b.Visible=false o.n.Visible=false end
else o.b.Visible=false o.n.Visible=false end
end
end)

local g=Instance.new("ScreenGui")g.Name="SwillHub"g.ResetOnSpawn=false g.Parent=LP:WaitForChild("PlayerGui")
local tg=Instance.new("TextButton")tg.Size=UDim2.new(0,50,0,50)tg.Position=UDim2.new(0,10,.5,-25)tg.BackgroundColor3=Color3.fromRGB(30,30,40)tg.Text="🍎"tg.TextSize=24 tg.TextColor3=Color3.fromRGB(255,255,255)tg.Parent=g
local m=Instance.new("Frame")m.Size=UDim2.new(0,300,0,450)m.Position=UDim2.new(.5,-150,.5,-225)m.BackgroundColor3=Color3.fromRGB(25,25,35)m.BorderSizePixel=0 m.Active=true m.Draggable=true m.Visible=false m.Parent=g
local cr=Instance.new("UICorner")cr.CornerRadius=UDim.new(0,8)cr.Parent=m
local t=Instance.new("TextLabel")t.Size=UDim2.new(1,0,0,35)t.BackgroundColor3=Color3.fromRGB(40,40,55)t.Text="🍎 SWILL HUB"t.TextColor3=Color3.fromRGB(255,255,255)t.Font=Enum.Font.GothamBold t.TextSize=16 t.Parent=m
local cl=Instance.new("TextButton")cl.Size=UDim2.new(0,35,0,35)cl.Position=UDim2.new(1,-35,0,0)cl.BackgroundColor3=Color3.fromRGB(150,40,40)cl.Text="✕"cl.TextColor3=Color3.fromRGB(255,255,255)cl.Font=Enum.Font.GothamBold cl.Parent=m
cl.MouseButton1Click:Connect(function()m.Visible=false end)
local s=Instance.new("ScrollingFrame")s.Size=UDim2.new(1,-10,1,-45)s.Position=UDim2.new(0,5,0,40)s.BackgroundTransparency=1 s.BorderSizePixel=0 s.ScrollBarThickness=4 s.CanvasSize=UDim2.new(0,0,0,0)s.AutomaticCanvasSize=Enum.AutomaticSize.Y s.Parent=m
local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,6)l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=s

local function mk(txt,key)
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,34)b.BackgroundColor3=Color3.fromRGB(45,45,60)b.Text=txt..": OFF"b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.Gotham b.TextSize=12 b.Parent=s
local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
b.MouseButton1Click:Connect(function()getgenv().C[key]=not getgenv().C[key]b.Text=txt..": "..(getgenv().C[key]and"ON"or"OFF")b.BackgroundColor3=getgenv().C[key]and Color3.fromRGB(50,120,60)or Color3.fromRGB(45,45,60)end)
end

mk("Auto Farm","AF")mk("Auto Quest","AQ")mk("Auto Raid","ARaid")mk("Auto Bounty","AB")mk("Fruit Sniper","FS")mk("ESP","ESP")mk("Fly","Fly")mk("Infinite Jump","IJ")mk("No Clip","NC")mk("Walk on Water","WW")mk("Kill Aura","KA")mk("Fast Attack","FA")mk("Auto Haki","AH")mk("Anti-Ragdoll","AR")mk("No Stun","NS")mk("Collect Chest","CC")mk("Collect Berry","CB")mk("Collect Hop","CH")mk("Collect Materials","CM")mk("Apple Farm","AA")mk("Anti-AFK","AFK")mk("Auto Respawn","AResp")mk("Safe Mode","SM")

tg.MouseButton1Click:Connect(function()m.Visible=not m.Visible end)

nt("SWILL HUB","Loaded successfully.")
print("[SWILL HUB] Loaded.")
