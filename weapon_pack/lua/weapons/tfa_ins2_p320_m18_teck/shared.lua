-- Variables that are used on both client and server
SWEP.Gun = ("tfa_ins2_p320_m18_teck") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - Pistols" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Manufacturer = "SIG USA" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "The Master MLG, Water, Delarobe - Edit by Lucho"
SWEP.Contact				= ""
SWEP.Purpose				= "An american sidearm preferred by military contractors. Compact, modular, and with high capacity."
SWEP.Instructions				= ""
SWEP.PrintName				= "SIG SAUER P320"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 20		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false -- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "pistol"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/toko/v_p320.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/toko/w_p320.mdl"	-- Weapon world model
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.ShowWorldModel			= true
SWEP.UseHands = true

SWEP.Primary.Sound			= Sound("Weapon_P320_1")
SWEP.Primary.SilencedSound			= Sound("Weapon_P320_2")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 650			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 17		-- Size of a clip
SWEP.Primary.DefaultClip		= 85		-- Bullets you start with
SWEP.Primary.KickUp			= 0.22		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.095		-- Maximum up recoil (stock)
SWEP.Primary.StaticRecoilFactor = 1
SWEP.Primary.Automatic			= false	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= false

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 30	-- Base damage per bullet
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

SWEP.Primary.Spread		= .035	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.SpreadMultiplierMax = 0 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 0 --How much the spread recovers, per second. Example val: 3
--Penetration Related
SWEP.MaxPenetrationCounter = 0 --The maximum number of ricochets.  To prevent stack overflows.
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.RangeFalloffLUT = {
    bezier     = true,
    
    range_func = "quintic",
    units      = "meters",
    
    lut = {
        {range = 0, damage = 1},
        {range = 20, damage = 1},
        {range = 25, damage = 1},
        {range = 30, damage = 0.8},
        {range = 35, damage = 0.65},
    }
}
SWEP.IronSightTime = 0.15
SWEP.MoveSpeed = 1 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.95
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.15
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

-- Enter iron sight info and bone mod info below
SWEP.SightsPos = Vector(1.161, 1.1, 2.479)
SWEP.SightsAng = Vector(0.136, 0, 30)

SWEP.IronSightsPos_RMR = Vector(1.18, 1.1, 2.15)
SWEP.IronSightsAng_RMR = Vector(0.136, 0, 30)
SWEP.VMPos = Vector(-3, 1, -2)
SWEP.VMAng = Vector(0,0,-30)
SWEP.VMPos_Additive = true
SWEP.RunSightsPos = Vector(4.762, -4.238, -0.717)
SWEP.RunSightsAng = Vector(-6.743, 46.284, 0)
SWEP.InspectPos = Vector(7.76, -2, 0.016)
SWEP.InspectAng = Vector(1, 37.277, 3.2)

SWEP.Offset = {
	Pos = {
		Up = -1.8,
		Right = 1.1,
		Forward = 4.295
	},
	Ang = {
		Up = -1.043,
		Right = 0,
		Forward = 180,
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

SWEP.VElements = {
                        ["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_g18.mdl", bone = "A_Muzzle", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["laser"] = { type = "Model", model = "models/weapons/upgrades/a_laser_p320.mdl", bone = "A_Underbarrel", rel = "", pos = Vector(-0.29, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	                ["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0,-0.3,0.2), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	                ["sight_rmr"] = { type = "Model", model = "models/weapons/tfa_eft/upgrades/v_rmr.mdl", bone = "Slide", rel = "", pos = Vector(0.02, -2, 0.5), angle = Angle(0, 180, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
					["sight_rmr_lens"] = (TFA.EFTC and TFA.EFTC.GetHoloSightReticle) and TFA.EFTC.GetHoloSightReticle("sight_rmr") or nil,
					
					["flashlight"] = { type = "Model", model = "models/weapons/upgrades/a_laser_p320.mdl", bone = "A_Underbarrel", rel = "", pos = Vector(-0.29, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

				}

SWEP.WElements = {
	["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_sec.mdl", bone = "ATTACH_Laser", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
        ["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_g18.mdl", bone = "ATTACH_Muzzle", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

		["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_ins.mdl", bone = "ATTACH_Laser", rel = "ref", pos = Vector(9.5, -1.75, -8.75), angle = Angle(-4, 8.5, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	}

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA

SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true --Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "ShellEject"--Which shell effect to use
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "PistolShellEject" --The effect used for shell ejection; Defaults to that used for blowback

SWEP.Attachments = {
                        [2] = { offset = { 0, 0 }, atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
						[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
                        [4] = { offset = { 0, 0 }, atts = { "ins2_ub_laser", "ins2_ub_flashlight1" }, order = 4 },
                        [5] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 5 },
                        [6] = { atts = { "ins2_p320_black", "ins2_p320_classic" }, order = 6 },
}

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only

SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_sprint", --Number for act, String/Number for sequence
		["value_empty"] = "empty_sprint",
		["is_idle"] = true
	}
}

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 4