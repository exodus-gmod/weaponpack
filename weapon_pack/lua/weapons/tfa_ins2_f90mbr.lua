SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "EXR - Assault Rifles" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = "Thales Australia" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "YuRaNnNzZZ - Edit by Lucho" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= (TFA and TFA.INS2) and true or false -- INSTALL SHARED PARTS
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false --Draw the crosshair in ironsights?
SWEP.PrintName				= "F90 MBR"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 2			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.AutoSwitchTo			= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false -- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.

if TFA then
	local path = "weapons/tfa_ins2/f90mbr/"
	local pref = "TFA_INS2.F90MBR"

	TFA.AddSound(pref .. ".1", CHAN_AUTO, 0.6, 140, 100, path .. "aug_fire1.wav", ")")
	TFA.AddSound(pref .. ".2", CHAN_AUTO, 0.6, 120, 100, path .. "aug_supressed_fire1.wav", ")")

	TFA.AddWeaponSound(pref .. ".Empty", path .. "handling/mk18_empty.wav")
	TFA.AddWeaponSound(pref .. ".Boltback", path .. "handling/mk18_boltback.wav")
	TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "handling/mk18_boltrelease.wav")
	TFA.AddWeaponSound(pref .. ".Magout", path .. "handling/mk18_magout.wav")
	TFA.AddWeaponSound(pref .. ".Magin", path .. "handling/mk18_magin.wav")
	TFA.AddWeaponSound(pref .. ".Hit", path .. "handling/mk18_hit.wav")
	TFA.AddWeaponSound(pref .. ".ROF", path .. "handling/mk18_fireselect.wav")
end

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_f90mbr", "vgui/killicons/tfa_ins2_f90mbr", Color(255, 80, 0, 191))
end

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("TFA_INS2.F90MBR.1") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("TFA_INS2.F90MBR.2") -- This is the sound of the weapon, when silenced.

SWEP.Primary.Damage = 26 -- Damage, in standard damage points.
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

SWEP.Primary.Force = nil --Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0 --Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 900 -- This is in Rounds Per Minute / RPM
SWEP.FiresUnderwater = false
--Miscelaneous Sounds
SWEP.IronInSound = Sound("TFA_INS2.IronIn") --Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = Sound("TFA_INS2.IronOut") --Sound to play when ironsighting out?  nil for default
-- Selective Fire Stuff
SWEP.SelectiveFire = true --Allow selecting your firemode?
SWEP.DisableBurstFire = true --Only auto/single?
--Ammo Related
SWEP.Primary.ClipSize = 35 -- This is the size of a clip
SWEP.Primary.DefaultClip = 175 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "ar2" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Recoil Related
SWEP.Primary.KickUp = 0.118 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.075 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = 0.035 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = 0.00001 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
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

--[[Penetration]]--
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through

--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/weapons/tfa_ins2/c_wf_ar36.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(-0.1, -0.65, -0.5) * 1.3 --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/weapons/tfa_ins2/w_wf_ar36.mdl" -- Weapon world model path
SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
SWEP.Offset = {
	Pos = {
		Up = -1,
		Right = 0.964,
		Forward = 4
	},
	Ang = {
		Up = 0,
		Right = -8,
		Forward = 180
	},
	Scale = 1
} --Procedural world model animation, defaulted for CS:S purposes.

--[[SPRINTING]]--
SWEP.RunSightsPos = Vector(2.4, -1.6, -0.8)
SWEP.RunSightsAng = Vector(-24, 32, -32)
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 65 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-4.328, -4, -0.64)
SWEP.IronSightsAng = Vector(0.2, 0, 0)

SWEP.IronSightsPos_Kobra = Vector(-4.33, -4, -0.732)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_Kobra = 65

SWEP.IronSightsPos_EOTech = Vector(-4.329, -4, -0.518)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_EOTech = 65

SWEP.IronSightsPos_RDS = Vector(-4.329, -4, -0.594)
SWEP.IronSightsAng_RDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_RDS = 65

SWEP.IronSightsPos_2XRDS = Vector(-4.325, -6.5, -0.598)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 65
SWEP.RTScopeFOV_2XRDS        = 30

SWEP.IronSightsPos_C79 = Vector(-4.327, -8.5, -0.638)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_C79 = 65
SWEP.RTScopeFOV_C79        = 50

SWEP.IronSightsPos_PO4X = Vector(-4.245, -9, -0.09)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_PO4X = 65

SWEP.IronSightsPos_RMRCanted = Vector(-5.71, -6., 0.7)
SWEP.IronSightsAng_RMRCanted = Vector(0, 0, -34)

SWEP.IronSightsPos_NVPoint = Vector(-5.8, 2.5, 0.5)
SWEP.IronSightsAng_NVPoint = Vector(0, 0, -40)

SWEP.IronSightsPos_HAMR = Vector(-3.233, -2, -0.15)
SWEP.IronSightsAng_HAMR = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_HAMR = 65

--[[INSPECTION]]--
SWEP.InspectPos = Vector(10, -6, -3.5)
SWEP.InspectAng = Vector(20, 40, 10)

--[[ANIMATION]]--
SWEP.StatusLengthOverride = {
	["base_reload"] = 76 / 30,
	["base_reloadempty"] = 86 / 30,
	["foregrip_reload"] = 76 / 30,
	["foregrip_reloadempty"] = 86 / 30,
} --Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.SprintBobMult = 0
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
SWEP.MuzzleFlashEffect = "tfa_muzzleflash_rifle" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
--Shell eject override
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "RifleShellEject" --The effect used for shell ejection; Defaults to that used for blowback
--Tracer Stuff
SWEP.TracerName 		= nil 	--Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 3 	--0 disables, otherwise, 1 in X chance
--[[EVENT TABLE]]--
SWEP.EventTable = {
	["base_ready"] = {
		{time = 5 / 32, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 26 / 32, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltback")},
		{time = 36 / 32, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltrelease")},
		{time = 55 / 32, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["base_draw"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["base_holster"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["base_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.F90MBR.Empty")},
	},
	["base_fireselect"] = {
		{time = 8 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.ROF")},
	},
	["base_reload"] = {
		{time = 5 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 20 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 45 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magout")},
		{time = 58 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 71 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magin")},
		{time = 94 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["base_reloadempty"] = {
		{time = 5 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 23 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magout")},
		{time = 40 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 65 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 71 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magin")},
		{time = 85 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Hit")},
		{time = 104 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltrelease")},
		{time = 115 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},

	["iron_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.F90MBR.Empty")},
	},
	["iron_fireselect"] = {
		{time = 8 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.ROF")},
	},

	["foregrip_ready"] = {
		{time = 5 / 32, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 26 / 32, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltback")},
		{time = 36 / 32, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltrelease")},
		{time = 55 / 32, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["foregrip_draw"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["foregrip_holster"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["foregrip_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.F90MBR.Empty")},
	},
	["foregrip_fireselect"] = {
		{time = 8 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.ROF")},
	},
	["foregrip_iron_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.F90MBR.Empty")},
	},
	["foregrip_iron_fireselect"] = {
		{time = 8 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.ROF")},
	},
	["foregrip_reload"] = {
		{time = 5 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 20 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 46 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magout")},
		{time = 58 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 72 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magin")},
		{time = 94 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["foregrip_reloadempty"] = {
		{time = 5 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 24 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magout")},
		{time = 40 / 30, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 65 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 72 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Magin")},
		{time = 85 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Hit")},
		{time = 104 / 30, type = "sound", value = Sound("TFA_INS2.F90MBR.Boltrelease")},
		{time = 115 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
}

--[[ATTACHMENTS]]--
SWEP.ViewModelBoneMods = {}

SWEP.WorldModelBoneMods = {
	["ATTACH_Laser"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(180, 0, 0) },
}

SWEP.VElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/v_wf_ar36_is_d.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["standard_barrel"] = { type = "Model", model = "models/weapons/tfa_ins2/v_wf_ar36_sp_d.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/v_wf_ar36_gp_d.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false},

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_xl.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech_l.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint_l.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x_l.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec.mdl", bone = "A_Suppressor", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_rail.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(-0.29, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0,0,0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_flashlight_band.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(0, 0.8, 0), angle = Angle(0, 0, 90), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["sight_rmr_canted"] = { type = "Model", model = "models/weapons/tfa_eft/upgrades/sights/reflex/v_canted_rmr.mdl", bone = "A_Optic", rel = "", pos = Vector(0., 0, 1.), angle = Angle(90, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_rmr_canted_lens"] = {type = "Quad", rel = "sight_rmr_canted", bone = "A_RenderReticle", pos = Vector(4, 1.385, 0.58), angle = Angle(90, 0, 0), size = 0.3, draw_func_outer = function(wep,p,a,s) TFA.EFT.DrawHoloSight(wep, "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", nil, p, a, s) end, active = false },	
	
}

SWEP.WElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/w_wf_ar36_is_d.mdl", bone = "", rel = "", pos = Vector(0, -0.245, 0.159), angle = Angle(0, -90, 0), size = Vector(0.611, 0.611, 0.611), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["standard_barrel"] = { type = "Model", model = "models/weapons/tfa_ins2/w_wf_ar36_sp_d.mdl", bone = "", rel = "", pos = Vector(0, -0.245, 0.159), angle = Angle(0, -90, 0), size = Vector(0.611, 0.611, 0.611), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true},
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/w_wf_ar36_gp_d.mdl", bone = "", rel = "", pos = Vector(0, -0.245, 0.159), angle = Angle(0, -90, 0), size = Vector(0.611, 0.611, 0.611), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false},

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec1.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_ins.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_sec.mdl", bone = "", rel = "", pos = Vector(10, 11.9, 3.8), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

}

SWEP.RTAttachment_PO4X            = 2
SWEP.ScopeDistanceRange_PO4X      = 50
SWEP.ScopeDistanceMin_PO4X        = 50


SWEP.Attachments = {
	[2] = { atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" } },
	[1] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" } },
	[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" } },
	[4] = { atts = { "ins2_fg_grip" } },
	[5] = { atts = { "ins2_ub_laser", "ins2_ub_flashlight1" } },
	[6] = { atts = { "am_match", "am_magnum", "am_gib" } },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

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
			self.IronSightsPos = Vector(-4.328, -4, -0.64)
			self.IronSightsAng = Vector(0.2, 0, 0)
			self.IronSightsPos_Kobra = Vector(-4.33, -4, -0.732)
			self.IronSightsAng_Kobra = Vector(0, 0, 0)
			self.IronSightsPos_EOTech = Vector(-4.329, -4, -0.518)
			self.IronSightsAng_EOTech = Vector(0, 0, 0)
			self.IronSightsPos_RDS = Vector(-4.329, -4, -0.594)
			self.IronSightsAng_RDS = Vector(0, 0, 0)
			self.IronSightsPos_2XRDS = Vector(-4.325, -6.5, -0.598)
			self.IronSightsAng_2XRDS = Vector(0, 0, 0)
			self.IronSightsPos_C79 = Vector(-4.327, -8.5, -0.638)
			self.IronSightsAng_C79 = Vector(0, 0, 0)
			self.IronSightsPos_PO4X = Vector(-4.245, -9, -0.09)
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

