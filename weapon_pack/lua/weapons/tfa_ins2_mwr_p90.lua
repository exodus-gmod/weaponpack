SWEP.Base				= "tfa_gun_base"
SWEP.Category			= "EXR - SMGs" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer		= "" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "TFA" --Author Tooltip
SWEP.Contact			= "" --Contact Info Tooltip
SWEP.Purpose			= "" --Purpose Tooltip
SWEP.Instructions		= "" --Instructions Tooltip
SWEP.Spawnable			= (TFA and TFA.INS2) and true or false --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable		= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair		= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS	= false --Draw the crosshair in ironsights?
SWEP.PrintName			= "P90"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 0				-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos			= 1			-- Position in the slot
SWEP.AutoSwitchTo		= false -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom		= false -- Auto switch from if you pick up a better weapon
SWEP.Weight				= 26			-- This controls how "good" the weapon is for autopickup.
SWEP.Type = "Sub-Machine Gun"

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("TFA_INS2.MWR_P90.1") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("TFA_INS2.MWR_P90.2") -- This is the sound of the weapon, when you shoot.

SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage = 20 -- Damage, in standard damage points.
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
SWEP.Primary.Knockback = 0 --Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 900 -- This is in Rounds Per Minute / RPM
SWEP.Primary.DryFireDelay = nil --How long you have to wait after firing your last shot before a dryfire animation can play.  Leave nil for full empty attack length.  Can also use SWEP.StatusLength[ ACT_VM_BLABLA ]
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate
SWEP.FiresUnderwater = false
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
--Ammo Related
SWEP.Primary.ClipSize = 50 -- This is the size of a clip
SWEP.Primary.DefaultClip = 250 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "smg1" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false --Disable round-in-the-chamber
--Recoil Related
SWEP.Primary.KickUp = 0.127 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.076 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 1 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = .03 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .00001 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 0 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery =  0 --How much the spread recovers, per second. Example val: 3
--Range Related
SWEP.Primary.Range = 1000 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
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
--Penetration Related
SWEP.MaxPenetrationCounter = 0 --The maximum number of ricochets.  To prevent stack overflows.
--Misc
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.JumpAccuracyMultiplier = 5
SWEP.IronSightTime = 0.25
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.25
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)
--Movespeed
SWEP.MoveSpeed = 1.15 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 1.1 --Multiply the player's movespeed by this when sighting.
--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/weapons/tfa_ins2/c_mwr_p90.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0, 0, 0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CameraAttachmentOffsets = {}
SWEP.CameraAttachmentScale = 1
SWEP.CenteredPos = nil --The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil --The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = {

}
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/weapons/tfa_ins2/w_mwr_p90.mdl" -- Weapon world model path
SWEP.Bodygroups_W = {}
SWEP.HoldType = "revolver" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles
SWEP.Offset = {
	Pos = {
		Up = -2,
		Right = 1,
		Forward = 8
	},
	Ang = {
		Up = 0,
		Right = -6,
		Forward = 178
	},
	Scale = 1
} --Procedural world model animation, defaulted for CS:S purposes.

SWEP.ThirdPersonReloadDisable = false --Disable third person reload?  True disables.
--[[SPRINTING]]--
SWEP.RunSightsPos = SWEP.VMPos
SWEP.RunSightsAng = SWEP.VMAng
SWEP.SafetyPos = Vector(0, -7.428, -5.353)
SWEP.SafetyAng = Vector(60, 0, 0)
SWEP.SprintAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_IDLE_TO_LOWERED --Number for act, String/Number for sequence
	},
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_IDLE_LOWERED, --Number for act, String/Number for sequence
		["is_idle"] = true
	},
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_LOWERED_TO_IDLE --Number for act, String/Number for sequence
	}
}
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 65 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-3.28, -3.665, -0.65)
SWEP.IronSightsAng = Vector(1.547, 0.019, 0)

SWEP.IronSightsPos_Kobra = Vector(-3.28, -4, -0.81)
SWEP.IronSightsAng_Kobra = Vector(0, 0.015, 0)
SWEP.Secondary.IronFOV_Kobra = 65

SWEP.IronSightsPos_EOTech = Vector(-3.282, -4, -0.8)
SWEP.IronSightsAng_EOTech = Vector(0.004, 0.009, 0)
SWEP.Secondary.IronFOV_EOTech = 65

SWEP.IronSightsPos_RDS = Vector(-3.282, -4, -0.8)
SWEP.IronSightsAng_RDS = Vector(0, 0.009, 0)
SWEP.Secondary.IronFOV_RDS = 65

SWEP.IronSightsPos_2XRDS = Vector(-3.281, -6, -0.802)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 65

SWEP.IronSightsPos_C79 = Vector(-3.283, -6, -0.921)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_C79 = 65

SWEP.IronSightsPos_PO4X = Vector(-3.224, -6, -0.489)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_PO4X = 65

--[[INSPECTION]]--
SWEP.InspectPos = Vector(10, -6, -2)
SWEP.InspectAng = Vector(28, 56, 16)
--[[VIEWMODEL ANIMATION HANDLING]]--
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS.
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_LUA -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.25 --Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 --Start an idle this far early into the end of another animation
SWEP.SprintBobMult = 0
--Shell eject override
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
--[[EVENT TABLE]]--

function SWEP:UpdateBeltBG(vm)
	local target = self:Clip1()

	if TFA.Enum.ReloadStatus[self:GetStatus()] then
		target = self:Clip1() + self:Ammo1()
	end

	self.Bodygroups_V[1] = math.Clamp(math.ceil(target / 5), 0, 10)
end

SWEP.EventTable = {
	[ACT_VM_DRAW] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw")},
		{time = 1 / 30, type = "lua", value = SWEP.UpdateBeltBG},
	},
	[ACT_VM_DRAW_DEPLOYED] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw")},
		{time = 1 / 30, type = "lua", value = SWEP.UpdateBeltBG},
		{time = 12 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Chamber")}
	},
	[ACT_VM_HOLSTER] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster")},
	},
	[ACT_VM_RELOAD] = {
		{time = 1 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Lift")},
		{time = 12 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.ClipOut")},
		{time = 30 / 30, type = "lua", value = SWEP.UpdateBeltBG},
		{time = 55 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.ClipIn")},
		{time = 67 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Hit")}
	},
	[ACT_VM_RELOAD_EMPTY] = {
		{time = 1 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Lift")},
		{time = 12 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.ClipOut")},
		{time = 30 / 30, type = "lua", value = SWEP.UpdateBeltBG},
		{time = 55 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.ClipIn")},
		{time = 67 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Hit")},
		{time = 89 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Chamber")}
	},
	[ACT_VM_FIDGET] = {
		{time = 1 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Look1")},
		{time = 50 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Look2")},
		{time = 105 / 30, type = "sound", value = Sound("TFA_INS2.MWR_P90.Look3")}
	},
	[ACT_VM_PRIMARYATTACK] = {
		{time = 0 / 30, type = "lua", value = SWEP.UpdateBeltBG},
	},
	[ACT_VM_PRIMARYATTACK_1] = {
		{time = 0 / 30, type = "lua", value = SWEP.UpdateBeltBG},
	}
}
--[[ATTACHMENTS]]--

SWEP.ViewModelBoneMods = {
	["tag_flash"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 90) },
	["tag_silencer"] = { scale = Vector(1, 1, 1), pos = Vector(-1.0, 0, 0), angle = Angle(0, 0, 0) },
	["A_Optic"] = { scale = Vector(0.925, 0.925, 0.925), pos = Vector(2.775, 0, 5.525), angle = Angle(0, -90, -90) },
	["A_Suppressor"] = { scale = Vector(0.675, 0.675, 0.675), pos = Vector(7.025, 0.075, 2.475), angle = Angle(0, -90, 0) },
	["A_LaserFlashlight"] = { scale = Vector(1, 1, 1), pos = Vector(4.575, 0.675, 4.825), angle = Angle(0, 0, 0) },
}
SWEP.WorldModelBoneMods = {
	["tag_flash"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 90) },
	["tag_silencer"] = { scale = Vector(1, 1, 1), pos = Vector(-1.0, 0, 0), angle = Angle(0, 0, 0) },
	["ATTACH_ModKit"] = { scale = Vector(0.75, 0.75, 0.75), pos = Vector(2.775, 0, 5.525), angle = Angle(0, 0, 90) },
	["ATTACH_Muzzle"] = { scale = Vector(0.5, 0.5, 0.5), pos = Vector(7.025, 0.075, 2.475), angle = Angle(0, 0, 0) },
	["ATTACH_Laser"] = { scale = Vector(1, 1, 1), pos = Vector(4.575, 0.675, 4.825), angle = Angle(0, 0, 180) },
}

SWEP.VElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_standard_mwr_p90.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = true, active = true, bodygroup = {} },
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_l.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24_m.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec.mdl", bone = "A_Suppressor", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_rail.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(-0.29, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0,0,0), angle = Angle(1.225, 0, 0), size = Vector(1, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false }
}
SWEP.WElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_standard_mwr_p90.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = true, active = true, bodygroup = {} },
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "ATTACH_ModKit", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec1.mdl", bone = "ATTACH_Muzzle", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_ins.mdl", bone = "ATTACH_Laser", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

}
SWEP.Attachments = {
	[1] = { atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" }, order = 2 },
	[2] = { atts = { "am_match", "am_magnum", "am_gib" }, order = 5 },
	[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
	[7] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" }, order = 1 },
	[9] = { atts = { "ins2_ub_laser" }, order = 4 },
}

SWEP.MuzzleAttachmentSilenced = 3

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 4
SWEP.LaserDotISMovement = true

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.StatusLengthOverride = {
	[ACT_VM_RELOAD] = 58 / 30,
	[ACT_VM_RELOAD_EMPTY] = 58 / 30
}

DEFINE_BASECLASS(SWEP.Base)

function SWEP:Initialize(...)
	if TFA.COD then
		self.Primary.Sound = Sound("TFA_INS2.MWR_P90.1N")
		self.Primary.SilencedSound = Sound("TFA_INS2.MWR_P90.2N")
		self.Primary.SoundEchoTable = {
			[0] = Sound("TFA_INS2.MWR_P90.TailInside"),
			[256] = Sound("TFA_INS2.MWR_P90.TailOutside")
		}
	end

	return BaseClass.Initialize(self, ...)
end