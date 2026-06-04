-- Variables that are used on both client and server
SWEP.Gun = ("tfa_ins2_mk47") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - Assault Rifles" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "muzzle" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.MuzzleAttachmentSilenced = "3"
SWEP.Manufacturer = "CMMG Inc."--Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= "A standart AR that use 7.62x39mm"
SWEP.Instructions				= ""
SWEP.PrintName				= "MK47 Mutant"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 0				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 30		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
SWEP.Type = "Assault Rifle"
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_ins2_mk47mutant.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mk47_mutant.mdl"	-- Weapon world model
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = true
SWEP.ShowWorldModel			= true
SWEP.UseHands = true

SWEP.Primary.Sound			= Sound("TFA_INS2_MK47MUTANT.1")
SWEP.Primary.SilencedSound			= Sound("TFA_INS2_MK47MUTANT_SUPP.1")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 650		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30	-- Size of a clip
SWEP.Primary.DefaultClip		= 150		-- Bullets you start with
SWEP.Primary.KickUp			= 0.122	-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.084		-- Maximum up recoil (stock)
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles. Enter what fraction or percentage (in decimal form) you want. This is also affected by a convar that defaults to 0.5.
SWEP.IronRecoilMultiplier = 1
SWEP.CrouchRecoilMultiplier = 1
SWEP.MoveSpeed = 0.95 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.9
SWEP.IronSightTime = 0.35        --Multiply the player's movespeed by this when sighting.
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = false -- Disable round-in-the-chamber

SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.SelectiveFire		= false
SWEP.DisableBurstFire = false
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
SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 36	-- Base damage per bullet
SWEP.Primary.Spread		= .035	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.35
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.76, 0, 0.699)
SWEP.IronSightsAng = Vector(0.323, 0, 0)
SWEP.IronSightsPos_EOTech = Vector(-2.836, 0, 0.835)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)
SWEP.IronSightsPos_Kobra = Vector(-2.840, 0, 1.045)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 0)
SWEP.IronSightsPos_C79 = Vector(-2.836, -1.25, 0.458)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.IronSightsPos_PO4X = Vector(-2.77, -1.2, 0.948)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.IronSightsPos_2XRDS = Vector(-2.836, 0, 0.818)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.IronSightsPos_RDS = Vector(-2.836, 0, 0.815)
SWEP.IronSightsAng_RDS = Vector(0, 0, 0)
SWEP.InspectPos = Vector(5.806, 2.255, -0.826)
SWEP.InspectAng = Vector(4.802, 15.925, 5.096)

SWEP.ViewModelBoneMods = {
        ["A_Optic"] = { scale = Vector(0.9, 0.9, 0.9), pos = Vector(-0.15, -0.55, -0.625), angle = Angle(0, 0, 0) },
        ["A_Suppressor"] = { scale = Vector(0.7, 0.7, 0.7), pos = Vector(0, 0, 0.2), angle = Angle(0, 0, 0) },
        ["A_Foregrip"] = { scale = Vector(0.425, 0.425, 0.425), pos = Vector(0, 0.1, -0.15), angle = Angle(0, 0, 0) }
}

SWEP.Offset = {
	Pos = {
		Up = -1.425,
		Right = 0.925,
		Forward = 3.4
	},
	Ang = {
		Up = 0.2,
		Right = -2.05,
		Forward = 180,
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

SWEP.VElements = {
        ["sights_folded"] = { type = "Model", model = "models/weapons/upgrades/v_mk47mutant_sights.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },
        ["mag"] = { type = "Model", model = "models/weapons/upgrades/v_mk47mutant_mag.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },
        ["mag_ext"] = { type = "Model", model = "models/weapons/upgrades/v_mk47mutant_extended_mag.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec.mdl", bone = "A_Suppressor", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
        ["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
        ["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
        ["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_foregrip_sec.mdl", bone = "b_wpn", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
}

SWEP.WElements = {
        ["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["sights_folded"] = { type = "Model", model = "models/weapons/upgrades/w_mk47_mutant_sights.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },
        ["mag"] = { type = "Model", model = "models/weapons/upgrades/w_mk47_mutant_mag.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },
        ["mag_ext"] = { type = "Model", model = "models/weapons/upgrades/w_mk47_mutant_mag_extended.mdl", bone = "b_wpn", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec2.mdl", bone = "ATTACH_Suppressor", rel = "", pos = Vector(-2.609, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_foregrip_sec1.mdl", bone = "R Hand", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(-36.681, 1.572, 19.11), angle = Angle(0, 0, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(5.985, 1.572, 14.368), angle = Angle(0, 0, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 2, 2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
        ["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
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

SWEP.Attachments = {
	[1] = { atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
	[2] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" }, order = 1},
	[6] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
	[4] = { atts = { "ins2_fg_grip" }, order = 4},
	[5] = { atts = { "am_match", "am_magnum", "am_gib" }, order = 5 },
}
