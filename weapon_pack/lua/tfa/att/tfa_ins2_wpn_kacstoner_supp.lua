if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Suppressor"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Less firing noise", TFA.AttachmentColors["+"], "Slightly Reduced Spread", TFA.AttachmentColors["-"], "Slower ADS Speed", TFA.AttachmentColors["-"], "15% Less Range" }
ATTACHMENT.Icon = "entities/ins2_att_br_supp_12g.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SUPP"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["suppressor"] = {
			["active"] = true
		},
		["standard_barrel"] = {
			["active"] = false
		}
	},
	["WElements"] = {
		["suppressor"] = {
			["active"] = true
		},
		["standard_barrel"] = {
			["active"] = false
		}
	},
	["Primary"] = {
		["MinRangeStartFalloff"] = function(wep,stat) return stat * 0.85 end,
		["Spread"] = function(wep,stat) return stat * 0.9 end,
		["Sound"] = function(wep,stat) return wep.Primary.SilencedSound or stat end
	},
	["IronSightTime"] = function(wep,stat) return stat * 1.3 end,
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
	["MuzzleAttachmentMod"] = function(wep,stat) return wep.MuzzleAttachmentSilenced or stat end,
	["Silenced"] = true,
}

function ATTACHMENT:Attach(wep)
	wep.Silenced = true
	wep:SetSilenced(wep.Silenced)
end

function ATTACHMENT:Detach(wep)
	wep.Silenced = false
	wep:SetSilenced(wep.Silenced)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
