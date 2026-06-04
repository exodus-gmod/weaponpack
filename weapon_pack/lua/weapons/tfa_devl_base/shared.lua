SWEP.Base = "tfa_bash_base"
SWEP.Category				= "TFA Devil Customs" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer 			= "" --Manufacturer (not design institute. For instance, people keep listing the AS VAL as being manufactured by TsNIITochMash, but TsNIITochMash was just the design institute. Tula Arms Plant was the manufacturer.
SWEP.Author					= "Dead-Eye Devil" --I prefer to list this as the person who designed the firearm in question.
//SWEP.Contact				= "https://steamcommunity.com/id/DeadEyeDevil/" --Steam Idle_Blend
//SWEP.Contact 				= "Seth@laneys.info" -- my email if there's something absolutely game-breaking.
//SWEP.Contact 				= "https://discord.gg/GD2pXAtnaN" -- Permanent invite to my Discord Server if you want to join. Come and hang out I guess.
SWEP.Instructions			= "" --Instructions. This doesn't show up anywhere in the cl_hud though.
SWEP.Spawnable				= false --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= false --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= false		-- Draw the crosshair?
SWEP.DrawCrosshairIS 		= false --Draw the crosshair in ironsights?
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.Type 					= "" --I like to use this field to define a term in the Weapon's name, or to translate words/acronyms from other languages. AS VAL would have a SWEP.Type of "Avtomat Specialn'yj Val", AK-47 would be "Avotmat Kalashnikova goda 1947", MP5 would be "MaschinePistole 5."
SWEP.Description 			= "" --This field actually replaces the SWEP.category in the cl_hud. Your weapon will still be categorized in the spawnmenu by SWEP.Category, but SWEP.Description will be what appears in the inspection menu.
SWEP.Action 				= "" --The mechanism with which your weapon operates. Kalashnikovs are "Long-stroke, gas-operated, rotating bolt" AR-15s are "Direct impingement, gas-operated, rotating bolt" Makarovs are "Direct-blowback," and bolt-action sniper rifles are "hand-operated, bolt-action."
SWEP.GRAU					= "" --For weapons registered within the GRAU Index. All weapons are 6ПXX, with XX being whatever number comes after. For example, the AKM is 6П1, an AS VAL is 6П30, an AN-94 is 6П33, and an AEK-971 is 6П67.
//SWEP.ProductionYear		= math.random(1955, 2020) --This was thought up by GroveZ. I just decided to do the same thing. For TFA HUDs that support it, SWEP.ProductionYear is pretty much a randomized per-weapon stat that tells you the year your gun was made. Here, we have a math.random formula for an AKM.
SWEP.Purpose				= "" --Purpose. Why the hell was your gun made?
SWEP.Ergonomics				= 15 --This can affects ADS Speed.
SWEP.Weight             	= nil --this is actually an interesting mechanic, because of the SWEP.MoveSpeed function. Input the weapon's weight in kilograms, and multiply by ten.

--[[RECOIL SCHEMA]]-- Thanks to GroveZ for building pretty much everything, but Dead-Eye Devil for converting it to the new TFA System.
//SWEP.Primary.KickUp = nil
//SWEP.Primary.KickDown = SWEP.Primary.KickUp / 2.25 -- This is the maximum downwards recoil (skeet)
//SWEP.Primary.KickHorizontal = nil
//SWEP.Primary.SpreadIncrement = (SWEP.Primary.KickUp + SWEP.Primary.KickDown + SWEP.Primary.KickHorizontal) / 2
//SWEP.MoveSpeed = 0.01 * (100 - ((SWEP.Weight / 10) + ((SWEP.Weight / 10) - 1.65)))
SWEP.Primary.Velocity = 340 --YOU MUST FILL THIS FIELD. This stat is measured in m/s, not hammer units.
// SWEP.IronSightTime = (((SWEP.Ergonomics * -1) + 100) * 0.01) + 0.25
// SWEP.Primary.IronAccuracy = 2 / 10800

-- Here at Devil Customs, we like to measure our weapons' accuracy with real-life study results. Simply put, I measure my gun's accuracy with real-life statistics and measurements. I don't put my IronAccuracy at shit like SWEP.Primary.Spread * 0.75, or even shit like 0.0001 (automatic 1.08 MOA).
-- I take the real-life accuracy measurements for my guns - which can sometimes get difficult, as weapons like the AK Alpha and AS VAL are often so-top secret or restricted to the American public that getting an MOA stat is near-impossible, leading oftentimes to guesswork.
-- To find your weapon's IronAccuracy, study up on your weapon, and take a simple real-life stat. MOA (Margin Of Accuracy) is the average spread of a weapon's shots taken at ~100m. 1 MOA is one 60th of a degree, or 1 / 10800
-- To get this stat in GMod, just take the MOA and divide it by 180, then again by 60. For a single calculation, just divide once by 10800. Here, we see a weapon with an MOA of 2. This, believe it or not, is the actual accuracy capability of an AK-103 that has fired over 1,400 rounds non-stop (see link 1).
-- This weapon, then, is likely a simple assault rifle. Most Kalashnikovs can boast 2-MOA at 100m. A high-quality assault rifle might even boast sub-MOA accuracy, putting this stat at less than 1 / 10800. This means that the weapon is quite accurate, but not the best weapon on offer.
-- Medium and high-tier sniper rifles (E.G. Accuracy International AWM,,Orsis T-5000M, Ruger Precision Rifle, etc.) tend to have sub-1 MOA accuracy, but due to the nature of precision shooting, many variables play into a shooter's accuracy - elevation, wind direction and speed, humidity, target motion/velocity, bullet velocity, scope zeroing, Earth's rotation - even the way you pull the trigger has an effect.
-- For real precision shooting, I recommend StormFox (see link 2). TFA may not take rain, snow, and temperature into effect in ballistics, but I do know that StormFox's wind system really makes sniping interesting.

SWEP.MaxPenetrationCounter = nil --The maximum number of ricochets.  To prevent stack overflows.
SWEP.Primary.MaxPenetration = 100 --does this even change anything?
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.FiresUnderwater = false
--Miscelaneous Sounds
SWEP.Primary.LoopSound = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced = nil -- Loop end/tail sound, silenced
SWEP.Primary.SubsonicSound = Sound("DEVL_SUBSONIC.2")
SWEP.IronInSound = Sound("TFA_DEVL.IronIn")
SWEP.IronOutSound = Sound("TFA_DEVL.IronOut")
SWEP.Subsonic = false --Determines whether your bullets are subsonic. If muzzle velocity is over 340 m/s set this to false. Working on an automatic function.
--[[VIEWMODEL]]--
SWEP.VMPos = Vector(0, 0, 0)
SWEP.VMAng = Vector(0, 0, 0)
SWEP.UseHands = true --Use gmod c_arms system.

SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS.

SWEP.ScopeOverlayTransforms = {0, 0}
SWEP.ScopeOverlayTransformMultiplier = 0.8
SWEP.ScopeShadow = nil
SWEP.ScopeReticule = nil
SWEP.ScopeDirt = nil
SWEP.ScopeReticule_CrossCol = false
SWEP.ScopeReticule_Scale = {1, 1}
SWEP.ScopeAngleTransforms = {}
SWEP.ScopeLegacyOrientation = false --used to align with eyeangles instead of vm angles
SWEP.Walk_Mode = TFA.Enum.LOCOMOTION_LUA

SWEP.BO4Weapon = true
SWEP.FirstDeployEnabled = true
SWEP.LaserDotISMovement = true

if CLIENT then
	SWEP.ElementRender = {}
	SWEP.ElementRenderWorld = {}
end

local function l_Lerp(v, f, t)
	return f + (t - f) * v
end

local l_Lerp = function(t, a, b) return a + (b - a) * t end

local l_mathApproach = math.Approach
local l_CT = CurTime














local target_pos, target_ang, adstransitionspeed, hls
local flip_vec = Vector(-1, 1, 1)
local flip_ang = Vector(1, -1, -1)
local cl_tfa_viewmodel_offset_x
local cl_tfa_viewmodel_offset_y, cl_tfa_viewmodel_offset_z, cl_tfa_viewmodel_centered
local intensityWalk, intensityRun, intensityBreath

if CLIENT then
	cl_tfa_viewmodel_offset_x = GetConVar("cl_tfa_viewmodel_offset_x")
	cl_tfa_viewmodel_offset_y = GetConVar("cl_tfa_viewmodel_offset_y")
	cl_tfa_viewmodel_offset_z = GetConVar("cl_tfa_viewmodel_offset_z")
	cl_tfa_viewmodel_centered = GetConVar("cl_tfa_viewmodel_centered")
end

target_pos = Vector()
target_ang = Vector()
local centered_sprintpos = Vector(0, -1, 1)
local centered_sprintang = Vector(-15, 0, 0)
local vmviewpunch_cv
local vm_offset_pos = Vector()
local vm_offset_ang = Angle()
--local fps_max_cvar = GetConVar("fps_max")
local righthanded, shouldflip, cl_vm_flip_cv, cl_vm_nearwall, fovmod_add, fovmod_mult
SWEP.WeaponLength = 0

function SWEP:UpdateWeaponLength()
	if not self:VMIV() then return end
	local vm = self.OwnerViewModel
	local mzpos = self:GetMuzzlePos()
	if not mzpos then return end
	if not mzpos.Pos then return end
	if GetViewEntity and GetViewEntity() ~= self:GetOwner() then return end
	local mzVec = vm:WorldToLocal(mzpos.Pos)
	self.WeaponLength = math.abs(mzVec.x)
end

	SWEP.NearWallVector = Vector(.5, -0.75, .1):GetNormalized() * 0.5
	SWEP.NearWallVectorADS = Vector(.5, -0.75, .1):GetNormalized() * 0.25

function SWEP:CalculateNearWall(p, a)
	if not self:OwnerIsValid() then return p, a end

	if not cl_vm_nearwall then
		cl_vm_nearwall = GetConVar("cl_tfa_viewmodel_nearwall")
	end

	if not cl_vm_nearwall or not cl_vm_nearwall:GetBool() then return p, a end

	local sp = self:GetOwner():GetShootPos()
	local ea = self:GetOwner():EyeAngles()
	local et = util.QuickTrace(sp,ea:Forward()*128,{self,self:GetOwner()})--self:GetOwner():GetEyeTrace()
	local dist = et.HitPos:Distance(sp)
	if dist<1 then
		et=util.QuickTrace(sp,ea:Forward()*128,{self,self:GetOwner(),et.Entity})
		dist = et.HitPos:Distance(sp)
	end

	self:UpdateWeaponLength()

	local nw_offset_vec = self:GetIronSights() and self.NearWallVectorADS or self.NearWallVector
	local off = self.WeaponLength - dist

	if self:GetStat("Blowback_PistolMode") then
	if off > 0 then
		p = p + nw_offset_vec * off / 2
		local posCompensated = sp * 1
		posCompensated:Add(ea:Right() * nw_offset_vec.x * off / .035 * (self.ViewModelFlip and -1 or 1))
		posCompensated:Add(ea:Forward() * nw_offset_vec.y * off / .02)
		posCompensated:Add(ea:Up() * nw_offset_vec.z * off / 2)
		local angleComp = (et.HitPos - posCompensated):Angle()
		a.x = a.x - math.AngleDifference(angleComp.p, ea.p) / -2
		a.y = a.y + math.AngleDifference(angleComp.y, ea.y) / 1.75
	end
	else
	if off > 0 then
		p = p + nw_offset_vec * off / 2
		local posCompensated = sp * 1
		posCompensated:Add(ea:Right() * nw_offset_vec.x * off / .008 * (self.ViewModelFlip and -1 or 1))
		posCompensated:Add(ea:Forward() * nw_offset_vec.y * off / .02)
		posCompensated:Add(ea:Up() * nw_offset_vec.z * off / 2)
		local angleComp = (et.HitPos - posCompensated):Angle()
		a.x = a.x - math.AngleDifference(angleComp.p, ea.p) / -2
		a.y = a.y + math.AngleDifference(angleComp.y, ea.y) / 1.75
	end
	end

	return p, a
end

SWEP.WalkSightPos = SWEP.VMPos
SWEP.WalkSightAng = SWEP.VMAng
SWEP.ShootWalkOverride = true
SWEP.WalkingStartSpeed = 99
SWEP.WalkingEndSpeed = 201

SWEP.viewkickxmult = 1 --Kicks the gun down. Use a negative number to make the gun rise.
SWEP.viewkickymult = 1 --Kicks the gun to the side. Pretty much no reason to go negative.
SWEP.viewkickzmult = 1 --Rotates the gun around the target point. Subtle at reasonable numbers, but if you set this to 100, you'll know what it does pretty quick.
SWEP.viewkickxmulthip = 1 --Kicks the gun down. Use a negative number to make the gun rise.
SWEP.viewkickymulthip = 1 --Kicks the gun to the side. Pretty much no reason to go negative.
SWEP.viewkickzmulthip = 1 --Rotates the gun around the target point. Subtle at reasonable numbers, but if you set this to 100, you'll know what it does pretty quick.
--[[
	There seems to be a lot of versatility in this viewkick management method. It's a little time-consuming, but I'm pretty sure you can balance out the recoil however you want with this. Here's a quick tutorial.
	
	One of the big "claims" of ArcCW is its firing code - mostly just camera shake, really. This system allows you to manipulate recoil in ways that I'd never really even thought of when I built the system.
	Use low values of viewkickxmult to let the natural TFA recoil system add a rougher kick - like firing a weapon from Call of Duty, where most of the recoil is felt via the firing animation and the recoil applied to your crosshair.
	Use medium values of each to give your gun a realistic feel - its what I did on my personal AEK-971 gun, to one extent or the other. Low total recoil, but the viewkick system allows the gun to be felt realistically, as the recoil on an AEK-971 is extremely low, but not non-existant.
	However, you don't want your viewkick and your recoil numbers to conflict - by which I mean, "don't use a high viewkick value and a low recoil value." This will cause an effect that is not exactly desireable, as your crosshair will stay in the same spot, but your gun will fly around in your hands. It just looks bad and broken, really, but if you want to, you can do that.
	For my sniper rifles, I typically use more horizontal recoil than vertical to give a better sense that the gun is putting the recoil into your shoulder, but your aim is still being thrown off target after each shot.
	I tend to keep machine guns pretty stable. A viewkickxmult of around |0.875| to |0.375| depending on firerate and weapon characteristics.
]]--
function SWEP:CalculateViewModelOffset(delta)
	local xmul = self:GetStat("viewkickxmult") -- multiplier to viewkick.
	local ymul = self:GetStat("viewkickymult")
	local zmul = self:GetStat("viewkickzmult")
	local xmulhip = self:GetStat("viewkickxmulthip") -- multiplier to viewkick.
	local ymulhip = self:GetStat("viewkickymulthip")
	local zmulhip = self:GetStat("viewkickzmulthip")

	
	if self:GetStat("VMPos_Additive") then
		target_pos:Zero()
		target_ang:Zero()
	else
		target_pos = self:GetStat("VMPos") * 1
		target_ang = self:GetStat("VMAng") * 1
	end

	if cl_tfa_viewmodel_centered:GetBool() then
		if self:GetStat("CenteredPos") then
			target_pos.x = self:GetStat("CenteredPos").x
			target_pos.y = self:GetStat("CenteredPos").y
			target_pos.z = self:GetStat("CenteredPos").z

			if self:GetStat("CenteredAng") then
				target_ang.x = self:GetStat("CenteredAng").x
				target_ang.y = self:GetStat("CenteredAng").y
				target_ang.z = self:GetStat("CenteredAng").z
			end
		elseif self:GetStat("IronSightsPos") then
			target_pos.x = self:GetStat("IronSightsPos").x
			target_pos.z = target_pos.z - 3

			if self:GetStat("IronSightsAng") then
				target_ang:Zero()
				target_ang.y = self:GetStat("IronSightsAng").y
			end
		end
	end

	adstransitionspeed = 10
	walking = false
	local is = self:GetIronSights()
	local spr = self:GetSprinting()
	local stat = self:GetStatus()
	local speed = LocalPlayer():GetVelocity():Length2D()
	local lowspeed = self:GetStat("WalkingStartSpeed")
	local highspeed = self:GetStat("WalkingEndSpeed") --These define what speed the artificial walking anims start and end at. Designed to work with FineSpeed, you can (in theory) set this to only occur when you're using FineSpeed. Until I come up with a better method, you're going to want to set the highspeed to something like 200-203.
	hls = (TFA.Enum.HolsterStatus[stat] and self.ProceduralHolsterEnabled) or (TFA.Enum.ReloadStatus[stat] and self.ProceduralReloadEnabled)

	if self:GetStat("WalkSightPos") != Vector(0, 0, 0) and self:GetStat("WalkSightAng") != Vector(0, 0, 0) then -- Begin Dead-Eye's walking code
		walking = true
		if self:GetStat("ShootWalkOverride") == true then
			if stat == TFA.Enum.STATUS_SHOOTING and not is then
				target_pos = self.RunSightsPos * 0
				target_ang = self.RunSightsAng * 0
			elseif spr and (self.Sprint_Mode == TFA.Enum.LOCOMOTION_LUA or self.Sprint_Mode == TFA.Enum.LOCOMOTION_HYBRID) then
				target_pos = self:GetStat("RunSightsPos") * 1
				target_ang = self:GetStat("RunSightsAng") * 1
			elseif is == false and speed > lowspeed and speed < highspeed then
				target_pos = self:GetStat("WalkSightPos") * 1
				target_ang = self:GetStat("WalkSightAng") * 1
			end
		end
		
		if self:GetStat("ShootWalkOverride") != true then
			if spr and (self.Sprint_Mode == TFA.Enum.LOCOMOTION_LUA or self.Sprint_Mode == TFA.Enum.LOCOMOTION_HYBRID) then
				target_pos = self:GetStat("RunSightsPos") * 1
				target_ang = self:GetStat("RunSightsAng") * 1
			elseif is == false and speed > lowspeed and speed < highspeed then
				target_pos = self:GetStat("WalkSightPos") * 1
				target_ang = self:GetStat("WalkSightAng") * 1
			end
		end
	end -- End Dead-Eye's walking code

	if hls then
		target_pos = self:GetStat("ProceduralHolsterPos") * 1
		target_ang = self:GetStat("ProceduralHolsterAng") * 1

		if self.ViewModelFlip then
			target_pos = target_pos * flip_vec
			target_ang = target_ang * flip_ang
		end

		adstransitionspeed = self:GetStat("ProceduralHolsterTime") * 15
	elseif is and (self.Sights_Mode == TFA.Enum.LOCOMOTION_LUA or self.Sights_Mode == TFA.Enum.LOCOMOTION_HYBRID) then
		target_pos = (self:GetStat("IronSightsPos", self.SightsPos) or self:GetStat("SightsPos", vector_origin)) * 1
		target_ang = (self:GetStat("IronSightsAng", self.SightsAng) or self:GetStat("SightsAng", vector_origin)) * 1
		adstransitionspeed = 15 / (self:GetStat("IronSightTime") / 0.3)
	elseif (spr or self:IsSafety()) and (self.Sprint_Mode == TFA.Enum.LOCOMOTION_LUA or self.Sprint_Mode == TFA.Enum.LOCOMOTION_HYBRID or (self:IsSafety() and not spr)) and stat ~= TFA.Enum.STATUS_FIDGET and stat ~= TFA.Enum.STATUS_BASHING then
		if cl_tfa_viewmodel_centered and cl_tfa_viewmodel_centered:GetBool() then
			target_pos = target_pos + centered_sprintpos
			target_ang = target_ang + centered_sprintang
		elseif self:IsSafety() and self:GetStat("SafetyPos") and not spr then
			target_pos = self:GetStat("SafetyPos") * 1
			target_ang = self:GetStat("SafetyAng") * 1
		else
			target_pos = self:GetStat("RunSightsPos") * 1
			target_ang = self:GetStat("RunSightsAng") * 1
		end

		adstransitionspeed = 7.5
	end

	if cl_tfa_viewmodel_offset_x and not is then
		target_pos.x = target_pos.x + cl_tfa_viewmodel_offset_x:GetFloat()
		target_pos.y = target_pos.y + cl_tfa_viewmodel_offset_y:GetFloat()
		target_pos.z = target_pos.z + cl_tfa_viewmodel_offset_z:GetFloat()
	end

	if self.Inspecting then
		if not self.InspectPos then
			self.InspectPos = self.InspectPosDef * 1

			if self.ViewModelFlip then
				self.InspectPos.x = self.InspectPos.x * -1
			end
		end

		if not self.InspectAng then
			self.InspectAng = self.InspectAngDef * 1

			if self.ViewModelFlip then
				self.InspectAng.x = self.InspectAngDef.x * 1
				self.InspectAng.y = self.InspectAngDef.y * -1
				self.InspectAng.z = self.InspectAngDef.z * -1
			end
		end

		target_pos = self:GetStat("InspectPos") * 1
		target_ang = self:GetStat("InspectAng") * 1
		adstransitionspeed = 10
	end

	target_pos, target_ang = self:CalculateNearWall(target_pos, target_ang)

	if self.VMPos_Additive then
		target_pos.x = target_pos.x + self.VMPos.x
		target_pos.y = target_pos.y + self.VMPos.y
		target_pos.z = target_pos.z + self.VMPos.z
		target_ang.x = target_ang.x + self.VMAng.x
		target_ang.y = target_ang.y + self.VMAng.y
		target_ang.z = target_ang.z + self.VMAng.z
	end

	target_ang.z = target_ang.z + -7.5 * (1 - math.abs(0.5 - self.IronSightsProgress) * 2) * (self:GetIronSights() and 1 or 0.5) * (self.ViewModelFlip and 1 or -1)

	if self:GetHidden() then
		target_pos.z = target_pos.z - 5
	end

	if self:GetStat("BlowbackEnabled") and self.BlowbackCurrentRoot > 0.01 then
		local bbvec = self:GetStat("BlowbackVector")
		target_pos = target_pos + bbvec * self.BlowbackCurrentRoot
		local bbang = self:GetStat("BlowbackAngle") or angle_zero
		bbvec = bbvec * 1
		bbvec.x = bbang.p
		bbvec.y = bbang.y
		bbvec.z = bbang.r
		target_ang = target_ang + bbvec * self.BlowbackCurrentRoot
		bbang = self.BlowbackRandomAngle * (1 - math.max(0, self.IronSightsProgress) * .8)
		bbvec.x = bbang.p
		bbvec.y = bbang.y
		bbvec.z = bbang.r
		target_ang = target_ang + bbvec * self.BlowbackCurrentRoot
		if self:GetStat("Blowback_PistolMode") then
			adstransitionspeed = adstransitionspeed + 50 * math.pow(self.BlowbackCurrentRoot, 2)
		else
			adstransitionspeed = adstransitionspeed + 5 * math.pow(self.BlowbackCurrentRoot, 2)
		end
	end
	
	if is then --Custom weapon kick code.
		local vpa = self:GetOwner():GetViewPunchAngles()
		target_ang.x = target_ang.x + (xmul * vpa.p)
		target_ang.y = target_ang.y + (ymul * vpa.y)
		target_ang.z = target_ang.z + (zmul * vpa.r)
	else
		local vpa = self:GetOwner():GetViewPunchAngles()
		target_ang.x = target_ang.x + (xmulhip * vpa.p)
		target_ang.y = target_ang.y + (ymulhip * vpa.y)
		target_ang.z = target_ang.z + (zmulhip * vpa.r)
	end
	
    if self:GetOwner():Crouching() then --Crouching code. Not complicated.
        target_down = 0
        if self.CrouchPos and is == false and not self.Inspecting then
			viewkickxmult = 0
			viewkickymult = 0
			viewkickzmult = 0 --This disables viewkick when crouched. Without this, your viewmodel will glitch out permanently until your next map reload or lua restart.
            target_pos = self.CrouchPos
            target_ang = self.CrouchAng
        end
    end

	vm_offset_pos.x = math.Approach(vm_offset_pos.x, target_pos.x, (target_pos.x - vm_offset_pos.x) * delta * adstransitionspeed)
	vm_offset_pos.y = math.Approach(vm_offset_pos.y, target_pos.y, (target_pos.y - vm_offset_pos.y) * delta * adstransitionspeed)
	vm_offset_pos.z = math.Approach(vm_offset_pos.z, target_pos.z, (target_pos.z - vm_offset_pos.z) * delta * adstransitionspeed)
	vm_offset_ang.p = math.ApproachAngle(vm_offset_ang.p, target_ang.x, math.AngleDifference(target_ang.x, vm_offset_ang.p) * delta * adstransitionspeed)
	vm_offset_ang.y = math.ApproachAngle(vm_offset_ang.y, target_ang.y, math.AngleDifference(target_ang.y, vm_offset_ang.y) * delta * adstransitionspeed)
	vm_offset_ang.r = math.ApproachAngle(vm_offset_ang.r, target_ang.z, math.AngleDifference(target_ang.z, vm_offset_ang.r) * delta * adstransitionspeed)

	intensityWalk = math.min(self:GetOwner():GetVelocity():Length2D() / self:GetOwner():GetWalkSpeed(), 1)

	if self.WalkBobMult_Iron and self.IronSightsProgress > 0.01 then
		intensityWalk = intensityWalk * self.WalkBobMult_Iron * self.IronSightsProgress
	else
		intensityWalk = intensityWalk * self.WalkBobMult
	end

	intensityBreath = l_Lerp(self.IronSightsProgress, self:GetStat("BreathScale", 0.2), self:GetStat("IronBobMultWalk", 0.5) * intensityWalk)
	intensityWalk = intensityWalk * (1 - self.IronSightsProgress)
	intensityRun = l_Lerp(self.SprintProgress, 0, self.SprintBobMult)
	local velocity = math.max(self:GetOwner():GetVelocity():Length2D() * self:AirWalkScale() - self:GetOwner():GetVelocity().z * 0.5, 0)
	local rate = math.min(math.max(0.15, math.sqrt(velocity / self:GetOwner():GetRunSpeed()) * 1.75), self:GetSprinting() and 5 or 3)

	self.pos_cached, self.ang_cached = self:WalkBob(vm_offset_pos * 1, vm_offset_ang * 1, math.max(intensityBreath - intensityWalk - intensityRun, 0), math.max(intensityWalk - intensityRun, 0), rate, delta)
end

local ATT_MAX_SCREEN_RATIO = 1 / 5
local tableCopy = table.Copy

function SWEP:GenerateVGUIAttachmentTable()
	self.VGUIAttachments = {}
	local keyz = table.GetKeys(self.Attachments)
	table.RemoveByValue(keyz, "BaseClass")

	table.sort(keyz, function(a, b)
		--A and B are keys
		local v1 = self.Attachments[a]
		local v2 = self.Attachments[b]

		if v1 and v2 and (v1.order or v2.order) then
			return (v1.order or a) < (v2.order or b)
		else
			return a < b
		end
	end)

	for i, k in ipairs(keyz) do
		local v = self.Attachments[k]
		self.VGUIAttachments[i] = tableCopy(v)
		self.VGUIAttachments[i].cat = k
		self.VGUIAttachments[i].offset = nil
		self.VGUIAttachments[i].order = nil
	end

	ATT_DIMENSION = math.Round(TFA.ScaleH(TFA.Attachments.IconSize))
	local max_row_atts = math.floor(ScrW() * ATT_MAX_SCREEN_RATIO / ATT_DIMENSION)
	local i = 1

	while true do
		local v = self.VGUIAttachments[i]
		if not v then break end
		i = i + 1

		for l, b in pairs(v.atts) do
			if not istable(b) then
				v.atts[l] = {b, l} --name, ID
			end
		end

		if (#v.atts > max_row_atts) then
			while (#v.atts > max_row_atts) do
				local t = tableCopy(v)

				for _ = 1, max_row_atts do
					table.remove(t.atts, 1)
				end

				for _ = 1, #v.atts - max_row_atts do
					table.remove(v.atts)
				end

				table.insert(self.VGUIAttachments, i, t)
			end
		end
	end
end

function SWEP:PrimaryAttack()
	self:PrePrimaryAttack()
	if self.Owner:IsNPC() then
		if self:Clip1() <= 0 then
			if SERVER then
				self.Owner:SetSchedule(SCHED_RELOAD)
			end

			return
		end

		if SERVER and CurTime() < self:GetNextPrimaryFire() then return false end

		local times_to_fire = 2

		if self.OnlyBurstFire then
			times_to_fire = 3
		end

		if self.Primary.Automatic then
			times_to_fire = math.random(5, 8)
		end

		self:SetNextPrimaryFire(CurTime() + (((self.Primary.RPM / 60) / 100) * times_to_fire) + math.random(0.2, 0.6))

		timer.Create("GunTimer" .. tostring(self:GetOwner():EntIndex()), (self.Primary.RPM / 60) / 100, times_to_fire, function()
			if not IsValid(self) then return end
			if not IsValid(self.Owner) then return end
			if not self:GetOwner().GetShootPos then return end
			self:EmitGunfireSound(self.Primary.Sound)
			self:TakePrimaryAmmo(1)
			local damage_to_do = self.Primary.Damage * npc_ar2_damage_cv:GetFloat() / 16
			local bullet = {}
			bullet.Num = self.Primary.NumShots
			bullet.Src = self.Owner:GetShootPos()
			bullet.Dir = self.Owner:GetAimVector()
			bullet.Tracer = 1
			bullet.Damage = damage_to_do
			bullet.AmmoType = self.Primary.Ammo
			self.Owner:FireBullets(bullet)
		end)

		return
	end

	if not IsValid(self) then return end
	if not self:VMIV() then return end
	if not self:CanPrimaryAttack() then return end
	if hook.Run("TFA_PrimaryAttack",self) then return end
	if TFA.Enum.ShootReadyStatus[self:GetShootStatus()] then
		self:SetShootStatus(TFA.Enum.SHOOT_IDLE)
	end

	if self.CanBeSilenced and self:GetOwner():KeyDown(IN_USE) and (SERVER or not sp) then
		self:ChooseSilenceAnim(not self:GetSilenced())
		local _, tanim = self:SetStatus(TFA.Enum.STATUS_SILENCER_TOGGLE)
		self:SetStatusEnd(l_CT() + self:GetActivityLength(tanim, true))

		return
	end

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	if self:GetMaxBurst() > 1 then
		self:SetBurstCount(math.max(1, self:GetBurstCount() + 1))
	end

	if self:GetStat("PumpAction") and self:GetShotgunCancel() then return end
	self:SetStatus(TFA.Enum.STATUS_SHOOTING)
	self:SetStatusEnd(self:GetNextPrimaryFire())
	self:ToggleAkimbo()
	local _, tanim = self:ChooseShootAnim()

	if (not sp) or (not self:IsFirstPerson()) then
		self:GetOwner():SetAnimation(PLAYER_ATTACK1)
	end

		if self:GetStat("Primary.Sound") and IsFirstTimePredicted() and not (sp and CLIENT) then --Subsonic sound code
			if self:GetOwner():IsPlayer() and self:GetStat("Primary.LoopSoundSubsonic") and (not self:GetStat("Primary.LoopSoundAutoOnly", false) or self.Primary.Automatic) then
				self:EmitGunfireSound(self:GetStat("Primary.LoopSoundSubsonic"))
			elseif self:GetStat("Subsonic") == true and self:GetSilenced() then
				self:EmitGunfireSound(self:GetStat("Primary.SubsonicSound"))
			elseif self:GetOwner():IsPlayer() and self:GetStat("Primary.LoopSound") and (not self:GetStat("Primary.LoopSoundAutoOnly", false) or self.Primary.Automatic) then
				self:EmitGunfireLoop()	
			elseif self:GetStat("Primary.SilencedSound") and self:GetSilenced() then
				self:EmitGunfireSound(self:GetStat("Primary.SilencedSound"))
			else
				self:EmitGunfireSound(self:GetStat("Primary.Sound"))
			end
		end
	
	self:TakePrimaryAmmo(self:GetStat("Primary.AmmoConsumption"))

	if self:Clip1() == 0 and self:GetStat("Primary.ClipSize") > 0 then
		self:SetNextPrimaryFire(math.max(self:GetNextPrimaryFire(), CurTime() + (self.Primary.DryFireDelay or self:GetActivityLength(tanim, true))))
	end

	self:ShootBulletInformation()
	self:UpdateJamFactor()
	local _, CurrentRecoil = self:CalculateConeRecoil()
	self:Recoil(CurrentRecoil, IsFirstTimePredicted())

	if sp and SERVER then
		self:CallOnClient("Recoil", "")
	end

	if self.MuzzleFlashEnabled and (not self:IsFirstPerson() or not self.AutoDetectMuzzleAttachment) then
		self:ShootEffectsCustom()
	end

	if self.EjectionSmoke and CLIENT and self:GetOwner() == LocalPlayer() and IsFirstTimePredicted() and not self.LuaShellEject then
		self:EjectionSmoke()
	end

	self:DoAmmoCheck()

	if self:GetStatus() == TFA.GetStatus("shooting") and self:GetStat("PumpAction") then
		if self:Clip1() == 0 and self:GetStat("PumpAction").value_empty then
			self:SetShotgunCancel(true)
		elseif (self:GetStat("Primary.ClipSize") < 0 or self:Clip1() > 0) and self:GetStat("PumpAction").value then
			self:SetShotgunCancel(true)
		end
	end

	if IsFirstTimePredicted() then
		self:RollJamChance()
	end

	self:PostPrimaryAttack()
	hook.Run("TFA_PostPrimaryAttack",self)
end

--[[LINKS]]--

-- Link 1: https://www.youtube.com/watch?v=Io7Zztghdno --GunBusters: AK-103
-- Link 2: https://steamcommunity.com/sharedfiles/filedetails/?id=1132466603 --StormFox