if not TFA_ATTACHMENT_ISUPDATING then TFAUpdateAttachments(false) return end

TFA.Attachments.RegisterFromTable("ins2_br_heavy", {
	Name = CLIENT and "#insurgency_weapon_upgrade_heavybarrel" or "Heavy Barrel",
	Description = {
		"#insurgency_weapon_upgrade_heavybarrel_desc",
		TFA.AttachmentColors["+"], "Increases Range by 15%", "Decreases Recoil by 10%",
		TFA.AttachmentColors["-"], "5% decreased movement speed", "Slower ADS speed",
	},
	Icon = "entities/ins2_att_br_heavy.png",
	ShortName = "HBR",

	WeaponTable = {
		["Primary"] = {
			["KickUp"] = function( wep, stat ) return stat * 0.9 end,
			["KickHorizontal"] = function( wep, stat ) return stat * 0.9 end,
			["MinRangeStartFalloff"] = function ( wep, stat) return stat * 1.15 end,
			["Damage"] = function ( wep, stat) return stat * 1 end,
		},
		["IronSightTime"] = function ( wep, stat) return stat * 1.4 end,
		["MoveSpeed"] = function( wep, stat ) return stat * 0.95 end,
		["IronSightsMoveSpeed"] = function( wep, stat ) return stat * 0.95 end,
	},
})

TFA.Attachments.RegisterFromTable("ins2_br_light", {
	Name = "Light Barrel",
	Description = {
		"A lightweight barrel made of aluminum.",
		TFA.AttachmentColors["+"], "5% Increased Movement Speed", "Faster ADS Speed",
		TFA.AttachmentColors["-"], "10% Less Range", "Increases Recoil by 10%",
	},
	Icon = "entities/ins2_att_br_heavy.png",
	ShortName = "LBR",

	WeaponTable = {
		["Primary"] = {
			["KickUp"] = function( wep, stat ) return stat * 1.1 end,
			["KickHorizontal"] = function( wep, stat ) return stat * 1.1 end,
			["MinRangeStartFalloff"] = function ( wep, stat) return stat * 0.9 end,
			["Damage"] = function ( wep, stat) return stat * 1 end,
		},
		["IronSightTime"] = function ( wep, stat) return stat * 0.85 end,
		["MoveSpeed"] = function( wep, stat ) return stat * 1.05 end,
		["IronSightsMoveSpeed"] = function( wep, stat ) return stat * 1.05 end,
	},
})

TFA.Attachments.RegisterFromTable("ins2_br_supp", {
	Name = CLIENT and "#insurgency_weapon_upgrade_silencer" or "Suppressor",
	Description = {
		"#insurgency_weapon_upgrade_silencer_desc",
		TFA.AttachmentColors["+"], "Less firing noise",
		TFA.AttachmentColors["+"], "Slightly Reduced Spread",
        TFA.AttachmentColors["-"], "Slower ADS speed",
		TFA.AttachmentColors["-"], "15% less range"
	},
	Icon = "entities/ins2_att_br_supp.png",
	ShortName = "SUPP",

	WeaponTable = {
		VElements = {
			suppressor = { active = true },
			standard_barrel = { active = false },
		},
		WElements = {
			suppressor = { active = true },
			standard_barrel = { active = false },
		},
		["Primary"] = {
			["MinRangeStartFalloff"] = function(wep,stat) return stat * 0.85 end,
			["Spread"] = function(wep,stat) return stat * 0.9 end,
			["KickHorizontal"] = function(wep,stat) return stat * 1 end,
			["Sound"] = function(wep,stat) return wep.Primary.SilencedSound or stat end
		},
		["IronSightTime"] = function(wep,stat) return stat * 1.3 end,
		["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
		["MuzzleAttachmentMod"] = function(wep,stat) return wep.MuzzleAttachmentSilenced or stat end,
		["Silenced"] = true,
	},

	Attach = function(self, wep)
		wep.Silenced = true
		wep:SetSilenced(wep.Silenced)
	end,

	Detach = function(self, wep)
		wep.Silenced = false
		wep:SetSilenced(wep.Silenced)
	end
})

TFA.Attachments.RegisterFromTable("ins2_fg_gp25", {
	Base = "ins2_gl_base",
	Name = CLIENT and "#insurgency_weapon_gp25_he" or "GP-25",
	Icon = "entities/ins2_att_gp25.png",

	DefaultModel = "models/weapons/tfa_ins2/upgrades/a_projectile_gp25.mdl"
})
TFA.Attachments.RegisterFromTable("ins2_fg_m203", {
	Base = "ins2_gl_base",
	Name = CLIENT and "#insurgency_weapon_m203_he" or "M203",
	Icon = "entities/ins2_att_m203.png",

	DefaultModel = "models/weapons/tfa_ins2/upgrades/a_projectile_m203.mdl"
})

local function reloadAnimFunc(suffix, basePrefix)
	return function(wep, _val)
		local val = table.Copy(_val)
		if val.type == TFA.Enum.ANIMATION_SEQ then
			val.value = val.value .. "_" .. suffix
		else
			val.type = TFA.Enum.ANIMATION_SEQ
			val.value = (basePrefix or "base_reload") .. "_" .. suffix
		end
		return (wep:CheckVMSequence(val.value) and val or _val), true, true
	end
end

TFA.Attachments.RegisterFromTable("ins2_mag_ext_base", {
	Name = "INS2 Extended Mag Base",
	WeaponTable = {
		VElements = { mag = { active = false } },
		WElements = { mag = { active = false } },
	},
	Attach = function(self, wep)
		if not wep:GetIsFirstDeploy() then
			wep:Unload()
		end
	end,
	Detach = function(self, wep)
		wep:Unload()
	end,
})

TFA.Attachments.RegisterFromTable("ins2_mag_drum_75rd", {
	Base = "ins2_mag_ext_base",
	Name = CLIENT and "#insurgency_weapon_upgrade_magazine_drum" or "Drum Magazine",
	Description = {
		TFA.AttachmentColors["+"], "Increases magazine capacity to 75 rounds."
	},
	Icon = "entities/ins2_att_mag_drum_75rd.png",
	ShortName = "DRUM",

	WeaponTable = {
		VElements = { mag_drum = { active = true } },
		WElements = { mag_drum = { active = true } },
		Animations = {
			reload = reloadAnimFunc("drum", "base_reload"),
			reload_empty = reloadAnimFunc("drum", "base_reload_empty"),
		},
		Primary = {
			ClipSize = function(wep, val)
				return wep.Primary.ClipSize_Drum or 75
			end,
		},
	}
})
TFA.Attachments.RegisterFromTable("ins2_mag_ext_carbine_30rd", {
	Base = "ins2_mag_ext_base",
	Name = CLIENT and "#insurgency_weapon_upgrade_magazine_extended" or "Extended Magazine",
	Description = {
		TFA.AttachmentColors["+"], "Increases magazine capacity to 30 rounds."
	},
	Icon = "entities/ins2_att_mag_ext_carbine_30rd.png",
	ShortName = "MAG+",

	WeaponTable = {
		VElements = { mag_ext = { active = true } },
		WElements = { mag_ext = { active = true } },
		Animations = {
			reload = reloadAnimFunc("ext", "base_reload"),
			reload_empty = reloadAnimFunc("ext", "base_reload_empty"),
		},
		Primary = {
			ClipSize = function(wep, val)
				return wep.Primary.ClipSize_ExtCarbine or 30
			end,
		},
	}
})
TFA.Attachments.RegisterFromTable("ins2_mag_ext_pistol", {
	Base = "ins2_mag_ext_base",
	Name = CLIENT and "#insurgency_weapon_upgrade_magazine_extended" or "Extended Magazine",
	Description = {
		TFA.AttachmentColors["+"], "Increases magazine capacity by 25%.",
		TFA.AttachmentColors["-"], ""
	},
	Icon = "entities/ins2_att_mag_ext_pistol.png",
	ShortName = "MAG+",

	WeaponTable = {
		VElements = { mag_ext = { active = true } },
		WElements = { mag_ext = { active = true } },
		Animations = {
			reload = reloadAnimFunc("extmag", "base_reload"),
			reload_empty = reloadAnimFunc("extmag", "base_reload_empty"),
		},
		Primary = {
			ClipSize = function(wep, stat) return stat * 1.25
			end,
		},
		HolsterTime = function (wep,stat) return stat * 1.45 end,
	}
})
TFA.Attachments.RegisterFromTable("ins2_mag_ext_rifle_30rd", {
	Base = "ins2_mag_ext_base",
	Name = CLIENT and "#insurgency_weapon_upgrade_magazine_extended" or "Extended Magazine",
	Description = {
		TFA.AttachmentColors["+"], "Increases magazine capacity to 30 rounds."
	},
	Icon = "entities/ins2_att_mag_ext_rifle_30rd.png",
	ShortName = "MAG+",

	WeaponTable = {
		VElements = { mag_ext = { active = true } },
		WElements = { mag_ext = { active = true } },
		Animations = {
			reload = reloadAnimFunc("ext", "base_reload"),
			reload_empty = reloadAnimFunc("ext", "base_reload_empty"),
		},
		Primary = {
			ClipSize = function(wep, val)
				return wep.Primary.ClipSize_ExtRifle or 30
			end,
		},
	}
})
TFA.Attachments.RegisterFromTable("ins2_mag_speedloader", {
	Name = CLIENT and "#insurgency_weapon_upgrade_speedloader" or "Speed Loader",
	Description = {
		TFA.AttachmentColors["+"], "#insurgency_weapon_upgrade_speedloader_desc"
	},
	Icon = "entities/ins2_att_mag_speedloader.png",
	ShortName = "LOAD+",

	WeaponTable = {
		VElements = { speedloader = { active = true } },
		Shotgun = false,
		Animations = {
			reload = reloadAnimFunc("speed", "base_reload"),
			reload_shotgun_start = { type = 0, value = 0 },
			reload_shotgun_start_is = { type = 0, value = 0 },
			reload_shotgun_finish = { type = 0, value = 0 },
			reload_shotgun_finish_is = { type = 0, value = 0 },
		},
	}
})
TFA.Attachments.RegisterFromTable("ins2_ub_flashlight", {
	Name = CLIENT and "#insurgency_weapon_upgrade_flashlight" or "Flashlight",
	Description = {
		"#insurgency_weapon_upgrade_flashlight_desc"
	},
	Icon = "entities/ins2_att_ub_flashlight.png",
	ShortName = "FLASH",

	WeaponTable = {
		VElements = { flashlight = { active = true } },
		WElements = { flashlight = { active = true } },
		FlashlightAttachmentName = "Laser",
		Flashlight_VElement = "flashlight",
		FlashlightAttachmentWorld = 1,

		FlashlightSoundToggleOn = Sound("TFA_INS2.FlashlightOn"),
		FlashlightSoundToggleOff = Sound("TFA_INS2.FlashlightOff")
	},

	Attach = function(self, wep)
		local owner = wep:GetOwner()

		if SERVER and IsValid(owner) and owner:IsPlayer() and owner:FlashlightIsOn() then
			owner:Flashlight(false)
		end
	end,

	Detach = function(self, wep)
		if wep:GetFlashlightEnabled() then
			wep:ToggleFlashlight(false)
		end
	end
})
TFA.Attachments.RegisterFromTable("ins2_ub_laser", {
	Name = CLIENT and "#insurgency_weapon_upgrade_lasersight" or "Laser",
	Description = {
		"#insurgency_weapon_upgrade_lasersight_desc",
		TFA.AttachmentColors["+"], "Significantly lowers spread",
		TFA.AttachmentColors["-"], "Significantly raises iron sight accuracy"
	},
	Icon = "entities/ins2_att_ub_laser.png",
	ShortName = "LASR",

	WeaponTable = {
		VElements = {
			laser = { active = true },
			laser_beam = { active = true },
		},
		WElements = {
			laser = { active = true },
			laser_beam = { active = true },
		},
		Primary = {
			Spread = function(wep,stat) return stat - 0.025 end,
			IronAccuracy = function(wep,stat) return stat + 0.025 end
		},
		LaserSightAttachment = function(wep,stat) return wep.LaserSightModAttachment end,
		LaserSightAttachmentWorld = function(wep,stat) return wep.LaserSightModAttachmentWorld or wep.LaserSightModAttachment end
	},
	Attach = function(self, wep)
		local elem = wep:GetStatRaw("VElements.laser_beam")
		if elem then
			elem.translucent = true
		end
	end
})

TFA.Attachments.RegisterFromTable("ins2_stock_ergo", {
	Name = "Ergonomic Stock",
	ShortName = "ERGSK",
	Description = {
		TFA.Attachments.Colors["+"], "Faster ADS Speed",
		TFA.Attachments.Colors["+"], "Faster Movement Speed",
		TFA.Attachments.Colors["-"], "10% more recoil",
		TFA.Attachments.Colors["-"], "15% more spread"
	},
	Icon = "entities/ar15_att_moe_s.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["KickUp"] = function ( wep, stat ) return stat * 1.1 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.1 end,
			["Spread"] = function( wep, stat ) return stat * 1.15 end,
		},
		["IronSightTime"] = function(wep, stat) return stat * 0.8 end,
		["MoveSpeed"] = function(wep, stat) return stat * 1.05 end,
		["IronSightsMoveSpeed"] = function(wep, stat) return stat * 1.05 end,
	},
})

TFA.Attachments.RegisterFromTable("ins2_stock_recoil", {
	Name = "Heavy Stock",
	ShortName = "HVYSK",
	Description = {
		TFA.Attachments.Colors["+"], "Reduced Recoil by 15%",
		TFA.Attachments.Colors["+"], "Reduced Spread by 10%",
		TFA.Attachments.Colors["-"], "Slower ADS Speed",
		TFA.Attachments.Colors["-"], "Slower Movement Speed"
	},
	Icon = "entities/ar15_att_m16_s.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["KickUp"] = function ( wep, stat ) return stat * 0.85 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 0.85 end,
			["Spread"] = function( wep, stat ) return stat * 0.9 end,
		},
		["IronSightTime"] = function(wep, stat) return stat * 1.4 end,
		["MoveSpeed"] = function(wep, stat) return stat * 0.95 end,
		["IronSightsMoveSpeed"] = function(wep, stat) return stat * 0.95 end,
	},
})