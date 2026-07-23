-- Variables that are used on both client and server
SWEP.Gun = ("tfa_ins2_g28") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - DMRs" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "muzzle" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.MuzzleAttachmentSilenced = "muzzle_supp"
SWEP.Manufacturer = "Hoeckler and Koch"--Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "The Master MLG & CAS Boi"
SWEP.Contact				= ""
SWEP.Purpose				= "A fancy, High Powered DMR chambered in 7.62x51."
SWEP.Instructions				= ""
SWEP.PrintName				= "G28"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 40		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
SWEP.Type = "Semi Automatic Rifle"
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_g28_cas.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_g28_cas.mdl"	-- Weapon world model
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.ShowWorldModel			= true
SWEP.UseHands = true

SWEP.Primary.Sound			= Sound("weapons/tfa_ins2_g28/g28-1.wav")
SWEP.Primary.SilencedSound			= Sound("weapons/tfa_ins2_g28/g28_sil-1.wav")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 350			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20	-- Size of a clip
SWEP.Primary.DefaultClip		= 100		-- Bullets you start with
SWEP.Primary.KickUp			= 0.439	-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.174		-- Maximum up recoil (stock)
SWEP.Primary.Ammo			= "SniperPenetratedRound"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles. Enter what fraction or percentage (in decimal form) you want. This is also affected by a convar that defaults to 0.5.
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.IronSightTime = 0.45
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.45
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.Primary.Range = 1000 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
SWEP.Primary.FalloffMetricBased = true -- Set to true if you set up values below
SWEP.Primary.FalloffByMeter     = 0.5 -- How much damage points will bullet loose when travel
SWEP.Primary.MinRangeStartFalloff = 90 -- How long will bullet travel in Meters before starting to lose damage?
SWEP.Primary.MaxFalloff         = 12 -- Maximal amount of damage to be lost


SWEP.MoveSpeed = 0.85 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.8 --Multiply the player's movespeed by this when sighting.
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = false -- Disable round-in-the-chamber
SWEP.Primary.Automatic = false -- Automatic/Semi Auto
SWEP.SelectiveFire		= false

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 57	-- Base damage per bullet
local scale_table = {
    [HITGROUP_HEAD]     = 2.5,
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

SWEP.Primary.Spread		= .065	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.SpreadMultiplierMax = 0--How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 0 --How much the spread recovers, per second. Example val: 3

SWEP.ViewModelBoneMods = {
        ["A_Optic"] = { scale = Vector(1, 1, 1), pos = Vector(0.0, 0.3, -0.426), angle = Angle(0, 0, 0) }
}

SWEP.Attachments = {
                       [1] = { offset = { 0, 0 }, atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
                       [2] = { offset = { 0, 0 }, atts = { "ins2_ub_laser" }, order = 5 },
                       [3] = { offset = { 0, 0 }, atts = { "ins2_si_2xrds", "ins2_si_c79", "ins2_si_mx4" }, order = 1 },
                       [4] = { offset = { 0, 0 }, atts = { "ins2_fg_grip" }, order = 4 },
                       [5] = { offset = { 0, 0 }, atts = { "ins2_br_heavy", "ins2_br_light"  }, order = 3 },
                       [6] = { offset = { 0, 0 }, atts = { "am_match_dmr", "am_magnum_dmr", "am_gib_dmr" }, order = 6 },
}

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 4

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.905, 0, 1.462)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.IronSightsPos_EOTech = Vector(-2.945, 0, 1.262)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)
SWEP.IronSightsPos_Kobra = Vector(-2.955, 0, 1.496)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 0)
SWEP.IronSightsPos_C79 = Vector(-2.95, 0, 0.855)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.IronSightsPos_PO4X = Vector(-2.872, -2.5, 1.392)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.IronSightsPos_2XRDS = Vector(-2.947, -1, 1.255)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.IronSightsPos_RDS = Vector(-2.945, 0, 1.262)
SWEP.IronSightsAng_RDS = Vector(0, 0, 0)
SWEP.IronSightsPos_PMII = Vector(-2.903, -3.75, 1.193)
SWEP.IronSightsAng_PMII = Vector(0, 0, 0)
SWEP.IronSightsPos_T1 = Vector(-2.893, -5.75, -0.865)
SWEP.IronSightsAng_T1 = Vector(0, 0, 0)
SWEP.IronSightsPos_MX4 = Vector(-2.95, 0, 1.14)
SWEP.IronSightsAng_MX4 = Vector(0, 0, -0.85)
SWEP.RunSightsPos = Vector(4.762, -4.238, -0.717)
SWEP.RunSightsAng = Vector(-6.743, 46.284, 0)
SWEP.InspectPos = Vector(7.76, -2, 0.016)
SWEP.InspectAng = Vector(1, 37.277, 3.2)

SWEP.Offset = {
	Pos = {
		Up = -1.166,
		Right = 0.977,
		Forward = 4.34
	},
	Ang = {
		Up = 0,
		Right = -10.869,
		Forward = 180,
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

SWEP.VElements = {
        ["sights_folded"] = { type = "Model", model = "models/weapons/upgrades/v_g28_default_sights.mdl", bone = "b_wpn", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true },
        ["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.194, 11.875, 1.876), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },
        ["laser"] = { type = "Model", model = "models/weapons/upgrades/v_g28_laser.mdl", bone = "b_wpn", rel = "", pos = Vector(-0.545, 0.101, -0.1), angle = Angle(0, 0, 90), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["suppressor"] = { type = "Model", model = "models/weapons/upgrades/v_g28_silencer.mdl", bone = "A_Suppressor", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_PMII"] = { type = "Model", model = "models/weapons/upgrades/v_g28_scope.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
        ["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
        ["scope_PMII_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
        ["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
        ["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["foregrip"] = { type = "Model", model = "models/weapons/upgrades/v_g28_foregrip.mdl", bone = "b_wpn", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_mx4"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_m40_l.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
}

SWEP.WElements = {
	["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
              ["sights_folded"] = { type = "Model", model = "models/weapons/upgrades/w_g28_sights.mdl", bone = "b_wpn", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true },
        ["laser"] = { type = "Model", model = "models/weapons/upgrades/w_g28_laser.mdl", bone = "b_wpn", rel = "", pos = Vector(-0.545, 0.101, -0.1), angle = Angle(0, 0, 90), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["suppressor"] = { type = "Model", model = "models/weapons/upgrades/w_g28_silencer.mdl", bone = "A_Suppressor", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_PMII"] = { type = "Model", model = "models/weapons/upgrades/w_g28_scope.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["foregrip"] = { type = "Model", model = "models/weapons/upgrades/w_g28_foregrip.mdl", bone = "b_wpn", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(-36.681, 1.572, 19.11), angle = Angle(0, 0, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(5.985, 1.572, 14.368), angle = Angle(0, 0, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 2, 2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_mx4"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_scope_m40.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
}

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA

SWEP.BlowbackEnabled = false --Enable Blowback?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "RifleShellEject"-- ShotgunShellEject shotgun or ShellEject for a SMG    

SWEP.LuaShellEject = true

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_sprint", --Number for act, String/Number for sequence
                             ["value_empty"] = "empty_sprint", --Number for act, String/Number for sequence
		["is_idle"] = true
	}
}

SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_PRIMARYATTACK_1, --Number for act, String/Number for sequence
		["value_last"] = ACT_VM_PRIMARYATTACK_2,
		["value_empty"] = ACT_VM_PRIMARYATTACK_3
	} --What do you think
}
