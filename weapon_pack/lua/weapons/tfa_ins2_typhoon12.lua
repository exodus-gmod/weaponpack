SWEP.Base = "tfa_gun_base"

SWEP.Spawnable = (TFA and TFA.INS2) and true or false -- INSTALL SHARED PARTS
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.Weight = 28

SWEP.PrintName = "Typhoon F12 Custom"
SWEP.Manufacturer = "Typhoon Defence"
SWEP.Category = "EXR - Shotguns"
SWEP.Author = "YuRaNnNzZZ"
SWEP.Type = "Shotgun"

SWEP.DrawCrosshair = true
SWEP.DrawCrosshairIS = false

SWEP.Primary.Sound = Sound("TFA_INS2.WF_SHG53.1")
SWEP.Primary.SilencedSound = Sound("TFA_INS2.WF_SHG53.2")

SWEP.Primary.Damage = 5.5
SWEP.Primary.Knockback = 0
SWEP.Primary.NumShots = 10
SWEP.Primary.Automatic = true
SWEP.Primary.RPM = 300
SWEP.Primary.Velocity = 375 -- m/s

SWEP.FiresUnderwater = false

SWEP.IronInSound = Sound("TFA_INS2.IronIn")
SWEP.IronOutSound = Sound("TFA_INS2.IronOut")

SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 75
SWEP.Primary.Ammo = "buckshot"

SWEP.Primary.KickUp = 1.06
SWEP.Primary.KickDown = 0
SWEP.Primary.KickHorizontal = 0.45
SWEP.Primary.StaticRecoilFactor = 1

SWEP.Primary.Spread = 0.025
SWEP.Primary.IronAccuracy = 0.025
SWEP.Primary.SpreadMultiplierMax = 0
SWEP.Primary.SpreadIncrement = 0
SWEP.Primary.SpreadRecovery = 0

SWEP.Primary.Range = 1000
SWEP.Primary.RangeFalloff = 1
SWEP.Primary.RangeFalloffLUT = {
    bezier     = true,
    
    range_func = "quintic",
    units      = "meters",
    
    lut = {
        {range = 0, damage = 1},
        {range = 20, damage = 1},
        {range = 25, damage = 1},
        {range = 30, damage = 0.75},
        {range = 35, damage = 0.5},
    }
}
SWEP.IronRecoilMultiplier = 1
SWEP.CrouchAccuracyMultiplier = 1
SWEP.CrouchRecoilMultiplier = 1
SWEP.IronSightTime = 0.4
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.4
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)
SWEP.MoveSpeed = 0.9
SWEP.IronSightsMoveSpeed = 0.9

SWEP.ViewModel = "models/weapons/tfa_ins2/c_typhoon12.mdl"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true

SWEP.VMPos = Vector(0, 0, 0)
SWEP.VMAng = Vector(0, 0, 0)
SWEP.VMPos_Additive = false

SWEP.WorldModel = "models/weapons/tfa_ins2/w_typhoon12.mdl"
SWEP.HoldType = "ar2"

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
}

SWEP.RunSightsPos = Vector(2.4, -1.6, -0.8)
SWEP.RunSightsAng = Vector(-24, 32, -32)

SWEP.data = {}
SWEP.data.ironsights = 1

SWEP.IronSightsPos = Vector(-2.998, -4, -0.12)
SWEP.IronSightsAng = Vector(0.335, 0, 5)
SWEP.Secondary.IronFOV = 65

SWEP.IronSightsPos_Kobra = Vector(-3.016, -4, 0.126)
SWEP.IronSightsAng_Kobra = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_Kobra = 65

SWEP.IronSightsPos_EOTech = Vector(-3.019, -4, 0.135)
SWEP.IronSightsAng_EOTech = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_EOTech = 65

SWEP.IronSightsPos_RDS = Vector(-3.019, -4, 0.135)
SWEP.IronSightsAng_RDS = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_RDS = 65

SWEP.IronSightsPos_2XRDS = Vector(-3.019, -4, 0.135)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_2XRDS = 65

SWEP.IronSightsPos_C79 = Vector(-2.981, -4, -0.281)
SWEP.IronSightsAng_C79 = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_C79 = 65

SWEP.IronSightsPos_PO4X = Vector(-2.953, -4, 0.273)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 5)
SWEP.Secondary.IronFOV_PO4X = 65

SWEP.InspectPos = Vector(10, -6, -3.5)
SWEP.InspectAng = Vector(20, 40, 10)

SWEP.StatusLengthOverride = {
	["base_reload"] = 118 / 30,
	["base_reloadempty"] = 115 / 30,

	["foregrip_reload"] = 118 / 30,
	["foregrip_reload_empty"] = 115 / 30,
}

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI
SWEP.SprintBobMult = 0

SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT,
		["value"] = ACT_VM_PRIMARYATTACK_1,
		["value_last"] = ACT_VM_PRIMARYATTACK_2,
		["value_empty"] = ACT_VM_PRIMARYATTACK_3
	}
}

SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "base_sprint",
		["value_empty"] = "empty_sprint",
		["is_idle"] = true
	}
}

SWEP.MuzzleAttachment = "muzzle"
SWEP.ShellAttachment = "shell"
SWEP.MuzzleFlashEffect = "tfa_muzzleflash_shotgun"

SWEP.LuaShellEject = true
SWEP.LuaShellEffect = "RifleShellEject"

SWEP.TracerCount = 3

SWEP.ViewModelBoneMods = {
	["A_Foregrip"] = { scale = Vector(.5, .5, .5), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}
SWEP.WorldModelBoneMods = {
	["ATTACH_Laser"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(180, 0, 0) },
}

SWEP.VElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_typhoon12_sights_up.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },
	["rail_sights"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_typhoon12_sights_down.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_12ga.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_foregrip_ins2.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_l.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "A_Optic", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_rail.mdl", bone = "A_LaserFlashlight", rel = "", pos = Vector(-0.29, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0,0,0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_flashlight_rail.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
}

SWEP.WElements = {
	["sights_folded"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_typhoon12_sights.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec1.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
	["foregrip"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_ins_foregrip.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },

	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_ins.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
}

SWEP.Attachments = {
	[2] = { atts = { "ins2_br_supp", "r6s_muzzle_2", "r6s_flashhider_2" } },
	[3] = { offset = { 0, 0 }, atts = { "ins2_br_heavy" }, order = 3 },
	[4] = { atts = { "ins2_fg_grip" } },
	[1] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" } },
	[5] = { atts = { "ins2_ub_laser", "ins2_ub_flashlight" } },
	[6] = { atts = { "sg_slug" } },
}

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 7
SWEP.LaserDotISMovement = true

SWEP.EventTable = {
	["base_ready"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 32 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltBack")},
		{time = 27 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 46 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltForward")},
		{time = 47 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 63 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["base_draw"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["empty_draw"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["base_holster"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["empty_holster"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["base_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.WF_SHG53.Empty")},
	},
	["base_reload"] = {
		{time = 9 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 38 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.WpnUp")},
		{time = 40 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 41 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipOut")},
		{time = 66 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 81 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 114 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipMove")},
		{time = 118 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipIn")},
		{time = 119 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 141 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["base_reloadempty"] = {
		{time = 7 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 37 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.WpnUp2")},
		{time = 51 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipOut2")},
		{time = 52 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 64 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 98 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 110 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipMove")},
		{time = 114 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 115 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipIn2")},
		{time = 128 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 144 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 145 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltBack2")},
		{time = 154 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltForward2")},
		{time = 155 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 175 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["iron_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.WF_SHG53.Empty")},
	},

	["foregrip_ready"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
		{time = 32 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltBack")},
		{time = 27 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 46 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltForward")},
		{time = 47 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 63 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["foregrip_draw"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["foregrip_draw_empty"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Draw"), client = true, server = false},
	},
	["foregrip_holster"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["foregrip_holster_empty"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
	},
	["foregrip_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.WF_SHG53.Empty")},
	},
	["foregrip_reload"] = {
		{time = 9 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 38 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.WpnUp")},
		{time = 40 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 41 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipOut")},
		{time = 66 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 81 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 114 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipMove")},
		{time = 118 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipIn")},
		{time = 119 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 141 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["foregrip_reload_empty"] = {
		{time = 7 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 37 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.WpnUp2")},
		{time = 51 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipOut2")},
		{time = 52 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 64 / 30, type = "sound", value = Sound("TFA_INS2.Holster"), client = true, server = false},
		{time = 98 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 110 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipMove")},
		{time = 114 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 115 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.ClipIn2")},
		{time = 128 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 144 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 145 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltBack2")},
		{time = 154 / 30, type = "sound", value = Sound("TFA_INS2.WF_SHG53.BoltForward2")},
		{time = 155 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
		{time = 175 / 30, type = "sound", value = Sound("TFA_INS2.LeanIn"), client = true, server = false},
	},
	["foregrip_iron_dryfire"] = {
		{time = 0, type = "sound", value = Sound("TFA_INS2.WF_SHG53.Empty")},
	},
}
