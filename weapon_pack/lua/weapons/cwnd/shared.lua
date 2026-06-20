SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "EXR - Assault Rifles" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = "Noveske Rifleworks" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "BV" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false --Draw the crosshair in ironsights?
SWEP.PrintName				= "Noveske Diplomat"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 0			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.AutoSwitchTo			= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false -- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("weapons/cwnd/shoot.wav") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.Sound_SIL = Sound("weapons/cwnd/shoot_sil.wav")-- Script that calls the primary fire sound
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage = 30 -- Damage, in standard damage points.
local scale_table = {
    [HITGROUP_HEAD]     = 1,
    [HITGROUP_CHEST]    = 1,
    [HITGROUP_STOMACH]  = 1,
    [HITGROUP_LEFTARM]  = 3.5,
    [HITGROUP_RIGHTARM] = 3.5,
    [HITGROUP_LEFTLEG]  = 3.5,
    [HITGROUP_RIGHTLEG] = 3.5,
}

local function ScaleDamage(ent, hitgroup, dmginfo)
    local scale = scale_table[hitgroup]
    if not IsValid( ent ) or not scale then return end
    dmginfo:ScaleDamage( scale )
end

hook.Add( "ScaleNPCDamage", "AdjustLimbDamageNPC", ScaleDamage )
hook.Add( "ScalePlayerDamage", "AdjustLimbDamagePlayer", ScaleDamage )

SWEP.Primary.DamageTypeHandled = true --true will handle damagetype in base
SWEP.Primary.DamageType = nil --See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.  Leave nil to autodetect.  DMG_AIRBOAT opens doors.
SWEP.Primary.Force = nil --Force value, leave nil to autocalc
SWEP.Primary.Knockback = nil --Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 800 -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi = nil -- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst = nil -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.DryFireDelay = nil --How long you have to wait after firing your last shot before a dryfire animation can play.  Leave nil for full empty attack length.  Can also use SWEP.StatusLength[ ACT_VM_BLABLA ]
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate
SWEP.FiresUnderwater = false
--Silencing
SWEP.CanBeSilenced = false --Can we silence?  Requires animations.
SWEP.Silenced = true --Silenced by default?
-- Selective Fire Stuff
SWEP.SelectiveFire = false --Allow selecting your firemode?
SWEP.DisableBurstFire = true --Only auto/single?
SWEP.OnlyBurstFire = false --No auto, only burst/single?
SWEP.DefaultFireMode = "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
--Ammo Related
SWEP.Primary.ClipSize = 30 -- This is the size of a clip
SWEP.Primary.DefaultClip = 150 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "ar2" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false --Disable round-in-the-chamber
--Recoil Related
SWEP.Primary.KickUp = 0.139 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.086 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = .035 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.SpreadMultiplierMax = 0 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 0 --How much the spread recovers, per second. Example val: 3
--Range Related
SWEP.Primary.Range = 1000 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.Primary.RangeFalloffLUT = {
    bezier     = true,
    
    range_func = "quintic",
    units      = "meters",
    
    lut = {
        {range = 0, damage = 1},
        {range = 35, damage = 1},
        {range = 40, damage = 1},
        {range = 45, damage = 0.8},
        {range = 50, damage = 0.65},
    }
}

--Penetration Related
SWEP.MaxPenetrationCounter = 0 --The maximum number of ricochets.  To prevent stack overflows.
--Misc
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.IronSightTime = 0.35
--Movespeed
SWEP.MoveSpeed = 0.95 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.9 --Multiply the player's movespeed by this when sighting.
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.35
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)
--[[PROJECTILES]]--
SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model
--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/weapons/cwnd/v_bvrif_cwnd.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CenteredPos = nil --The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil --The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = nil --{
	--[0] = 1,
	--[1] = 4,
	--[2] = etc.
--}
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/weapons/w_rif_m4a1.mdl" -- Weapon world model path
SWEP.Bodygroups_W = nil --{
--[0] = 1,
--[1] = 4,
--[2] = etc.
--}
SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles
SWEP.Offset = {
	Pos = {
		Up = 0.5,
		Right = 1,
		Forward = 2
	},
	Ang = {
		Up = 0,
		Right = -4,
		Forward = 180
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

--Vector(4.796, 0.964, -0.82), angle = Angle(-5.844, 0, 180)

SWEP.ThirdPersonReloadDisable = false --Disable third person reload?  True disables.
--[[SCOPES]]--
SWEP.IronSightsSensitivity = 1 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction = false --Unscope/sight after you shoot?
SWEP.Scoped = false --Draw a scope overlay?
SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.25 --How long you stay sighted in after shooting, with a bolt action.
SWEP.ScopeScale = 0.5 --Scale of the scope overlay
SWEP.ReticleScale = 0.7 --Scale of the reticle overlay
--GDCW Overlay Options.  Only choose one.
SWEP.Secondary.UseACOG = false --Overlay option
SWEP.Secondary.UseMilDot = false --Overlay option
SWEP.Secondary.UseSVD = false --Overlay option
SWEP.Secondary.UseParabolic = false --Overlay option
SWEP.Secondary.UseElcan = false --Overlay option
SWEP.Secondary.UseGreenDuplex = false --Overlay option
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end
--[[SHOTGUN CODE]]--
SWEP.Shotgun = false --Enable shotgun style reloading.
SWEP.ShotgunEmptyAnim = false --Enable emtpy reloads on shotguns?
SWEP.ShotgunEmptyAnim_Shell = true --Enable insertion of a shell directly into the chamber on empty reload?
SWEP.ShellTime = .35 -- For shotguns, how long it takes to insert a shell.
--[[SPRINTING]]--
SWEP.RunSightsPos = Vector(2, -1, 0) --Change this, using SWEP Creation Kit preferably
SWEP.RunSightsAng = Vector(-17, 35, -15) --Change this, using SWEP Creation Kit preferably
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 65 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-2.5, -3.5, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.IronSightsPos_CWDeltaP = Vector(-2.5, -2, 0.2)
SWEP.IronSightsAng_CWDeltaP = Vector(1.2, 0.25, 0)
SWEP.IronSightsPos_CWH1 = Vector(-2.5, -3, 0.5)
SWEP.IronSightsAng_CWH1 = Vector(0.15, 0.175, 0)
SWEP.IronSightsPos_CWRMR = Vector(-2.5, -2, 0.6)
SWEP.IronSightsAng_CWRMR = Vector(1.2, 0.25, 0)
SWEP.IronSightsPos_CWXPS2 = Vector(-2.5, -2, -0.2)
SWEP.IronSightsAng_CWXPS2 = Vector(0.5, -0.15, 0)
SWEP.IronSightsPos_CWIdot = Vector(-2.65, -2, -0.2)
SWEP.IronSightsAng_CWIdot = Vector(0.125, -0.8, 0)
SWEP.IronSightsPos_CWKemper = Vector(-2.5, -2, -0.2)
SWEP.IronSightsAng_CWKemper = Vector(0.9, 0, 0)
SWEP.IronSightsPos_CWKobra = Vector(-2.5, -2, -0.4)
SWEP.IronSightsAng_CWKobra = Vector(1.45, 0.05, 0)
SWEP.IronSightsPos_CWKPSR2 = Vector(-2.5, -2, -0.4)
SWEP.IronSightsAng_CWKPSR2 = Vector(0.1, 0.25, 0)
SWEP.IronSightsPos_CW553 = Vector(-2.5, -2, -0.2)
SWEP.IronSightsAng_CW553 = Vector(0.6, 0.15, 0)
--[[INSPECTION]]--
SWEP.InspectPos = Vector(5, -6, -2)
SWEP.InspectAng = Vector(25, 30, 5)
--[[VIEWMODEL ANIMATION HANDLING]]--
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS.
--[[VIEWMODEL BLOWBACK]]--
SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-2,0) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true --Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "RifleShellEject"--Which shell effect to use
--[[VIEWMODEL PROCEDURAL ANIMATION]]--
SWEP.DoProceduralReload = false--Animate first person reload using lua?
SWEP.ProceduralReloadTime = 1 --Procedural reload time?
--[[HOLDTYPES]]--
SWEP.IronSightHoldTypeOverride = "" --This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride = "" --This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
--[[EFFECTS]]--
--Attachments
SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models
SWEP.MuzzleFlashEnabled = true --Enable muzzle flash
SWEP.MuzzleAttachmentRaw = nil --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
SWEP.SmokeParticle = nil --Smoke particle (ID within the PCF), defaults to something else based on holdtype; "" to disable
SWEP.EjectionSmokeEnabled = false --Disable automatic ejection smoke
--Shell eject override
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "RifleShellEject" --The effect used for shell ejection; Defaults to that used for blowback
--Tracer Stuff
SWEP.TracerName 		= nil 	--Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 3 	--0 disables, otherwise, 1 in X chance
--Impact Effects
SWEP.ImpactEffect = nil--Impact Effect
SWEP.ImpactDecal = nil--Impact Decal
--[[EVENT TABLE]]--
--example:
--SWEP.EventTable = {
--	[ACT_VM_RELOAD] = {
--		{ ["time"] = 0.1, ["type"] = "lua", ["value"] = function( wep, viewmodel ) end, ["client"] = true, ["server"] = true},
--		{ ["time"] = 0.1, ["type"] = "sound", ["value"] = Sound("x") }
--	}
--}
--[[RENDER TARGET]]--
SWEP.RTMaterialOverride = nil -- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), subtract 1 from its index, and set it to this.
SWEP.RTOpaque = false -- Do you want your render target to be opaque?
SWEP.RTCode = nil--function(self) return end --This is the function to draw onto your rendertarget
--[[AKIMBO]]--
SWEP.Akimbo = false --Akimbo gun?  Alternates between primary and secondary attacks.
SWEP.AnimCycle = 0 -- Start on the right
--[[ATTACHMENTS]]--

SWEP.VElements = {
	["CWDeltaP Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/aimpoint_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWDeltaP", pos = Vector(12, 1.62, 0.3), size = { x = 5, y = 5 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWDeltaP"] = { type = "Model", model = "models/weapons/cwupgrades/cwdeltap.mdl", bone = "Weapon_Main", rel = "", pos = Vector(1.7, -15, 3.6), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWXPS2 Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/eotech_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWXPS2", pos = Vector(9, 2.05, 0.025), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWXPS2"] = { type = "Model", model = "models/weapons/cwupgrades/cwxps2.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.2, -12.5, 4.4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWIdot Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/aimpoint_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWIdot", pos = Vector(12, 2.175, -0.25), size = { x = 5, y = 5 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWIdot"] = { type = "Model", model = "models/weapons/cwupgrades/cwidot.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.3, -15, 4.75), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWKobra Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/kobra_dot", bone = "ValveBiped.Bip01_Spine4", rel = "CWKobra", pos = Vector(11, 2.28, 0.06), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWKobra"] = { type = "Model", model = "models/weapons/cwupgrades/cwkobra.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.4, -14, 4.4), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWKPSR2 Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/aimpoint_dot", bone = "ValveBiped.Bip01_Spine4", rel = "CWKPSR2", pos = Vector(18, 4.525, -1.5), size = { x = 0.2, y = 0.2 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWKPSR2"] = { type = "Model", model = "models/weapons/cwupgrades/cwkpsr2.mdl", bone = "Weapon_Main", rel = "", pos = Vector(4.6, -20, 6.2), angle = Angle(0, -90, 0), size = Vector(2.1, 2.1, 2.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWKemper Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/aimpoint_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWIdot", pos = Vector(13, 2.175, -0.4), size = { x = 5, y = 5 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWKemper"] = { type = "Model", model = "models/weapons/cwupgrades/cwkemper.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.9, -16, 4.4), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CW553 Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/eotech_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWXPS2", pos = Vector(9, 2.1, 0.025), size = { x = 0.5, y = 0.5 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CW553"] = { type = "Model", model = "models/weapons/cwupgrades/cw553.mdl", bone = "Weapon_Main", rel = "", pos = Vector(3.75, -15, 5.2), angle = Angle(0, -90, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWH1 Dot"] = { type = "Sprite", sprite = "models/weapons/tfa_ins2/optics/aimpoint_reticule", bone = "ValveBiped.Bip01_Spine4", rel = "CWH1", pos = Vector(19, 3.7, -1.2), size = { x = 5, y = 5 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false,active = false},
	["CWH1"] = { type = "Model", model = "models/weapons/cwupgrades/cwh1.mdl", bone = "Weapon_Main", rel = "", pos = Vector(3.8, -22, 5), angle = Angle(0, -90, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWPBS2"] = { type = "Model", model = "models/weapons/cwupgrades/cwpbs2.mdl", bone = "Weapon_Main", rel = "", pos = Vector(4.55, -22.8, 6.5), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWOsprey"] = { type = "Model", model = "models/weapons/cwupgrades/cwosprey.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.15, -18, 5.3), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWPBS6"] = { type = "Model", model = "models/weapons/cwupgrades/cwpbs6.mdl", bone = "Weapon_Main", rel = "", pos = Vector(4.57, -23.8, 6.7), angle = Angle(0, -90, 0), size = Vector(2.1, 2.1, 2.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
	["CWSpectre"] = { type = "Model", model = "models/weapons/cwupgrades/cwspectre.mdl", bone = "Weapon_Main", rel = "", pos = Vector(2.85, -18, 4.5), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {},active = false },
}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "cwdeltap", "cwh1", "cwkobra", "cwkpsr2", "cwxps2", "cw553", "cwidot", "cwkemper", "cwnxs25" }, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 5 },
	[3] = { offset = { 0, 0 }, atts = { "cwspectre", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
        [4] = { offset = { 0, 0 }, atts = { "anpeq" }, order = 4 },
		[5] = { offset = { 0, 0 }, atts = {"ins2_br_heavy"}, order = 3},
}

 
DEFINE_BASECLASS( SWEP.Base )