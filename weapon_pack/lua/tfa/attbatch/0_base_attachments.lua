if not TFA_ATTACHMENT_ISUPDATING then TFAUpdateAttachments(false) return end

TFA.Attachments.RegisterFromTable("am_gib", {
	Name = "High Grain Ammunition",
	ShortName = "HGA",
	Description = {
		TFA.Attachments.Colors["+"], "2 more damage",
		TFA.Attachments.Colors["-"], "20% more recoil",
		TFA.Attachments.Colors["-"], "-50 RPM"
	},
	Icon = "entities/tfa_ammo_gib.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
			Damage = function( wep, stat ) return stat + 2 end,
			RPM = function( wep, stat ) return stat - 50 end,
			IronAccuracy = function( wep, stat ) return stat * 1 end,
			KickUp = function( wep, stat ) return stat * 1.2 end,
			KickHorizontal = function( wep, stat ) return stat * 1.2 end
		}
	}
})

TFA.Attachments.RegisterFromTable("am_gib_dmr", {
	Name = "High Grain Ammunition",
	ShortName = "HGA",
	Description = {
		TFA.Attachments.Colors["+"], "10 more damage",
		TFA.Attachments.Colors["-"], "20% more recoil",
		TFA.Attachments.Colors["-"], "-50 RPM",
	},
	Icon = "entities/tfa_ammo_gib.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
			Damage = function( wep, stat ) return stat + 10 end,
			RPM = function( wep, stat ) return stat - 50 end,
			IronAccuracy = function( wep, stat ) return stat * 1 end,
			KickUp = function( wep, stat ) return stat * 1.2 end,
			KickHorizontal = function( wep, stat ) return stat * 1.2 end
		}
	}
})

TFA.Attachments.RegisterFromTable("am_gib_snpr", {
	Name = "High Grain Ammuntion",
	ShortName = "HGA",
	Description = {
		TFA.Attachments.Colors["+"], "15 more damage",
		TFA.Attachments.Colors["-"], "20% more recoil",
		TFA.Attachments.Colors["-"], "-25 RPM",
	},
	Icon = "entities/tfa_ammo_gib.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
			RPM = function( wep, stat ) return stat - 25 end,
			Damage = function( wep, stat ) return stat + 15 end,
			IronAccuracy = function( wep, stat ) return stat * 1 end,
			KickUp = function( wep, stat ) return stat * 1.2 end,
			KickHorizontal = function( wep, stat ) return stat * 1.2 end
		}
	}
})

if not TFA_ATTACHMENT_ISUPDATING then TFAUpdateAttachments(false) return end

TFA.Attachments.RegisterFromTable("am_magnum", {
	Name = " AP Ammunition",
	ShortName = "APA",
	Description = {
		TFA.Attachments.Colors["+"], "Increased Range",
		TFA.Attachments.Colors["+"], "Improved Fall Off",
		TFA.Attachments.Colors["-"], "5% more recoil",
		TFA.Attachments.Colors["-"], "25% more spread"
	},
	Icon = "entities/tfa_ammo_match.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["KickUp"] = function ( wep, stat ) return stat * 1.05 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.05 end,
			["Spread"] = function( wep, stat ) return stat * 1.25 end,
			["MinRangeStartFalloff"] = function(wep, stat) return stat + 10 end,
			["FalloffByMeter"] = function(wep, stat) return stat - 0.2 end,
		},
	},
})

TFA.Attachments.RegisterFromTable("am_magnum_dmr", {
	Name = " AP Ammunition",
	ShortName = "APA",
	Description = {
		TFA.Attachments.Colors["+"], "Increased Range",
		TFA.Attachments.Colors["+"], "Improved Fall Off",
		TFA.Attachments.Colors["-"], "5% more recoil",
		TFA.Attachments.Colors["-"], "25% more spread"
	},
	Icon = "entities/tfa_ammo_match.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["KickUp"] = function ( wep, stat ) return stat * 1.05 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.05 end,
			["Spread"] = function( wep, stat ) return stat * 1.25 end,
			["MinRangeStartFalloff"] = function(wep, stat) return stat + 15 end,
			["FalloffByMeter"] = function(wep, stat) return stat - 0.2 end,
		}
	},
})

TFA.Attachments.RegisterFromTable("am_magnum_snpr", {
	Name = " AP Ammunition",
	ShortName = "APA",
	Description = {
		TFA.Attachments.Colors["+"], "Increased Range",
		TFA.Attachments.Colors["+"], "Improved Fall Off",
		TFA.Attachments.Colors["-"], "5% more recoil",
		TFA.Attachments.Colors["-"], "25% more spread"
	},
	Icon = "entities/tfa_ammo_match.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["KickUp"] = function ( wep, stat ) return stat * 1.05 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.05 end,
			["Spread"] = function( wep, stat ) return stat * 1.25 end,
			["MinRangeStartFalloff"] = function(wep, stat) return stat + 20 end,
			["FalloffByMeter"] = function(wep, stat) return stat - 0.2 end,
			["MaxFalloff"] = function(wep, stat) return 12 end,
		}
	},
})

TFA.Attachments.RegisterFromTable("am_match", {
	Name = "Low Grain Ammunition",
	ShortName = "LGA",
	Description = {
		TFA.Attachments.Colors["+"], "15% tighter spread",
		"15% lower recoil","+50 RPM",
		TFA.Attachments.Colors["-"], "-2 Damage",
	},
	Icon = "entities/tfa_ammo_magnum.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
            Damage = function( wep, stat ) return stat -2 end,
			Spread = function( wep, stat ) return stat * 0.85 end,
			RPM = function ( wep, stat) return stat + 50 end,
			KickUp = function( wep, stat ) return stat * 0.85 end,
			KickHorizontal = function( wep, stat ) return stat * 0.85 end
		}
	}
})

TFA.Attachments.RegisterFromTable("am_match_dmr", {
	Name = "Low Grain Ammunition",
	ShortName = "LGA",
	Description = {
		TFA.Attachments.Colors["+"], "15% tighter spread",
		"15% lower recoil","+50 RPM",
		TFA.Attachments.Colors["-"], "-10 Damage",
	},
	Icon = "entities/tfa_ammo_magnum.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
            Damage = function( wep, stat ) return stat - 10 end,
			Spread = function( wep, stat ) return stat * 0.85 end,
			RPM = function ( wep, stat) return stat + 50 end,
			KickUp = function( wep, stat ) return stat * 0.85 end,
			KickHorizontal = function( wep, stat ) return stat * 0.85 end
		}
	}
})

TFA.Attachments.RegisterFromTable("am_match_snpr", {
	Name = "Low Grain Ammunition",
	ShortName = "LGA",
	Description = {
		TFA.Attachments.Colors["+"], "15% tighter spread",
		"15% lower recoil","+25 RPM",
		TFA.Attachments.Colors["-"], "-15 Damage",
	},
	Icon = "entities/tfa_ammo_magnum.png",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		Primary = {
            Damage = function( wep, stat ) return stat -15 end,
			Spread = function( wep, stat ) return stat * 0.85 end,
			RPM = function ( wep, stat) return stat + 25 end,
			KickUp = function( wep, stat ) return stat * 0.85 end,
			KickHorizontal = function( wep, stat ) return stat * 0.85 end
		}
	}
})

TFA.Attachments.RegisterFromTable("sg_slug", {
	Name = "Slug Ammunition",
	ShortName = "Slug",
	Description = {
		TFA.Attachments.Colors["+"], "Much lower spread",
		TFA.Attachments.Colors["+"], "Double range",
		TFA.Attachments.Colors["-"], "15% less damage",
		TFA.Attachments.Colors["-"], "15% More Recoil",
		"One pellet"
	},
	Icon = "entities/tfa_ammo_slug.png",
	TFADataVersion = TFA.LatestDataVersion,

WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
		["Damage"] = function( wep, stat ) return wep.Primary_TFA.NumShots * stat * 0.85 end,
			["NumShots"] = function( wep, stat ) return 1, true end,
			["KickUp"] = function ( wep, stat ) return stat * 1.15 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.15 end,
			["IronAccuracy"] = function( wep, stat ) return math.max( stat - 0.025 ) end,
			["MaxFalloff"] = function( wep, stat ) return 15 end,
			["MinRangeStartFalloff"] = function(wep, stat) return 40 end,
			["FalloffByMeter"] = function(wep, stat) return 0.5 end,
		}
	},
})

TFA.Attachments.RegisterFromTable("sg_bird", {
	Name = "Birdshot Ammunition",
	ShortName = "Bird",
	Description = {
		TFA.Attachments.Colors["+"], "15% Less Recoil",
		TFA.Attachments.Colors["+"], "Double Pellets",
		TFA.Attachments.Colors["-"], "30% Less Damage",
		TFA.Attachments.Colors["-"], "20% More Spread",
	},
	Icon = "entities/sw500_410_bore_gauge.png",
	TFADataVersion = TFA.LatestDataVersion,

WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["NumShots"] = function( wep, stat ) return 20, true end,
			["KickUp"] = function ( wep, stat ) return stat * 0.85 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 0.85 end,
			["Spread"] = function( wep, stat ) return stat * 1.2 end,
			["Damage"] = function( wep, stat ) return stat * 0.7 end,
			["MaxFalloff"] = function(wep, stat) return stat * 0.5 end,
		}
	},
})

TFA.Attachments.RegisterFromTable("sg_flech", {
	Name = "Flechette Ammunition",
	ShortName = "flch",
	Description = {
		TFA.Attachments.Colors["+"], "Improved Aim Accuracy",
		TFA.Attachments.Colors["+"], "Increased Damage",
		TFA.Attachments.Colors["-"], "-4 Pellets",
		TFA.Attachments.Colors["-"], "10% More Recoil",
	},
	Icon = "entities/flechetterounds.png",
	TFADataVersion = TFA.LatestDataVersion,

WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 1.45 end,
			["NumShots"] = function( wep, stat ) return 6, true end,
			["KickUp"] = function ( wep, stat ) return stat * 1.1 end,
			["KickHorizontal"] = function ( wep, stat ) return stat * 1.1 end,
			["IronAccuracy"] = function( wep, stat ) return math.max( stat - 0.01 ) end,
			["Range"] = function( wep, stat ) return stat * 1 end -- Stat functions support changing value dynamically (which is cached afterwards), SWEP.Primary_TFA contains original unchanged values
		}
	},
})

TFA.Attachments.RegisterFromTable("br_supp", {
	Name = "Suppressor",
	Description = {
		TFA.Attachments.Colors["+"], "Less firing noise",
        TFA.Attachments.Colors["+"], "Slightly Reduced Spread",
		TFA.Attachments.Colors["-"], "Slower ADS speed",
		TFA.Attachments.Colors["-"], "15% less range"
	},
	Icon = "entities/tfa_br_supp.png",
	ShortName = "SUPP",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		["ViewModelElements"] = {
			["suppressor"] = {
				["active"] = true
			}
		},
		["WorldModelElements"] = {
			["suppressor"] = {
				["active"] = true
			}
		},
		["Primary"] = {
			["Spread"] = function(wep,stat) return stat * 0.9 end,
			["KickHorizontal"] = function(wep,stat) return stat * 1 end,
            ["MinRangeStartFalloff"] = function(wep,stat) return stat * 0.85 end,
			["Sound"] = function(wep,stat) return wep.Primary.SilencedSound or stat end
		},
		["IronSightTime"] = function(wep,stat) return stat * 1.3 end,
		["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
		["MuzzleAttachmentMod"] = function(wep,stat) return wep.MuzzleAttachmentSilenced or stat end
	}
})

TFA.Attachments.RegisterFromTable("si_acog", {
	Base = "si_rt_base",
	Name = "ACOG",
	Description = {
		TFA.Attachments.Colors["="], "4x zoom",
		TFA.Attachments.Colors["-"], "20% higher zoom time",
		TFA.Attachments.Colors["-"], "10% slower aimed walking"
	},
	Icon = "entities/tfa_si_acog.png",
	ShortName = "ACOG",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		["ViewModelElements"] = {
			["acog"] = {
				["active"] = true
			},
			["rtcircle_acog"] = {
				["active"] = true
			}
		},
		["WorldModelElements"] = {
			["acog"] = {
				["active"] = true
			}
		},
		["IronSightsPosition"] = function( wep, val ) return wep.IronSightsPos_ACOG or val, true end,
		["IronSightsAngle"] = function( wep, val ) return wep.IronSightsAng_ACOG or val, true end,
		["IronSightsSensitivity"] = function(wep,val) return TFA.CalculateSensitivtyScale( 90 / 4 / 2, wep:GetStatL("Secondary.OwnerFOV"), wep.ACOGScreenScale ) end ,
		["Secondary"] = {
			["OwnerFOV"] = function( wep, val ) return val * 1 end
		},
		["IronSightTime"] = function( wep, val ) return val * 1.20 end,
		["IronSightMoveSpeed"] = function(stat) return stat * 0.9 end,
		["RTOpaque"] = true,
		["RTMaterialOverride"] = -1,

		["RTScopeFOV"] = 90 / 4 / 2, -- Default FOV / Scope Zoom / screenscale

		["RTReticleMaterial"] = Material("scope/gdcw_acog"),
		["RTReticleScale"] = 1,
	}
})
TFA.Attachments.RegisterFromTable("si_aimpoint", {
	Name = "Aimpoint",
	Description = {
		TFA.Attachments.Colors["="], "10% higher zoom",
		TFA.Attachments.Colors["-"], "10% higher zoom time"
	},
	Icon = "entities/tfa_si_aimpoint.png",
	ShortName = "AIM",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		["ViewModelElements"] = {
			["aimpoint"] = {
				["active"] = true
			},
			["aimpoint_spr"] = {
				["active"] = true
			}
		},
		["WorldModelElements"] = {
			["aimpoint"] = {
				["active"] = true
			},
			["aimpoint_spr"] = {
				["active"] = true
			}
		},
		["IronSightsPosition"] = function( wep, val ) return wep.IronSightsPos_AimPoint or val, true end,
		["IronSightsAngle"] = function( wep, val ) return wep.IronSightsAng_AimPoint or val, true end,
		["Secondary"] = {
			["OwnerFOV"] = function( wep, val ) return val * 1 end
		},
		["IronSightTime"] = function( wep, val ) return val * 1.10 end
	}
})
TFA.Attachments.RegisterFromTable("si_eotech", {
	Name = "EOTech",
	Description = {
		TFA.Attachments.Colors["="], "10% higher zoom",
		TFA.Attachments.Colors["-"], "10% higher zoom time"
	},
	Icon = "entities/tfa_si_eotech.png",
	ShortName = "EOTEK",
	TFADataVersion = TFA.LatestDataVersion,

	WeaponTable = {
		["ViewModelElements"] = {
			["eotech"] = {
				["active"] = true
			}
		},
		["WorldModelElements"] = {
			["eotech"] = {
				["active"] = true
			}
		},
		["IronSightsPosition"] = function( wep, val ) return wep.IronSightsPos_EOTech or val, true end,
		["IronSightsAngle"] = function( wep, val ) return wep.IronSightsAng_EOTech or val, true end,
		["Secondary"] = {
			["OwnerFOV"] = function( wep, val ) return val * 1 end
		},
		["IronSightTime"] = function( wep, val ) return val * 1.10 end
	}
})
