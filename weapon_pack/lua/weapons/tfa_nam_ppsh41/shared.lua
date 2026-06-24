-- Variables that are used on both client and server
SWEP.Gun = ("tfa_nam_ppsh41") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - SMGs" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell"	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Author				= "Georgi Shpagin"
SWEP.Contact				= ""
SWEP.Purpose				= "An old russian SMG. Chambered in 9x18. Lacks modularity, but comes with a drum magazine option."
SWEP.Instructions				= ""
SWEP.PrintName				= "PPSH-41"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 26		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
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
SWEP.Primary.RPM			= 1050			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 41		-- Size of a clip
SWEP.Primary.DefaultClip		= 205		-- Bullets you start with
SWEP.Primary.KickUp				= 0.125		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.082		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= false
SWEP.CanBeSilenced		= false
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.JumpAccuracyMultiplier = 5
SWEP.IronSightTime = 0.25
SWEP.MoveSpeed = 1.15 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed =  1.1 --Multiply the player's movespeed by this when sighting.
SWEP.Primary.RangeFalloffLUT = {
    bezier     = true,
    
    range_func = "quintic",
    units      = "meters",
    
    lut = {
        {range = 0, damage = 1},
        {range = 25, damage = 1},
        {range = 30, damage = 1},
        {range = 35, damage = 0.8},
        {range = 40, damage = 0.65},
    }
}
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.25
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)
SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 20	-- Base damage per bullet
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

SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.SpreadMultiplierMax = 0 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 0 --How much the spread recovers, per second. Example val: 3
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
	[1] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 5 },
                        [2] = { offset = { 0, 0 }, atts = { "tfa_nam_sling" }, order = 3 },
                        [3] = { offset = { 0, 0 }, atts = { "ins2_mag_drum_75rd" }, order = 4 },
						[4] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 2 },
						[5] = { offset = { 0, 0 }, atts = { "r6s_muzzle_2", "r6s_flashhider_2" }, order = 1 },
}