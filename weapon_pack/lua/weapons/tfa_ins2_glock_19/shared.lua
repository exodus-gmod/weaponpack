-- Variables that are used on both client and server
SWEP.Gun = ("tfa_ins2_glock_19") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - Pistols" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Author				= "Lucho & LB"
SWEP.Contact				= ""
SWEP.Purpose				= "A reliable and compact 9x19 pistol made by GLOCK. Best for quick draws."
SWEP.Instructions				= ""
SWEP.PrintName				= "Glock 19"		-- Weapon name (Shown on HUD)	
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
SWEP.ViewModel				= "models/weapons/v_glock19.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/tfa_ins2/w_glock19.mdl"	-- Weapon world model
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.ShowWorldModel			= true
SWEP.UseHands = true

--Penetration Related
SWEP.MaxPenetrationCounter = 0 --The maximum number of ricochets.  To prevent stack overflows.
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through


SWEP.Primary.Sound			= Sound("weapons/glock_19/glock18-1.wav")
SWEP.Primary.SilencedSound			= Sound("weapons/glock_19/glock18_suppresed.wav")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 12		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.087		-- Maximum up recoil (stock)
SWEP.Primary.StaticRecoilFactor = 1
SWEP.Primary.Automatic			= false	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= false
SWEP.CanBeSilenced		= false
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

SWEP.Secondary.IronFOV			= 75		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 32	-- Base damage per bullet
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
SWEP.IronSightTime = 0.15
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.15
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)


-- Enter iron sight info and bone mod info below - Lucho (safe)
SWEP.SightsPos = Vector(-1.950, 0, 0.450)
SWEP.SafetyAng = Vector(-11, 8, -10)
SWEP.InspectPos = Vector(7.76, -5.178, 0.016)
SWEP.InspectAng = Vector(1, 37.277, 3.2)

SWEP.IronSightsPos = Vector(-1.989, 0.1, 0.37)
SWEP.IronSightsAng = Vector(0.5, 0, 0)

SWEP.Offset = {
	Pos = {
		Up = -0.9,
		Right = 0.964,
		Forward = 4.796
	},
	Ang = {
		Up = 0,
		Right = -5.844,
		Forward = 180
	},
	Scale = 0.90 	 
} --Procedural world model animation, defaulted for CS:S purposes.

SWEP.WElements = {
	["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
}

SWEP.Primary.ClipSize_ExtPistol = 25

SWEP.VElements = {
                        ["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_pistol.mdl", bone = "Weapon", rel = "", pos = Vector(-0.132, 4, 0.352), angle = Angle(0, -90.44, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active =false, bonemerge = false },
                        
				["mag"] = { type = "Model", model = "models/weapons/upgrades/a_maganize_glock19.mdl", bone = "Magazine", rel = "", pos = Vector(1.21, -11.7, 6), angle = Angle(-11.528, -85.519, 0.18), size = Vector(1.2, 1.2, 1.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = true },
				
				["laser"] = { type = "Model", model = "models/weapons/upgrades/a_laser_glock19.mdl", bone = "A_Underbarrel", rel = "", pos = Vector(-14.5, -1.6, 1.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
		
	 			["flashlight"] = { type = "Model", model = "models/weapons/upgrades/a_laser_glock19.mdl", bone = "A_Underbarrel", rel = "", pos = Vector(-14.5, -1.6, 1.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
				

				["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Underbarrel", rel = "laser", pos = Vector(0,0.1,-1.2), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

				["sight_rmr"] = { type = "Model", model = "models/weapons/tfa_eft/upgrades/v_rmr.mdl", bone = "Slide", rel = "", pos = Vector(-0.09, -1.7, 0.4), angle = Angle(0, 180, 0), size = Vector(0.65, 0.7, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
				["sight_rmr_lens"] = (TFA.EFTC and TFA.EFTC.GetHoloSightReticle) and TFA.EFTC.GetHoloSightReticle("sight_rmr") or nil,



}

SWEP.WElements = {
				["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["mag_ext"] = { type = "Model", model = "models/weapons/upgrades/a_magazine_glock19_33.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.765, 2.45, -1.719), angle = Angle(-180, 180, 0), size = Vector(0.779, 0.779, 0.779), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },
				["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_pistol.mdl", bone = "ATTACH_Muzzle", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
				["laser"] = { type = "Model", model = "models/weapons/upgrades/w_glock19_laser.mdl", bone = "ATTACH_Laser", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
				["flashlight"] = { type = "Model", model = "models/weapons/upgrades/w_glock19_laser.mdl", bone = "ATTACH_Laser", rel = "ref", pos = Vector(15,15,3), angle = Angle(180, 0, -90), size = Vector(1.299, 1.299, 1.299), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
				

}


SWEP.MuzzleAttachmentSilenced = 3

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
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
SWEP.MuzzleAttachmentSilenced = 3
SWEP.LaserSightModAttachmentWorld = 3
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true --Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "ShellEject"--Which shell effect to use
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = -8 --The delay to actually eject things
SWEP.LuaShellEffect = "PistolShellEject" --The effect used for shell ejection; Defaults to that used for blowback

SWEP.IronSightsPos_RMR = Vector(-1.975, 0.5, 0.2)
SWEP.IronSightsAng_RMR = Vector(0, 0, 0)

SWEP.Attachments = {
						[2] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 4 },
						[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 2 },
                        [4] = { offset = { 0, 0 }, atts = { "ins2_ub_laser", "ins2_ub_flashlight2" }, order = 3 },
                        [6] = { offset = { 0, 0 }, atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 1 },
                        [5] = { offset = { 0, 0 }, atts = { "ins2_glock19_stainless_camo", "ins2_glock19_two_tone_camo" }, order = 5 },
}