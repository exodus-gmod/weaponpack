-- Variables that are used on both client and server
SWEP.Gun = ("tfa_nam_ppsh41") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "TFA Born To Kill: Vietnam" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell"	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Author				= "Georgi Shpagin"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "PPSH-41"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 3			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 35		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 62
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_ppsh.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_aug.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.ShowWorldModel			= false
SWEP.UseHands = true

SWEP.Primary.Sound			= Sound("weapons/tfa_ppsh41/mp5k_fp.wav")
SWEP.Primary.RPM			= 950			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 130		-- Bullets you start with
SWEP.Primary.KickUp				= 0.42		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.12		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.07		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= false
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 29.2	-- Base damage per bullet
SWEP.Primary.Spread		= .016	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .009 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.SightsPos = Vector(-1.816, 0, 0.781)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.InspectPos = Vector(7.76, -1.178, 0.016)
SWEP.InspectAng = Vector(1, 37.277, 3.2)

SWEP.MuzzleAttachmentSilenced = 3
SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModWorldAttachment = 0
SWEP.Blowback_Shell_Effect = "RifleShellEject" --Which shell effect to use
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "RifleShellEject" --The effect used for shell ejection; Defaults to that used for blowback

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

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(1.297, -1.167, 0) }
}

SWEP.VElements = {
	["mag"] = { type = "Model", model = "models/weapons/upgrades/v_ppshmag.mdl", bone = "RealMag", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = true },
                        ["sling"] = { type = "Model", model = "models/weapons/upgrades/v_ppshsling.mdl", bone = "sling1", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["mag_drum"] = { type = "Model", model = "models/weapons/upgrades/v_ppshdrum.mdl", bone = "RealMag", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false }
}

SWEP.WElements = {
	["ref"] = { type = "Model", model = "models/weapons/w_ppsh.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.421, 0.949, 0.81), angle = Angle(-165.271, -180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sling"] = { type = "Model", model = "models/weapons/upgrades/v_ppshsling.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ref", pos = Vector(-19.903, -3.375, 7.019), angle = Angle(0, 0.273, 0), size = Vector(2, 2, 2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },
	["mag"] = { type = "Model", model = "models/weapons/upgrades/w_ppshmag.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ref", pos = Vector(-0.036, 0, -0.098), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true },
	["mag_drum"] = { type = "Model", model = "models/weapons/upgrades/w_ppshdrum.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }
}

SWEP.MuzzleAttachmentSilenced = 3
SWEP.LaserSightModAttachment = 1
SWEP.Primary.ClipSize_Drum = 71

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum" }, order = 2 },
                        [2] = { offset = { 0, 0 }, atts = { "tfa_nam_sling" }, order = 3 },
                        [3] = { offset = { 0, 0 }, atts = { "ins2_mag_drum_75rd" }, order = 4 },
}