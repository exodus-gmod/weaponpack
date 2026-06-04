if not ATTACHMENT then
	ATTACHMENT = {}
end

local function GetBindName(bind, fallback)
	if input and input.LookupBinding then
		local keyname = input.LookupBinding(bind, true)

		if keyname then
			return keyname:upper()
		end
	end

	return fallback
end

ATTACHMENT.Name = "Walther MRS reflex sight"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5% higher zoom",
	TFA.AttachmentColors["+"], "5% lower zoom time",
	Color(0, 191, 255), string.format("Hold %s and press %s while aiming to switch reticle", GetBindName("+use", "USE key"), GetBindName("+reload", "Reload key")),
}
ATTACHMENT.Icon = "entities/eft_si_mrs.png"
ATTACHMENT.ShortName = "MRS"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["rail_sights"] = {
			["active"] = true
		},
		["sight_mrs"] = {
			["active"] = true,
		},
		["sight_mrs_lens"] = {
			["active"] = true
		},
		["carryhandle"] = {
			["active"] = false
		},
		["sights_base_f"] = {
			["active"] = false
		},
		["sights_base_r"] = {
			["active"] = false
		},
		["sights_base_folded_f"] = {
			["active"] = true
		},
		["sights_base_folded_r"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["rail_sights"] = {
			["active"] = true
		},
		["sight_mrs"] = {
			["active"] = true
		},
		["sights_folded"] = {
			["active"] = false
		}
	},
	["IronSightsPos"] = function( wep, val )
		return wep.IronSightsPos_MRS or val
	end,
	["IronSightsAng"] = function( wep, val )
		return wep.IronSightsAng_MRS or val
	end,
	["Secondary"] = {
		["IronFOV"] = function( wep, val )
			return wep.Secondary.IronFOV_MRS or val * 0.95
		end
	},
	["IronSightTime"] = function( wep, val )
		return val * 0.95
	end,
	["EFT_SightVElement"] = "sight_mrs",
	["SwitchableReticles"] = {
		"models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_1",
		"models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2",
		"models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_3",
		"models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_4",
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
