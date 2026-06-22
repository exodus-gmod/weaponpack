-- Variables that are used on both client and server
SWEP.Gun = ("tfa_ins2_rpk12") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - LMGs" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell"	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Author				= "The Master MLG - Edit by Lucho"
SWEP.Manufacturer = "Kalashnikov Concern " --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Contact				= ""
SWEP.Purpose				= "A robust, russian LMG with a drum magazine. Chambered in 7.62x39."
SWEP.Instructions				= ""
SWEP.PrintName				= "RPK-12"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 39		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false -- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_rpk12.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rpk12.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.UseHands =true

SWEP.Primary.Sound			= Sound("weapons/tfa_ins2_rpk_12/rpk_12_fire.wav")
SWEP.Primary.RPM			= 650			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 75		-- Size of a clip
SWEP.Primary.DefaultClip		= 375		-- Bullets you start with
SWEP.Primary.KickUp				= 0.258		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.15		-- Maximum up recoil (stock)
SWEP.Primary.StaticRecoilFactor = 1
SWEP.Primary.Automatic			= true	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true
SWEP.DisableBurstFire = true --Only auto/single?
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 65 -- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
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
SWEP.Primary.Damage		= 39	-- Base damage per bullet
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
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 0.4
SWEP.MoveSpeed = 0.8 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.75 --Multiply the player's movespeed by this when sighting.
SWEP.IronSightTime = 0.5
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.5
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.Offset = {
	Pos = {
		Up = -0.6,
		Right = 0.964,
		Forward = 5.1
	},
	Ang = {
		Up = 0,
		Right = -5.844,
		Forward = 180
	},
	Scale = 0.9
} --Procedural world model animation, defaulted for CS:S purposes.

--Penetration Related
SWEP.MaxPenetrationCounter = 0--The maximum number of ricochets.  To prevent stack overflows.
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.32, 0, -0.04)
SWEP.IronSightsAng = Vector(1.105, 0, 0)

SWEP.IronSightsPos_Kobra = Vector(-2.314, 0, -0.65)
SWEP.IronSightsAng_Kobra = Vector(1.105, 0, 0)

SWEP.IronSightsPos_EOTech = Vector(-2.32, 0, -0.584)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 0)

SWEP.IronSightsPos_2XRDS = Vector(-2.31, -1, -0.61)
SWEP.IronSightsAng_2XRDS = Vector(0.3, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 65
SWEP.RTScopeFOV_2XRDS        = 30

SWEP.IronSightsPos_PO4X = Vector(-2.25, -1, -0.5)
SWEP.IronSightsAng_PO4X = Vector(0.3, 0, 0)
SWEP.Secondary.IronFOV_PO4X = 65
SWEP.RTScopeFOV_PO4X        = 50

SWEP.InspectPos = Vector(7.76, 0.567, 0.016)
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

SWEP.EventTable = {
	[ACT_VM_FIREMODE] = {
		{time = 8 / 30, type = "sound", value = Sound("rpk_12_fire")},
	},
}

SWEP.ViewModelBoneMods = {
	["A_Optic"] = { scale = Vector(0.8, 0.8, 0.8), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
--	["A_LaserFlashlight"] = { scale = Vector(0.8, 0.8, 0.8), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
--	["L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}



SWEP.WElements = {
	["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true },
                        ["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 122), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
                        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "ATTACH_ModKit", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },       
}

SWEP.VElements = {
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x_lens"] = { type = "Model", model = "models/rtcircle.mdl", bone = "Lense_RT", rel = "scope_po4x", pos = Vector(0, 0, -1.6), angle = Angle(-90, 0, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
                        ["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
}

SWEP.Attachments = {
	[2] = { offset = { 0, 0 }, atts = { "am_match", "am_magnum", "am_gib" }, order = 4 },
	[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
                        [7] = { offset = { 0, 0 }, atts = { "ins2_si_kobra", "ins2_si_eotech",  "ins2_si_2xrds", "ins2_si_po4x" }, order = 1 },
			[8] = { offset = { 0, 0 }, atts = { "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
}

SWEP.RTAttachment_2XRDS = 2
SWEP.ScopeOverlayTransforms_2XRDS = { 0, 0 }
SWEP.ScopeDistanceRange_2XRDS = 777
SWEP.ScopeDistanceMin_2XRDS = 777

SWEP.RTAttachment_PO4X = 5
SWEP.ScopeOverlayTransforms_PO4X = { 0, 0 }
SWEP.ScopeDistanceRange_PO4X = 777
SWEP.ScopeDistanceMin_PO4X = 777