SWEP.Base					= "tfa_gun_base"
SWEP.Category				= "EXR - Assault Rifles" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer 			= "United States Navy" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author					= "OLDMaster_24 - Edit by Lucho" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions			= "" --Instructions Tooltip
SWEP.Spawnable				= (TFA and TFA.INS2) and true or false -- INSTALL SHARED PARTS
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS 		= false --Draw the crosshair in ironsights?
SWEP.PrintName				= "MK18 MOD 1"		-- Weapon name (Shown on HUD)
SWEP.Slot					= 2			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.AutoSwitchTo			= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false -- Auto switch from if you pick up a better weapon
SWEP.Weight					= 30			-- This controls how "good" the weapon is for autopickup.
SWEP.Type 					= "AR"

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("TFA_INS2.MK18MOD.1") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("TFA_INS2.MK18MOD.2") -- This is the sound of the weapon, when silenced.
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
SWEP.FiresUnderwater = true
--Miscelaneous Sounds
SWEP.IronInSound = Sound("TFA_INS2.IronIn") --Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = Sound("TFA_INS2.IronOut") --Sound to play when ironsighting out?  nil for default
--Silencing
SWEP.CanBeSilenced = false --Can we silence?  Requires animations.
SWEP.Silenced = false --Silenced by default?
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
SWEP.Primary.KickUp = 0.127 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.086 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = .035 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 0--How far the spread can expand when you shoot. Example val: 2.5
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
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.35
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)
--Movespeed
SWEP.MoveSpeed = 0.95 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.9 --Multiply the player's movespeed by this when sighting.
--[[PROJECTILES]]--
SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model
--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/weapons/tfa_ins2/v_mk18mod.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0, 0, 0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
-- SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
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
SWEP.WorldModel			= "models/weapons/tfa_ins2/w_mk18mod.mdl" -- Weapon world model path
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
		Up = -1,
		Right = 1.5,
		Forward = 4
	},
	Ang = {
		Up = -2,
		Right = -8,
		Forward = 180
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

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
SWEP.RunSightsPos = Vector(2.4, -1.6, -0.8)
SWEP.RunSightsAng = Vector(-24, 32, -16)
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 65 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-2.55, -0.75, 0.9)
SWEP.IronSightsAng = Vector(0.275, 0, 0)

SWEP.IronSightsPos_Kobra = Vector(-2.54, -0.75, 0.85)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_Kobra = 65

SWEP.IronSightsPos_EOTech = Vector(-2.54, -0.75, 0.82)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_EOTech = 65

SWEP.IronSightsPos_RDS = Vector(-2.54, -0.75, 0.63)
SWEP.IronSightsAng_RDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_RDS = 65

SWEP.IronSightsPos_2XRDS = Vector(-2.5325, -3.25, 0.82)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 65
SWEP.RTScopeFOV_2XRDS        = 30

SWEP.IronSightsPos_C79 = Vector(-2.539, -4., 0.528	)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_C79 = 65
SWEP.RTScopeFOV_C79        = 50

SWEP.IronSightsPos_RMRCanted = Vector(-3.96, -4., 1.35)
SWEP.IronSightsAng_RMRCanted = Vector(0, 0, -34)

SWEP.IronSightsPos_NVPoint = Vector(-5.8, 2.5, 0.5)
SWEP.IronSightsAng_NVPoint = Vector(0, 0, -40)

SWEP.IronSightsPos_HAMR = Vector(-3.233, -2, -0.15)
SWEP.IronSightsAng_HAMR = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_HAMR = 65

--[[INSPECTION]]--
SWEP.InspectPos = Vector(5, -5.619, -2.787)
SWEP.InspectAng = Vector(22.386, 34.417, 5)
--[[VIEWMODEL ANIMATION HANDLING]]--
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS.
--[[VIEWMODEL BLOWBACK]]--
SWEP.BlowbackEnabled = false --Enable Blowback?
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
--[[ANIMATION]]--

SWEP.StatusLengthOverride = {
	["base_reload"] = 81 / 30,
	["base_reload_empty"] = 86 / 30,
	["foregrip_reload"] = 81 / 30,
	["foregrip_reload_empty"] = 86 / 30,
} --Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
SWEP.SequenceLengthOverride = {} --Changes both the status delay and the nextprimaryfire of a given animation
SWEP.SequenceRateOverride = {} --Like above but changes animation length to a target
SWEP.SequenceRateOverrideScaled = {} --Like above but scales animation length rather than being absolute

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.SprintBobMult = 0
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.25 --Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 --Start an idle this far early into the end of another animation
--MDL Animations Below
SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_PRIMARYATTACK_1, --Number for act, String/Number for sequence
		["value_empty"] = ACT_VM_PRIMARYATTACK_3
	} --What do you think
}

SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_sprint", --Number for act, String/Number for sequence
		["is_idle"] = true
	}
}
--[[EFFECTS]]--
--Attachments
SWEP.MuzzleAttachment			= "muzzle" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 		-- Should be "2" for CSS models or "shell" for hl2 models
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

SWEP.ViewModelBoneMods = {
	["A_Suppressor"] = { scale = Vector(0.8, 0.8, 0.8), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["A_Optic"] = { scale = Vector(0.85, 0.85, 0.85), pos = Vector(0,-1, 0), angle = Angle(0, 0, 0) },
	["A_LaserFlashlight"] = { scale = Vector(1, 1, 1), pos = Vector(-1, -1, 1.25), angle = Angle(0, 0, -90) },
	["A_Foregrip"] = { scale = Vector(0.4, 0.4, 0.4), pos = Vector(0, 0, 0.25), angle = Angle(0, 0, 0) },
}

SWEP.WorldModelBoneMods = {
	["ATTACH_Muzzle"] = { scale = Vector(.75, .75, .75), pos = Vector(-1, 0, 0), angle = Angle(0, 0, 0) },
	["ATTACH_Laser"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 180) },
	["ATTACH_Foregrip"] = { scale = Vector(0.7, 0.7, 0.7), pos = Vector(0.9, 0, 0), angle = Angle(0, 0, 0) },
}

SWEP.VElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_standard_mk18mod.mdl", bone = "A_Optic", rel = "", pos = Vector(0, -0.245, 0.159), angle = Angle(0, -90, 0), size = Vector(0.611, 0.611, 0.611), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec2.mdl", bone = "A_Suppressor", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_foregrip_sec.mdl", bone = "A_Foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.485, 0.485, 0.485), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_anpeq15_tan.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(-1.3, 2.1,-1), angle = Angle(0, 0, -90), size = Vector(1, 1 ,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_anpeq15_tan.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(-1.3, 2.1,-1), angle = Angle(0, 0, -90), size = Vector(1, 1 ,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["sight_rmr_canted"] = { type = "Model", model = "models/weapons/tfa_eft/upgrades/sights/reflex/v_canted_rmr.mdl", bone = "A_Optic", rel = "", pos = Vector(0.05, 0, 1.1), angle = Angle(90, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_rmr_canted_lens"] = {type = "Quad", rel = "sight_rmr_canted", bone = "A_RenderReticle", pos = Vector(4, 1.385, 0.58), angle = Angle(90, 0, 0), size = 0.3, draw_func_outer = function(wep,p,a,s) TFA.EFT.DrawHoloSight(wep, "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", nil, p, a, s) end, active = false },	
	
}

SWEP.WElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_flipup_mk18mod.mdl", bone = "ATTACH_Standard", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec2.mdl", bone = "ATTACH_Muzzle", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_foregrip_sec2.mdl", bone = "ATTACH_Foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_sec.mdl", bone = "", rel = "", pos = Vector(16, 9.8, 3.8), angle = Angle(178, 4, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_sec.mdl", bone = "", rel = "", pos = Vector(16, 9.8, 3.8), angle = Angle(178, 4, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
	[2] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 6 },
	[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
	[7] = { offset = { 0, 0 }, atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79" }, order = 1 },
	[8] = { offset = { 0, 0 }, atts = { "ins2_fg_grip" }, order = 4 },
	[9] = { offset = { 0, 0 }, atts = { "ins2_ub_laser", "ins2_ub_flashlight1" }, order = 5 },
}

SWEP.MuzzleAttachmentSilenced = 2

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 4
SWEP.LaserDotISMovement = true

DEFINE_BASECLASS( SWEP.Base )

local function drawFuncUni()
	if TFA.EFT and TFA.EFT.DrawHoloSight then
		local drawFunc = TFA.EFT.DrawHoloSight

		return function(wep, p, a, s)
			local reticles = wep:GetStat("SwitchableReticles", {})
			if #reticles <= 0 then return end

			local activeelem = wep:GetStat("EFT_SightVElement")
			if not activeelem then return end

			local result = reticles[wep.ChosenReticle[activeelem] or 1]
			if not result then return end

			drawFunc(wep, result, activeelem, p, a, s)
		end
	end

	return nil
end

function SWEP:CycleReticle()
	local tbl = self:GetStat("SwitchableReticles", {})
	if #tbl <= 0 then return end

	local activeelem = self:GetStat("EFT_SightVElement")
	if not activeelem then return end

	if not self.ChosenReticle[activeelem] then
		self.ChosenReticle[activeelem] = 1
	end

	self.ChosenReticle[activeelem] = self.ChosenReticle[activeelem] + 1

	if self.ChosenReticle[activeelem] > #tbl then
		self.ChosenReticle[activeelem] = 1
	end

	self:EmitSound("TFA_EFT.FlashlightOn")
end

function SWEP:CycleFireMode(...)
	if self:GetIronSights() and self:GetStat("SwitchableReticles") then
		self:CallOnClient("CycleReticle")

		self:SetStatus(TFA.GetStatus("firemode"))
		self:SetStatusEnd(CurTime() + 0.25)

		return
	end

	return BaseClass.CycleFireMode(self, ...)
end

function SWEP:Think2(...)
 
	if self.Owner:KeyPressed(IN_WALK) and self:GetIronSights() then 
        if self.CurrentZoomState == 1 then
            self.CurrentZoomState = 2
			self:ClearStatCache()
			self.Secondary.ScopeZoom_ELCAN = 4
			self.Secondary.ScopeZoom_VUDU = 6
			self.Secondary.ScopeZoom_PS320 = 6
			self:PlayAnimation(self.AttInteractions.zoom_switch)
        else 
            self.CurrentZoomState = 1
			self:ClearStatCache()
			self.Secondary.ScopeZoom_ELCAN = 1
			self.Secondary.ScopeZoom_VUDU = 1
			self.Secondary.ScopeZoom_PS320 = 1
			self:PlayAnimation(self.AttInteractions.zoom_switch)
		end 
    end  
 
    if self.Owner:KeyPressed(IN_ZOOM) and self:GetIronSights() then 
        if self.CurrentSightState == 1 then 
            self.CurrentSightState = 2  
			self.IronSightsPos = Vector(-2.55, -0.75, 0.9)
			self.IronSightsAng = Vector(0.275, 0, 0)
			self.IronSightsPos_Kobra = Vector(-2.54, -0.75, 0.85)
			self.IronSightsAng_Kobra = Vector(0, 0, 0)
			self.IronSightsPos_EOTech = Vector(-2.54, -0.75, 0.82)
			self.IronSightsAng_EOTech = Vector(0, 0, 0)
			self.IronSightsPos_RDS = Vector(-2.54, -0.75, 0.63)
			self.IronSightsAng_RDS = Vector(0, 0, 0)
			self.IronSightsPos_2XRDS = Vector(-2.5325, -3.25, 0.82)
			self.IronSightsAng_2XRDS = Vector(0, 0, 0)
			self.IronSightsPos_C79 = Vector(-2.539, -4., 0.528)
			self.IronSightsAng_C79 = Vector(0, 0, 0)
			self.IronSightsPos_PO4X = Vector(-2.66, -5.75, 1.04)
			self.IronSightsAng_PO4X = Vector(0, 0, 0)
			self.IronSightsPos_MX4 = Vector(-2.73, -3, 0.655)
			self.IronSightsAng_MX4  = Vector(0, 0, 0)
			self.IronSightsPos_QTS11 = Vector(-3.19, -3, 0.43)
			self.IronSightsAng_QTS11 = Vector(0, 0, 0)
            self.IronSightsPos_553 = Vector(-3.24, 0, 0.262)
            self.IronSightsAng_553 = Vector(0,0,0)
            self.IronSightsPos_XPS3 = Vector(-3.24, 0, 0.47)
            self.IronSightsAng_XPS3 = Vector(0, 0, 0)
            self.IronSightsPos_EXPS3 = Vector(-3.24, 0, -0.15)
            self.IronSightsAng_EXPS3 = Vector(0, 0, 0)
            self.IronSightsPos_UH1 = Vector(-3.24, 0, -0.12)
            self.IronSightsAng_UH1 = Vector(0, 0, 0)
            self.IronSightsPos_1P87 = Vector(-3.24, 0, -0.4)
            self.IronSightsAng_1P87 = Vector(0, 0, 0)
            self.IronSightsPos_HS401G5 = Vector(-3.24, 0, 0.12)
            self.IronSightsAng_HS401G5 = Vector(0, 0, 0)
            self.IronSightsPos_M4 = Vector(-3.235, 0, 0.33)
            self.IronSightsAng_M4 = Vector(0, 0, 0)
            self.IronSightsPos_OKP7 = Vector(-3.099, 0, 0.43)
            self.IronSightsAng_OKP7 = Vector(0, 0, 0)
            self.IronSightsPos_SRS = Vector(-3.24, 0, -0.13)
            self.IronSightsAng_SRS = Vector(0, 0, 0)
            self.IronSightsPos_MRS = Vector(-3.23, 0, 0.05)
            self.IronSightsAng_MRS = Vector(0, 0, 0)
            self.IronSightsPos_PILAD = Vector(-3.24, 0, 0.08)
            self.IronSightsAng_PILAD = Vector(0, 0, 0)
            self.IronSightsPos_COBRA = Vector(-3.24, 0, -0.27)
            self.IronSightsAng_COBRA = Vector(0, 0, 0)
            self.IronSightsPos_PK06 = Vector(-3.24, 0, 0.49)
            self.IronSightsAng_PK06 = Vector(0, 0, 0)
            self.IronSightsPos_FF3 = Vector(-3.24, 0, 0.78)
            self.IronSightsAng_FF3 = Vector(0, 0, 0)
            self.IronSightsPos_T1 = Vector(-3.24, 0, 0.7)
            self.IronSightsAng_T1 = Vector(0, 0, 0)
            self.IronSightsPos_RMR = Vector(-3.242, 0, -0.18)
            self.IronSightsAng_RMR = Vector(0, 0, 0)
            self.IronSightsPos_ROMEO = Vector(-3.24, 0, -0.05)
            self.IronSightsAng_ROMEO = Vector(0, 0, 0)
            self.IronSightsPos_DP = Vector(-3.24, 0, 0.5)
            self.IronSightsAng_DP = Vector(0, 0, 0)
            self.IronSightsPos_ELCAN = Vector(-3.23, -2, -0.07)
            self.IronSightsAng_ELCAN = Vector(0, 0, 0)
            self.IronSightsPos_HAMR = Vector(-3.233, -2, -0.15)
            self.IronSightsAng_HAMR = Vector(0, 0, 0)
            self.IronSightsPos_BRAVO4 = Vector(-3.231, -2, 0.069)
            self.IronSightsAng_BRAVO4 = Vector(0, 0, 0)
            self.IronSightsPos_PRISM = Vector(-3.233, -2, -0.13)
            self.IronSightsAng_PRISM = Vector(0, 0, 0)
            self.IronSightsPos_PRISM2X = Vector(-3.233, -2, 0.268)
            self.IronSightsAng_PRISM2X = Vector(0, 0, 0)
            self.IronSightsPos_TA01NSN = Vector(-3.23, -2, -0.07)
            self.IronSightsAng_TA01NSN = Vector(0, 0, 0)
            self.IronSightsPos_TA11D = Vector(-3.232, -2, -0.16)
            self.IronSightsAng_TA11D = Vector(0, 0, 0)
            self.IronSightsPos_VUDU = Vector(-3.286, -2, 0.24)
            self.IronSightsAng_VUDU = Vector(0, 0, 0)
            self.IronSightsPos_REAPIR = Vector(-3.234, -1, -0.065)
            self.IronSightsAng_REAPIR = Vector(0, 0, 0)
            self.IronSightsPos_VULCAN = Vector(-3.235, -3, -0.229)
            self.IronSightsAng_VULCAN = Vector(0, 0, 0)
        else 
            self.CurrentSightState = 1
            self.IronSightsPos_ELCAN = Vector(-3.23, -2, -1.16)
			self.IronSightsPos = self.IronSightsPos_NVPoint
			self.IronSightsAng = self.IronSightsAng_NVPoint	
			self.IronSightsPos_Kobra = self.IronSightsPos_NVPoint	
			self.IronSightsAng_Kobra = self.IronSightsAng_NVPoint	
			self.IronSightsPos_EOTech = self.IronSightsPos_NVPoint	
			self.IronSightsAng_EOTech = self.IronSightsAng_NVPoint	
			self.IronSightsPos_RDS = self.IronSightsPos_NVPoint
			self.IronSightsAng_RDS = self.IronSightsAng_NVPoint	
			self.IronSightsPos_2XRDS = self.IronSightsPos_NVPoint	
			self.IronSightsAng_2XRDS = self.IronSightsAng_NVPoint	
			self.IronSightsPos_C79 = self.IronSightsPos_NVPoint
			self.IronSightsAng_C79 = self.IronSightsAng_NVPoint	
			self.IronSightsPos_MX4 = self.IronSightsPos_NVPoint
			self.IronSightsAng_MX4 = self.IronSightsAng_NVPoint	
			self.IronSightsPos_QTS11 = self.IronSightsPos_NVPoint
			self.IronSightsAng_QTS11 = self.IronSightsAng_NVPoint
			self.IronSightsPos_PO4X = self.IronSightsPos_NVPointc
			self.IronSightsAng_PO4X = self.IronSightsAng_NVPoint
			self.IronSightsPos_EXPS3 = self.IronSightsPos_NVPoint
			self.IronSightsAng_EXPS3 = self.IronSightsAng_NVPoint
			self.IronSightsPos_XPS3 = self.IronSightsPos_NVPoint
			self.IronSightsAng_XPS3 = self.IronSightsAng_NVPoint
			self.IronSightsPos_UH1 = self.IronSightsPos_NVPoint
			self.IronSightsAng_UH1 = self.IronSightsAng_NVPoint
			self.IronSightsPos_PS320 = self.IronSightsPos_NVPoint
			self.IronSightsAng_PS320 = self.IronSightsAng_NVPoint
			self.IronSightsPos_TA01NSN = self.IronSightsPos_NVPoint
			self.IronSightsAng_TA01NSN = self.IronSightsAng_NVPoint
			self.IronSightsPos_REAPIR = self.IronSightsPos_NVPoint
			self.IronSightsAng_REAPIR = self.IronSightsAng_NVPoint
			self.IronSightsPos_VULCAN = self.IronSightsPos_NVPoint
			self.IronSightsAng_VULCAN = self.IronSightsAng_NVPoint
			self.IronSightsPos_PILAD = self.IronSightsPos_NVPoint
			self.IronSightsAng_PILAD = self.IronSightsAng_NVPoint
			self.IronSightsPos_M4 = self.IronSightsPos_NVPoint
			self.IronSightsAng_M4 = self.IronSightsAng_NVPoint
			self.IronSightsPos_HS401G5 = self.IronSightsPos_NVPoint
			self.IronSightsAng_HS401G5 = self.IronSightsAng_NVPoint
			self.IronSightsPos_HAMR = Vector(-3.24, -2, -1.57)
            self.IronSightsAng_HAMR = Vector(0, 0, 0)			
			self.IronSightsPos_BRAVO4 = self.IronSightsPos_NVPoint
			self.IronSightsAng_BRAVO4 = self.IronSightsAng_NVPoint
			self.IronSightsPos_PRISM = self.IronSightsPos_NVPoint
			self.IronSightsAng_PRISM = self.IronSightsAng_NVPoint
			self.IronSightsPos_PRISM2X = self.IronSightsPos_NVPoint
			self.IronSightsAng_PRISM2X = self.IronSightsAng_NVPoint
			self.IronSightsPos_PK06 = self.IronSightsPos_NVPoint
			self.IronSightsAng_PK06 = self.IronSightsAng_NVPoint
			self.IronSightsPos_553 = self.IronSightsPos_NVPoint
			self.IronSightsAng_553 = self.IronSightsAng_NVPoint
			self.IronSightsPos_510C = self.IronSightsPos_NVPoint
			self.IronSightsAng_510C = self.IronSightsAng_NVPoint
			self.IronSightsPos_1P87 = self.IronSightsPos_NVPoint
			self.IronSightsAng_1P87 = self.IronSightsAng_NVPoint
			self.IronSightsPos_COBRA = self.IronSightsPos_NVPoint
			self.IronSightsAng_COBRA = self.IronSightsAng_NVPoint
			self.IronSightsPos_OKP7 = self.IronSightsPos_NVPoint
			self.IronSightsAng_OKP7 = self.IronSightsAng_NVPoint
			self.IronSightsPos_T1 = self.IronSightsPos_NVPoint
			self.IronSightsAng_T1 = self.IronSightsAng_NVPoint
			self.IronSightsPos_MRO = self.IronSightsPos_NVPoint
			self.IronSightsAng_MRO = self.IronSightsAng_NVPoint
			self.IronSightsPos_MRS = self.IronSightsPos_NVPoint
			self.IronSightsAng_MRS = self.IronSightsAng_NVPoint
			self.IronSightsPos_SRS = self.IronSightsPos_NVPoint
			self.IronSightsAng_SRS = self.IronSightsAng_NVPoint
			self.IronSightsPos_RMR = self.IronSightsPos_NVPoint
			self.IronSightsAng_RMR = self.IronSightsAng_NVPoint
			self.IronSightsPos_ROMEO = self.IronSightsPos_NVPoint
			self.IronSightsAng_ROMEO = self.IronSightsAng_NVPoint
			self.IronSightsPos_TA01NSN = self.IronSightsPos_NVPoint
            self.IronSightsAng_TA01NSN = self.IronSightsAng_NVPoint
            self.IronSightsPos_TA11D = self.IronSightsPos_NVPoint
            self.IronSightsAng_TA11D = self.IronSightsAng_NVPoint
			self.IronSightsPos_VUDU = self.IronSightsPos_NVPoint
			self.IronSightsAng_VUDU = self.IronSightsAng_NVPoint
			self.IronSightsPos_DP = self.IronSightsPos_NVPoint
			self.IronSightsAng_DP = self.IronSightsAng_NVPoint			
			self.IronSightsPos_FF3 = self.IronSightsPos_NVPoint
			self.IronSightsAng_FF3 = self.IronSightsAng_NVPoint			
		end 
    end 

if self:GetIronSights() then
		self.RiotShieldCone = 30
		self.RiotShieldDamageCap = (engine.ActiveGamemode() == "sandbox" and 24) or 500
	else
		self.RiotShieldCone = 15
		self.RiotShieldDamageCap = (engine.ActiveGamemode() == "sandbox" and 15) or 40
end
 
    return BaseClass.Think2(self, ...)
end

SWEP.AttInteractions = {
	["zoom_switch"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, 
		["value"] = nil,
		["enabled"] = true 
	}
}

DEFINE_BASECLASS( SWEP.Base )

SWEP.StatCache_Blacklist = {
	["IronSightsPos_Kobra"] = true,
    ["IronSightsAng_Kobra"] = true,
	["IronSightsPos_EOTech"] = true,
    ["IronSightsAng_EOTech"] = true,
	["IronSightsPos_RDS"] = true,
    ["IronSightsAng_RDS"] = true,
	["IronSightsPos_2XRDS"] = true,
    ["IronSightsAng_2XRDS"] = true,
	["IronSightsPos_C79"] = true,
    ["IronSightsAng_C79"] = true,
	["IronSightsPos_MX4"] = true,
	["IronSightsAng_MX4"] = true,
	["IronSightsPos_QTS11"] = true,
    ["IronSightsAng_QTS11"] = true,
    ["IronSightsPos_ELCAN"] = true,
    ["IronSightsAng_ELCAN"] = true,
    ["IronSightsPos_PS320"] = true,
    ["IronSightsAng_PS320"] = true,
    ["IronSightsPos_TA11D"] = true,
    ["IronSightsAng_TA11D"] = true,
    ["IronSightsPos_GL"] = true,
    ["IronSightsAng_GL"] = true,
    ["IronSightsPos_EXPS3"] = true,
    ["IronSightsAng_EXPS3"] = true,
    ["IronSightsPos_UH1"] = true,
    ["IronSightsAng_UH1"] = true,
    ["IronSightsPos_MRS"] = true,
    ["IronSightsAng_MRS"] = true,
    ["IronSightsPos_1P87"] = true,
    ["IronSightsAng_1P87"] = true,
    ["IronSightsPos_PILAD"] = true,
    ["IronSightsAng_PILAD"] = true,
    ["IronSightsPos_510C"] = true,
    ["IronSightsAng_510C"] = true,
    ["IronSightsPos_T1"] = true,
    ["IronSightsAng_T1"] = true,
    ["IronSightsPos_M4"] = true,
    ["IronSightsAng_M4"] = true,
    ["IronSightsPos_HS401G5"] = true,
    ["IronSightsAng_HS401G5"] = true,
    ["IronSightsPos_COBRA"] = true,
    ["IronSightsAng_COBRA"] = true,
    ["IronSightsPos_OKP7"] = true,
    ["IronSightsAng_OKP7"] = true,
    ["IronSightsPos_PK06"] = true,
    ["IronSightsAng_PK06"] = true,
    ["IronSightsPos_ROMEO"] = true,
    ["IronSightsAng_ROMEO"] = true,
    ["IronSightsPos_RMR"] = true,
    ["IronSightsAng_RMR"] = true,
    ["IronSightsPos_RMRCanted"] = true,
    ["IronSightsAng_RMRCanted"] = true,
    ["IronSightsPos_NIGHTFORCE"] = true,
    ["IronSightsAng_NIGHTFORCE"] = true,
    ["IronSightsPos_VUDU"] = true,
    ["IronSightsAng_VUDU"] = true,
	["Secondary.IronFOV_VUDU"] = true,
	["Secondary.IronFOV_NIGHTFORCE"] = true,
    ["IronSightsPos_MRO"] = true,
    ["IronSightsAng_MRO"] = true,
    ["IronSightsPos_TA01NSN"] = true,
    ["IronSightsAng_TA01NSN"] = true,
    ["IronSightsPos_HAMR"] = true,
    ["IronSightsAng_HAMR"] = true,
    ["IronSightsPos_PRISM"] = true,
    ["IronSightsAng_PRISM"] = true,
    ["IronSightsPos_BRAVO4"] = true,
    ["IronSightsAng_BRAVO4"] = true,
    ["IronSightsPos_REAPIR"] = true,
    ["IronSightsAng_REAPIR"] = true,
    ["IronSightsPos_VULCAN"] = true,
    ["IronSightsAng_VULCAN"] = true,
    ["IronSightsPos_PRISM2X"] = true,
    ["IronSightsAng_PRISM2X"] = true,
    ["IronSightsPos_SRS"] = true,
    ["IronSightsAng_SRS"] = true,
    ["IronSightsPos_553"] = true,
    ["IronSightsAng_553"] = true,
    ["IronSightsPos_XPS3"] = true,
    ["IronSightsAng_XPS3"] = true,
    ["Secondary.IronFOV_ELCAN"] = true, 
    ["IronSightsPos"] = true,
    ["IronSightsAng"] = true,
    ["Secondary.IronFOV"] = true,
    ["SCOPING"] = true,
    ["CYCLEDELAY"] = true,
    ["IronSightsPos_DP"] = true,
    ["IronSightsAng_DP"] = true,
    ["IronSightsPos_FF3"] = true,
    ["IronSightsAng_FF3"] = true,	
}



