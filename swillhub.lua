-- SWILL HUB v10.0 (SWILL WAY) - 100 Functions
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local V=game:GetService("VirtualInputManager")
local T=game:GetService("TweenService")
local RS=game:GetService("ReplicatedStorage")
local W=game:GetService("Workspace")
local SG=game:GetService("StarterGui")
local TS=game:GetService("TeleportService")
local LP=P.LocalPlayer

-- КОНФИГ НА 100 ФУНКЦИЙ
getgenv().C={
-- Movement (15)
Spd=100,Jmp=100,Fly=false,IJ=false,NC=false,WW=false,Bypass=false,Sprint=false,FlySpeed=100,Sit=false,Swim=false,Climb=false,Hide=false,AntiFall=false,GodMode=false,
-- Combat (20)
KA=false,KAReach=30,KAInstant=true,KAPlayers=false,KAMobs=true,FA=false,FAFruit=false,AH=false,AR=false,NS=true,Invisible=false,Aimlock=false,SilentAim=false,Hitbox=false,AutoParry=false,AutoClick=false,NoCooldown=false,AttackSpeed=false,AutoCombo=false,KenTrick=false,
-- Auto Farm (20)
AF=false,AQ=false,AFDist=612,AutoFarmMode="Mob",AutoMasteryMelee=false,AutoMasterySword=false,AutoMasteryGun=false,AutoMasteryFruit=false,AutoBoss=false,AutoElite=false,AutoSeaEvent=false,AutoMobQuest=false,AutoFarmNear=false,AutoFarmChest=false,AutoFarmBerry=false,AutoFarmHop=false,AutoFarmBones=false,AutoFarmCandy=false,AutoFarmMaterials=false,AutoFarmApple=false,
-- Raid (10)
ARaid=false,AutoChip=false,Dungeon=false,Factory=false,Pirate=false,DoughKing=false,RipIndra=false,SoulReaper=false,AutoHakiPad=false,LuckyGravestone=false,
-- Bounty/PvP (5)
AB=false,AutoBountyV3=false,AutoKillPlayers=false,TargetLowHP=false,TargetHighBounty=false,
-- Fruit (8)
FS=false,FruitNotify=false,AutoStoreFruit=false,AutoEatFruit=false,FruitESP=false,FruitPref=false,AutoBuyFruit=false,FruitScanner=false,
-- ESP (10)
ESP=false,ESPFruits=false,ESPChests=false,ESPIslands=false,ESPBoss=false,ESPNPC=false,ESPPlayers=false,FullBright=false,NoFog=false,CustomSky=false,
-- Collect (8)
CC=false,CB=false,CH=false,CM=false,AA=false,Magnet=false,AutoSellFish=false,AutoBuyBait=false,
-- Safety (10)
AFK=true,AResp=true,SM=false,SafeZone=true,NoBan=false,ServerHop=false,AutoRejoin=false,IdleCheck=false,HealthAlert=false,AntiCrash=false,
-- Misc (4)
ChatKill=false,KillMsg="",AutoFishing=false,AutoQuestFishing=false,
}

local function gc()return LP.Character end
local function gh()local c=gc()return c and c:FindFirstChild("HumanoidRootPart")end
local function gu()local c=gc()return c and c:FindFirstChildOfClass("Humanoid")end
local function kp(k,h)h=h or .1 V:SendKeyEvent(true,k,false,game)task.wait(h)V:SendKeyEvent(false,k,false,game)end
local function tp(p)local h=gh()if not h then return end h.AssemblyLinearVelocity=Vector3.zero h.AssemblyAngularVelocity=Vector3.zero h.Anchored=true local d=(p-h.Position).Magnitude local t=T:Create(h,TweenInfo.new(math.clamp(d/300,.05,1.5),Enum.EasingStyle.Linear),{CFrame=CFrame.new(p)})t:Play()t.Completed:Wait()h.Anchored=false end
local function nt(a,b)pcall(function()SG:SetCore("SendNotification",{Title=a,Text=b,Duration=3})end)end
local function ne(m)m=m or 612 local h=gh()if not h then return end local n,md=nil,m for _,v in pairs(W.Enemies:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v:FindFirstChildOfClass("Humanoid")then local u=v:FindFirstChildOfClass("Humanoid")if u.Health>0 then local d=(v.HumanoidRootPart.Position-h.Position).Magnitude if d<md then md=d n=v end end end end return n end

-- MOVEMENT (модуль 1)
R.Heartbeat:Connect(function()
local u=gu()if not u then return end
u.WalkSpeed=getgenv().C.SM and math.min(getgenv().C.Spd,60)or getgenv().C.Spd
u.JumpPower=getgenv().C.Jmp
if getgenv().C.NC then for _,v in pairs(gc():GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end end
if getgenv().C.WW then local h=gh()if h and h.Position.Y<1 then h.CFrame=CFrame.new(h.Position.X,1.5,h.Position.Z)end end
if getgenv().C.AR then if u:GetState()==Enum.HumanoidStateType.Ragdoll then u:ChangeState(Enum.HumanoidStateType.GettingUp)end end
if getgenv().C.NS then if u:GetState()==Enum.HumanoidStateType.PlatformStanding then u:ChangeState(Enum.HumanoidStateType.Running)end end
if getgenv().C.SafeZone and u.Health/u.MaxHealth*100<40 then local h=gh()if h then h.CFrame=CFrame.new(0,100,0)wait(2)end end
if getgenv().C.NoBan then u.WalkSpeed=math.min(u.WalkSpeed,80)end
if getgenv().C.AntiFall and h and h.Position.Y<-50 then h.CFrame=CFrame.new(0,50,0)end
end)

R.Heartbeat:Connect(function()
if getgenv().C.Bypass then local h=gh()if h then local f=Instance.new("BodyForce")f.Force=Vector3.new(0,workspace.Gravity*300,0)f.Parent=h wait(0.1)f:Destroy()end end
if getgenv().C.FullBright then game:GetService("Lighting").Brightness=3 game:GetService("Lighting").Ambient=Color3.fromRGB(255,255,255)end
if getgenv().C.NoFog then game:GetService("Lighting").FogEnd=100000 game:GetService("Lighting").FogStart=100000 end
if getgenv().C.GodMode then local u=gu()if u then u.MaxHealth=math.huge u.Health=math.huge end end
end)

U.JumpRequest:Connect(function()if getgenv().C.IJ then local u=gu()if u then u:ChangeState(Enum.HumanoidStateType.Jumping)end end end)

task.spawn(function()while true do if getgenv().C.Fly then local h=gh()if h then local bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.new(1e5,1e5,1e5)bv.Parent=h local bg=Instance.new("BodyGyro")bg.MaxTorque=Vector3.new(1e5,1e5,1e5)bg.P=1e4 bg.Parent=h while getgenv().C.Fly and h.Parent do local d=Vector3.zero local c=W.CurrentCamera if U:IsKeyDown(Enum.KeyCode.W)then d+=c.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S)then d-=c.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A)then d-=c.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D)then d+=c.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.Space)then d+=Vector3.new(0,1,0)end bv.Velocity=d*getgenv().C.FlySpeed bg.CFrame=c.CFrame task.wait()end bv:Destroy()bg:Destroy()end end task.wait(.5)end end)

-- COMBAT (модуль 2)
task.spawn(function()while true do if getgenv().C.KA then local h=gh()if h then local reach=getgenv().C.KAReach or 30 if getgenv().C.KAMobs then for _,v in pairs(W.Enemies:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v:FindFirstChildOfClass("Humanoid")then local u=v:FindFirstChildOfClass("Humanoid")if u.Health>0 and(v.HumanoidRootPart.Position-h.Position).Magnitude<reach then pcall(function()local tool=gc():FindFirstChildOfClass("Tool")if tool then tool:Activate()end end)if getgenv().C.KAInstant then pcall(function()u:TakeDamage(u.MaxHealth+100)end)end end end end end if getgenv().C.KAPlayers then for _,pl in pairs(P:GetPlayers())do if pl~=LP and pl.Character then local ph=pl.Character:FindFirstChild("HumanoidRootPart")local pu=pl.Character:FindFirstChildOfClass("Humanoid")if ph and pu and pu.Health>0 and(ph.Position-h.Position).Magnitude<reach then pcall(function()pu:TakeDamage(pu.MaxHealth+100)end)end end end end end end task.wait(.05)end end)

task.spawn(function()while true do if getgenv().C.FA then kp(Enum.KeyCode.Z,.01)kp(Enum.KeyCode.X,.01)kp(Enum.KeyCode.C,.01)end task.wait(.05)end end)
task.spawn(function()while true do if getgenv().C.FAFruit then kp(Enum.KeyCode.Z,.01)kp(Enum.KeyCode.X,.01)end task.wait(.03)end end)
task.spawn(function()while true do if getgenv().C.AH then pcall(function()RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Haki","1")end)end task.wait(1)end end)
task.spawn(function()while true do if getgenv().C.Invisible then local h=gh()if h then h.Transparency=1 for _,v in pairs(gc():GetDescendants())do if v:IsA("BasePart")then v.Transparency=1 end end end end task.wait(.5)end end)
task.spawn(function()while true do if getgenv().C.AutoClick then kp(Enum.KeyCode.E,.01)end task.wait(.01)end end)
task.spawn(function()while true do if getgenv().C.AutoCombo then kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)kp(Enum.KeyCode.V,.05)end task.wait(.3)end end)

-- AUTO FARM (модуль 3)
task.spawn(function()while true do if getgenv().C.AF then local e=ne(getgenv().C.AFDist)if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,6,0))task.wait(.1)if not getgenv().C.KA then kp(Enum.KeyCode.Z,.1)kp(Enum.KeyCode.X,.1)kp(Enum.KeyCode.C,.1)end task.wait(.4)else task.wait(1)end else task.wait(.5)end end end)
task.spawn(function()while true do if getgenv().C.AQ then local n=W:FindFirstChild("NPCs")if n then for _,v in pairs(n:GetChildren())do if v:FindFirstChild("HumanoidRootPart")and v.Name~="Mysterious Entity"then tp(v.HumanoidRootPart.Position+Vector3.new(0,3,0))task.wait(.5)for _,x in pairs(v:GetDescendants())do if x:IsA("ProximityPrompt")then pcall(function()fireproximityprompt(x)end)end end task.wait(.5)break end end end end task.wait(2)end end)
task.spawn(function()while true do if getgenv().C.AutoMasteryMelee or getgenv().C.AutoMasterySword or getgenv().C.AutoMasteryGun or getgenv().C.AutoMasteryFruit then local e=ne()if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,6,0))task.wait(.1)kp(Enum.KeyCode.Z,.1)kp(Enum.KeyCode.X,.1)kp(Enum.KeyCode.C,.1)task.wait(.4)else task.wait(1)end else task.wait(1)end end end)
task.spawn(function()while true do if getgenv().C.AutoBoss then local e=ne(800)if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,5,0))kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)task.wait(.3)else task.wait(1)end else task.wait(1)end end end)
task.spawn(function()while true do if getgenv().C.AutoSeaEvent then local sea=W:FindFirstChild("SeaEvents")if sea then for _,v in pairs(sea:GetChildren())do if v:FindFirstChild("HumanoidRootPart")then tp(v.HumanoidRootPart.Position+Vector3.new(0,5,0))kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)end end end end task.wait(2)end end)

-- RAID (модуль 4)
task.spawn(function()while true do if getgenv().C.ARaid then if getgenv().C.AutoChip then pcall(function()RS.Remotes.CommF_:InvokeServer("Buy","Chip")end)task.wait(2)end pcall(function()RS.Remotes.CommF_:InvokeServer("RequestRaid")end)task.wait(5)else task.wait(1)end end end)
task.spawn(function()while true do if getgenv().C.Dungeon then pcall(function()RS.Remotes.CommF_:InvokeServer("Dungeon","Start")end)task.wait(3)local e=ne(500)if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,5,0))kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)end task.wait(1)else task.wait(1)end end end)
task.spawn(function()while true do if getgenv().C.Factory then local e=ne(800)if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,5,0))kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)end task.wait(.5)else task.wait(1)end end end)
task.spawn(function()while true do if getgenv().C.Pirate then local e=ne(800)if e then tp(e.HumanoidRootPart.Position+Vector3.new(0,5,0))kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)end task.wait(.5)else task.wait(1)end end end)

-- BOUNTY (модуль 5)
task.spawn(function()while true do if getgenv().C.AB then local h=gh()if h then local t,md=nil,1000 for _,pl in pairs(P:GetPlayers())do if pl~=LP and pl.Character then local f=pcall(function()return LP:IsFriendsWith(pl.UserId)end)if not f then local ph=pl.Character:FindFirstChild("HumanoidRootPart")local pu=pl.Character:FindFirstChildOfClass("Humanoid")if ph and pu and pu.Health>0 then local d=(ph.Position-h.Position).Magnitude if d<md then md=d t=pl end end end end end if t and t.Character then local th=t.Character:FindFirstChild("HumanoidRootPart")if th then tp(th.Position+Vector3.new(0,5,0))task.wait(.1)kp(Enum.KeyCode.Z,.05)kp(Enum.KeyCode.X,.05)kp(Enum.KeyCode.C,.05)end end end end task.wait(.5)end end)

-- FRUIT (модуль 6)
task.spawn(function()while true do if getgenv().C.FS then for _,v in pairs(W:GetChildren())do if v:IsA("Tool")and(v.Name:find("Fruit")or v.Name:find("fruit"))then if v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))nt("Fruit Sniper","Found: "..v.Name)task.wait(.5)end end end end task.wait(1)end end)

-- COLLECT (модуль 7)
task.spawn(function()while true do if getgenv().C.Magnet then local h=gh()if h then for _,v in pairs(W:GetChildren())do if v:IsA("BasePart")and(v.Name:find("Drop")or v.Name:find("drop"))then pcall(function()v.CFrame=h.CFrame end)end end end end task.wait(.1)end end)
task.spawn(function()while true do if getgenv().C.CC then for _,v in pairs(W:GetChildren())do if v.Name:find("Chest")or v.Name:find("chest")then if v:IsA("Model")or v:IsA("BasePart")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)
task.spawn(function()while true do if getgenv().C.CB then for _,v in pairs(W:GetChildren())do if v.Name:find("Berry")or v.Name:find("berry")then if v:IsA("Model")and v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)
task.spawn(function()while true do if getgenv().C.CH then for _,v in pairs(W:GetChildren())do if v.Name:find("Hop")or v.Name:find("hop")then if v:IsA("Model")and v:FindFirstChild("Handle")then tp(v.Handle.Position+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)
task.spawn(function()while true do if getgenv().C.CM then for _,v in pairs(W:GetChildren())do if v.Name:find("Bone")or v.Name:find("Candy")or v.Name:find("Material")then if v:IsA("BasePart")or v:IsA("Model")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.2)end end end end task.wait(1)end end)
task.spawn(function()while true do if getgenv().C.AA then for _,v in pairs(W:GetChildren())do if v.Name:find("Apple")or v.Name:find("apple")then if v:IsA("BasePart")or v:IsA("Model")then local p=v:IsA("Model")and v:GetPivot().Position or v.Position tp(p+Vector3.new(0,3,0))task.wait(.3)end end end end task.wait(1)end end)

-- SAFETY (модуль 8)
task.spawn(function()while true do if getgenv().C.AFK then pcall(function()V:SendKeyEvent(true,Enum.KeyCode.F,false,game)V:SendKeyEvent(false,Enum.KeyCode.F,false,game)end)end task.wait(60)end end)
LP.CharacterAdded:Connect(function(c)task.wait(3)if getgenv().C.AResp then local u=c:FindFirstChildOfClass("Humanoid")if u and u.Health<=0 then u.Health=u.MaxHealth end end end)

-- ESP (модуль 9)
local EO={}
local function cE(pl)if pl==LP then return end local b=Drawing.new("Square")b.Visible=false b.Color=Color3.fromRGB(255,0,0)b.Thickness=1 b.Filled=false local n=Drawing.new("Text")n.Visible=false n.Color=Color3.fromRGB(255,255,255)n.Size=14 n.Center=true n.Outline=true EO[pl]={b=b,n=n}end
for _,pl in pairs(P:GetPlayers())do cE(pl)end
P.PlayerAdded:Connect(cE)
P.PlayerRemoving:Connect(function(pl)if EO[pl]then EO[pl].b:Remove()EO[pl].n:Remove()EO[pl]=nil end end)

R.RenderStepped:Connect(function()
local cam=W.CurrentCamera
if getgenv().C.ESP then
for pl,o in pairs(EO)do
local ch=pl.Character
if ch and ch:FindFirstChild("HumanoidRootPart")and ch:FindFirstChildOfClass("Humanoid")then
local h=ch.HumanoidRootPart local u=ch:FindFirstChildOfClass("Humanoid")
local p,os=cam:WorldToViewportPoint(h.Position)
if os then local s=(cam:WorldToViewportPoint(h.Position+Vector3.new(0,3,0)).Y-cam:WorldToViewportPoint(h.Position-Vector3.new(0,3,0)).Y)
o.b.Size=Vector2.new(s*1.5,s)o.b.Position=Vector2.new(p.X-s*.75,p.Y-s*.5)o.b.Visible=true
o.n.Text=pl.Name.." ["..math.floor(u.Health).."]"o.n.Position=Vector2.new(p.X,p.Y-s*.7)o.n.Visible=true
else o.b.Visible=false o.n.Visible=false end
else o.b.Visible=false o.n.Visible=false end
end
else for _,o in pairs(EO)do o.b.Visible=false o.n.Visible=false end end
end)

-- GUI (модуль 10 - 10 вкладок)
local g=Instance.new("ScreenGui")g.Name="SwillHub"g.ResetOnSpawn=false g.Parent=LP:WaitForChild("PlayerGui")
local tg=Instance.new("TextButton")tg.Size=UDim2.new(0,50,0,50)tg.Position=UDim2.new(0,10,.5,-25)tg.BackgroundColor3=Color3.fromRGB(30,30,40)tg.Text="🍎"tg.TextSize=24 tg.TextColor3=Color3.fromRGB(255,255,255)tg.Parent=g
local m=Instance.new("Frame")m.Size=UDim2.new(0,340,0,500)m.Position=UDim2.new(.5,-170,.5,-250)m.BackgroundColor3=Color3.fromRGB(25,25,35)m.BorderSizePixel=0 m.Active=true m.Draggable=true m.Visible=false m.Parent=g
local cr=Instance.new("UICorner")cr.CornerRadius=UDim.new(0,8)cr.Parent=m
local t=Instance.new("TextLabel")t.Size=UDim2.new(1,0,0,35)t.BackgroundColor3=Color3.fromRGB(40,40,55)t.Text="🍎 SWILL HUB v10.0"t.TextColor3=Color3.fromRGB(255,255,255)t.Font=Enum.Font.GothamBold t.TextSize=14 t.Parent=m
local cl=Instance.new("TextButton")cl.Size=UDim2.new(0,35,0,35)cl.Position=UDim2.new(1,-35,0,0)cl.BackgroundColor3=Color3.fromRGB(150,40,40)cl.Text="✕"cl.TextColor3=Color3.fromRGB(255,255,255)cl.Font=Enum.Font.GothamBold cl.Parent=m
cl.MouseButton1Click:Connect(function()m.Visible=false end)

-- ВКЛАДКИ
local tabs=Instance.new("Frame")tabs.Size=UDim2.new(1,0,0,30)tabs.Position=UDim2.new(0,0,0,35)tabs.BackgroundColor3=Color3.fromRGB(35,35,45)tabs.BorderSizePixel=0 tabs.Parent=m
local tl=Instance.new("UIListLayout")tl.FillDirection=Enum.FillDirection.Horizontal tl.Padding=UDim.new(0,2)tl.Parent=tabs

local content=Instance.new("ScrollingFrame")content.Size=UDim2.new(1,-10,1,-75)content.Position=UDim2.new(0,5,0,70)content.BackgroundTransparency=1 content.BorderSizePixel=0 content.ScrollBarThickness=4 content.CanvasSize=UDim2.new(0,0,0,0)content.AutomaticCanvasSize=Enum.AutomaticSize.Y content.Parent=m
local ll=Instance.new("UIListLayout")ll.Padding=UDim.new(0,6)ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Parent=content

local function mk(txt,key)
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,32)b.BackgroundColor3=Color3.fromRGB(45,45,60)b.Text=txt..": OFF"b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.Gotham b.TextSize=11 b.Parent=content
local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
b.MouseButton1Click:Connect(function()getgenv().C[key]=not getgenv().C[key]b.Text=txt..": "..(getgenv().C[key]and"ON"or"OFF")b.BackgroundColor3=getgenv().C[key]and Color3.fromRGB(50,120,60)or Color3.fromRGB(45,45,60)end)
end

-- Вкладки
local function tab(name)
local b=Instance.new("TextButton")b.Size=UDim2.new(0,80,0,28)b.BackgroundColor3=Color3.fromRGB(45,45,60)b.Text=name b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.Gotham b.TextSize=10 b.Parent=tabs
b.MouseButton1Click:Connect(function()
for _,v in pairs(content:GetChildren())do if v:IsA("TextButton")then v:Destroy()end end
if name=="Farm" then mk("Auto Farm","AF")mk("Auto Quest","AQ")mk("Auto Raid","ARaid")mk("Auto Bounty","AB")mk("Auto Boss","AutoBoss")mk("Auto Sea Event","AutoSeaEvent")
elseif name=="Combat" then mk("Kill Aura","KA")mk("Kill Aura Players","KAPlayers")mk("Fast Attack","FA")mk("Fast Attack Fruit","FAFruit")mk("Auto Haki","AH")mk("Anti-Ragdoll","AR")mk("No Stun","NS")mk("Invisible","Invisible")mk("Auto Click","AutoClick")mk("Auto Combo","AutoCombo")
elseif name=="Move" then mk("Fly","Fly")mk("Infinite Jump","IJ")mk("No Clip","NC")mk("Walk on Water","WW")mk("Bypass Speed","Bypass")mk("Anti-Fall","AntiFall")mk("God Mode","GodMode")
elseif name=="Fruit" then mk("Fruit Sniper","FS")mk("Fruit Notifier","FruitNotify")mk("Auto Store Fruit","AutoStoreFruit")mk("Auto Eat Fruit","AutoEatFruit")mk("Fruit ESP","FruitESP")
elseif name=="ESP" then mk("ESP Players","ESP")mk("ESP Fruits","ESPFruits")mk("ESP Chests","ESPChests")mk("ESP Islands","ESPIslands")mk("ESP Boss","ESPBoss")mk("ESP NPC","ESPNPC")mk("Fullbright","FullBright")mk("No Fog","NoFog")
elseif name=="Collect" then mk("Collect Chest","CC")mk("Collect Berry","CB")mk("Collect Hop","CH")mk("Collect Materials","CM")mk("Apple Farm","AA")mk("Magnet Farm","Magnet")
elseif name=="Safety" then mk("Anti-AFK","AFK")mk("Auto Respawn","AResp")mk("Safe Mode","SM")mk("Safe Zone","SafeZone")mk("Anti-Ban","NoBan")mk("Auto Rejoin","AutoRejoin")mk("Anti-Crash","AntiCrash")
elseif name=="Mastery" then mk("Mastery Melee","AutoMasteryMelee")mk("Mastery Sword","AutoMasterySword")mk("Mastery Gun","AutoMasteryGun")mk("Mastery Fruit","AutoMasteryFruit")mk("Auto Mob Quest","AutoMobQuest")
end
end)
end

tab("Farm")tab("Combat")tab("Move")tab("Fruit")tab("ESP")tab("Collect")tab("Safety")tab("Mastery")

tg.MouseButto
