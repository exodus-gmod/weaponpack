SWEP.Base					= "tfa_gun_base"
SWEP.Category				= "EXR - Assault Rifles" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer			= "Degtyaryov Plant" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author					= "YuRaNnNzZZ" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "A more modern 5.45x39 assault rifle. Has a much higher cyclic speed, at the cost of high stopping power." --Purpose Tooltip
SWEP.Instructions			= "" --Instructions Tooltip
SWEP.Spawnable				= (TFA and TFA.INS2) and true or false -- INSTALL SHARED PARTS
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS		= false --Draw the crosshair in ironsights?
SWEP.PrintName				= "AEK-971"		-- Weapon name (Shown on HUD)
SWEP.Slot					= 2			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.Weight					= 30			-- This controls how "good" the weapon is for autopickup.

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("TFA_INS2.AEK971.1") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("TFA_INS2.AEK971.2") -- This is the sound of the weapon, when silenced.
SWEP.Primary.GLSound = Sound("TFA_INS2_GP30.1")

SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage = 32 --DAage, in standard damage points.
local scale_table = {
    [HITGROUP_HEAD]     = 2,
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
SWEP.Primary.RPM = 750 -- This is in Rounds Per Minute / RPM

SWEP.Primary.Velocity = 880 -- m/s

SWEP.FiresUnderwater = false
--Miscelaneous Sounds
SWEP.IronInSound = Sound("TFA_INS2.IronIn") --Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = Sound("TFA_INS2.IronOut") --Sound to play when ironsighting out?  nil for default
--Silencing
SWEP.CanBeSilenced = false --Can we silence?  Requires animations.
SWEP.Silenced = false --Silenced by default?
-- Selective Fire Stuff
SWEP.SelectiveFire = true --Allow selecting your firemode?
SWEP.DisableBurstFire = false --Only auto/single?
SWEP.OnlyBurstFire = false --No auto, only burst/single?
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.BurstFireCount = 3
SWEP.DefaultFireMode = "Automatic"
--Ammo Related
SWEP.Primary.ClipSize = 30 -- This is the size of a clip
SWEP.Primary.DefaultClip = 150 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "ar2" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false --Disable round-in-the-chamber
--Recoil Related
SWEP.Primary.KickUp = 0.121 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.088 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = .035 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 0 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 0 --How much the spread recovers, per second. Example val: 3
--Range Related
SWEP.Primary.Range = 1000 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 1-- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
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
SWEP.JumpAccuracyMultiplier = 500
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
SWEP.ViewModel			= "models/weapons/tfa_ins2/c_aek971.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0.1, 0.5, -0.6) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CenteredPos = nil --The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil --The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = nil
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/weapons/tfa_ins2/w_aek971.mdl" -- Weapon world model path
SWEP.Bodygroups_W = nil
SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles
SWEP.Offset = {
	Pos = {
		Up = -1,
		Right = 0.75,
		Forward = 4
	},
	Ang = {
		Up = -4,
		Right = -12,
		Forward = 180
	},
	Scale = 0.95
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
SWEP.Secondary.ScopeTable = nil
--[[SHOTGUN CODE]]--
SWEP.Shotgun = false --Enable shotgun style reloading.
--[[SPRINTING]]--
SWEP.RunSightsPos = Vector(2.4, -1.6, -0.8)
SWEP.RunSightsAng = Vector(-24, 32, -16)
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 65 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-3.655, -2, 0.575)
SWEP.IronSightsAng = Vector(-0.481, 0.015, 0)

SWEP.IronSightsPos_GL = Vector(-1.425, -4, 0.805)
SWEP.IronSightsAng_GL = Vector(0.01, 0.012, 0)

SWEP.IronSightsPos_Kobra = Vector(-3.66, -4, -1.322)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_Kobra = 65

SWEP.IronSightsPos_EOTech = Vector(-3.66, -4, -1.311)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_EOTech = 65

SWEP.IronSightsPos_RDS = Vector(-3.66, -4, -1.312)
SWEP.IronSightsAng_RDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_RDS = 65

SWEP.IronSightsPos_2XRDS = Vector(-3.658, -4, -1.314)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 65

SWEP.IronSightsPos_C79 = Vector(-3.66, -4, -1.442)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_C79 = 65

SWEP.IronSightsPos_PO4X = Vector(-3.585, -4, -1.181)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_PO4X = 65

--[[INSPECTION]]--
SWEP.InspectPos = Vector(8, -6.619, -2.787)
SWEP.InspectAng = Vector(20, 42, 8)
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
	["base_reload"] = 70 / 30,
	["base_reloadempty"] = 65 / 30,
	["foregrip_reload"] = 70 / 30,
	["foregrip_reloadempty"] = 65 / 30,
	["gl_reload"] = 70 / 30,
	["gl_reloadempty"] = 65 / 30,
	["glsetup_reload"] = 51 / 31,
} --Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
SWEP.SequenceLengthOverride = {} --Changes both the status delay and the nextprimaryfire of a given animation
SWEP.SequenceRateOverride = {} --Like above but changes animation length to a target

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.SprintBobMult = 0
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.25 --Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 --Start an idle this far early into the end of another animation
--MDL Animations Below
SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT,
		["value"] = ACT_VM_PRIMARYATTACK_1,
		["value_empty"] = ACT_VM_PRIMARYATTACK_3,
	},
}

SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "base_sprint",
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
SWEP.EventTable = {
	["base_ready"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 19 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 29 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
	},
	["base_draw"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
	},
	["base_holster"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Holster")},
	},
	["base_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["base_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},
	["base_reload"] = {
		{["time"] = 18 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 22 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 45 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 65 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 82 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["base_reloadempty"] = {
		{["time"] = 5 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 36 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 40 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 50 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 62 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 93 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 102 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
		{["time"] = 119 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["iron_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["iron_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},

	-- FOREGRIP
	["foregrip_ready"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 19 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 29 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
	},
	["foregrip_draw"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
	},
	["foregrip_holster"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Holster")},
	},
	["foregrip_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["foregrip_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},
	["foregrip_reload"] = {
		{["time"] = 18 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 22 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 45 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 65 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 82 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["foregrip_reloadempty"] = {
		{["time"] = 5 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 36 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 40 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 50 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 62 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 93 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 102 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
		{["time"] = 119 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["foregrip_iron_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["foregrip_iron_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},

	-- GL
	["gl_ready"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 19 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 29 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
	},
	["gl_draw"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
	},
	["gl_holster"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Holster")},
	},
	["gl_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["gl_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},
	["gl_reload"] = {
		{["time"] = 18 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 22 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 45 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 65 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 82 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["gl_reloadempty"] = {
		{["time"] = 5 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
		{["time"] = 36 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagRelease")},
		{["time"] = 40 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magout")},
		{["time"] = 50 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.MagoutRattle")},
		{["time"] = 62 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Magin")},
		{["time"] = 93 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltback")},
		{["time"] = 102 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Boltrelease")},
		{["time"] = 119 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
	["gl_iron_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["gl_iron_fireselect"] = {
		{["time"] = 6 / 30, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.ROF")},
	},

	-- GLSETUP
	["glsetup_in"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2_GP30.Select")},
	},
	["glsetup_out"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2_GP30.Deselect")},
	},
	["glsetup_draw"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
	},
	["glsetup_holster"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Holster")},
	},
	["glsetup_ready"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.Draw")},
	},
	["glsetup_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["glsetup_iron_dryfire"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Empty")},
	},
	["glsetup_reload"] = {
		{["time"] = 0, ["type"] = "sound", ["value"] = Sound("TFA_INS2.GLBeginReload")},
		{["time"] = 39 / 31, ["type"] = "sound", ["value"] = Sound("TFA_INS2_GP30.GrenadeIn")},
		{["time"] = 45 / 31, ["type"] = "sound", ["value"] = Sound("TFA_INS2_GP30.GrenadeInClick")},
		{["time"] = 64 / 31, ["type"] = "sound", ["value"] = Sound("TFA_INS2.AEK971.Rattle")},
	},
}
--[[ATTACHMENTS]]--

SWEP.ViewModelBoneMods = {
	["A_Optic"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.565, 1), angle = Angle(0, 0, 0) },
	["A_Foregrip"] = { scale = Vector(.5, .5, .5), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}

local wscale = Vector(1, 1, 1) / 1.3

SWEP.WorldModelBoneMods = {
	["ATTACH_Foregrip"] = { scale = wscale, pos = Vector(-1, 0, -1), angle = Angle(0, 0, 0) },
	["ATTACH_Laser"] = { scale = wscale, pos = Vector(0, 0, 0), angle = Angle(180, 0, 0) },
	["ATTACH_ModKit"] = { scale = wscale, pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ATTACH_Muzzle"] = { scale = wscale, pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}

SWEP.VElements = {
	["rail_sights"] = { type = "Model", model = "models/weapons/tfa_ins2/c_aek971_mount.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_l.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan_m.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_ak.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },

	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_foregrip_ins2.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = color_white, surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["gl"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_gl_gp25.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = color_white, surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false},

	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_flashlight_band.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_band.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
}

SWEP.WElements = {
	["rail_sights"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_modkit_6.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_ins1.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_ins.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_foregrip_ins.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = color_white, surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["gl"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_gp25.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = color_white, surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
}

SWEP.Attachments = {
	[1] = { atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
	[2] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" }, order = 1},
	[3] = { atts = { "ins2_ub_laser", "ins2_ub_flashlight" }, order = 5},
	[6] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
	[4] = { atts = { "ins2_fg_grip" }, order = 4},
	[5] = { atts = { "am_match", "am_magnum", "am_gib" }, order = 6 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.MuzzleAttachmentSilenced = 2

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 4
SWEP.LaserDotISMovement = true
